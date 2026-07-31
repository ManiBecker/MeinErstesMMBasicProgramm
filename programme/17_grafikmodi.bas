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

PRINT "5. Die Bildschirmgroesse"
PRINT MM.HRES
PRINT MM.VRES

PRINT "6. Bildschirminformationen anzeigen"
CLS
PRINT "Bildschirminformationen"
PRINT
PRINT "Breite : ";MM.HRES
PRINT "Hoehe  : ";MM.VRES


PRINT "7. Schriftarten"
PRINT MM.INFO(FONTWIDTH)
PRINT MM.INFO(FONTHEIGHT)

PRINT "11. Ein erstes Informationsprogramm"
CLS
PRINT "Grafiksystem"
PRINT "------------"
PRINT
PRINT "Breite      : ";MM.HRES
PRINT "Hoehe       : ";MM.VRES
PRINT
PRINT "Fontbreite  : ";MM.INFO(FONTWIDTH)
PRINT "Fonthoehe   : ";MM.INFO(FONTHEIGHT)

PRINT "12. Experimentiere!"
PRINT "Probiere folgende Aenderungen aus:"
PRINT "- Fuehre das Programm auf verschiedenen Geraeten aus."
PRINT "- Vergleiche HDMI und VGA."
PRINT "- Aendere die Schriftart und beobachte die Werte."
PRINT "- Notiere die Bildschirmgroesse deines Systems."

PRINT "17.13. Probier’s selbst!"
PRINT "Versuche folgende Aufgaben:"
PRINT "1. Gib die Bildschirmbreite aus."
PRINT "2. Gib die Bildschirmhoehe aus."
PRINT "3. Gib die Fontbreite aus."
PRINT "4. Gib die Fonthoehe aus."
PRINT "5. Berechne die Bildschirmmitte."