Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 50_sprite_demo.bas
Rem Titel: Kapitel 50: Sprites und BLIT
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 09.09.2026
Rem
Rem Beschreibung:
Rem
Rem Zwei Sprites werden direkt im BASIC-Programm erzeugt.
Rem Sie bewegen sich mit SPRITE NEXT / SPRITE MOVE und prallen
Rem aneinander sowie an den Bildschirmraendern ab.
Rem
Rem Beenden mit Q
Rem
Rem Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
Rem
Rem ====================================================================

Option BASE 0

Dim INTEGER BallPixels%(255)
Dim INTEGER BoxPixels%(399)

Dim INTEGER x1%, y1%, dx1%, dy1%
Dim INTEGER x2%, y2%, dx2%, dy2%
Dim STRING Taste$

CreateSprites

CLS
Print @(10, 10) "SPRITE-Demo - Q beendet"

' Sprite 1: 16 x 16 Pixel
' Sprite 2: 20 x 20 Pixel
Sprite LOADARRAY #1, 16, 16, BallPixels%()
Sprite LOADARRAY #2, 20, 20, BoxPixels%()

' Farbcode 0 wird transparent dargestellt
Sprite SET TRANSPARENT 0

' Startpositionen
x1% = 40
y1% = 70

x2% = MM.HRES - 100
y2% = MM.VRES - 100

' Bewegungsrichtungen
dx1% = 3
dy1% = 2

dx2% = -2
dy2% = -3

' Beide Sprites liegen auf Layer 1 und koennen kollidieren
Sprite SHOW #1, x1%, y1%, 1
Sprite SHOW #2, x2%, y2%, 1

' Collision-Interrupt einschalten
Sprite INTERRUPT Collision

Do
    ' Neue Positionen berechnen
    x1% = x1% + dx1%
    y1% = y1% + dy1%

    x2% = x2% + dx2%
    y2% = y2% + dy2%

    ' Beide Bewegungen vorbereiten ...
    Sprite NEXT #1, x1%, y1%
    Sprite NEXT #2, x2%, y2%

    ' ... und gemeinsam ausfuehren.
    ' Kollisionen werden danach von MMBasic gemeldet.
    Sprite MOVE

    ' Die tatsaechliche Sprite-Position wieder uebernehmen.
    ' Das ist besonders nach einer Kollision nuetzlich.
    x1% = sprite(X, 1)
    y1% = sprite(Y, 1)
    x2% = sprite(X, 2)
    y2% = sprite(Y, 2)

    Pause 20

    Taste$ = Inkey$
    If UCASE$(Taste$) = "Q" Then Exit Do
Loop

' Aufraeumen
Sprite HIDE ALL
Sprite CLOSE ALL

CLS
Print "Sprite-Demo beendet."
End


' ------------------------------------------------------------
' Sprite-Grafiken erzeugen
' ------------------------------------------------------------
Sub CreateSprites
    Local INTEGER x%, y%, p%, rx%, ry%

    ' --------------------------------------------------------
    ' Sprite 1: gelber Ball mit rotem Rand
    ' 16 x 16 Pixel
    ' --------------------------------------------------------
    For y% = 0 To 15
        For x% = 0 To 15
            p% = y% * 16 + x%

            rx% = x% - 7
            ry% = y% - 7

            If rx% * rx% + ry% * ry% <= 49 Then
                If rx% * rx% + ry% * ry% >= 36 Then
                    BallPixels%(p%) = &HFF0000
                Else
                    BallPixels%(p%) = &HFFFF00
                EndIf
            Else
                BallPixels%(p%) = 0
            EndIf
        Next x%
    Next y%

    ' --------------------------------------------------------
    ' Sprite 2: cyanfarbenes Quadrat mit weissem Mittelpunkt
    ' 20 x 20 Pixel
    ' --------------------------------------------------------
    For y% = 0 To 19
        For x% = 0 To 19
            p% = y% * 20 + x%

            If x% = 0 Or x% = 19 Or y% = 0 Or y% = 19 Then
                BoxPixels%(p%) = &H00FFFF
            Else If x% >= 7 And x% <= 12 And y% >= 7 And y% <= 12 Then
                BoxPixels%(p%) = &HFFFFFF
            Else
                BoxPixels%(p%) = &H0000FF
            EndIf
        Next x%
    Next y%
End Sub


' ------------------------------------------------------------
' Collision-Interrupt
'
' SPRITE MOVE meldet Kollisionen wie ein Scroll-Vorgang.
' Deshalb kann SPRITE(S) gleich 0 sein. In diesem Fall liefert
' SPRITE(C, 0) die Anzahl der Sprites mit Kollisionen.
' ------------------------------------------------------------
Sub Collision
    Local INTEGER i%, s%

    If sprite(S) <> 0 Then
        ProcessCollision sprite(S)
    Else
        For i% = 1 To sprite(C, 0)
            s% = sprite(C, 0, i%)
            ProcessCollision s%
        Next i%
    EndIf
End Sub


' ------------------------------------------------------------
' Kollisionen eines bestimmten Sprites auswerten
' ------------------------------------------------------------
Sub ProcessCollision(s%)
    Local INTEGER i%, hit%

    For i% = 1 To sprite(C, s%)
        hit% = sprite(C, s%, i%)

        Select Case hit%
            Case &HF1
                ' linker Bildschirmrand
                If s% = 1 Then dx1% = Abs(dx1%)
                If s% = 2 Then dx2% = Abs(dx2%)

            Case &HF2
                ' oberer Bildschirmrand
                If s% = 1 Then dy1% = Abs(dy1%)
                If s% = 2 Then dy2% = Abs(dy2%)

            Case &HF4
                ' rechter Bildschirmrand
                If s% = 1 Then dx1% = -Abs(dx1%)
                If s% = 2 Then dx2% = -Abs(dx2%)

            Case &HF8
                ' unterer Bildschirmrand
                If s% = 1 Then dy1% = -Abs(dy1%)
                If s% = 2 Then dy2% = -Abs(dy2%)

            Case Else
                ' Kollision mit einem anderen Sprite.
                ' Bei zwei bewegten Objekten kehren wir jeweils
                ' beide Bewegungsrichtungen um.
                If s% = 1 Then
                    dx1% = -dx1%
                    dy1% = -dy1%
                Else If s% = 2 Then
                    dx2% = -dx2%
                    dy2% = -dy2%
                EndIf
        End Select
    Next i%
End Sub
