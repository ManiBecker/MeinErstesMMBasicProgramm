Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 51_abschlussspiel.bas
Rem Titel: Kapitel 51: Von der Idee zum fertigen Spiel
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 10.09.2026
Rem
Rem Beschreibung:
Rem
Rem Abschlussprojekt zu "Mein erstes MMBasic Programm".
Rem Das Spiel verbindet viele Themen aus den vorherigen Kapiteln:
Rem Sprites, Animation, Kollisionserkennung, Zufallszahlen, Timer,
Rem Soundeffekte und verschiedene Eingabegeraete.
Rem
Rem Ziel:
Rem Muenzen einsammeln, Gegnern ausweichen und moeglichst viele
Rem Punkte und Level erreichen.
Rem
Rem Zielsystem: PicoMite HDMI/USB bzw. PicoMite VGA/USB mit RP2350
Rem Firmware:   PicoMite MMBasic 6.03.x
Rem
Rem Steuerung:
Rem   1 = Cursortasten
Rem   2 = USB-Maus
Rem   3 = Richtungstasten eines USB-Gamepads
Rem   4 = linker Analogstick eines USB-Gamepads
Rem
Rem Hinweis:
Rem Bei Tastatur + Maus liegt ein Gamepad typischerweise auf Kanal 3.
Rem Falls noetig, MouseChannel und GamepadChannel unten anpassen.
Rem
Rem Hardware/Voraussetzungen:
Rem PicoMite mit VGA- oder HDMI-Ausgabe; fuer Maus/Gamepad eine
Rem Firmware-Variante mit entsprechender USB-Unterstuetzung.
Rem
Rem ====================================================================

Option EXPLICIT

' ----------------------------------------------------------------------------
' Konstanten fuer Spielregeln, Sprite-Nummern und Eingabegeraete
' ----------------------------------------------------------------------------
Const MaxEnemies = 4
Const MaxCoins = 10
Const StartLives = 3
Const CoinPoints = 10

Const PlayerSpeed = 5
Const EnemyStartSpeed = 1

Const PlayerSprite = 1
Const FirstEnemySprite = 2
Const FirstCoinSprite = 6

Const SpriteSize = 12
Const PlayfieldTop = 32
Const MouseChannel = 2
Const GamepadChannel = 3

Const DeadZoneLow = 110
Const DeadZoneHigh = 146

Const BtnDown% = 32
Const BtnRight% = 64
Const BtnUp% = 128
Const BtnLeft% = 256

' ----------------------------------------------------------------------------
' Globale Spielvariablen: Positionen, Punkte, Level und Eingabestatus
' ----------------------------------------------------------------------------
Dim INTEGER Score, Lives, Level
Dim INTEGER EnemySpeedNow
Dim INTEGER PlayerX, PlayerY
Dim INTEGER MoveX, MoveY
Dim INTEGER StickX, StickY
Dim INTEGER ScreenWidth, ScreenHeight

Dim INTEGER EnemyX(MaxEnemies)
Dim INTEGER EnemyY(MaxEnemies)
Dim INTEGER EnemyDX(MaxEnemies)
Dim INTEGER EnemyDY(MaxEnemies)

Dim INTEGER CoinX(MaxCoins)
Dim INTEGER CoinY(MaxCoins)
Dim INTEGER CoinVisible(MaxCoins)

' Kopie der aktuellen Kollisionsliste.
' Die Treffer werden zuerst gesichert, weil das Ausblenden einer Muenze
' mit SPRITE HIDE SAFE die interne Kollisionsliste veraendern kann.
Dim INTEGER HitList(64)

' Sprite-Bilder: 12 x 12 Pixel = 144 Farbwerte pro Grafik
Dim INTEGER PlayerImage(SpriteSize * SpriteSize - 1)
Dim INTEGER EnemyImage(SpriteSize * SpriteSize - 1)
Dim INTEGER CoinImage(SpriteSize * SpriteSize - 1)

' Nicht blockierende Soundsteuerung.
' PLAY SOUND startet den Ton; UpdateSound beendet ihn spaeter per TIMER.
Dim INTEGER SoundActive
Dim FLOAT SoundOffAt

