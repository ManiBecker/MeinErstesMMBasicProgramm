Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 37_senso.bas
Rem Titel: Kapitel 37: Senso - das elektronische Gedaechtnisspiel
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 31.08.2026
Rem
Rem Beschreibung: Ein vollstaendiges elektronisches Gedaechtnisspiel
Rem
Rem Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
Rem
Rem ====================================================================

SetPin GP0, DOUT 'LED 1
SetPin GP1, DOUT 'LED 2
SetPin GP2, DOUT 'LED 3
SetPin GP3, DOUT 'LED 4
SetPin GP4, DIN  'Taster 1
SetPin GP5, DIN  'Taster 2
SetPin GP6, DIN  'Taster 3
SetPin GP7, DIN  'Taster 4

Dim FOLGE(100)

Do

  LEVEL=1
  CLS RGB(BLACK)
  Print "Senso - das elektronische Gedaechtnisspiel"
  Print
  Print "Druecke Taste ";
  For i=1 To 4
    Print i;
    ZeigeFarbe i
    Pause 300
  Next i
  Pause 300
  Do
    Print
    Print "Runde: ";level
    Pause 300
    FOLGE(LEVEL)=Int(Rnd*4)+1
    For I=1 To LEVEL
      ZeigeFarbe FOLGE(I)
    Next I
    FEHLER=0
    For I=1 To LEVEL
      TASTE=HoleTaste()
      If TASTE<>FOLGE(I) Then
        FEHLER=1
        Exit For
      EndIf
    Next I
    If FEHLER=1 Then
      Fehleranimation 3
      Exit Do
    EndIf
    LEVEL=LEVEL+1
    Pause 500
  Loop

  Print
  Print "Spiel beendet"
  Print "Erreichte Runde:"
  Print LEVEL

  If LEVEL>BESTE_RUNDE Then
    BESTE_RUNDE=LEVEL
    Print "Beste Rundenamzahl!"
  EndIf

  Print
  Print "Noch einmal? (J/N)"
  Do : t$=Inkey$ : Loop While t$=""

Loop While t$="j" Or t$="J"

Print
Print "Ready..."
End

Sub ZeigeFarbe(FARBE)
  Select Case FARBE
  Case 1
    Pin(GP0)=1
    Play TONE 262,262,250
    Pin(GP0)=0
  Case 2
    Pin(GP1)=1
    Play TONE 330,330,250
    Pin(GP1)=0
  Case 3
    Pin(GP2)=1
    Play TONE 392,392,250
    Pin(GP2)=0
  Case 4
    Pin(GP3)=1
    Play TONE 523,523,250
    Pin(GP3)=0
  End Select
  Pause 300
End Sub

Function HoleTaste()
  Do
    t$=Inkey$
    If Pin(GP4)=1 Or t$="1" Then
      Print ".";
      Do : Loop While Pin(GP4)=1 Or KeyDown(0)>0
      HoleTaste=1
      ZeigeFarbe 1
      Exit Function
    EndIf
    If Pin(GP5)=1 Or t$="2" Then
      Print ".";
      Do : Loop While Pin(GP5)=1 Or KeyDown(0)>0
      HoleTaste=2
      ZeigeFarbe 2
      Exit Function
    EndIf
    If Pin(GP6)=1 Or t$="3" Then
      Print ".";
      Do : Loop While Pin(GP6)=1 Or KeyDown(0)>0
      HoleTaste=3
      ZeigeFarbe 3
      Exit Function
    EndIf
    If Pin(GP7)=1 Or t$="4" Then
      Print ".";
      Do : Loop While Pin(GP7)=1 Or KeyDown(0)>0
      HoleTaste=4
      ZeigeFarbe 4
      Exit Function
    EndIf
  Loop
End Function

Sub Fehleranimation(ANZAHL)
  Print
  Print "Falsche Taste!"
  Print
  For I=1 To ANZAHL
    Pin(GP0)=1
    Pin(GP1)=1
    Pin(GP2)=1
    Pin(GP3)=1
    Play tone 300,300,250
    Pause 200
    Pin(GP0)=0
    Pin(GP1)=0
    Pin(GP2)=0
    Pin(GP3)=0
    Play tone 500,500,250
    Pause 200
  Next I
End Sub
