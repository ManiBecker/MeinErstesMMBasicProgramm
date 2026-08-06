Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 18_farben_und_schriften.bas
Rem Titel: Kapitel 18: Farben und Schriftarten
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 27.07.2026
Rem
Rem Beschreibung:  Funktion RGB()
Rem
Rem Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
Rem
Rem ====================================================================

MODE 2
Print "3. Farben mit RGB() erzeugen"
Print
Print "RGB(255,0,0): ";RGB(255,0,0)
Print "RGB(0,255,0): ";RGB(0,255,0)
Print "RGB(0,0,255): ";RGB(0,0,255)
Print
Print "Press any key...": Do : Loop While Inkey$=""

Print "4. Farbkonstanten verwenden"
Print
Print "RGB(RED):    ";RGB(RED)
Print "RGB(GREEN):  ";RGB(GREEN)
Print "RGB(BLUE):   ";RGB(BLUE)
Print "RGB(YELLOW): ";RGB(YELLOW)
Print "RGB(CYAN):   ";RGB(CYAN)
Print "RGB(MAGENTA):";RGB(MAGENTA)
Print "RGB(WHITE):  ";RGB(WHITE)
Print "RGB(BLACK):  ";RGB(BLACK)
Print
Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "5. Vorder- und Hintergrundfarbe"
Colour RGB(YELLOW), RGB(BLUE)
Print "Hallo MMBasic"
Print
Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "6. Der Bildschirmhintergrund"
Print
Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "7. Ein kleines Farbexperiment"
Colour RGB(YELLOW), RGB(BLACK)
Print "Gelber Text"
Colour RGB(CYAN), RGB(BLACK)
Print "Cyanfarbener Text"
Colour RGB(RED), RGB(BLACK)
Print "Roter Text"
Print
Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "9. Schriftart auswaehlen"
Font 1
Print "Schriftart 1"
Font 2
Print "Schriftart 2"
Font 3
Print "Schriftart 3"
Print
Font 1
Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "11. Schriftgroesse ausprobieren"
Font 1
Print "Kleine Schrift"
Font 2
Print "Mittlere Schrift"
Font 3
Print "Grosse Schrift"
Font 5
Print "Sehr grosse Schrift"
Print
Font 1
Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "12. Grosse Zahlen darstellen"
Font 6
Print "12:45"
Font 1
Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "13. Informationen zur aktuellen Schrift"
Font 1
Print "MM.INFO(FONTWIDTH):  ";MM.Info(FONTWIDTH)
Print "MM.INFO(FONTHEIGHT): ";MM.Info(FONTHEIGHT)
Font 2
Print "MM.INFO(FONTWIDTH):  ";MM.Info(FONTWIDTH)
Print "MM.INFO(FONTHEIGHT): ";MM.Info(FONTHEIGHT)
Font 3
Print "MM.INFO(FONTWIDTH):  ";MM.Info(FONTWIDTH)
Print "MM.INFO(FONTHEIGHT): ";MM.Info(FONTHEIGHT)
Font 1
Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "14. Ein digitales Display"
Colour RGB(GREEN), RGB(BLACK)
Font 6
Print Time$
Print
Font 1
Print "Press any key...": Do : Loop While Inkey$=""

MODE 1
Print "15. Experimentiere!"
Print
Print "Probiere folgende Aenderungen aus:"
Print "- Verwende andere Farben."
Print "- Teste verschiedene Schriftarten."
Print "- Kombiniere unterschiedliche Vorder- und Hintergrundfarben."
Print "- Zeige das aktuelle Datum an."
Print
Print "Press any key...": Do : Loop While Inkey$=""
Print
Print "18.16. Probier's selbst!"
Print
Print "Versuche folgende Aufgaben:"
Print "1. Gib deinen Namen in einer grossen Schrift aus."
Print "2. Zeige Datum und Uhrzeit gleichzeitig an."
Print "3. Verwende eine andere Farbe fuer jede Zeile."
Print "4. Erstelle eine einfache digitale Uhr."