' Gemeinsame Bewegungswerte und Status der ausgewaehlten Eingabegeraete
Dim INTEGER Control
Dim AGAIN$
Dim INTEGER MouseXPos, MouseYPos


' ----------------------------------------------------------------------------
' Hauptprogramm: Steuerung waehlen, Spielrunden starten und Game Loop ausfuehren
' ----------------------------------------------------------------------------

MODE 2


' Die Steuerungsart wird einmal zu Programmbeginn ausgewaehlt.
Control = GameControl()

Do

  ' Vor einer neuen Runde eventuell vorhandene Sprite-Puffer freigeben.
  Sprite CLOSE ALL
  CLS RGB(BLACK)

  ScreenWidth = MM.HRES
  ScreenHeight = MM.VRES

  CreateSprites
  InitGame
  ShowSprites
  UpdateStatus

  Do While Lives > 0
    ReadControl
    MovePlayer
    MoveEnemies
    MoveSprites
    CheckCollisions

    If Lives > 0 Then
        If CoinsRemaining() = 0 Then StartNextLevel
    EndIf

    UpdateStatus
    UpdateSound

    Pause 16
  Loop

  GameOver
  AGAIN$ = PlayAgain$()

Loop While AGAIN$="J"

End

' ============================================================================
' Sprite-Grafiken fuer Spieler, Gegner und Muenzen im Speicher erzeugen
' ============================================================================
Sub CreateSprites
    Local INTEGER x, y, p

    ' Alle Bildpuffer zuerst mit der transparenten Hintergrundfarbe fuellen.
    For p = 0 To SpriteSize * SpriteSize - 1
        PlayerImage(p) = RGB(BLACK)
        EnemyImage(p) = RGB(BLACK)
        CoinImage(p) = RGB(BLACK)
    Next p

    ' ------------------------------------------------------------------------
    ' Spieler: gruene Figur mit weissem Visier
    ' ------------------------------------------------------------------------
    For y = 2 To 9
        For x = 2 To 9
            PlayerImage(y * SpriteSize + x) = RGB(GREEN)
        Next x
    Next y

    For x = 4 To 7
        PlayerImage(3 * SpriteSize + x) = RGB(WHITE)
        PlayerImage(4 * SpriteSize + x) = RGB(WHITE)
    Next x

    PlayerImage(10 * SpriteSize + 3) = RGB(GREEN)
    PlayerImage(10 * SpriteSize + 4) = RGB(GREEN)
    PlayerImage(10 * SpriteSize + 7) = RGB(GREEN)
    PlayerImage(10 * SpriteSize + 8) = RGB(GREEN)

    ' ------------------------------------------------------------------------
    ' Gegner: rote Figur mit gelben Augen
    ' ------------------------------------------------------------------------
    For y = 2 To 9
        For x = 1 To 10
            EnemyImage(y * SpriteSize + x) = RGB(RED)
        Next x
    Next y

    EnemyImage(1 * SpriteSize + 2) = RGB(RED)
    EnemyImage(1 * SpriteSize + 9) = RGB(RED)
    EnemyImage(4 * SpriteSize + 3) = RGB(YELLOW)
    EnemyImage(4 * SpriteSize + 8) = RGB(YELLOW)
    EnemyImage(10 * SpriteSize + 2) = RGB(RED)
    EnemyImage(10 * SpriteSize + 5) = RGB(RED)
    EnemyImage(10 * SpriteSize + 8) = RGB(RED)

    ' ------------------------------------------------------------------------
    ' Muenze: kleine gelbe Scheibe
    ' ------------------------------------------------------------------------
    For y = 1 To 10
        For x = 1 To 10
            If (x - 5.5) * (x - 5.5) + (y - 5.5) * (y - 5.5) <= 22 Then
                CoinImage(y * SpriteSize + x) = RGB(YELLOW)
            EndIf
        Next x
    Next y

    For y = 3 To 8
        CoinImage(y * SpriteSize + 5) = RGB(WHITE)
    Next y

    ' Je ein Originalbild fuer Spieler, Gegner und Muenze als Sprite laden.
    Sprite LOADARRAY PlayerSprite, SpriteSize, SpriteSize, PlayerImage()
    Sprite LOADARRAY FirstEnemySprite, SpriteSize, SpriteSize, EnemyImage()
    Sprite LOADARRAY FirstCoinSprite, SpriteSize, SpriteSize, CoinImage()

    ' Weitere Gegner und Muenzen verwenden dieselben Bilddaten per SPRITE COPY.
    Sprite COPY FirstEnemySprite, FirstEnemySprite + 1, MaxEnemies - 1
    Sprite COPY FirstCoinSprite, FirstCoinSprite + 1, MaxCoins - 1
