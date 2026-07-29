REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 25_spirograph.bas
REM Titel: Kapitel 25: Geometrische Muster und Spirographen
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 29.07.2026
REM
REM Beschreibung:
REM
REM Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
REM
REM ====================================================================

PRINT "4. Ein Kreis aus Punkten"
CLS RGB(BLACK)
MX=MM.HRES/2
MY=MM.VRES/2
FOR I=0 TO 360
  W=I*PI/180
  X=MX+SIN(W)*100
  Y=MY-COS(W)*100
  PIXEL X,Y,RGB(YELLOW)
NEXT I

PRINT "5. Ein Sonnenstrahlen-Muster"
CLS RGB(BLACK)
MX=MM.HRES/2
MY=MM.VRES/2
FOR I=0 TO 360 STEP 5
  W=I*PI/180
  X=MX+SIN(W)*150
  Y=MY-COS(W)*150
  LINE MX,MY,X,Y,,,RGB(YELLOW)
NEXT I

PRINT "6. Ein Stern"
CLS RGB(BLACK)
MX=MM.HRES/2
MY=MM.VRES/2
FOR I=0 TO 4
  W=I*72*PI/180
  X(I)=MX+SIN(W)*120
  Y(I)=MY-COS(W)*120
NEXT I
FOR I=0 TO 4
  J=(I+2) MOD 5
  LINE X(I),Y(I),X(J),Y(J),,,RGB(CYAN)
NEXT I

PRINT "7. Ein Stern mit zehn Spitzen"
CLS RGB(BLACK)
MX=MM.HRES/2
MY=MM.VRES/2
DIM X(9)
DIM Y(9)
FOR I=0 TO 9
  W=I*36*PI/180
  X(I)=MX+SIN(W)*150
  Y(I)=MY-COS(W)*150
NEXT I
FOR I=0 TO 9
  J=(I+3) MOD 10
  LINE X(I),Y(I),X(J),Y(J),,,RGB(GREEN)
NEXT I

PRINT "8. Eine Rosette"
CLS RGB(BLACK)
MX=MM.HRES/2
MY=MM.VRES/2
FOR I=0 TO 355 STEP 5
  W1=I*PI/180
190
  W2=(I*3)*PI/180
  X1=MX+SIN(W1)*150
  Y1=MY-COS(W1)*150
  X2=MX+SIN(W2)*150
  Y2=MY-COS(W2)*150
  LINE X1,Y1,X2,Y2,,,RGB(YELLOW)
NEXT I

PRINT "9. Farben ins Spiel bringen"
FARBE=RGB( _
  INT(RND*256), _
  INT(RND*256), _
  INT(RND*256))

PRINT "10. Ein einfacher Spirograph"
CLS RGB(BLACK)
MX=MM.HRES/2
MY=MM.VRES/2
FOR I=0 TO 1440 STEP 2
  W=I*PI/180
  X=MX+COS(W)*150+COS(W*5)*40
  Y=MY+SIN(W)*150+SIN(W*5)*40
  PIXEL X,Y,RGB(CYAN)
NEXT I

PRINT "11. Das Muster verändern"
CLS RGB(BLACK)
MX=MM.HRES/2
MY=MM.VRES/2
FOR I=0 TO 1440 STEP 2
  W=I*PI/180
  X=MX+COS(W)*140+COS(W*9)*30
  Y=MY+SIN(W)*140+SIN(W*9)*30
  PIXEL X,Y,RGB(CYAN)
NEXT I

PRINT "12. Ein spektakulärer Spirograph"
CLS RGB(BLACK)
MX=MM.HRES/2
MY=MM.VRES/2
FOR I=0 TO 3600 STEP 1
  W=I*PI/180
  X=MX+COS(W)*120+COS(W*7)*50
  Y=MY+SIN(W)*120+SIN(W*7)*50
  FARBE=RGB( _
  INT(RND*256), _
  INT(RND*256), _
  INT(RND*256))
  PIXEL X,Y,FARBE
NEXT I

PRINT "13. Ein Blumenmuster"
CLS RGB(BLACK)
MX=MM.HRES/2
MY=MM.VRES/2
FOR I=0 TO 3600
  W=I*PI/180
  R=120+40*SIN(W*8)
  X=MX+COS(W)*R
  Y=MY+SIN(W)*R
  PIXEL X,Y,RGB(MAGENTA)
NEXT I
