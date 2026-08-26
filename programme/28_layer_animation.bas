Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 28_layer_animation.bas
Rem Titel: Kapitel 28: Layerbuffer und bewegliche Objekte
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 26.08.2026
Rem
Rem Beschreibung:
Rem
Rem Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
Rem
Rem ====================================================================

Option Continuation Lines On

MODE 2

CLS RGB(BLACK)
Print "Zunaechst zeichnen wir einen statischen Sternenhimmel."

For I=1 To 500
  X=Int(Rnd*MM.HRES)
  Y=Int(Rnd*MM.VRES)
  Pixel X,Y,RGB(WHITE)
Next I

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "Einen Ball auf dem Layerbuffer zeichnen"

For I=1 To 500
  X=Int(Rnd*MM.HRES)
  Y=Int(Rnd*MM.VRES)
  Pixel X,Y,RGB(WHITE)
Next I

FRAMEBUFFER LAYER
FRAMEBUFFER WRITE L

Circle 100,100,10,,,RGB(YELLOW),RGB(YELLOW)

FRAMEBUFFER WRITE N
Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "Ein beweglicher Ball"
Print "Press any key..."

For I=1 To 500
  Pixel Int(Rnd*MM.HRES),Int(Rnd*MM.VRES),RGB(WHITE)
Next I

'FRAMEBUFFER LAYER

X=100
Y=100
DX=3
DY=2

Do
  FRAMEBUFFER WRITE L
  CLS
  Circle X,Y,10,,,RGB(YELLOW),RGB(YELLOW)
  X=X+DX
  Y=Y+DY
  If X<10 Then DX=-DX
  If X>MM.HRES-10 Then DX=-DX
  If Y<10 Then DY=-DY
  If Y>MM.VRES-10 Then DY=-DY
  Pause 20
Loop While Inkey$=""

FRAMEBUFFER WRITE N

CLS RGB(BLACK)
Print "Ein Raumschiff ueber Sternenhimmel"
Print "Press any key..."
For I=1 To 500
  Pixel Int(Rnd*MM.HRES),Int(Rnd*MM.VRES),RGB(WHITE)
Next I

'FRAMEBUFFER LAYER

X=100
Y=100
DX=3
DY=2

Do
  FRAMEBUFFER WRITE L
  CLS

    Line X,Y-10,X-8,Y+8
    Line X,Y-10,X+8,Y+8
    Line X-8,Y+8,X+8,Y+8

  X=X+DX
  Y=Y+DY
  If X<10 Then DX=-DX
  If X>MM.HRES-10 Then DX=-DX
  If Y<10 Then DY=-DY
  If Y>MM.VRES-10 Then DY=-DY
  Pause 20
Loop While Inkey$=""

FRAMEBUFFER WRITE N

CLS RGB(BLACK)
Print "Mehrere Objekte"
Print "Press any key..."

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

  aC(I)=RGB(Int(Rnd*255),Int(Rnd*255),Int(Rnd*255))
  aCB(I)=RGB(Int(Rnd*255),Int(Rnd*255),Int(Rnd*255))
Next I


For I=1 To 500
  Pixel Int(Rnd*MM.HRES),Int(Rnd*MM.VRES),RGB(WHITE)
Next I

'FRAMEBUFFER LAYER

Do
  FRAMEBUFFER WRITE L
  CLS

  For I=0 To 9
    Circle aX(I),aY(I),8,,,aC(I),aCB(I)

    aX(I)=aX(I)+aDX(I)
    aY(I)=aY(I)+aDY(I)

    If aX(I)<10 Then aDX(I)=-aDX(I)
    If aX(I)>MM.HRES-10 Then aDX(I)=-aDX(I)
    If aY(I)<10 Then aDY(I)=-aDY(I)
    If aY(I)>MM.VRES-10 Then aDY(I)=-aDY(I)
  Next I

  Pause 20
Loop While Inkey$=""

FRAMEBUFFER WRITE N
CLS
Print "Ready..."
