Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 18_farb_tabelle.bas
Rem Titel: Kapitel 18: Farb- und Schriftmustertafel
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 21.09.2026
Rem
Rem Beschreibung:
Rem Zeigt vordefinierte und selbst gemischte Farben sowie verschiedene
Rem Schriftarten von MMBasic auf dem Bildschirm an.
Rem
Rem Hardware/Voraussetzungen: Grafikausgabe
Rem ====================================================================

CLS RGB(BLACK)

' ------------------------------------------------------------
' Vordefinierte Farben
' ------------------------------------------------------------

FONT 1

COLOUR RGB(WHITE),RGB(BLACK)
PRINT "MMBasic Farb- und Schriftmustertafel"
PRINT
PRINT "Vordefinierte Farben:"

COLOUR RGB(WHITE),RGB(BLACK)
PRINT "WHITE"

COLOUR RGB(RED),RGB(BLACK)
PRINT "RED"

COLOUR RGB(GREEN),RGB(BLACK)
PRINT "GREEN"

COLOUR RGB(BLUE),RGB(BLACK)
PRINT "BLUE"

COLOUR RGB(YELLOW),RGB(BLACK)
PRINT "YELLOW"

COLOUR RGB(CYAN),RGB(BLACK)
PRINT "CYAN"

COLOUR RGB(MAGENTA),RGB(BLACK)
PRINT "MAGENTA"

' ------------------------------------------------------------
' Selbst gemischte Farben
' ------------------------------------------------------------

COLOUR RGB(WHITE),RGB(BLACK)
PRINT
PRINT "Eigene RGB-Farben:"

COLOUR RGB(255,128,0),RGB(BLACK)
PRINT "ORANGE       RGB(255,128,0)"

COLOUR RGB(128,255,0),RGB(BLACK)
PRINT "HELLGRUEN    RGB(128,255,0)"

COLOUR RGB(255,128,192),RGB(BLACK)
PRINT "ROSA         RGB(255,128,192)"

COLOUR RGB(128,128,255),RGB(BLACK)
PRINT "HELLBLAU     RGB(128,128,255)"

COLOUR RGB(128,128,128),RGB(BLACK)
PRINT "GRAU         RGB(128,128,128)"

' ------------------------------------------------------------
' Verschiedene Schriftarten
' ------------------------------------------------------------

COLOUR RGB(WHITE),RGB(BLACK)

PRINT
PRINT "Schriftarten:"

FONT 1
PRINT "Font 1 - Standardschrift"

FONT 2
PRINT "Font 2"

FONT 3
PRINT "Font 3"

' Standardschrift und Farben wiederherstellen
FONT 1
COLOUR RGB(WHITE),RGB(BLACK) 
