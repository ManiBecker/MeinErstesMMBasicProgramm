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

PRINT "3. Unsere erste Eingabe"
INPUT A
PRINT A

PRINT "4. Eingaben in Variablen speichern"
INPUT A
PRINT A

PRINT "5. Mit Eingaben rechnen"
INPUT A
PRINT A*2

PRINT "6. Zwei Werte eingeben"
INPUT A
INPUT B
PRINT A+B

PRINT "7. Eine persönliche Begrüßung"
INPUT N$
PRINT "Hallo ";N$

PRINT "8. Texte und Variablen kombinieren"
INPUT NAME$
PRINT "Willkommen ";NAME$
PRINT "Schön, dass du da bist."

PRINT "9. Unser erstes interaktives Programm"
PRINT "Wie heißt du?"
INPUT NAME$
PRINT "Hallo ";NAME$
PRINT "Willkommen bei MMBasic!"

PRINT "10. Experimentiere!"
PRINT "Probiere folgende Änderungen aus:"
PRINT "- Gib dein Alter ein."
PRINT "- Addiere zwei eingegebene Zahlen."
PRINT "- Gib deinen Wohnort ein."
PRINT "- Erweitere die Begrüßung um weitere Texte."

PRINT "11. Probier’s selbst!"
PRINT "Versuche folgende Aufgaben:"
PRINT "1. Frage den Benutzer nach seinem Namen."
PRINT "2. Frage den Benutzer nach seinem Alter."
PRINT "3. Addiere zwei eingegebene Zahlen."
PRINT "4. Gib eine persönliche Begrüßung aus."

