REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 39_mmedit_hallo.bas
REM Titel: Kapitel 39: Programmieren mit MMEdit
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 27.07.2026
REM
REM Beschreibung: Beispielprogramm zu Kapitel 39
REM
REM Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
REM
REM ====================================================================

OPTION EXPLICIT

Print "Kapitel 39: Programmieren mit MMEdit"

DIM INTEGER Zaehler

FOR Zaehler = 1 TO 10
  PRINT "Hallo MMBasic! Durchlauf"; Zaehler
  PAUSE 500
NEXT Zaehler

PRINT "Programm beendet."
