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
Rem Die Farbbeispiele werden platzsparend in zwei Spalten ausgegeben.
Rem
Rem Hardware/Voraussetzungen: Grafikausgabe
Rem ====================================================================

CLS RGB(BLACK)
FONT 1
COLOUR RGB(WHITE),RGB(BLACK)

PRINT "MMBasic Farb- und Schriftmustertafel"
PRINT

' ------------------------------------------------------------
' Positionen fuer die beiden Spalten berechnen
' ------------------------------------------------------------

X1=0
X2=MM.HRES\2
Y=MM.INFO(FONTHEIGHT)*3
DY=MM.INFO(FONTHEIGHT)

' ------------------------------------------------------------
' Ueberschriften
' ------------------------------------------------------------

COLOUR RGB(WHITE),RGB(BLACK)

PRINT @(X1,Y) "Vordefinierte Farben:"
PRINT @(X2,Y) "Eigene RGB-Farben:"

Y=Y+DY*2

' ------------------------------------------------------------
' Vordefinierte Farben - linke Spalte
' ------------------------------------------------------------

COLOUR RGB(WHITE),RGB(BLACK)
PRINT @(X1,Y) "WHITE"

COLOUR RGB(RED),RGB(BLACK)
PRINT @(X1,Y+DY) "RED"

COLOUR RGB(GREEN),RGB(BLACK)
PRINT @(X1,Y+DY*2) "GREEN"

COLOUR RGB(BLUE),RGB(BLACK)
PRINT @(X1,Y+DY*3) "BLUE"

COLOUR RGB(YELLOW),RGB(BLACK)
PRINT @(X1,Y+DY*4) "YELLOW"

COLOUR RGB(CYAN),RGB(BLACK)
PRINT @(X1,Y+DY*5) "CYAN"

COLOUR RGB(MAGENTA),RGB(BLACK)
PRINT @(X1,Y+DY*6) "MAGENTA"

' ------------------------------------------------------------
' Selbst gemischte Farben - rechte Spalte
' ------------------------------------------------------------

COLOUR RGB(255,128,0),RGB(BLACK)
PRINT @(X2,Y) "ORANGE  RGB(255,128,0)"

COLOUR RGB(128,255,0),RGB(BLACK)
PRINT @(X2,Y+DY) "HELLGRUEN RGB(128,255,0)"

COLOUR RGB(255,128,192),RGB(BLACK)
PRINT @(X2,Y+DY*2) "ROSA    RGB(255,128,192)"

COLOUR RGB(128,128,255),RGB(BLACK)
PRINT @(X2,Y+DY*3) "HELLBLAU RGB(128,128,255)"

COLOUR RGB(128,128,128),RGB(BLACK)
PRINT @(X2,Y+DY*4) "GRAU    RGB(128,128,128)"

' ------------------------------------------------------------
' Verschiedene Schriftarten
' ------------------------------------------------------------

Y=Y+DY*8

COLOUR RGB(WHITE),RGB(BLACK)

FONT 1
PRINT @(0,Y) "Schriftarten:"

Y=Y+MM.INFO(FONTHEIGHT)*2

FONT 1
PRINT @(0,Y) "Font 1 - Standardschrift"

Y=Y+MM.INFO(FONTHEIGHT)

FONT 2
PRINT @(0,Y) "Font 2"

Y=Y+MM.INFO(FONTHEIGHT)

FONT 3
PRINT @(0,Y) "Font 3"

' Standardschrift und Farben wiederherstellen
FONT 1
COLOUR RGB(WHITE),RGB(BLACK)
