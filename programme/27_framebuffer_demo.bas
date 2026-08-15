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

CLS RGB(BLACK)
PRINT "7. Unser erstes Beispiel"
FRAMEBUFFER CREATE
FRAMEBUFFER WRITE F
FOR I=1 TO 1000
  X=INT(RND*MM.HRES)
  Y=INT(RND*MM.VRES)
  PIXEL X,Y,RGB(YELLOW)
NEXT I

PRINT "Press any key...": Do: Loop While Inkey$=""

CLS RGB(BLACK)
PRINT "9. Das Bild anzeigen"
FRAMEBUFFER CREATE
FRAMEBUFFER WRITE F
FOR I=1 TO 1000
  X=INT(RND*MM.HRES)
  Y=INT(RND*MM.VRES)
  PIXEL X,Y,RGB(YELLOW)
NEXT I
FRAMEBUFFER COPY F,N

PRINT "Press any key...": Do: Loop While Inkey$=""

CLS RGB(BLACK)
PRINT "11. Ein komplettes Bild vorbereiten"
FRAMEBUFFER CREATE
FRAMEBUFFER WRITE F
FOR I=1 TO 100
  X=INT(RND*MM.HRES)
  Y=INT(RND*MM.VRES)
  CIRCLE X,Y,10,,,RGB(CYAN)
NEXT I
TEXT MM.HRES/2,20, _
  "Framebuffer Demo", _
  "CT"
FRAMEBUFFER COPY F,N

PRINT "Press any key...": Do: Loop While Inkey$=""

CLS RGB(BLACK)

PRINT "12. Die Bahnhofsuhr verbessern"

mitteX=MM.HRES/2
mitteY=MM.VRES/2
radius=MM.HRES/2-10

If MM.VRES/2-10<radius Then
  radius=MM.VRES/2-10
EndIf

FRAMEBUFFER CREATE
FRAMEBUFFER WRITE F

Do
  If alteZeit$<>Time$ Then
    alteZeit$=Time$
    Berechne Time$
    ZeichneZifferblatt mitteX,mitteY,radius
    ZeichneText mitteX,mitteY,radius
    ZeichneStundenzeiger mitteX,mitteY,radius,stundenWinkel
    ZeichneMinutenzeiger mitteX,mitteY,radius,minutenWinkel
    ZeichneSekundenzeiger mitteX,mitteY,radius,sekundenWinkel
    FRAMEBUFFER COPY F,N
  EndIf
Loop While Inkey$=""

Print
Print "Ready..."
End
