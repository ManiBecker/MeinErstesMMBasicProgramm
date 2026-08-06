Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 05_rechenquiz.bas
Rem Titel: Kapitel 5: Entscheidungen mit IF
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 24.07.2026
Rem
Rem Beschreibung: Entscheidungen mit IF zu treffen
Rem
Rem Hardware/Voraussetzungen:
Rem
Rem ====================================================================

Print "7. Unsere erste Entscheidung"
A = 10
If A = 10 Then
  Print "A hat den Wert 10."
EndIf

Print "Press any key...": Do : Loop While Inkey$=""

Print "9. ELSE - der andere Fall"
A = 5
If A = 10 Then
  Print "A ist 10."
Else
  Print "A ist nicht 10."
EndIf

Print "Press any key...": Do : Loop While Inkey$=""

Print "11. Unser erstes Quiz"
Print "Wieviel ist 2+3?"
Input ANTWORT
If ANTWORT = 5 Then
  Print "Richtig!"
Else
  Print "Leider falsch."
EndIf

Print "Press any key...": Do : Loop While Inkey$=""

Print "12. Mehrere Entscheidungen"
Input "Schulnote";NOTE
If NOTE = 1 Then
  Print "Sehr gut"
EndIf
If NOTE = 2 Then
  Print "Gut"
EndIf
If NOTE = 3 Then
  Print "Befriedigend"
EndIf

Print "Press any key...": Do : Loop While Inkey$=""

Print "13. ELSEIF verwenden"
Input "Schulnote";NOTE
If NOTE = 1 Then
  Print "Sehr gut"
ElseIf NOTE = 2 Then
  Print "Gut"
ElseIf NOTE = 3 Then
  Print "Befriedigend"
Else
  Print "Unbekannte Note"
EndIf

Print "Press any key...": Do : Loop While Inkey$=""

Print "14. Verschachtelte Entscheidungen"
Input "Alter"; ALTER
If ALTER >= 18 Then
  Print "Volljaehrig"
  If ALTER >= 67 Then
    Print "Rentenalter erreicht"
  EndIf
EndIf

Print "Press any key...": Do : Loop While Inkey$=""

Print "16. Probier's selbst!"
Print "Versuche folgende Aufgaben:"
Print "1. Schreibe ein Programm, das prueft, ob eine Zahl groesser als 100 ist."
Print "2. Gib aus, ob eine Zahl gerade oder ungerade ist."
Print "3. Vergleiche zwei Zahlen miteinander."
Print "4. Erweitere das Quiz um weitere Rechenaufgaben."
Print "5. Gib abhaengig vom Alter unterschiedliche Texte aus."
Print
Print "Ready..."
