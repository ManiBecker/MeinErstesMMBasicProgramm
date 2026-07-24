REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 05_rechenquiz.bas
REM Titel: Kapitel 5: Entscheidungen mit IF
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 24.07.2026
REM
REM Beschreibung: Entscheidungen mit IF zu treffen
REM
REM Hardware/Voraussetzungen:
REM
REM ====================================================================

PRINT "7. Unsere erste Entscheidung"
A = 10
IF A = 10 THEN
  PRINT "A hat den Wert 10."
ENDIF

PRINT "9. ELSE – der andere Fall"
A = 5
IF A = 10 THEN
  PRINT "A ist 10."
ELSE
  PRINT "A ist nicht 10."
ENDIF

PRINT "11. Unser erstes Quiz"
PRINT "Wieviel ist 2+3?"
INPUT ANTWORT
IF ANTWORT = 5 THEN
  PRINT "Richtig!"
ELSE
  PRINT "Leider falsch."
ENDIF

PRINT "12. Mehrere Entscheidungen"
INPUT NOTE
IF NOTE = 1 THEN
  PRINT "Sehr gut"
ENDIF
IF NOTE = 2 THEN
  PRINT "Gut"
ENDIF
IF NOTE = 3 THEN
  PRINT "Befriedigend"
ENDIF

PRINT "13. ELSEIF verwenden"
INPUT NOTE
IF NOTE = 1 THEN
  PRINT "Sehr gut"
ELSEIF NOTE = 2 THEN
  PRINT "Gut"
ELSEIF NOTE = 3 THEN
  PRINT "Befriedigend"
ELSE
  PRINT "Unbekannte Note"
ENDIF

PRINT "14. Verschachtelte Entscheidungen"
ALTER = 20
IF ALTER >= 18 THEN
  PRINT "Volljährig"
  IF ALTER >= 67 THEN
  PRINT "Rentenalter erreicht"
  ENDIF
ENDIF

PRINT "16. Probier’s selbst!"
PRINT "Versuche folgende Aufgaben:"
PRINT "1. Schreibe ein Programm, das prüft, ob eine Zahl größer als 100 ist."
PRINT "2. Gib aus, ob eine Zahl gerade oder ungerade ist."
PRINT "3. Vergleiche zwei Zahlen miteinander."
PRINT "4. Erweitere das Quiz um weitere Rechenaufgaben."
PRINT "5. Gib abhängig vom Alter unterschiedliche Texte aus."

