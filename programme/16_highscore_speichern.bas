Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 16_highscore_speichern.bas
Rem Titel: Kapitel 16: Dateien speichern und laden
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 27.07.2026
Rem
Rem Beschreibung: Speichern und Lesen von Daten in Dateien
Rem
Rem Hardware/Voraussetzungen: keine
Rem
Rem ====================================================================

Print "4. Eine Datei oeffnen"
Open "test.txt" For OUTPUT As #1

Print "Press any key...": Do : Loop While Inkey$=""

Print "5. Eine Datei schreiben"
Print #1,"Hallo Welt"

Print "Press any key...": Do : Loop While Inkey$=""

Print "6. Dateien immer schliessen"
Close #1

Print "Press any key...": Do : Loop While Inkey$=""

Print "7. Eine Datei lesen"
Open "test.txt" For INPUT As #1
Line Input #1,A$
Print A$
Close #1

Print "Press any key...": Do : Loop While Inkey$=""

Print "9. Mehrere Zeilen speichern"
Open "namen.txt" For OUTPUT As #1
Print #1,"Manfred"
Print #1,"Geoff"
Print #1,"Peter"
Close #1

Print "Press any key...": Do : Loop While Inkey$=""

Print "10. Daten anhaengen"
Open "namen.txt" For APPEND As #1
Print #1,"Sarah"
Close #1

Print "Press any key...": Do : Loop While Inkey$=""

Print "12. Mit WRITE speichern"
Open "spieler.txt" For OUTPUT As #1
Print #1,"Manfred",9
Close #1

Print "Press any key...": Do : Loop While Inkey$=""

Print "13. Ein Highscore speichern"
Input "Name ";NAME$
PUNKTE=8
Open "highscore.txt" For OUTPUT As #1
Print #1,NAME$,PUNKTE
Close #1
Print "Highscore gespeichert."

Print "Press any key...": Do : Loop While Inkey$=""

Print "14. Einen Highscore laden"
Open "highscore.txt" For INPUT As #1
Input #1,NAME$,PUNKTE
Close #1
Print "Name   : "; NAME$
Print "Punkte : "; PUNKTE

Print "Press any key...": Do : Loop While Inkey$=""

Print "18. Experimentiere!"
Print "Probiere folgende Aenderungen aus:"
Print "- Speichere mehrere Namen in einer Datei."
Print "- Speichere mehrere Punktzahlen."
Print "- Verwende APPEND statt OUTPUT."
Print "- Aendere den Dateinamen."

Print "Press any key...": Do : Loop While Inkey$=""

Print "16.19. Probier's selbst!"
Print "Versuche folgende Aufgaben:"
Print "1. Speichere deinen Namen in einer Datei."
Print "2. Speichere dein Alter in einer Datei."
Print "3. Lies die Datei wieder ein."
Print "4. Erstelle eine kleine Highscore-Datei."
Print "5. Speichere mehrere Spieler untereinander."
Print
Print "Ready..."
