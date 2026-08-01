REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 04_persoenliche_begruessung.bas
REM Titel: Kapitel 4: Benutzereingaben mit INPUT
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 24.07.2026
REM
REM Beschreibung: Wie Daten vom Benutzer eingegeben werden
REM
REM Hardware/Voraussetzungen: keine
REM
REM ====================================================================

PRINT "2. Warum Benutzereingaben wichtig sind"
A=10
B=20
PRINT A+B

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "3. Unsere erste Eingabe"
INPUT A
PRINT A

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "4. Eingaben in Variablen speichern"
INPUT A
PRINT A

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "5. Mit Eingaben rechnen"
INPUT A
PRINT A*2

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "6. Zwei Werte eingeben"
INPUT A, B
PRINT A+B

INPUT "Bitte gebe zwei Zahlen ein, getrennt durch ein Komma: "; A, B
PRINT "Die Summe der zwei Zahlen ist: "; A+B

INPUT "Bitte gebe zwei Zahlen ein, getrennt durch ein Komma: ", A, B
PRINT "Die Summe der zwei Zahlen ist: "; A+B

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "7. Eine persoenliche Begrueßung"
INPUT "Wie heisst du";N$
PRINT "Hallo ";N$;", schön, dass du da bist."

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "8. Experimentiere!"
PRINT "Probiere folgende Änderungen aus:"
PRINT "- Gib dein Alter ein."
PRINT "- Addiere zwei eingegebene Zahlen."
PRINT "- Gib deinen Wohnort ein."
PRINT "- Erweitere die Begrueßung um weitere Texte."

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "9. Probier’s selbst!"
PRINT "Versuche folgende Aufgaben:"
PRINT "1. Frage den Benutzer nach seinem Namen."
PRINT "2. Frage den Benutzer nach seinem Alter."
PRINT "3. Addiere zwei eingegebene Zahlen."
PRINT "4. Gib eine persoenliche Begrueßung aus."

