REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 28_layer_animation.bas
REM Titel: Kapitel 28: Layerbuffer und bewegliche Objekte
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 27.07.2026
REM
REM Beschreibung:
REM
REM Hardware/Voraussetzungen: keine/PicoMite/ColourMaxiMite
REM
REM ====================================================================

Option Continuation Lines On

MODE 2

CLS RGB(BLACK)
Print "Zunaechst zeichnen wir einen statischen Sternenhimmel."

FOR I=1 TO 500
  X=INT(RND*MM.HRES)
  Y=INT(RND*MM.VRES)
  PIXEL X,Y,RGB(WHITE)
NEXT I

PRINT "Press any key...": Do: Loop While Inkey$=""

CLS
Print "Einen Ball auf dem Layerbuffer zeichnen"

FOR I=1 TO 500
  X=INT(RND*MM.HRES)
  Y=INT(RND*MM.VRES)
  PIXEL X,Y,RGB(WHITE)
NEXT I

FRAMEBUFFER LAYER
FRAMEBUFFER WRITE L

CIRCLE 100,100,10,,,RGB(YELLOW),RGB(YELLOW)

PRINT "Press any key...": Do: Loop While Inkey$=""

CLS
Print "Ein beweglicher Ball"
CLS RGB(BLACK)

FOR I=1 TO 500
  PIXEL INT(RND*MM.HRES), _
        INT(RND*MM.VRES), _
        RGB(WHITE)
NEXT I

FRAMEBUFFER LAYER

X=100
Y=100
DX=3
DY=2

DO
  FRAMEBUFFER WRITE L
  CLS
  CIRCLE X,Y,10,,,RGB(YELLOW),RGB(YELLOW)
  X=X+DX
  Y=Y+DY
  IF X<10 THEN DX=-DX
  IF X>MM.HRES-10 THEN DX=-DX
  IF Y<10 THEN DY=-DY
  IF Y>MM.VRES-10 THEN DY=-DY
  PAUSE 20
LOOP

PRINT "Press any key...": Do: Loop While Inkey$=""

CLS
Print "Ein Raumschiff über Sternenhimmel"
FOR I=1 TO 500
  PIXEL INT(RND*MM.HRES), _
        INT(RND*MM.VRES), _
        RGB(WHITE)
NEXT I

FRAMEBUFFER LAYER

X=100
Y=100
DX=3
DY=2

DO
  FRAMEBUFFER WRITE L
  CLS

    LINE X,Y-10,X-8,Y+8
    LINE X,Y-10,X+8,Y+8
    LINE X-8,Y+8,X+8,Y+8

  X=X+DX
  Y=Y+DY
  IF X<10 THEN DX=-DX
  IF X>MM.HRES-10 THEN DX=-DX
  IF Y<10 THEN DY=-DY
  IF Y>MM.VRES-10 THEN DY=-DY
  PAUSE 20
LOOP

PRINT "Press any key...": Do: Loop While Inkey$=""

CLS
Print "Mehrere Objekte"

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


FOR I=1 TO 500
  PIXEL INT(RND*MM.HRES), _
        INT(RND*MM.VRES), _
        RGB(WHITE)
NEXT I

FRAMEBUFFER LAYER

DO
  FRAMEBUFFER WRITE L
  CLS

  FOR I=0 TO 9
    CIRCLE aX(I),aY(I),8,,,aC(I),aCB(I)

    aX(I)=aX(I)+aDX(I)
    aY(I)=aY(I)+aDY(I)

    If aX(I)<10 Then aDX(I)=-aDX(I)
    If aX(I)>MM.HRES-10 Then aDX(I)=-aDX(I)
    If aY(I)<10 Then aDY(I)=-aDY(I)
    If aY(I)>MM.VRES-10 Then aDY(I)=-aDY(I)
  NEXT I

  PAUSE 20
LOOP While Inkey$=""

Print "Ready..."
