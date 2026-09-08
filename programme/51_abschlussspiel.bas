REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 51_abschlussspiel.bas
REM Titel: Kapitel 51: Von der Idee zum fertigen Spiel
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 08.09.2026
REM
REM Beschreibung:
REM
REM Abschlussprojekt zu "Mein erstes MMBasic-Programm"
REM
REM Zielsystem: PicoMite HDMI/USB bzw. PicoMite VGA/USB mit RP2350
REM Firmware:   PicoMite MMBasic 6.03.x
REM
REM Steuerung:  linker Analogstick eines USB-Gamepads
REM Hinweis:    Bei Tastatur + Maus liegt das Gamepad typischerweise auf Kanal 3.
REM             Falls noetig, GamepadChannel unten anpassen.
REM
REM Hardware/Voraussetzungen: keine/PicoMite/ColourMaxiMite
REM
REM ====================================================================

OPTION EXPLICIT

' ----------------------------------------------------------------------------
' Konstanten
' ----------------------------------------------------------------------------
CONST MaxEnemies = 4
CONST MaxCoins = 10
CONST StartLives = 3
CONST CoinPoints = 10

CONST PlayerSpeed = 3
CONST EnemyStartSpeed = 1

CONST PlayerSprite = 1
CONST FirstEnemySprite = 2
CONST FirstCoinSprite = 6

CONST SpriteSize = 12
CONST PlayfieldTop = 32
CONST GamepadChannel = 3

CONST DeadZoneLow = 110
CONST DeadZoneHigh = 146

' ----------------------------------------------------------------------------
' Spielvariablen
' ----------------------------------------------------------------------------
DIM INTEGER Score, Lives, Level
DIM INTEGER EnemySpeedNow
DIM INTEGER PlayerX, PlayerY
DIM INTEGER MoveX, MoveY
DIM INTEGER StickX, StickY
DIM INTEGER ScreenWidth, ScreenHeight

DIM INTEGER EnemyX(MaxEnemies)
DIM INTEGER EnemyY(MaxEnemies)
DIM INTEGER EnemyDX(MaxEnemies)
DIM INTEGER EnemyDY(MaxEnemies)

DIM INTEGER CoinX(MaxCoins)
DIM INTEGER CoinY(MaxCoins)
DIM INTEGER CoinVisible(MaxCoins)

' Eine Kopie der aktuellen Kollisionsliste.
' So koennen Sprites ausgeblendet werden, ohne die Liste waehrend
' der Auswertung erneut abfragen zu muessen.
DIM INTEGER HitList(64)

' Sprite-Bilder: 12 x 12 Pixel = 144 Eintraege
DIM INTEGER PlayerImage(SpriteSize * SpriteSize - 1)
DIM INTEGER EnemyImage(SpriteSize * SpriteSize - 1)
DIM INTEGER CoinImage(SpriteSize * SpriteSize - 1)

' Sound wird mit PLAY SOUND gestartet und nach kurzer Zeit wieder beendet.
DIM INTEGER SoundActive
DIM FLOAT SoundOffAt

' ----------------------------------------------------------------------------
' Hauptprogramm
' ----------------------------------------------------------------------------
MODE 2

' Falls das Programm erneut gestartet wird, alte Sprite-Puffer freigeben.
SPRITE CLOSE ALL
CLS RGB(BLACK)

ScreenWidth = MM.HRES
ScreenHeight = MM.VRES

CreateSprites
InitGame
ShowSprites
UpdateStatus

DO WHILE Lives > 0
    ReadGamepad
    MovePlayer
    MoveEnemies
    MoveSprites
    CheckCollisions

    IF Lives > 0 THEN
        IF CoinsRemaining() = 0 THEN StartNextLevel
    ENDIF

    UpdateStatus
    UpdateSound

    PAUSE 16
LOOP

GameOver
END

