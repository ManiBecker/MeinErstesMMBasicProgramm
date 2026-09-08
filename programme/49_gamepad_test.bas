REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 49_gamepad_test.bas
REM Titel: Kapitel 49: Spielcontroller und Gamepads
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 08.09.2026
REM
REM Beschreibung:
REM
REM USB-Gamepad am PicoMite testen
REM Zeigt Analogsticks, Trigger und gedrueckte Tasten an.
REM Das erste Gamepad liegt normalerweise auf USB-Kanal 3.
REM
REM Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
REM
REM ====================================================================

OPTION EXPLICIT

CONST Gamepad = 3

CONST BtnR1%      = 1
CONST BtnStart%   = 2
CONST BtnHome%    = 4
CONST BtnSelect%  = 8
CONST BtnL1%      = 16
CONST BtnDown%    = 32
CONST BtnRight%   = 64
CONST BtnUp%      = 128
CONST BtnLeft%    = 256
CONST BtnR2%      = 512
CONST BtnTriangle%= 1024
CONST BtnCircle%  = 2048
CONST BtnSquare%  = 4096
CONST BtnCross%   = 8192
CONST BtnL2%      = 16384
CONST BtnTouch%   = 32768

DIM usbType%
DIM lx, ly, rx, ry
DIM lTrigger, rTrigger
DIM buttons%

usbType% = MM.INFO(USB Gamepad)

PRINT "Gamepad-Test"
PRINT "============"
PRINT

IF usbType% = 0 THEN
    PRINT "Kein USB-Geraet auf Kanal "; Gamepad; " gefunden."
    PRINT "Das erste Gamepad wird normalerweise Kanal 3 zugeordnet."
    END
ENDIF

PRINT "USB-Kanal : "; Gamepad
PRINT "Geraetecode: "; usbType%;

SELECT CASE usbType%
    CASE 128
        PRINT "  (PS4-Controller)"
    CASE 129
        PRINT "  (PS3-Controller)"
    CASE 130
        PRINT "  (SNES/Generic-Gamepad)"
    CASE ELSE
        PRINT
        PRINT "Achtung: Auf diesem Kanal wurde kein bekanntes Gamepad erkannt."
        END
END SELECT

PRINT
PRINT "Controller bewegen oder Tasten druecken."
PRINT "Abbruch mit Ctrl-C."
PRINT

DO
    lx = DEVICE(GAMEPAD Gamepad, LX)
    ly = DEVICE(GAMEPAD Gamepad, LY)
    rx = DEVICE(GAMEPAD Gamepad, RX)
    ry = DEVICE(GAMEPAD Gamepad, RY)

    lTrigger = DEVICE(GAMEPAD Gamepad, L)
    rTrigger = DEVICE(GAMEPAD Gamepad, R)
    buttons% = DEVICE(GAMEPAD Gamepad, B)

    PRINT "LX:"; lx; "  LY:"; ly; "  RX:"; rx; "  RY:"; ry
    PRINT "L :"; lTrigger; "  R :"; rTrigger; "  B:"; buttons%

    IF buttons% <> 0 THEN
        PRINT "Tasten: ";

        IF (buttons% AND BtnR1%)       <> 0 THEN PRINT "R1 ";
        IF (buttons% AND BtnStart%)    <> 0 THEN PRINT "START/OPTIONS ";
        IF (buttons% AND BtnHome%)     <> 0 THEN PRINT "HOME ";
        IF (buttons% AND BtnSelect%)   <> 0 THEN PRINT "SELECT/SHARE ";
        IF (buttons% AND BtnL1%)       <> 0 THEN PRINT "L1 ";
        IF (buttons% AND BtnDown%)     <> 0 THEN PRINT "DOWN ";
        IF (buttons% AND BtnRight%)    <> 0 THEN PRINT "RIGHT ";
        IF (buttons% AND BtnUp%)       <> 0 THEN PRINT "UP ";
        IF (buttons% AND BtnLeft%)     <> 0 THEN PRINT "LEFT ";
        IF (buttons% AND BtnR2%)       <> 0 THEN PRINT "R2 ";
        IF (buttons% AND BtnTriangle%) <> 0 THEN PRINT "X/TRIANGLE ";
        IF (buttons% AND BtnCircle%)   <> 0 THEN PRINT "A/CIRCLE ";
        IF (buttons% AND BtnSquare%)   <> 0 THEN PRINT "Y/SQUARE ";
        IF (buttons% AND BtnCross%)    <> 0 THEN PRINT "B/CROSS ";
        IF (buttons% AND BtnL2%)       <> 0 THEN PRINT "L2 ";
        IF (buttons% AND BtnTouch%)    <> 0 THEN PRINT "TOUCHPAD ";

        PRINT
    ELSE
        PRINT "Tasten: keine"
    ENDIF

    PRINT
    PAUSE 100
LOOP 
