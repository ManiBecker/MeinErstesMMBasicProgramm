Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 14_little_professor_v2.bas
Rem Titel: Kapitel 14: Little Professor Version 2
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 27.07.2026
Rem
Rem Beschreibung: Das komplette Programm
Rem
Rem Hardware/Voraussetzungen: keine
Rem
Rem ====================================================================

CLS
Print "Little Professor Version 2"
Print "=========================="
Print
Do
  Input "Wie heisst du ";NAME$
Loop While name$=""
Print
Print "Hallo ";NAME$;", herzlich willkommen;)"
Print
PUNKTE=0
For RUNDE=1 To 10
  Print "Aufgabe";RUNDE;".) ";
  NeueAufgabe
  Input "",ANTWORT
  If ANTWORT=ERG Then
    Print "Richtig!"
    PUNKTE=PUNKTE+1
  Else
    Print "Leider falsch! ";
    Print "Richtig waere ";ERG
  EndIf
Next RUNDE
Print
Print NAME$;", du hast";PUNKTE;" von 10 Punkten erreicht."
PROZENT=PUNKTE*100/10
If PROZENT=100 Then
  Print "Perfekt!"
ElseIf PROZENT>=90 Then
  Print "Sehr gut!"
ElseIf PROZENT>=80 Then
  Print "Gut gemacht!"
ElseIf PROZENT>=60 Then
  Print "Das war ordentlich."
Else
  Print "Weiter ueben!"
EndIf
Print
Print "Ready..."
End

Sub NeueAufgabe
  OP=Int(Rnd*4)
  If OP=0 Then
    A=Int(Rnd*10)+1
    B=Int(Rnd*10)+1
    ERG=A+B
    Print A;" +";B;" = ";
  ElseIf OP=1 Then
    A=Int(Rnd*10)+11
    B=Int(Rnd*10)+1
    ERG=A-B
    Print A;" -";B;" = ";
  ElseIf OP=2 Then
    A=Int(Rnd*10)+1
    B=Int(Rnd*10)+1
    ERG=A*B
    Print A;" *";B;" = ";
  Else
    ERG=Int(Rnd*10)+1
    B=Int(Rnd*10)+1
    A=ERG*B
    Print A;" /";B;" = ";
  EndIf
End Sub
