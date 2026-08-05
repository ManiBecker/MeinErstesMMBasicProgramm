REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 17_grafikmodi.bas
REM Titel: Kapitel 17: Die verschiedenen Grafikmodi
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 27.07.2026
REM
REM Beschreibung: Einfache Grafikausgaben
REM
REM Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
REM
REM ====================================================================

MODE 1

PRINT "5. Die Bildschirmgroesse bei MODE 1"
PRINT
PRINT MM.HRES
PRINT MM.VRES
PRINT
PRINT "Press any key...": Do: Loop While Inkey$=""

MODE 2

PRINT "6. Bildschirminformationen anzeigen bei MODE 2"
PRINT
PRINT "Breite : ";MM.HRES
PRINT "Hoehe  : ";MM.VRES
PRINT
PRINT "Press any key...": Do: Loop While Inkey$=""

MODE 3

PRINT "7. Schriftarten bei MODE 3"
PRINT
PRINT MM.INFO(FONTWIDTH)
PRINT MM.INFO(FONTHEIGHT)
PRINT
PRINT "Press any key...": Do: Loop While Inkey$=""

FOR M=1 TO 5
MODE M
PRINT "11. Ein erstes Informationsprogramm bei MODE";M
PRINT
PRINT "Grafiksystem"
PRINT "------------"
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

PRINT "12. Experimentiere!"
PRINT
PRINT "Probiere folgende Aenderungen aus:"
PRINT "- Fuehre das Programm auf verschiedenen Geraeten aus."
PRINT "- Vergleiche HDMI und VGA."
PRINT "- Aendere die Schriftart und beobachte die Werte."
PRINT "- Notiere die Bildschirmgroesse deines Systems."
PRINT
PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "17.13. Probier's selbst!"
PRINT
PRINT "Versuche folgende Aufgaben:"
PRINT "1. Gib die Bildschirmbreite aus."
PRINT "2. Gib die Bildschirmhoehe aus."
PRINT "3. Gib die Fontbreite aus."
PRINT "4. Gib die Fonthoehe aus."
PRINT "5. Berechne die Bildschirmmitte."