REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 21_treffe_die_scheibe.bas
REM Titel: Kapitel 21: Treffe die Scheibe
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 28.07.2026
REM
REM Beschreibung: Unser erstes Grafikspiel
REM
REM Hardware/Voraussetzungen: keine/PicoMite/ColourMaxiMite
REM
REM ====================================================================

MODE 2

CLS RGB(BLACK)

TX=INT(RND*(MM.HRES-120))+60
TY=INT(RND*(MM.VRES-120))+60

ZeichneScheibe TX,TY

PRINT
PRINT "Treffe die Scheibe!"
PRINT

INPUT "X ";SX
INPUT "Y ";SY

DIST=SQR((SX-TX)^2+(SY-TY)^2)

CIRCLE SX,SY,4,1,1,RGB(RED),RGB(RED)

PRINT
PRINT "Abstand: ";INT(DIST);" Pixel"

IF DIST<10 THEN
  PRINT "Volltreffer!"
ELSEIF DIST<25 THEN
  PRINT "Sehr gut!"
ELSEIF DIST<50 THEN
  PRINT "Gut getroffen!"
ELSE
  PRINT "Daneben!"
ENDIF
END

SUB ZeichneScheibe(X,Y)
  CIRCLE X,Y,60,2,1,RGB(WHITE)
  CIRCLE X,Y,40,2,1,RGB(WHITE)
  CIRCLE X,Y,20,2,1,RGB(WHITE)
END SUB