End Sub

' ============================================================================
' Neue Spielrunde initialisieren: Punkte, Leben, Level und Positionen zuruecksetzen
' ============================================================================
Sub InitGame
    Score = 0
    Lives = StartLives
    Level = 1
    EnemySpeedNow = EnemyStartSpeed
    SoundActive = 0

    ResetPlayer
    PlaceEnemies
    PlaceCoins
End Sub

' ============================================================================
' Startposition des Spielers in der Bildschirmmitte berechnen
' ============================================================================
Sub ResetPlayer
    PlayerX = MM.HRES \ 2 - sprite(W, PlayerSprite) \ 2
    PlayerY = MM.VRES \ 2 - sprite(H, PlayerSprite) \ 2
End Sub

' ============================================================================
' Gegner zufaellig verteilen und ihre Anfangsgeschwindigkeit festlegen
' ============================================================================
Sub PlaceEnemies
    Local INTEGER i

    For i = 1 To MaxEnemies
        ' Sicherheitsabstand zur Startposition des Spielers einhalten.
        Do
            EnemyX(i) = Int(Rnd * (MM.HRES - sprite(W, FirstEnemySprite)))
            EnemyY(i) = PlayfieldTop + Int(Rnd * (MM.VRES - PlayfieldTop - sprite(H, FirstEnemySprite)))
        Loop While Abs(EnemyX(i) - PlayerX) < 50 And Abs(EnemyY(i) - PlayerY) < 50

        If Rnd < 0.5 Then
            EnemyDX(i) = -EnemySpeedNow
        Else
            EnemyDX(i) = EnemySpeedNow
        EndIf

        If Rnd < 0.5 Then
            EnemyDY(i) = -EnemySpeedNow
        Else
            EnemyDY(i) = EnemySpeedNow
        EndIf
    Next i
End Sub

' ============================================================================
' Alle Muenzen zufaellig im sichtbaren Spielfeld verteilen
' ============================================================================
Sub PlaceCoins
    Local INTEGER i

    For i = 1 To MaxCoins
        CoinX(i) = Int(Rnd * (MM.HRES - sprite(W, FirstCoinSprite)))
        CoinY(i) = PlayfieldTop + Int(Rnd * (MM.VRES - PlayfieldTop - sprite(H, FirstCoinSprite)))
        CoinVisible(i) = 1
    Next i
End Sub

' ============================================================================
' Spieler, Gegner und Muenzen fuer den Beginn der Runde sichtbar machen
' ============================================================================
Sub ShowSprites
    Local INTEGER i, SpriteNo

    Sprite SHOW PlayerSprite, PlayerX, PlayerY, 1

    For i = 1 To MaxEnemies
        SpriteNo = FirstEnemySprite + i - 1
        Sprite SHOW SpriteNo, EnemyX(i), EnemyY(i), 1
    Next i

    For i = 1 To MaxCoins
        SpriteNo = FirstCoinSprite + i - 1
        Sprite SHOW SpriteNo, CoinX(i), CoinY(i), 1
    Next i
End Sub

' ============================================================================
' Ausgewaehltes Eingabegeraet abfragen
' ReadControl vereinheitlicht die vier Steuerungsarten und liefert MoveX/MoveY.
' ============================================================================
Sub ReadControl
    If Control = 2 Then
      ReadMouse
    ElseIf Control = 3 Then
      ReadGamepadButtons
    Else If Control = 4 Then
      ReadGamepadStick
    Else
      ReadKeyboard
    EndIf
End Sub