' ============================================================================
' Sprite-Grafiken erzeugen
' ============================================================================
SUB CreateSprites
    LOCAL INTEGER x, y, p

    ' Alle Pixel zunaechst transparent (schwarz) setzen.
    FOR p = 0 TO SpriteSize * SpriteSize - 1
        PlayerImage(p) = RGB(BLACK)
        EnemyImage(p) = RGB(BLACK)
        CoinImage(p) = RGB(BLACK)
    NEXT p

    ' ------------------------------------------------------------------------
    ' Spieler: gruene Figur mit weissem Visier
    ' ------------------------------------------------------------------------
    FOR y = 2 TO 9
        FOR x = 2 TO 9
            PlayerImage(y * SpriteSize + x) = RGB(GREEN)
        NEXT x
    NEXT y

    FOR x = 4 TO 7
        PlayerImage(3 * SpriteSize + x) = RGB(WHITE)
        PlayerImage(4 * SpriteSize + x) = RGB(WHITE)
    NEXT x

    PlayerImage(10 * SpriteSize + 3) = RGB(GREEN)
    PlayerImage(10 * SpriteSize + 4) = RGB(GREEN)
    PlayerImage(10 * SpriteSize + 7) = RGB(GREEN)
    PlayerImage(10 * SpriteSize + 8) = RGB(GREEN)

    ' ------------------------------------------------------------------------
    ' Gegner: rote Figur mit gelben Augen
    ' ------------------------------------------------------------------------
    FOR y = 2 TO 9
        FOR x = 1 TO 10
            EnemyImage(y * SpriteSize + x) = RGB(RED)
        NEXT x
    NEXT y

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
    FOR y = 1 TO 10
        FOR x = 1 TO 10
            IF (x - 5.5) * (x - 5.5) + (y - 5.5) * (y - 5.5) <= 22 THEN
                CoinImage(y * SpriteSize + x) = RGB(YELLOW)
            ENDIF
        NEXT x
    NEXT y

    FOR y = 3 TO 8
        CoinImage(y * SpriteSize + 5) = RGB(WHITE)
    NEXT y

    ' Drei Originalbilder laden.
    SPRITE LOADARRAY PlayerSprite, SpriteSize, SpriteSize, PlayerImage()
    SPRITE LOADARRAY FirstEnemySprite, SpriteSize, SpriteSize, EnemyImage()
    SPRITE LOADARRAY FirstCoinSprite, SpriteSize, SpriteSize, CoinImage()

    ' Die uebrigen Gegner und Muenzen teilen sich die Bilddaten des Originals.
    SPRITE COPY FirstEnemySprite, FirstEnemySprite + 1, MaxEnemies - 1
    SPRITE COPY FirstCoinSprite, FirstCoinSprite + 1, MaxCoins - 1
END SUB

' ============================================================================
' Neues Spiel vorbereiten
' ============================================================================
SUB InitGame
    Score = 0
    Lives = StartLives
    Level = 1
    EnemySpeedNow = EnemyStartSpeed
    SoundActive = 0

    ResetPlayer
    PlaceEnemies
    PlaceCoins
END SUB

' ============================================================================
' Spieler in die Bildschirmmitte setzen
' ============================================================================
SUB ResetPlayer
    PlayerX = MM.HRES \ 2 - SPRITE(W, PlayerSprite) \ 2
    PlayerY = MM.VRES \ 2 - SPRITE(H, PlayerSprite) \ 2
END SUB

' ============================================================================
' Gegner zufaellig verteilen und Bewegungsrichtung festlegen
' ============================================================================
SUB PlaceEnemies
    LOCAL INTEGER i

    FOR i = 1 TO MaxEnemies
        ' Gegner nicht direkt auf der Startposition des Spielers erzeugen.
        DO
            EnemyX(i) = INT(RND * (MM.HRES - SPRITE(W, FirstEnemySprite)))
            EnemyY(i) = PlayfieldTop + INT(RND * (MM.VRES - PlayfieldTop - SPRITE(H, FirstEnemySprite)))
        LOOP WHILE ABS(EnemyX(i) - PlayerX) < 50 AND ABS(EnemyY(i) - PlayerY) < 50

        IF RND < 0.5 THEN
            EnemyDX(i) = -EnemySpeedNow
        ELSE
            EnemyDX(i) = EnemySpeedNow
        ENDIF

        IF RND < 0.5 THEN
            EnemyDY(i) = -EnemySpeedNow
        ELSE
            EnemyDY(i) = EnemySpeedNow
        ENDIF
    NEXT i
END SUB

' ============================================================================
' Muenzen zufaellig verteilen
' ============================================================================
SUB PlaceCoins
    LOCAL INTEGER i

    FOR i = 1 TO MaxCoins
        CoinX(i) = INT(RND * (MM.HRES - SPRITE(W, FirstCoinSprite)))
        CoinY(i) = PlayfieldTop + INT(RND * (MM.VRES - PlayfieldTop - SPRITE(H, FirstCoinSprite)))
        CoinVisible(i) = 1
    NEXT i
END SUB

