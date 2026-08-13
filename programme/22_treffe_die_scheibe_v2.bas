Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 22_treffe_die_scheibe_v2.bas
Rem Titel: Kapitel 22: Treffe die Scheibe Version 2
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 14.08.2026
Rem
Rem Beschreibung: Unser erstes Grafikspiel, Version 2
Rem
Rem Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
Rem
Rem ====================================================================

MODE 2

CLS RGB(BLACK)

Input "Name ";NAME$

Print
Print "1 = Leicht"
Print "2 = Mittel"
Print "3 = Schwer"

Input "Schwierigkeit ";LEVEL

If LEVEL=1 Then
  RADIUS=60
ElseIf LEVEL=2 Then
  RADIUS=40
Else
  RADIUS=25
EndIf

Dim TREFFER(9)

GESAMTPUNKTE=0

For RUNDE=1 To 10

  CLS RGB(BLACK)

  TX=Int(Rnd*(MM.HRES-2*RADIUS))+RADIUS
  TY=Int(Rnd*(MM.VRES-2*RADIUS))+RADIUS

  ZeichneScheibe TX,TY,RADIUS
  Print

  Print "Schuss ";RUNDE;" von 10"

  Input "X ";SX
  Input "Y ";SY

  DIST=Sqr((SX-TX)^2+(SY-TY)^2)

  TREFFER(RUNDE-1)=DIST

  Circle SX,SY,4,1,1,RGB(RED),RGB(RED)

  PUNKTE=100-Int(DIST)

  If PUNKTE<0 Then
    PUNKTE=0
  EndIf

  GESAMTPUNKTE=GESAMTPUNKTE+PUNKTE

  Print
  Print "Entfernung : ";Int(DIST);" Pixel"
  Print "Punkte : ";PUNKTE

  Pause 1500

Next RUNDE

CLS RGB(BLACK)

Print
Print "===================="
Print " SPIEL BEENDET"
Print "===================="
Print
Print NAME$
Print
Print "Gesamtpunkte : ";GESAMTPUNKTE

BEST=TREFFER(0)

For I=1 To 9
  If TREFFER(I)<BEST Then
  BEST=TREFFER(I)
  EndIf
Next I

Print
Print "Bester Schuss : ";Int(BEST);" Pixel"
Print
Print "Alle Schuesse"

For I=0 To 9
  Print I+1;". ";Int(TREFFER(I));" Pixel"
Next I

Open "highscore.txt" For OUTPUT As #1

Print #1,NAME$,GESAMTPUNKTE

Close #1

Print
Print "Highscore gespeichert"
Print
Print "Ready..."

End

Sub ZeichneScheibe(X,Y,R)
  Circle X,Y,R,2,1,RGB(WHITE)
  Circle X,Y,R*0.66,2,1,RGB(WHITE)
  Circle X,Y,R*0.33,2,1,RGB(WHITE)
End Sub
