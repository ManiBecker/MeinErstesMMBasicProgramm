REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 16_highscore_speichern.bas
REM Titel: Kapitel 16: Dateien speichern und laden
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 27.07.2026
REM
REM Beschreibung: Speichern und Lesen von Daten in Dateien
REM
REM Hardware/Voraussetzungen: keine
REM
REM ====================================================================

PRINT "4. Eine Datei oeffnen"
OPEN "test.txt" FOR OUTPUT AS #1

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "5. Eine Datei schreiben"
PRINT #1,"Hallo Welt"

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "6. Dateien immer schliessen"
CLOSE #1

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "7. Eine Datei lesen"
OPEN "test.txt" FOR INPUT AS #1
LINE INPUT #1,A$
PRINT A$
CLOSE #1

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "9. Mehrere Zeilen speichern"
OPEN "namen.txt" FOR OUTPUT AS #1
PRINT #1,"Manfred"
PRINT #1,"Geoff"
PRINT #1,"Peter"
CLOSE #1

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "10. Daten anhaengen"
OPEN "namen.txt" FOR APPEND AS #1
PRINT #1,"Sarah"
CLOSE #1

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "12. Mit WRITE speichern"
OPEN "spieler.txt" FOR OUTPUT AS #1
WRITE #1,"Manfred",9
CLOSE #1

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "13. Ein Highscore speichern"
INPUT "Name ";NAME$
PUNKTE=8
OPEN "highscore.txt" FOR OUTPUT AS #1
WRITE #1,NAME$,PUNKTE
CLOSE #1
PRINT "Highscore gespeichert."

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "14. Einen Highscore laden"
OPEN "highscore.txt" FOR INPUT AS #1
READ #1, NAME$, PUNKTE
CLOSE #1
PRINT "Name   : "; NAME$
PRINT "Punkte : "; PUNKTE

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "18. Experimentiere!"
PRINT "Probiere folgende Aenderungen aus:"
PRINT "- Speichere mehrere Namen in einer Datei."
PRINT "- Speichere mehrere Punktzahlen."
PRINT "- Verwende APPEND statt OUTPUT."
PRINT "- Aendere den Dateinamen."

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "16.19. Probier’s selbst!"
PRINT "Versuche folgende Aufgaben:"
PRINT "1. Speichere deinen Namen in einer Datei."
PRINT "2. Speichere dein Alter in einer Datei."
PRINT "3. Lies die Datei wieder ein."
PRINT "4. Erstelle eine kleine Highscore-Datei."
PRINT "5. Speichere mehrere Spieler untereinander."