' ============================================================================
' Alle Sprites zum ersten Mal anzeigen
' ============================================================================
SUB ShowSprites
    LOCAL INTEGER i, SpriteNo

    SPRITE SHOW PlayerSprite, PlayerX, PlayerY, 1

    FOR i = 1 TO MaxEnemies
        SpriteNo = FirstEnemySprite + i - 1
        SPRITE SHOW SpriteNo, EnemyX(i), EnemyY(i), 1
    NEXT i

    FOR i = 1 TO MaxCoins
        SpriteNo = FirstCoinSprite + i - 1
        SPRITE SHOW SpriteNo, CoinX(i), CoinY(i), 1
    NEXT i
END SUB

' ============================================================================
' USB-Gamepad auslesen
' ============================================================================
SUB ReadGamepad
    StickX = DEVICE(GAMEPAD GamepadChannel, "LX")
    StickY = DEVICE(GAMEPAD GamepadChannel, "LY")

    MoveX = 0
    MoveY = 0

    IF StickX < DeadZoneLow THEN MoveX = -PlayerSpeed
    IF StickX > DeadZoneHigh THEN MoveX = PlayerSpeed

    IF StickY < DeadZoneLow THEN MoveY = -PlayerSpeed
    IF StickY > DeadZoneHigh THEN MoveY = PlayerSpeed
END SUB

' ============================================================================
' Spielerposition berechnen und auf das Spielfeld begrenzen
' ============================================================================
SUB MovePlayer
    PlayerX = PlayerX + MoveX
    PlayerY = PlayerY + MoveY

    IF PlayerX < 0 THEN PlayerX = 0
    IF PlayerY < PlayfieldTop THEN PlayerY = PlayfieldTop

    IF PlayerX > MM.HRES - SPRITE(W, PlayerSprite) THEN
        PlayerX = MM.HRES - SPRITE(W, PlayerSprite)
    ENDIF

    IF PlayerY > MM.VRES - SPRITE(H, PlayerSprite) THEN
        PlayerY = MM.VRES - SPRITE(H, PlayerSprite)
    ENDIF
END SUB

' ============================================================================
' Gegnerpositionen berechnen und an den Raendern abprallen lassen
' ============================================================================
SUB MoveEnemies
    LOCAL INTEGER i, EnemyWidth, EnemyHeight

    EnemyWidth = SPRITE(W, FirstEnemySprite)
    EnemyHeight = SPRITE(H, FirstEnemySprite)

    FOR i = 1 TO MaxEnemies
        EnemyX(i) = EnemyX(i) + EnemyDX(i)
        EnemyY(i) = EnemyY(i) + EnemyDY(i)

        IF EnemyX(i) <= 0 THEN
            EnemyX(i) = 0
            EnemyDX(i) = ABS(EnemyDX(i))
        ENDIF

        IF EnemyX(i) >= MM.HRES - EnemyWidth THEN
            EnemyX(i) = MM.HRES - EnemyWidth
            EnemyDX(i) = -ABS(EnemyDX(i))
        ENDIF

        IF EnemyY(i) <= PlayfieldTop THEN
            EnemyY(i) = PlayfieldTop
            EnemyDY(i) = ABS(EnemyDY(i))
        ENDIF

        IF EnemyY(i) >= MM.VRES - EnemyHeight THEN
            EnemyY(i) = MM.VRES - EnemyHeight
            EnemyDY(i) = -ABS(EnemyDY(i))
        ENDIF
    NEXT i
END SUB

' ============================================================================
' Alle bewegten Sprites in einer gemeinsamen Transaktion verschieben
' ============================================================================
SUB MoveSprites
    LOCAL INTEGER i, SpriteNo

    SPRITE NEXT PlayerSprite, PlayerX, PlayerY

    FOR i = 1 TO MaxEnemies
        SpriteNo = FirstEnemySprite + i - 1
        SPRITE NEXT SpriteNo, EnemyX(i), EnemyY(i)
    NEXT i

    SPRITE MOVE
END SUB

