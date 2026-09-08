REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 42_chain_ende.bas
REM Titel: Kapitel 42: Programme verketten mit CHAIN
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 08.09.2026
REM
REM Beschreibung: Dieses Programm wird von 42_chain_spiel.bas gestartet.
REM        Die Variablen spieler$ und punkte stehen weiterhin zur Verfuegung.
REM Hardware/Voraussetzungen: keine/PicoMite/ColourMaxiMite
REM
REM ====================================================================

CLS

PRINT "========================"
PRINT "       ENDE"
PRINT "========================"
PRINT
PRINT "Spieler: "; spieler$
PRINT "Endstand: "; punkte
PRINT
PRINT "Uebergebener Parameter: "; MM.CMDLINE$
PRINT
PRINT "Die Programmkette ist beendet."
PRINT
PRINT "Beliebige Taste zum Beenden ..."

DO
LOOP UNTIL INKEY$ <> ""

END 
