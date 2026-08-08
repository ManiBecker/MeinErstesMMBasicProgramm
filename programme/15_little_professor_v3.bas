Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 15_little_professor_v3.bas
Rem Titel: Kapitel 15: Little Professor Version 3
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 27.07.2026
Rem
Rem Beschreibung:
Rem
Rem Hardware/Voraussetzungen: keine/PicoMite/ColourMaxiMite
Rem
Rem ====================================================================

RUNDE=1

Print "3. Die Aufgaben speichern"
Print "Dim AUFGABE$(9)"
Print "Dim LOESUNG(9)"
Print "Dim EINGABE(9)"
Print "Dim TYP(9)"

Print "Press any key...": Do : Loop While Inkey$=""

Print "4. Die Arrays fuellen"
Print "AUFGABE$(RUNDE-1)=TEXTAUFGABE$"
Print "LOESUNG(RUNDE-1)=ERG"
Print "EINGABE(RUNDE-1)=ANTWORT"
Print "TYP(RUNDE-1)=OP"

Print "Press any key...": Do : Loop While Inkey$=""

Print "5. Eine Aufgabe als Text speichern"
Print "TEXTAUFGABE$=Str$(A)+"" + ""+Str$(B)"
Print "TEXTAUFGABE$=Str$(A)+"" * ""+Str$(B)"

Print "Press any key...": Do : Loop While Inkey$=""

Print "6. Das komplette Programm"
Print "Findest du in 15_little_professor_v3_final.bas"

Do
  Input "Wie heisst du ";NAME$
Loop While NAME$=""
Dim AUFGABE$(9)
Dim LOESUNG(9)
Dim EINGABE(9)
Dim TYP(9)
PUNKTE=0
For RUNDE=1 To 10
  NeueAufgabe
  Print "Aufgabe ";RUNDE;".) ";
  Print TEXTAUFGABE$;" = ";
  Input "",ANTWORT
  AUFGABE$(RUNDE-1)=TEXTAUFGABE$
  LOESUNG(RUNDE-1)=ERG
  EINGABE(RUNDE-1)=ANTWORT
  TYP(RUNDE-1)=OP
  If ANTWORT=ERG Then
    Print "Richtig!"
    PUNKTE=PUNKTE+1
  Else
    Print "Leider falsch! ";
    Print "Richtig waere ";ERG
  EndIf
Next RUNDE
Print
Print NAME$;", du hast ";PUNKTE;" von 10 Punkten erreicht."
Print
Print "Auswertung"
Print "-----------"
For I=0 To 9
  If EINGABE(I)=LOESUNG(I) Then
    Print AUFGABE$(I);" =";LOESUNG(I);"  OK :)"
  Else
    Print AUFGABE$(I);" =";LOESUNG(I);
    Print "  Deine Antwort ";EINGABE(I);" war leider falsch ;("
  EndIf
Next I
Sub NeueAufgabe
  OP=Int(Rnd*4)
  If OP=0 Then
    A=Int(Rnd*10)
    B=Int(Rnd*10)
    ERG=A+B
    TEXTAUFGABE$=Str$(A)+" + "+Str$(B)
  ElseIf OP=1 Then
    A=Int(Rnd*10)+10
    B=Int(Rnd*10)
    ERG=A-B
    TEXTAUFGABE$=Str$(A)+" - "+Str$(B)
  ElseIf OP=2 Then
    A=Int(Rnd*10)
    B=Int(Rnd*10)
    ERG=A*B
    TEXTAUFGABE$=Str$(A)+" * "+Str$(B)
  Else
    ERG=Int(Rnd*10)+1
    B=Int(Rnd*10)+1
    A=ERG*B
    TEXTAUFGABE$=Str$(A)+" / "+Str$(B)
  EndIf
End Sub

Print "Press any key...": Do : Loop While Inkey$=""

Print "9. Fehler nach Rechenart zaehlen"
ADDI=0
SUBS=0
MULT=0
DIVI=0
For I=0 To 9
  If EINGABE(I)<>LOESUNG(I) Then
    If TYP(I)=0 Then ADDI=ADDI+1
    If TYP(I)=1 Then SUBS=SUBS+1
    If TYP(I)=2 Then MULT=MULT+1
    If TYP(I)=3 Then DIVI=DIVI+1
  EndIf
Next I

Print
Print "Fehlerstatistik"
Print "Additionen:      ";ADDI
Print "Subtraktionen:   ";SUBS
Print "Multiplikation:  ";MULT
Print "Divisionen:      ";DIVI

Print "Press any key...": Do : Loop While Inkey$=""

Print "11. Experimentiere!"
Print "Probiere folgende Aenderungen aus:"
Print "- Erhoehe die Anzahl der Aufgaben auf 20."
Print "- Speichere zusaetzlich die benoetigte Zeit."
Print "- Gib nur die falsch beantworteten Aufgaben aus."
Print "- Zaehle richtige Antworten je Rechenart."

Print "Press any key...": Do : Loop While Inkey$=""

Print "12. Probier's selbst!"
Print "Versuche folgende Aufgaben:"
Print "1. Speichere den Namen des Spielers."
Print "2. Gib die erreichte Prozentzahl aus."
Print "3. Zeige nur die falschen Antworten an."
Print "4. Ermittle die schwierigste Rechenart."
Print "5. Vergib eine Schulnote."
Print
Print "Ready..."