' ============================================================================
' Kollisionen des Spielers auswerten
' ============================================================================
SUB CheckCollisions
    LOCAL INTEGER i, HitCount, HitSprite, CoinIndex
    LOCAL INTEGER EnemyHit

    HitCount = SPRITE(C, PlayerSprite)
    IF HitCount = 0 THEN EXIT SUB

    ' Kollisionsliste zuerst sichern.
    FOR i = 1 TO HitCount
        HitList(i) = SPRITE(C, PlayerSprite, i)
    NEXT i

    ' Gegner haben Vorrang. Bei einer Beruehrung geht ein Leben verloren.
    EnemyHit = 0
    FOR i = 1 TO HitCount
        HitSprite = HitList(i)
        IF HitSprite >= FirstEnemySprite AND HitSprite < FirstEnemySprite + MaxEnemies THEN
            EnemyHit = 1
            EXIT FOR
        ENDIF
    NEXT i

    IF EnemyHit THEN
        Lives = Lives - 1
        StartHitSound

        IF Lives > 0 THEN
            ResetPlayer
            SPRITE SHOW SAFE PlayerSprite, PlayerX, PlayerY, 1
            PAUSE 300
        ENDIF

        EXIT SUB
    ENDIF

    ' Danach eingesammelte Muenzen bearbeiten.
    FOR i = 1 TO HitCount
        HitSprite = HitList(i)

        IF HitSprite >= FirstCoinSprite AND HitSprite < FirstCoinSprite + MaxCoins THEN
            CoinIndex = HitSprite - FirstCoinSprite + 1

            IF CoinVisible(CoinIndex) THEN
                CoinVisible(CoinIndex) = 0
                SPRITE HIDE SAFE HitSprite
                Score = Score + CoinPoints
                StartCoinSound
            ENDIF
        ENDIF
    NEXT i
END SUB

' ============================================================================
' Anzahl der noch sichtbaren Muenzen bestimmen
' ============================================================================
FUNCTION CoinsRemaining()
    LOCAL INTEGER i, Count

    Count = 0
    FOR i = 1 TO MaxCoins
        IF CoinVisible(i) THEN Count = Count + 1
    NEXT i

    CoinsRemaining = Count
END FUNCTION

' ============================================================================
' Naechstes Level vorbereiten
' ============================================================================
SUB StartNextLevel
    LOCAL INTEGER i, SpriteNo

    Level = Level + 1
    EnemySpeedNow = EnemyStartSpeed + Level - 1

    ' Bewegungsrichtung beibehalten, aber Betrag an neue Geschwindigkeit anpassen.
    FOR i = 1 TO MaxEnemies
        IF EnemyDX(i) < 0 THEN
            EnemyDX(i) = -EnemySpeedNow
        ELSE
            EnemyDX(i) = EnemySpeedNow
        ENDIF

        IF EnemyDY(i) < 0 THEN
            EnemyDY(i) = -EnemySpeedNow
        ELSE
            EnemyDY(i) = EnemySpeedNow
        ENDIF
    NEXT i

    PlaceCoins

    FOR i = 1 TO MaxCoins
        SpriteNo = FirstCoinSprite + i - 1
        SPRITE SHOW SAFE SpriteNo, CoinX(i), CoinY(i), 1
    NEXT i

    StartLevelSound
END SUB

' ============================================================================
' Statuszeile aktualisieren
' ============================================================================
SUB UpdateStatus
    BOX 0, 0, MM.HRES, PlayfieldTop, 0, RGB(BLACK), RGB(BLACK)

    TEXT 4, 8, "Punkte: " + STR$(Score), L, 1, 1, RGB(WHITE)
    TEXT MM.HRES \ 2, 8, "Level: " + STR$(Level), C, 1, 1, RGB(WHITE)
    TEXT MM.HRES - 4, 8, "Leben: " + STR$(Lives), R, 1, 1, RGB(WHITE)
END SUB

' ============================================================================
' Kurze Soundeffekte
' ============================================================================
SUB StartCoinSound
    PLAY SOUND 1, B, Q, 1200, 10
    SoundActive = 1
    SoundOffAt = TIMER + 60
END SUB

SUB StartHitSound
    PLAY SOUND 1, B, N, 180, 12
    SoundActive = 1
    SoundOffAt = TIMER + 180
END SUB

SUB StartLevelSound
    PLAY SOUND 1, B, Q, 1600, 10
    SoundActive = 1
    SoundOffAt = TIMER + 120
END SUB

SUB UpdateSound
    IF SoundActive THEN
        IF TIMER >= SoundOffAt THEN
            PLAY SOUND 1, B, O
            SoundActive = 0
        ENDIF
    ENDIF
END SUB

' ============================================================================
' Spielende
' ============================================================================
SUB GameOver
    PLAY SOUND 1, B, O
    SoundActive = 0

    SPRITE HIDE ALL

    CLS RGB(BLACK)

    TEXT MM.HRES \ 2, MM.VRES \ 2 - 28, "GAME OVER", C, 2, 2, RGB(RED)
    TEXT MM.HRES \ 2, MM.VRES \ 2 + 12, "Punkte: " + STR$(Score), C, 1, 1, RGB(WHITE)
    TEXT MM.HRES \ 2, MM.VRES \ 2 + 40, "Level: " + STR$(Level), C, 1, 1, RGB(WHITE)

    SPRITE CLOSE ALL
END SUB 
