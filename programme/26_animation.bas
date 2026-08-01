REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 26_animation.bas
REM Titel: Kapitel 26: Animationen und bewegte Grafiken
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 29.07.2026
REM
REM Beschreibung: Objekte zu bewegen
REM
REM Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
REM
REM ====================================================================

PRINT "3. Unser erstes bewegtes Objekt"
MODE 2
X=50
Y=100
FOR J = 1 TO 100
  CLS
  CIRCLE X,Y,10,,,RGB(YELLOW),RGB(YELLOW)
  PAUSE 20
  X=X+2
NEXT J

PRINT "Press any key...": Do: Loop While Inkey$=""

CLS
PRINT "6. Bewegung in zwei Richtungen"
MODE 2
X=50
Y=50
FOR J = 1 TO 100  CLS
  CIRCLE X,Y,10,,,RGB(CYAN),RGB(CYAN)
  PAUSE 20
  X=X+2
  Y=Y+1
NEXT J

PRINT "Press any key...": Do: Loop While Inkey$=""

CLS
PRINT "9. Der erste huepfende Ball"
MODE 2
X=100
Y=100
DX=3
DY=2
FOR J = 1 TO 100  CLS
  CIRCLE X,Y,10,,,RGB(YELLOW),RGB(YELLOW)
  PAUSE 15
  X=X+DX
  Y=Y+DY
  IF X<10 THEN DX=-DX
  IF X>MM.HRES-10 THEN DX=-DX
  IF Y<10 THEN DY=-DY
  IF Y>MM.VRES-10 THEN DY=-DY
NEXT J

PRINT "Press any key...": Do: Loop While Inkey$=""

CLS
PRINT "15. Zehn huepfende Baelle"
MODE 2

DIM X(9)
DIM Y(9)
DIM DX(9)
DIM DY(9)

FOR I = 0 TO 9
  X(I)=10+INT(RND*(MM.HRES-20))
  Y(I)=10+INT(RND*(MM.VRES-20))

  DX(I)=INT(RND*5)+1
  DY(I)=INT(RND*5)+1

  IF RND<0.5 THEN DX(I)=-DX(I)
  IF RND<0.5 THEN DY(I)=-DY(I)
NEXT I

FOR J = 1 TO 100
  CLS

  FOR I=0 TO 9
    CIRCLE X(I),Y(I),10,,,RGB(YELLOW),RGB(YELLOW)

    X(I)=X(I)+DX(I)
    Y(I)=Y(I)+DY(I)

    IF X(I)<10 THEN DX(I)=-DX(I)
    IF X(I)>MM.HRES-10 THEN DX(I)=-DX(I)
    IF Y(I)<10 THEN DY(I)=-DY(I)
    IF Y(I)>MM.VRES-10 THEN DY(I)=-DY(I)
  NEXT I

  PAUSE 20
NEXT J

PRINT "Press any key...": Do: Loop While Inkey$=""

CLS

PRINT "16. Ein kleiner Bildschirmschoner"
MODE 2
DIM X(9)
DIM Y(9)
DIM DX(9)
DIM DY(9)
FOR I=0 TO 9
  X(I)=INT(RND*MM.HRES)
  Y(I)=INT(RND*MM.VRES)
  DX(I)=INT(RND*5)+1
  DY(I)=INT(RND*5)+1
NEXT I
DO
  CLS
  FOR I=0 TO 9
    TEXT X(I),Y(I),"MMBasic"
    X(I)=X(I)+DX(I)
    Y(I)=Y(I)+DY(I)
    IF X(I)<10 THEN DX(I)=-DX(I)
    IF X(I)>MM.HRES-10 THEN DX(I)=-DX(I)
    IF Y(I)<10 THEN DY(I)=-DY(I)
    IF Y(I)>MM.VRES-10 THEN DY(I)=-DY(I)
  NEXT I
  PAUSE 20
LOOP WHILE INKEY$=""