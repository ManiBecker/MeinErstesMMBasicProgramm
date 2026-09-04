REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 17_grafikmodi.bas
REM Titel: Kapitel 17: Die verschiedenen Grafikmodi
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 04.09.2026
REM
REM Beschreibung: Grafikmodi, Bildschirminformationen und pixelgenaue
REM               Textausgabe mit PRINT @()
REM
REM Hardware/Voraussetzungen: PicoMite/Colour Maximite 2
REM
REM ====================================================================

MODE 1

PRINT "Die Bildschirmgroesse bei MODE 1"
PRINT
PRINT MM.HRES
PRINT MM.VRES
PRINT
PRINT "Press any key...": Do: Loop While Inkey$=""

MODE 2

PRINT "Bildschirminformationen bei MODE 2"
PRINT
PRINT "Breite : ";MM.HRES
PRINT "Hoehe  : ";MM.VRES
PRINT
PRINT "Press any key...": Do: Loop While Inkey$=""

MODE 3

PRINT "Schriftinformationen bei MODE 3"
PRINT
PRINT "Fontbreite : ";MM.INFO(FONTWIDTH)
PRINT "Fonthoehe  : ";MM.INFO(FONTHEIGHT)
PRINT
PRINT "Press any key...": Do: Loop While Inkey$=""

MODE 1
CLS

PRINT "Text pixelgenau positionieren"
PRINT
PRINT @(50,50) "X=50, Y=50"
PRINT @(100,100) "X=100, Y=100"
PRINT @(200,150) "X=200, Y=150"

PRINT @(50,220) "Hallo" @(200,220) "MMBasic"

PRINT @(50,280) "Press any key..."
Do: Loop While Inkey$=""

CLS
PRINT "Ausgabemodi von PRINT @()"
PRINT
PRINT @(50,60,0) "m=0  Normal"
PRINT @(50,90,1) "m=1  Transparenter Hintergrund"
PRINT @(50,120,2) "m=2  Invertiert"
PRINT @(50,150,5) "m=5  Pixel invertieren"
PRINT
PRINT @(50,210) "Press any key..."
Do: Loop While Inkey$=""

FOR M=1 TO 5
  MODE M
  PRINT "Grafiksystem bei MODE ";M
  PRINT "----------------------"
  PRINT
  PRINT "Breite      : ";MM.HRES
  PRINT "Hoehe       : ";MM.VRES
  PRINT
  PRINT "Fontbreite  : ";MM.INFO(FONTWIDTH)
  PRINT "Fonthoehe   : ";MM.INFO(FONTHEIGHT)
  PRINT
  PRINT "Press any key...": Do: Loop While Inkey$=""
NEXT M

MODE 1

PRINT "Experimentiere!"
PRINT
PRINT "Probiere folgende Aenderungen aus:"
PRINT "- Fuehre das Programm auf verschiedenen Geraeten aus."
PRINT "- Vergleiche HDMI und VGA."
PRINT "- Aendere die Schriftart und beobachte die Werte."
PRINT "- Notiere die Bildschirmgroesse deines Systems."
PRINT "- Aendere die Koordinaten bei PRINT @()."
PRINT
PRINT "Press any key...": Do: Loop While Inkey$=""

CLS
PRINT "Probier's selbst!"
PRINT
PRINT "Versuche folgende Aufgaben:"
PRINT "1. Gib die Bildschirmbreite aus."
PRINT "2. Gib die Bildschirmhoehe aus."
PRINT "3. Gib die Fontbreite aus."
PRINT "4. Gib die Fonthoehe aus."
PRINT "5. Berechne die Bildschirmmitte."
PRINT "6. Gib mit PRINT @() einen Text in der Bildschirmmitte aus." 
