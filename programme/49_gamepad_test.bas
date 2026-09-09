Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 49_gamepad_test.bas
Rem Titel: Kapitel 49: Spielcontroller und Gamepads
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 09.09.2026
Rem
Rem Beschreibung:
Rem
Rem USB-Gamepad am PicoMite testen
Rem Zeigt Analogsticks, Trigger und gedrueckte Tasten an.
Rem Das erste Gamepad liegt normalerweise auf USB-Kanal 3.
Rem
Rem Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
Rem
Rem ====================================================================

Option EXPLICIT

Const Gamepad = 3

Const BtnR1%      = 1
Const BtnStart%   = 2
Const BtnHome%    = 4
Const BtnSelect%  = 8
Const BtnL1%      = 16
Const BtnDown%    = 32
Const BtnRight%   = 64
Const BtnUp%      = 128
Const BtnLeft%    = 256
Const BtnR2%      = 512
Const BtnTriangle%= 1024
Const BtnCircle%  = 2048
Const BtnSquare%  = 4096
Const BtnCross%   = 8192
Const BtnL2%      = 16384
Const BtnTouch%   = 32768

Dim usbType%
Dim lx, ly, rx, ry
Dim lTrigger, rTrigger
Dim buttons%

usbType% = MM.Info(USB Gamepad)

Print "Gamepad-Test"
Print "============"
Print

If usbType% = 0 Then
    Print "Kein USB-Geraet auf Kanal "; Gamepad; " gefunden."
    Print "Das erste Gamepad wird normalerweise Kanal 3 zugeordnet."
    End
EndIf

Print "USB-Kanal : "; Gamepad
Print "Geraetecode: "; usbType%;

Select Case usbType%
    Case 128
        Print "  (PS4-Controller)"
    Case 129
        Print "  (PS3-Controller)"
    Case 130
        Print "  (SNES/Generic-Gamepad)"
    Case Else
        Print
        Print "Achtung: Auf diesem Kanal wurde kein bekanntes Gamepad erkannt."
        End
End Select

Print
Print "Controller bewegen oder Tasten druecken."
Print "Abbruch mit Ctrl-C."
Print

Do
    lx = DEVICE(GAMEPAD Gamepad, LX)
    ly = DEVICE(GAMEPAD Gamepad, LY)
    rx = DEVICE(GAMEPAD Gamepad, RX)
    ry = DEVICE(GAMEPAD Gamepad, RY)

    lTrigger = DEVICE(GAMEPAD Gamepad, L)
    rTrigger = DEVICE(GAMEPAD Gamepad, R)
    buttons% = DEVICE(GAMEPAD Gamepad, B)

    Print @(0,150) "LX:"; lx; "  LY:"; ly; "  RX:"; rx; "  RY:"; ry; "    "
    Print @(0,165) "L :"; lTrigger; "  R :"; rTrigger; "  B:"; buttons%; "    "
    Print @(0,180) "Tasten: ";
    If buttons% <> 0 Then


        If (buttons% And BtnR1%)       <> 0 Then Print "R1 ";
        If (buttons% And BtnStart%)    <> 0 Then Print "START/OPTIONS ";
        If (buttons% And BtnHome%)     <> 0 Then Print "HOME ";
        If (buttons% And BtnSelect%)   <> 0 Then Print "SELECT/SHARE ";
        If (buttons% And BtnL1%)       <> 0 Then Print "L1 ";
        If (buttons% And BtnDown%)     <> 0 Then Print "DOWN ";
        If (buttons% And BtnRight%)    <> 0 Then Print "RIGHT ";
        If (buttons% And BtnUp%)       <> 0 Then Print "UP ";
        If (buttons% And BtnLeft%)     <> 0 Then Print "LEFT ";
        If (buttons% And BtnR2%)       <> 0 Then Print "R2 ";
        If (buttons% And BtnTriangle%) <> 0 Then Print "X/TRIANGLE ";
        If (buttons% And BtnCircle%)   <> 0 Then Print "A/CIRCLE ";
        If (buttons% And BtnSquare%)   <> 0 Then Print "Y/SQUARE ";
        If (buttons% And BtnCross%)    <> 0 Then Print "B/CROSS ";
        If (buttons% And BtnL2%)       <> 0 Then Print "L2 ";
        If (buttons% And BtnTouch%)    <> 0 Then Print "TOUCHPAD ";

        Print "                                                  "
    Else
        Print "keine                                             "
    EndIf

    Print
    Pause 100
Loop
