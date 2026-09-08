REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 50_sprite_demo.bas
REM Titel: Kapitel 50: Sprites und BLIT
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 08.09.2026
REM
REM Beschreibung:
REM
REM Zwei Sprites werden direkt im BASIC-Programm erzeugt.
REM Sie bewegen sich mit SPRITE NEXT / SPRITE MOVE und prallen
REM aneinander sowie an den Bildschirmraendern ab.
REM
REM Beenden mit Q
REM
REM Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
REM
REM ====================================================================

OPTION BASE 0

DIM INTEGER BallPixels%(255)
DIM INTEGER BoxPixels%(399)

DIM INTEGER x1%, y1%, dx1%, dy1%
DIM INTEGER x2%, y2%, dx2%, dy2%
DIM STRING Taste$

CreateSprites

CLS
PRINT @(10, 10) "SPRITE-Demo - Q beendet"

' Sprite 1: 16 x 16 Pixel
' Sprite 2: 20 x 20 Pixel
SPRITE LOADARRAY #1, 16, 16, BallPixels%()
SPRITE LOADARRAY #2, 20, 20, BoxPixels%()

' Farbcode 0 wird transparent dargestellt
SPRITE SET TRANSPARENT 0

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
SPRITE SHOW #1, x1%, y1%, 1
SPRITE SHOW #2, x2%, y2%, 1

' Collision-Interrupt einschalten
SPRITE INTERRUPT Collision

DO
    ' Neue Positionen berechnen
    x1% = x1% + dx1%
    y1% = y1% + dy1%

    x2% = x2% + dx2%
    y2% = y2% + dy2%

    ' Beide Bewegungen vorbereiten ...
    SPRITE NEXT #1, x1%, y1%
    SPRITE NEXT #2, x2%, y2%

    ' ... und gemeinsam ausfuehren.
    ' Kollisionen werden danach von MMBasic gemeldet.
    SPRITE MOVE

    ' Die tatsaechliche Sprite-Position wieder uebernehmen.
    ' Das ist besonders nach einer Kollision nuetzlich.
    x1% = SPRITE(X, 1)
    y1% = SPRITE(Y, 1)
    x2% = SPRITE(X, 2)
    y2% = SPRITE(Y, 2)

    PAUSE 20

    Taste$ = INKEY$
    IF UCASE$(Taste$) = "Q" THEN EXIT DO
LOOP

' Aufraeumen
SPRITE INTERRUPT 0
SPRITE HIDE ALL
SPRITE CLOSE ALL

CLS
PRINT "Sprite-Demo beendet."
END


' ------------------------------------------------------------
' Sprite-Grafiken erzeugen
' ------------------------------------------------------------
SUB CreateSprites
    LOCAL INTEGER x%, y%, p%, rx%, ry%

    ' --------------------------------------------------------
    ' Sprite 1: gelber Ball mit rotem Rand
    ' 16 x 16 Pixel
    ' --------------------------------------------------------
    FOR y% = 0 TO 15
        FOR x% = 0 TO 15
            p% = y% * 16 + x%

            rx% = x% - 7
            ry% = y% - 7

            IF rx% * rx% + ry% * ry% <= 49 THEN
                IF rx% * rx% + ry% * ry% >= 36 THEN
                    BallPixels%(p%) = &HFF0000
                ELSE
                    BallPixels%(p%) = &HFFFF00
                ENDIF
            ELSE
                BallPixels%(p%) = 0
            ENDIF
        NEXT x%
    NEXT y%

    ' --------------------------------------------------------
    ' Sprite 2: cyanfarbenes Quadrat mit weissem Mittelpunkt
    ' 20 x 20 Pixel
    ' --------------------------------------------------------
    FOR y% = 0 TO 19
        FOR x% = 0 TO 19
            p% = y% * 20 + x%

            IF x% = 0 OR x% = 19 OR y% = 0 OR y% = 19 THEN
                BoxPixels%(p%) = &H00FFFF
            ELSE IF x% >= 7 AND x% <= 12 AND y% >= 7 AND y% <= 12 THEN
                BoxPixels%(p%) = &HFFFFFF
            ELSE
                BoxPixels%(p%) = &H0000FF
            ENDIF
        NEXT x%
    NEXT y%
END SUB


' ------------------------------------------------------------
' Collision-Interrupt
'
' SPRITE MOVE meldet Kollisionen wie ein Scroll-Vorgang.
' Deshalb kann SPRITE(S) gleich 0 sein. In diesem Fall liefert
' SPRITE(C, 0) die Anzahl der Sprites mit Kollisionen.
' ------------------------------------------------------------
SUB Collision
    LOCAL INTEGER i%, s%

    IF SPRITE(S) <> 0 THEN
        ProcessCollision SPRITE(S)
    ELSE
        FOR i% = 1 TO SPRITE(C, 0)
            s% = SPRITE(C, 0, i%)
            ProcessCollision s%
        NEXT i%
    ENDIF
END SUB


' ------------------------------------------------------------
' Kollisionen eines bestimmten Sprites auswerten
' ------------------------------------------------------------
SUB ProcessCollision(s%)
    LOCAL INTEGER i%, hit%

    FOR i% = 1 TO SPRITE(C, s%)
        hit% = SPRITE(C, s%, i%)

        SELECT CASE hit%
            CASE &HF1
                ' linker Bildschirmrand
                IF s% = 1 THEN dx1% = ABS(dx1%)
                IF s% = 2 THEN dx2% = ABS(dx2%)

            CASE &HF2
                ' oberer Bildschirmrand
                IF s% = 1 THEN dy1% = ABS(dy1%)
                IF s% = 2 THEN dy2% = ABS(dy2%)

            CASE &HF4
                ' rechter Bildschirmrand
                IF s% = 1 THEN dx1% = -ABS(dx1%)
                IF s% = 2 THEN dx2% = -ABS(dx2%)

            CASE &HF8
                ' unterer Bildschirmrand
                IF s% = 1 THEN dy1% = -ABS(dy1%)
                IF s% = 2 THEN dy2% = -ABS(dy2%)

            CASE ELSE
                ' Kollision mit einem anderen Sprite.
                ' Bei zwei bewegten Objekten kehren wir jeweils
                ' beide Bewegungsrichtungen um.
                IF s% = 1 THEN
                    dx1% = -dx1%
                    dy1% = -dy1%
                ELSE IF s% = 2 THEN
                    dx2% = -dx2%
                    dy2% = -dy2%
                ENDIF
        END SELECT
    NEXT i%
END SUB 
