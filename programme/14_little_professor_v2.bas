Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 14_little_professor_v2.bas
Rem Titel: Kapitel 14: Little Professor Version 2
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 27.07.2026
Rem
Rem Beschreibung: eigenen kleinen Mathematiktrainer programmieren
Rem
Rem Hardware/Voraussetzungen: keine
Rem
Rem ====================================================================

Print "3. Der Spielername"
Do
  Input "Wie heisst du ";NAME$
Loop While NAME$=""
Print
Print "Hallo ";NAME$
Print

Print "Press any key...": Do : Loop While Inkey$=""

Print "4. Zufaellig eine Rechenart auswaehlen"
OP=Int(Rnd*4)
Print "Die Werte bedeuten:"
Print "0 = Addition"
Print "1 = Subtraktion"
Print "2 = Multiplikation"
Print "3 = Division"

Print "Press any key...": Do : Loop While Inkey$=""

Print "5. Eine Aufgabe erzeugen"
Sub NeueAufgabe
  OP=Int(Rnd*4)
End Sub

Print "Press any key...": Do : Loop While Inkey$=""

Print "6. Additionsaufgaben"
A=Int(Rnd*10)
B=Int(Rnd*10)
ERG=A+B
Print A;" + ";B;" = ?"

Print "Press any key...": Do : Loop While Inkey$=""

Print "7. Subtraktionsaufgaben"
A=Int(Rnd*10)+10
B=Int(Rnd*10)
ERG=A-B
Print A;" - ";B;" = ?"

Print "Press any key...": Do : Loop While Inkey$=""

Print "8. Multiplikationsaufgaben"
A=Int(Rnd*10)
B=Int(Rnd*10)
ERG=A*B
Print A;" * ";B;" = ?"

Print "Press any key...": Do : Loop While Inkey$=""

Print "9. Divisionsaufgaben"
ERG=Int(Rnd*10)+1
B=Int(Rnd*10)+1
A=ERG*B
Print A;" / ";B;" = ?"

Print "Press any key...": Do : Loop While Inkey$=""

Print "10. Die SUB vervollstaendigen"
Sub NeueAufgabe2
  OP=Int(Rnd*4)
  If OP=0 Then
    A=Int(Rnd*10)
    B=Int(Rnd*10)
    ERG=A+B
    Print A;" + ";B;" = ?"
  ElseIf OP=1 Then
    A=Int(Rnd*10)+10
    B=Int(Rnd*10)
    ERG=A-B
    Print A;" - ";B;" = ?"
  ElseIf OP=2 Then
    A=Int(Rnd*10)
    B=Int(Rnd*10)
    ERG=A*B
    Print A;" * ";B;" = ?"
  Else
    ERG=Int(Rnd*10)+1
    B=Int(Rnd*10)+1
    A=ERG*B
    Print A;" / ";B;" = ?"
  EndIf
End Sub

Print "Press any key...": Do : Loop While Inkey$=""

Print "11. Das komplette Programm"
Print "Findest du in 14_little_professor_v2_final.bas"

Print "14. Experimentiere!"
Print "Probiere folgende Aenderungen aus:"
Print "- Verwende Zahlen bis 20."
Print "- Stelle 20 Aufgaben."
Print "- Verwende nur Multiplikationsaufgaben."
Print "- Verwende nur Divisionsaufgaben."
Print "- Aendere die Bewertung am Ende."

Print "Press any key...": Do : Loop While Inkey$=""

Print "15. Probier's selbst!"
Print "Versuche folgende Aufgaben:"
Print "1. Fuege eine Schwierigkeitsstufe hinzu."
Print "2. Lasse den Spieler die Anzahl der Aufgaben waehlen."
Print "3. Vergib Bonuspunkte fuer besonders schnelle Loesungen."
Print "4. Speichere die Anzahl richtiger und falscher Antworten getrennt."
Print "5. Zeige am Ende die erreichte Prozentzahl an."
Print
Print "Ready..."
