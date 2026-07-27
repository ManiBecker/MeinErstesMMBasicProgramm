REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 18_farben_und_schriften.bas
REM Titel: Kapitel 18: Farben und Schriftarten
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 27.07.2026
REM
REM Beschreibung:  Funktion RGB()
REM
REM Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
REM
REM ====================================================================

PRINT "3. Farben mit RGB() erzeugen"
PRINT "RGB(255,0,0): ";RGB(255,0,0)
PRINT "RGB(0,255,0): ";RGB(0,255,0)
PRINT "RGB(0,0,255): ";RGB(0,0,255)

PRINT "4. Farbkonstanten verwenden"
PRINT "RGB(RED):    ";RGB(RED)
PRINT "RGB(GREEN):  ";RGB(GREEN)
PRINT "RGB(BLUE):   ";RGB(BLUE)
PRINT "RGB(YELLOW): ";RGB(YELLOW)
PRINT "RGB(CYAN):   ";RGB(CYAN)
PRINT "RGB(MAGENTA):";RGB(MAGENTA)
PRINT "RGB(WHITE):  ";RGB(WHITE)
PRINT "RGB(BLACK):  ";RGB(BLACK)

PRINT "5. Vorder- und Hintergrundfarbe"
CLS
COLOUR RGB(YELLOW), RGB(BLUE)
PRINT "Hallo MMBasic"

PRINT "6. Der Bildschirmhintergrund"
CLS RGB(BLACK)

PRINT "7. Ein kleines Farbexperiment"
CLS RGB(BLACK)
COLOUR RGB(YELLOW), RGB(BLACK)
PRINT "Gelber Text"
COLOUR RGB(CYAN), RGB(BLACK)
PRINT "Cyanfarbener Text"
COLOUR RGB(RED), RGB(BLACK)
PRINT "Roter Text"

PRINT "9. Schriftart auswählen"
FONT 1
PRINT "Schriftart 1"
FONT 2
PRINT "Schriftart 2"
FONT 3
PRINT "Schriftart 3"

PRINT "11. Schriftgröße ausprobieren"
CLS
FONT 1
PRINT "Kleine Schrift"
FONT 2
PRINT "Mittlere Schrift"
FONT 3
PRINT "Grosse Schrift"
FONT 5
PRINT "Sehr grosse Schrift"

PRINT "12. Große Zahlen darstellen"
CLS
FONT 6
PRINT "12:45"

PRINT "13. Informationen zur aktuellen Schrift"
PRINT "MM.INFO(FONTWIDTH):  ";MM.INFO(FONTWIDTH)
PRINT "MM.INFO(FONTHEIGHT): ";MM.INFO(FONTHEIGHT)

PRINT "14. Ein digitales Display"
CLS RGB(BLACK)
COLOUR RGB(GREEN), RGB(BLACK)
FONT 6
PRINT TIME$

PRINT "15. Experimentiere!"
PRINT "Probiere folgende Änderungen aus:"
PRINT "- Verwende andere Farben."
PRINT "- Teste verschiedene Schriftarten."
PRINT "- Kombiniere unterschiedliche Vorder- und Hintergrundfarben."
PRINT "- Zeige das aktuelle Datum an."

PRINT "18.16. Probier’s selbst!"
PRINT "Versuche folgende Aufgaben:"
PRINT "1. Gib deinen Namen in einer großen Schrift aus."
PRINT "2. Zeige Datum und Uhrzeit gleichzeitig an."
PRINT "3. Verwende eine andere Farbe für jede Zeile."
PRINT "4. Erstelle eine einfache digitale Uhr."



