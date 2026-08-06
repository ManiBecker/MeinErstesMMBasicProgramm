Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 04_persoenliche_begruessung.bas
Rem Titel: Kapitel 4: Benutzereingaben mit INPUT
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 24.07.2026
Rem
Rem Beschreibung: Wie Daten vom Benutzer eingegeben werden
Rem
Rem Hardware/Voraussetzungen: keine
Rem
Rem ====================================================================

Print "2. Warum Benutzereingaben wichtig sind"
Print "A=10":A=10
Print "B=20":B=20
Print "Print A+B":Print A+B

Print "Press any key...": Do : Loop While Inkey$=""

Print "3. Unsere erste Eingabe"
Print "Input A":Input A
Print "Print A":Print A

Print "Press any key...": Do : Loop While Inkey$=""

Print "4. Eingaben in Variablen speichern"
Print "Input A":Input A
Print "Print A":Print A

Print "Press any key...": Do : Loop While Inkey$=""

Print "5. Mit Eingaben rechnen"
Print "Input A":Input A
Print "Print A*2":Print A*2

Print "Press any key...": Do : Loop While Inkey$=""

Print "6. Zwei Werte eingeben"
Print "Input A, B":Input A, B
Print "Print A+B":Print A+B

Input "Bitte gebe zwei Zahlen ein, getrennt durch ein Komma: "; A, B
Print "Die Summe der zwei Zahlen ist: "; A+B

Input "Bitte gebe zwei Zahlen ein, getrennt durch ein Komma: ", A, B
Print "Die Summe der zwei Zahlen ist: "; A+B

Print "Press any key...": Do : Loop While Inkey$=""

Print "7. Eine persoenliche Begruessung"
Input "Wie heisst du";N$
Print "Hallo ";N$;", schoen, dass du da bist."

Print "Press any key...": Do : Loop While Inkey$=""

Print "8. Experimentiere!"
Print "Probiere folgende Aenderungen aus:"
Print "- Gib dein Alter ein."
Print "- Addiere zwei eingegebene Zahlen."
Print "- Gib deinen Wohnort ein."
Print "- Erweitere die Begruessung um weitere Texte."

Print "Press any key...": Do : Loop While Inkey$=""

Print "9. Probier's selbst!"
Print "Versuche folgende Aufgaben:"
Print "1. Frage den Benutzer nach seinem Namen."
Print "2. Frage den Benutzer nach seinem Alter."
Print "3. Addiere zwei eingegebene Zahlen."
Print "4. Gib eine persoenliche Begruessung aus."
Print
Print "Ready..."
