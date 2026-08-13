Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 21_treffe_die_scheibe.bas
Rem Titel: Kapitel 21: Treffe die Scheibe
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 14.08.2026
Rem
Rem Beschreibung: Unser erstes Grafikspiel
Rem
Rem Hardware/Voraussetzungen: keine/PicoMite/ColourMaxiMite
Rem
Rem ====================================================================

MODE 2

CLS RGB(BLACK)

TX=Int(Rnd*(MM.HRES-120))+60
TY=Int(Rnd*(MM.VRES-120))+60

ZeichneScheibe TX,TY

Print
Print "Treffe die Scheibe!"
Print

Input "X ";SX
Input "Y ";SY

DIST=Sqr((SX-TX)^2+(SY-TY)^2)

Circle SX,SY,4,1,1,RGB(RED),RGB(RED)

Print
Print "Abstand: ";Int(DIST);" Pixel"

If DIST<10 Then
  Print "Volltreffer!"
ElseIf DIST<25 Then
  Print "Sehr gut!"
ElseIf DIST<50 Then
  Print "Gut getroffen!"
Else
  Print "Daneben!"
EndIf
Print
Print "Ready..."
End

Sub ZeichneScheibe(X,Y)
  Circle X,Y,60,2,1,RGB(WHITE)
  Circle X,Y,40,2,1,RGB(WHITE)
  Circle X,Y,20,2,1,RGB(WHITE)
End Sub
