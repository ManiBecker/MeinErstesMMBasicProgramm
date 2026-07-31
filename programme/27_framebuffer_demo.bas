REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 27_framebuffer_demo.bas
REM Titel: Kapitel 27: Flackerfreie Grafik mit Framebuffer
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 31.07.2026
REM
REM Beschreibung: Framebuffer, flackerfreie Animationen
REM
REM Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
REM
REM ====================================================================

PRINT "7. Unser erstes Beispiel"
CLS RGB(BLACK)
FRAMEBUFFER CREATE
FRAMEBUFFER WRITE F
FOR I=1 TO 1000
  X=INT(RND*MM.HRES)
  Y=INT(RND*MM.VRES)
  PIXEL X,Y,RGB(YELLOW)
NEXT I
PAUSE 3000

PRINT "9. Das Bild anzeigen"
CLS RGB(BLACK)
FRAMEBUFFER CREATE
FRAMEBUFFER WRITE F
FOR I=1 TO 1000
  X=INT(RND*MM.HRES)
  Y=INT(RND*MM.VRES)
  PIXEL X,Y,RGB(YELLOW)
NEXT I
FRAMEBUFFER COPY F,N

PRINT "11. Ein komplettes Bild vorbereiten"
FRAMEBUFFER CREATE
FRAMEBUFFER WRITE F
CLS RGB(BLACK)
FOR I=1 TO 100
  X=INT(RND*MM.HRES)
  Y=INT(RND*MM.VRES)
  CIRCLE X,Y,10,,,RGB(CYAN)
NEXT I
TEXT MM.HRES/2,20, _
  "Framebuffer Demo", _
  "CT"
FRAMEBUFFER COPY F,N

PRINT "12. Die Bahnhofsuhr verbessern"
