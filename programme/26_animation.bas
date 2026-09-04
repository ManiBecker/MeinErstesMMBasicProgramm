Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 26_animation.bas
Rem Titel: Kapitel 26: Animationen und bewegte Grafiken
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 04.09.2026
Rem
Rem Beschreibung: Beispiele fuer Animationen und bewegte Grafiken
Rem
Rem Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
Rem
Rem ====================================================================

MODE 2

CLS
Print "Unser erstes bewegtes Objekt"
Pause 1000

X=50
Y=100

For J=1 To 100
  CLS
  Circle X,Y,10,,,RGB(YELLOW),RGB(YELLOW)
  Pause 20
  X=X+2
Next J

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "Bewegung in zwei Richtungen"
Pause 1000

X=50
Y=50

For J=1 To 100
  CLS
  Circle X,Y,10,,,RGB(CYAN),RGB(CYAN)
  Pause 20
  X=X+2
  Y=Y+1
Next J

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "Der erste huepfende Ball"
Pause 1000

X=100
Y=100
DX=3
DY=2

For J=1 To 200
  CLS
  Circle X,Y,10,,,RGB(YELLOW),RGB(YELLOW)
  Pause 15

  X=X+DX
  Y=Y+DY

  If X<10 Then X=10: DX=Abs(DX)
  If X>MM.HRES-10 Then X=MM.HRES-10: DX=-Abs(DX)
  If Y<10 Then Y=10: DY=Abs(DY)
  If Y>MM.VRES-10 Then Y=MM.VRES-10: DY=-Abs(DY)
Next J

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "Zehn huepfende Baelle"
Pause 1000

Dim aX(9)
Dim aY(9)
Dim aDX(9)
Dim aDY(9)
Dim aC(9)
Dim aCB(9)

For I=0 To 9
  aX(I)=10+Int(Rnd*(MM.HRES-20))
  aY(I)=10+Int(Rnd*(MM.VRES-20))

  aDX(I)=Int(Rnd*5)+1
  aDY(I)=Int(Rnd*5)+1

  If Rnd<0.5 Then aDX(I)=-aDX(I)
  If Rnd<0.5 Then aDY(I)=-aDY(I)

  aC(I)=RGB(Int(Rnd*256),Int(Rnd*256),Int(Rnd*256))
  aCB(I)=RGB(Int(Rnd*256),Int(Rnd*256),Int(Rnd*256))
Next I

For J=1 To 200
  CLS

  For I=0 To 9
    Circle aX(I),aY(I),10,,,aC(I),aCB(I)

    aX(I)=aX(I)+aDX(I)
    aY(I)=aY(I)+aDY(I)

    If aX(I)<10 Then aX(I)=10: aDX(I)=Abs(aDX(I))
    If aX(I)>MM.HRES-10 Then aX(I)=MM.HRES-10: aDX(I)=-Abs(aDX(I))
    If aY(I)<10 Then aY(I)=10: aDY(I)=Abs(aDY(I))
    If aY(I)>MM.VRES-10 Then aY(I)=MM.VRES-10: aDY(I)=-Abs(aDY(I))
  Next I

  Pause 20
Next J

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "Ein kleiner Bildschirmschoner"
Pause 1000

text$="MMBasic"
textWidth=Len(text$)*MM.FONTWIDTH
textHeight=MM.FONTHEIGHT

For I=0 To 9
  aX(I)=Int(Rnd*(MM.HRES-textWidth+1))
  aY(I)=Int(Rnd*(MM.VRES-textHeight+1))

  aDX(I)=Int(Rnd*5)+1
  aDY(I)=Int(Rnd*5)+1

  If Rnd<0.5 Then aDX(I)=-aDX(I)
  If Rnd<0.5 Then aDY(I)=-aDY(I)

  aC(I)=RGB(Int(Rnd*256),Int(Rnd*256),Int(Rnd*256))
Next I

For J=0 To 500
  CLS

  For I=0 To 9
    Text aX(I),aY(I),text$,,,,aC(I)

    aX(I)=aX(I)+aDX(I)
    aY(I)=aY(I)+aDY(I)

    If aX(I)<0 Then aX(I)=0: aDX(I)=Abs(aDX(I))
    If aX(I)>MM.HRES-textWidth Then aX(I)=MM.HRES-textWidth: aDX(I)=-Abs(aDX(I))
    If aY(I)<0 Then aY(I)=0: aDY(I)=Abs(aDY(I))
    If aY(I)>MM.VRES-textHeight Then aY(I)=MM.VRES-textHeight: aDY(I)=-Abs(aDY(I))
  Next I

  Pause 20
Next J

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "Ein weiterer Bildschirmschoner"
Pause 1000

Dim aX1(9)
Dim aY1(9)
Dim aX2(9)
Dim aY2(9)
Dim aDX1(9)
Dim aDY1(9)
Dim aDX2(9)
Dim aDY2(9)

For I=0 To 9
  aX1(I)=Int(Rnd*MM.HRES)
  aY1(I)=Int(Rnd*MM.VRES)
  aX2(I)=aX1(I)
  aY2(I)=aY1(I)

  aDX1(I)=Int(Rnd*5)+1
  aDY1(I)=Int(Rnd*5)+1
  aDX2(I)=Int(Rnd*5)+1
  aDY2(I)=Int(Rnd*5)+1

  If Rnd<0.5 Then aDX1(I)=-aDX1(I)
  If Rnd<0.5 Then aDY1(I)=-aDY1(I)
  If Rnd<0.5 Then aDX2(I)=-aDX2(I)
  If Rnd<0.5 Then aDY2(I)=-aDY2(I)

  aC(I)=RGB(Int(Rnd*256),Int(Rnd*256),Int(Rnd*256))
Next I

For J=0 To 500
  CLS

  For I=0 To 9
    Line aX1(I),aY1(I),aX2(I),aY2(I),1,aC(I)

    aX1(I)=aX1(I)+aDX1(I)
    aY1(I)=aY1(I)+aDY1(I)

    If aX1(I)<0 Then aX1(I)=0: aDX1(I)=Int(Rnd*5)+1
    If aX1(I)>MM.HRES-1 Then aX1(I)=MM.HRES-1: aDX1(I)=-(Int(Rnd*5)+1)
    If aY1(I)<0 Then aY1(I)=0: aDY1(I)=Int(Rnd*5)+1
    If aY1(I)>MM.VRES-1 Then aY1(I)=MM.VRES-1: aDY1(I)=-(Int(Rnd*5)+1)

    aX2(I)=aX2(I)+aDX2(I)
    aY2(I)=aY2(I)+aDY2(I)

    If aX2(I)<0 Then aX2(I)=0: aDX2(I)=Int(Rnd*5)+1
    If aX2(I)>MM.HRES-1 Then aX2(I)=MM.HRES-1: aDX2(I)=-(Int(Rnd*5)+1)
    If aY2(I)<0 Then aY2(I)=0: aDY2(I)=Int(Rnd*5)+1
    If aY2(I)>MM.VRES-1 Then aY2(I)=MM.VRES-1: aDY2(I)=-(Int(Rnd*5)+1)
  Next I

  Pause 20
Next J

Print "Ready..." 
