REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 22_treffe_die_scheibe_v2.bas
REM Titel: Kapitel 22: Treffe die Scheibe Version 2
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 28.07.2026
REM
REM Beschreibung: Unser erstes Grafikspiel, Version 2
REM
REM Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
REM
REM ====================================================================

MODE 2

CLS RGB(BLACK)

INPUT "Name ";NAME$

PRINT
PRINT "1 = Leicht"
PRINT "2 = Mittel"
PRINT "3 = Schwer"

INPUT "Schwierigkeit ";LEVEL

IF LEVEL=1 THEN
  RADIUS=60
ELSEIF LEVEL=2 THEN
  RADIUS=40
ELSE
  RADIUS=25
ENDIF

DIM TREFFER(9)

GESAMTPUNKTE=0

FOR RUNDE=1 TO 10

  CLS RGB(BLACK)

  TX=INT(RND*(MM.HRES-2*RADIUS))+RADIUS
  TY=INT(RND*(MM.VRES-2*RADIUS))+RADIUS

  ZeichneScheibe TX,TY,RADIUS
  PRINT

  PRINT "Schuss ";RUNDE;" von 10"

  INPUT "X ";SX
  INPUT "Y ";SY

  DIST=SQR((SX-TX)^2+(SY-TY)^2)

  TREFFER(RUNDE-1)=DIST

  CIRCLE SX,SY,4,1,1,RGB(RED),RGB(RED)

  PUNKTE=100-INT(DIST)

  IF PUNKTE<0 THEN
    PUNKTE=0
  ENDIF

  GESAMTPUNKTE=GESAMTPUNKTE+PUNKTE

  PRINT
  PRINT "Entfernung : ";INT(DIST);" Pixel"
  PRINT "Punkte : ";PUNKTE

  PAUSE 1500

NEXT RUNDE

CLS RGB(BLACK)

PRINT
PRINT "===================="
PRINT " SPIEL BEENDET"
PRINT "===================="
PRINT
PRINT NAME$
PRINT
PRINT "Gesamtpunkte : ";GESAMTPUNKTE

BEST=TREFFER(0)

FOR I=1 TO 9
  IF TREFFER(I)<BEST THEN
  BEST=TREFFER(I)
  ENDIF
NEXT I

PRINT
PRINT "Bester Schuss : ";INT(BEST);" Pixel"
PRINT
PRINT "Alle Schuesse"

FOR I=0 TO 9
  PRINT I+1;". ";INT(TREFFER(I));" Pixel"
NEXT I

OPEN "highscore.txt" FOR OUTPUT AS #1

WRITE #1,NAME$,GESAMTPUNKTE

CLOSE #1

PRINT
PRINT "Highscore gespeichert"

END

SUB ZeichneScheibe(X,Y,R)
  CIRCLE X,Y,R,2,1,RGB(WHITE)
  CIRCLE X,Y,R*0.66,2,1,RGB(WHITE)
  CIRCLE X,Y,R*0.33,2,1,RGB(WHITE)
END SUB