' ============================================================================
' Cursortasten mit KEYDOWN() auslesen; zwei Tasten erlauben diagonale Bewegung
' ============================================================================
Sub ReadKeyboard
    Local Integer i, key

    MoveX = 0
    MoveY = 0

    ' KEYDOWN(0) liefert die Anzahl gleichzeitig gedrueckter Tasten.
    ' Dadurch sind auch diagonale Bewegungen mit zwei Cursortasten moeglich.
    For i = 1 To KeyDown(0)
        key = KeyDown(i)

        Select Case key
            Case 128                    ' Cursor hoch
                MoveY = -PlayerSpeed

            Case 129                    ' Cursor runter
                MoveY = PlayerSpeed

            Case 130                    ' Cursor links
                MoveX = -PlayerSpeed

            Case 131                    ' Cursor rechts
                MoveX = PlayerSpeed
        End Select
    Next i
End Sub

' ============================================================================
' USB-Maus auslesen und aus der Positionsaenderung die Richtung bestimmen
' ============================================================================
Sub ReadMouse
    Local x, y, dx, dy

    x=DEVICE(Mouse MouseChannel,x)
    dx=x-MouseXPos
    If dx < 0 Then
      MoveX = -PlayerSpeed
    ElseIf dx > 0 Then
      MoveX = PlayerSpeed
    Else
      MoveX = 0
    EndIf

    y=DEVICE(Mouse MouseChannel,y)
    dy=y-MouseYPos
    If dy < 0 Then
      MoveY = -PlayerSpeed
    ElseIf dy > 0 Then
      MoveY = PlayerSpeed
    Else
      MoveY = 0
    EndIf

    MouseXPos=x
    MouseYPos=y
End Sub

' ============================================================================
' Richtungstasten eines USB-Gamepads als Bitmaske auswerten
' ============================================================================
Sub ReadGamepadButtons
    Local buttons%

    buttons% = DEVICE(GAMEPAD GamepadChannel, B)

    MoveX = 0
    MoveY = 0

    If buttons% <> 0 Then
      If (buttons% And BtnLeft%) <> 0 Then MoveX = -PlayerSpeed
      If (buttons% And BtnRight%) <> 0 Then MoveX = PlayerSpeed

      If (buttons% And BtnUp%) <> 0 Then MoveY = -PlayerSpeed
      If (buttons% And BtnDown%) <> 0  Then MoveY = PlayerSpeed
    EndIf
End Sub

' ============================================================================
' Linken Analogstick des USB-Gamepads mit Totzone auswerten
' ============================================================================
Sub ReadGamepadStick
    StickX = DEVICE(GAMEPAD GamepadChannel, "LX")
    StickY = DEVICE(GAMEPAD GamepadChannel, "LY")

    MoveX = 0
    MoveY = 0

    If StickX < DeadZoneLow Then MoveX = -PlayerSpeed
    If StickX > DeadZoneHigh Then MoveX = PlayerSpeed

    If StickY < DeadZoneLow Then MoveY = -PlayerSpeed
    If StickY > DeadZoneHigh Then MoveY = PlayerSpeed
End Sub

' ============================================================================
' Spieler entsprechend MoveX/MoveY bewegen und im Spielfeld halten
' ============================================================================
Sub MovePlayer
    PlayerX = PlayerX + MoveX
    PlayerY = PlayerY + MoveY

    If PlayerX < 0 Then PlayerX = 0
    If PlayerY < PlayfieldTop Then PlayerY = PlayfieldTop

    If PlayerX > MM.HRES - sprite(W, PlayerSprite) Then
        PlayerX = MM.HRES - sprite(W, PlayerSprite)
    EndIf

    If PlayerY > MM.VRES - sprite(H, PlayerSprite) Then
        PlayerY = MM.VRES - sprite(H, PlayerSprite)
    EndIf
End Sub

' ============================================================================
' Gegner bewegen und ihre Richtung an den Bildschirmraendern umkehren
' ============================================================================
Sub MoveEnemies
    Local INTEGER i, EnemyWidth, EnemyHeight

    EnemyWidth = sprite(W, FirstEnemySprite)
    EnemyHeight = sprite(H, FirstEnemySprite)

    For i = 1 To MaxEnemies
        EnemyX(i) = EnemyX(i) + EnemyDX(i)
        EnemyY(i) = EnemyY(i) + EnemyDY(i)

        If EnemyX(i) <= 0 Then
            EnemyX(i) = 0
            EnemyDX(i) = Abs(EnemyDX(i))
        EndIf

        If EnemyX(i) >= MM.HRES - EnemyWidth Then
            EnemyX(i) = MM.HRES - EnemyWidth
            EnemyDX(i) = -Abs(EnemyDX(i))
        EndIf

        If EnemyY(i) <= PlayfieldTop Then
            EnemyY(i) = PlayfieldTop
            EnemyDY(i) = Abs(EnemyDY(i))
        EndIf

        If EnemyY(i) >= MM.VRES - EnemyHeight Then
            EnemyY(i) = MM.VRES - EnemyHeight
            EnemyDY(i) = -Abs(EnemyDY(i))
        EndIf
    Next i
