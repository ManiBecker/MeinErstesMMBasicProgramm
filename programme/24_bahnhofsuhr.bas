Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 24_bahnhofsuhr.bas
Rem Titel: Kapitel 24: Eine analoge Bahnhofsuhr
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 09.08.2026
Rem
Rem Beschreibung: Das vollstaendige Programm
Rem
Rem Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
Rem
Rem ====================================================================

MODE 3

mitteX=MM.HRES/2
mitteY=MM.VRES/2
radius=MM.HRES/2-10

If MM.VRES/2-10<radius Then
  radius=MM.VRES/2-10
EndIf

CLS RGB(BLACK)

Do
  If alteZeit$<>Time$ Then
    alteZeit$=Time$
    Berechne Time$
    ZeichneZifferblatt mitteX,mitteY,radius
    ZeichneText mitteX,mitteY,radius
    ZeichneStundenzeiger mitteX,mitteY,radius,stundenWinkel
    ZeichneMinutenzeiger mitteX,mitteY,radius,minutenWinkel
    ZeichneSekundenzeiger mitteX,mitteY,radius,sekundenWinkel
  EndIf
Loop While Inkey$=""

Print
Print "Ready..."
End

Sub Berechne(t$)
    stunde=Val(Left$(t$,2))
    minute=Val(Mid$(t$,4,2))
    sekunde=Val(Right$(t$,2))
    stundenWinkel=((stunde Mod 12)*30+minute*0.5)*Pi/180
    minutenWinkel=(minute*6+sekunde*0.1)*Pi/180
    sekundenWinkel=sekunde*6*Pi/180
End Sub

Sub ZeichneZifferblatt(x,y,r)
  Circle x,y,r,5,1,RGB(BLUE),RGB(WHITE)
  Circle x,y,r-5,5,1,RGB(BLACK),RGB(WHITE)
  For i=0 To 59
    winkel=i*6*Pi/180
    If i Mod 5=0 Then
      innen=r*0.78
      t=3
    Else
      innen=r*0.86
      t=1
    EndIf
    x1=x+Sin(winkel)*innen
    y1=y-Cos(winkel)*innen
    x2=x+Sin(winkel)*r*0.92
    y2=y-Cos(winkel)*r*0.92
    Line x1,y1,x2,y2,t,RGB(BLACK)
  Next i
End Sub

Sub ZeichneText(x,y,r)
    Color RGB(BLACK),RGB(WHITE)
    version$ = "MMBasic "+Str$(MM.Info(Version))
    Text x-MM.Info(FONTWIDTH)*Len(version$)/2,y-r*0.6,version$
    Text x-MM.Info(FONTWIDTH)*Len(MM.DEVICE$)/2,y-r*0.53,MM.DEVICE$
    Text x-MM.Info(FONTWIDTH)*4,y+r*0.53,Time$
    Text x-MM.Info(FONTWIDTH)*5,y+r*0.6,Date$
End Sub

Sub ZeichneStundenzeiger(x,y,r,winkel)
  x2=x+Sin(winkel)*r*0.55
  y2=y-Cos(winkel)*r*0.55
  Line x,y,x2,y2,5,RGB(MIDGREEN)
  Circle mitteX,mitteY,radius*0.045,4,1,RGB(MIDGREEN),RGB(BLUE)
End Sub

Sub ZeichneMinutenzeiger(x,y,r,winkel)
  x2=x+Sin(winkel)*R*0.84
  y2=y-Cos(winkel)*R*0.84
  Line x,y,x2,y2,3,RGB(BLUE)
  Circle mitteX,mitteY,radius*0.035,4,1,RGB(BLUE),RGB(RED)
End Sub

Sub ZeichneSekundenzeiger(x,y,r,winkel)
  x1=x-Sin(winkel)*r*0.14
  y1=y+Cos(winkel)*r*0.14
  x2=x+Sin(winkel)*r*0.84
  y2=y-Cos(winkel)*r*0.84
  Line x1,y1,x2,y2,1,RGB(RED)
  xk=x+Sin(winkel)*r*0.70
  yk=y-Cos(winkel)*r*0.70
  Circle xk,yk,r*0.035,1,1,RGB(RED),RGB(WHITE)
End Sub
