Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 13_little_professor.bas
Rem Titel: Kapitel 13: Little Professor
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 27.07.2026
Rem
Rem Beschreibung:  eigenen kleinen Mathematiktrainer programmieren
Rem
Rem Hardware/Voraussetzungen: keine
Rem
Rem ====================================================================

Print "3. Unsere erste Rechenaufgabe"
A=Int(Rnd*10)+1
B=Int(Rnd*10)+1
Print A;" + ";B;" = ";
Input ANTWORT
If ANTWORT=A+B Then
  Print "Richtig!"
Else
  Print "Leider falsch!"
EndIf

Print "Press any key...": Do : Loop While Inkey$=""

Print "5. Mehrere Aufgaben hintereinander"
For RUNDE=1 To 3
  A=Int(Rnd*10)+1
  B=Int(Rnd*10)+1
  Print
  Print "Aufgabe ";RUNDE
  Print A;" + ";B;" = ";
  Input ANTWORT
  If ANTWORT=A+B Then
    Print "Richtig!"
  Else
    Print "Leider falsch!"
  EndIf
Next RUNDE

Print "Press any key...": Do : Loop While Inkey$=""

Print "6. Punkte zaehlen"
PUNKTE=0
PUNKTE=PUNKTE+1

Print "Press any key...": Do : Loop While Inkey$=""

Print "7. Die richtige Loesung anzeigen"
If ANTWORT=A+B Then
  Print "Richtig!"
  PUNKTE=PUNKTE+1
Else
  Print "Leider falsch!"
  Print "Richtig waere ";A+B
EndIf

Print "Press any key...": Do : Loop While Inkey$=""

Print "8. Das komplette Programm"
CLS
PUNKTE=0
For RUNDE=1 To 5
  A=Int(Rnd*10)
  B=Int(Rnd*10)
  Print
  Print "Aufgabe ";RUNDE
  Print A;" + ";B;" = ";
  Input ANTWORT
  If ANTWORT=A+B Then
    Print "Richtig!"
    PUNKTE=PUNKTE+1
  Else
    Print "Leider falsch!"
    Print "Richtig waere ";A+B
  EndIf
Next RUNDE
Print
Print "Du hast";PUNKTE;" von 10 Punkten erreicht."
Print
Print "Ready..."
