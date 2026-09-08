REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 40_library_test.bas
REM Titel: Kapitel 40: Programme speichern und laden
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 09.09.2026
REM
REM Beschreibung:
REM
REM Demonstriert die Verwendung von Routinen aus einer MMBasic-Library.
REM Voraussetzung ist, dass die SUB Begruessung und die FUNCTION Quadrat
REM zuvor mit LIBRARY SAVE in der Library gespeichert wurden.
REM
REM Hardware/Voraussetzungen: keine/PicoMite/ColourMaxiMite
REM
REM ====================================================================

CLS

PRINT "Kapitel 40 - Library-Test"
PRINT "=========================="
PRINT

PRINT "Aufruf einer SUB aus der Library:"
Begruessung
PRINT

PRINT "Aufruf einer FUNCTION aus der Library:"
FOR Zahl = 1 TO 10
  PRINT Zahl; " * "; Zahl; " = "; Quadrat(Zahl)
NEXT Zahl

PRINT
PRINT "Die Routinen Begruessung und Quadrat"
PRINT "stehen nicht in diesem Programm."
PRINT "Sie werden aus der MMBasic-Library aufgerufen."

END 