End Sub

' ============================================================================
' Spieler und Gegner vorbereiten und anschliessend gemeinsam mit SPRITE MOVE verschieben
' ============================================================================
Sub MoveSprites
    Local INTEGER i, SpriteNo

    Sprite NEXT PlayerSprite, PlayerX, PlayerY

    For i = 1 To MaxEnemies
        SpriteNo = FirstEnemySprite + i - 1
        Sprite NEXT SpriteNo, EnemyX(i), EnemyY(i)
    Next i

    Sprite MOVE
End Sub

' ============================================================================
' Kollisionen des Spielers mit Gegnern und Muenzen auswerten
' ============================================================================
Sub CheckCollisions
    Local INTEGER i, HitCount, HitSprite, CoinIndex
    Local INTEGER EnemyHit

    HitCount = sprite(C, PlayerSprite)
    If HitCount = 0 Then Exit Sub

    ' Trefferliste zuerst kopieren, bevor ein Sprite ausgeblendet wird.
    For i = 1 To HitCount
        HitList(i) = sprite(C, PlayerSprite, i)
    Next i

    ' Gegner haben Vorrang: Eine Beruehrung kostet genau ein Leben.
    EnemyHit = 0
    For i = 1 To HitCount
        HitSprite = HitList(i)
        If HitSprite >= FirstEnemySprite And HitSprite < FirstEnemySprite + MaxEnemies Then
            EnemyHit = 1
            Exit For
        EndIf
    Next i

    If EnemyHit Then
        Lives = Lives - 1
        StartHitSound

        If Lives > 0 Then
            ResetPlayer
            Sprite SHOW SAFE PlayerSprite, PlayerX, PlayerY, 1
            Pause 300
        EndIf

        Exit Sub
    EndIf

    ' Nur wenn kein Gegner getroffen wurde, eingesammelte Muenzen auswerten.
    For i = 1 To HitCount
        HitSprite = HitList(i)

        If HitSprite >= FirstCoinSprite And HitSprite < FirstCoinSprite + MaxCoins Then
            CoinIndex = HitSprite - FirstCoinSprite + 1

            If CoinVisible(CoinIndex) Then
                CoinVisible(CoinIndex) = 0
                Sprite HIDE SAFE HitSprite
                Score = Score + CoinPoints
                StartCoinSound
            EndIf
        EndIf
    Next i
End Sub

' ============================================================================
' Noch sichtbare Muenzen zaehlen; 0 bedeutet: Level geschafft
' ============================================================================
Function CoinsRemaining()
    Local INTEGER i, Count

    Count = 0
    For i = 1 To MaxCoins
        If CoinVisible(i) Then Count = Count + 1
    Next i

    CoinsRemaining = Count
End Function

' ============================================================================
' Naechstes Level starten: neue Muenzen und schnellere Gegner
' ============================================================================
Sub StartNextLevel
    Local INTEGER i, SpriteNo

    Level = Level + 1
    EnemySpeedNow = EnemyStartSpeed + Level - 1

    ' Bewegungsrichtung erhalten, den Betrag aber an die neue Geschwindigkeit anpassen.
    For i = 1 To MaxEnemies
        If EnemyDX(i) < 0 Then
            EnemyDX(i) = -EnemySpeedNow
        Else
            EnemyDX(i) = EnemySpeedNow
        EndIf

        If EnemyDY(i) < 0 Then
            EnemyDY(i) = -EnemySpeedNow
        Else
            EnemyDY(i) = EnemySpeedNow
        EndIf
    Next i

    PlaceCoins

    For i = 1 To MaxCoins
        SpriteNo = FirstCoinSprite + i - 1
        Sprite SHOW SAFE SpriteNo, CoinX(i), CoinY(i), 1
    Next i

    StartLevelSound
