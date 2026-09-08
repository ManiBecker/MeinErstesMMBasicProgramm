REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 42_chain_spiel.bas
REM Titel: Kapitel 42: Programme verketten mit CHAIN
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 08.09.2026
REM
REM Beschreibung: Dieses Programm wird von 42_chain_start.bas gestartet.
REM        Die Variablen spieler$ und punkte stehen weiterhin zur Verfuegung.
REM Hardware/Voraussetzungen: keine/PicoMite/ColourMaxiMite
REM
REM ====================================================================

CLS

PRINT "========================"
PRINT "      SPIEL"
PRINT "========================"
PRINT
PRINT "Spieler: "; spieler$
PRINT "Punkte beim Start: "; punkte
PRINT

PRINT "Du erhaeltst 50 Punkte."
punkte = punkte + 50

PRINT "Neuer Punktestand: "; punkte
PRINT
PRINT "Uebergebener Parameter: "; MM.CMDLINE$
PRINT
PRINT "Weiter mit beliebiger Taste ..."

DO
LOOP UNTIL INKEY$ <> ""

CHAIN "42_chain_ende.bas", "SPIEL BEENDET" 
