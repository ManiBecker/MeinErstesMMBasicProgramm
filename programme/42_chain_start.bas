REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 42_chain_start.bas
REM Titel: Kapitel 42: Programme verketten mit CHAIN
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 08.09.2026
REM
REM Beschreibung:
REM Startprogramm fuer das CHAIN-Beispiel. Es legt Variablen an,
REM die im naechsten Programm weiterhin zur Verfuegung stehen, und
REM uebergibt zusaetzlich den Parameter "LEVEL=2".
REM
REM Hardware/Voraussetzungen: keine/PicoMite/Colour Maximite 2
REM
REM ====================================================================

CLS

spieler$ = "Manfred"
punkte = 100

PRINT "Startprogramm"
PRINT "Spieler: "; spieler$
PRINT "Punkte:  "; punkte
PRINT
PRINT "Weiter mit beliebiger Taste ..."

DO
LOOP UNTIL INKEY$ <> ""

CHAIN "42_chain_spiel.bas", "LEVEL=2" 