End Sub

' ============================================================================
' Punkte, Leben und aktuelles Level in der Statuszeile anzeigen
' ============================================================================
Sub UpdateStatus
    Box 0, 0, MM.HRES, PlayfieldTop, 0, RGB(BLACK), RGB(BLACK)

    Text 4, 8, "Punkte: " + Str$(Score), L, 1, 1, RGB(WHITE)
    Text MM.HRES \ 2, 8, "Level: " + Str$(Level), C, 1, 1, RGB(WHITE)
    Text MM.HRES - 4, 8, "Leben: " + Str$(Lives), R, 1, 1, RGB(WHITE)
End Sub

' ============================================================================
' Kurze Soundeffekte ohne blockierende PAUSE erzeugen
' ============================================================================
Sub StartCoinSound
    Play SOUND 1, B, Q, 1200, 10
    SoundActive = 1
    SoundOffAt = Timer + 60
End Sub

Sub StartHitSound
    Play SOUND 1, B, N, 180, 12
    SoundActive = 1
    SoundOffAt = Timer + 180
End Sub

Sub StartLevelSound
    Play SOUND 1, B, Q, 1600, 10
    SoundActive = 1
    SoundOffAt = Timer + 120
End Sub

Sub UpdateSound
    If SoundActive Then
        If Timer >= SoundOffAt Then
            Play SOUND 1, B, O
            SoundActive = 0
        EndIf
    EndIf
End Sub

' ============================================================================
' Game-Over-Bildschirm anzeigen und alle Sprite-Ressourcen freigeben
' ============================================================================
Sub GameOver
    Play SOUND 1, B, O
    SoundActive = 0

    Sprite HIDE ALL

    CLS RGB(BLACK)

    Text MM.HRES \ 2, MM.VRES \ 2 - 66, "Abschluss-Spiel", C, 1, 2, RGB(BLUE)
    Text MM.HRES \ 2, MM.VRES \ 2 - 28, "GAME OVER", C, 2, 2, RGB(RED)
    Text MM.HRES \ 2, MM.VRES \ 2 + 12, "Punkte: " + Str$(Score), C, 1, 1, RGB(WHITE)
    Text MM.HRES \ 2, MM.VRES \ 2 + 40, "Level: " + Str$(Level), C, 1, 1, RGB(WHITE)

    Sprite CLOSE ALL
End Sub

' ============================================================================
' Gewuenschte Steuerungsart am Programmbeginn auswaehlen
' ============================================================================
Function GameControl()

    Local key$

    Text MM.HRES \ 2, MM.VRES \ 2 - 66, "Abschluss-Spiel", C, 1, 2, RGB(BLUE)
    Text MM.HRES \ 2, MM.VRES \ 2 - 28, "Steuerung", C, 2, 2, RGB(RED)
    Text MM.HRES \ 2, MM.VRES \ 2 + 20, "Cursortasten...: 1", C, 1, 1, RGB(WHITE)
    Text MM.HRES \ 2, MM.VRES \ 2 + 32, "Maus...........: 2", C, 1, 1, RGB(WHITE)
    Text MM.HRES \ 2, MM.VRES \ 2 + 44, "Gamepad-Button.: 3", C, 1, 1, RGB(WHITE)
    Text MM.HRES \ 2, MM.VRES \ 2 + 56, "Gamepad-Stick..: 4", C, 1, 1, RGB(WHITE)

    Do
      key$ = UCASE$(Inkey$)
    Loop Until key$="1" Or key$="2" Or key$="3" Or key$="4"

    GameControl = Val(key$)

End Function

' ============================================================================
' Nach GAME OVER abfragen, ob eine neue Runde gestartet werden soll
' ============================================================================
Function PlayAgain$()

    Local key$

    Text MM.HRES \ 2, MM.VRES \ 2 - 66, "Abschluss-Spiel", C, 1, 2, RGB(BLUE)
    Text MM.HRES \ 2, MM.VRES \ 2 + 60, "Nochmal spielen? (J/N)", C, 1, 1, RGB(YELLOW)

    Do
      key$ = UCASE$(Inkey$)
    Loop Until key$="J" Or key$="N"
    PlayAgain$=key$

End Function 