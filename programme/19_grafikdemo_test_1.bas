REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 19_grafikdemo_test_1.bas
REM Titel: Kapitel 19: Die ersten Grafikbefehle
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 28.07.2026
REM
REM Beschreibung: Ein kleines Grafik-Testprogramm
REM
REM Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
REM
REM ====================================================================

CLS RGB(BLACK)
PRINT "1000 zufaellige Punkte"
FOR I=1 TO 1000
  X=INT(RND*MM.HRES)
  Y=INT(RND*MM.VRES)
  FARBE=RGB(INT(RND*256),INT(RND*256),INT(RND*256))
  PIXEL X,Y,FARBE
NEXT I

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "1000 zufaellige Kreise"
FOR I=1 TO 1000
  RADIUS=INT(RND*20)+2
  X=INT(RND*(MM.HRES-2*RADIUS))+RADIUS
  Y=INT(RND*(MM.VRES-2*RADIUS))+RADIUS
  FARBE=RGB(INT(RND*256),INT(RND*256),INT(RND*256))
  CIRCLE X,Y,RADIUS,1,1,FARBE
NEXT I

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "1000 zufaellige Rechtecke"
FOR I=1 TO 1000
  BREITE=INT(RND*50)+5
  HOEHE=INT(RND*50)+5
  X=INT(RND*(MM.HRES-BREITE))
  Y=INT(RND*(MM.VRES-HOEHE))
  FARBE=RGB(INT(RND*256),INT(RND*256),INT(RND*256))
  BOX X,Y,BREITE,HOEHE,1,FARBE
NEXT I
