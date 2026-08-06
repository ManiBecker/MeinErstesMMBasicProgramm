Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 09_zahlenraten_v2.bas
Rem Titel: Kapitel 9: Zahlenraten Version 2
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 24.07.2026
Rem
Rem Beschreibung: wie ein Spiel mehrere Versuche erlauben kann
Rem
Rem Hardware/Voraussetzungen: keine
Rem
Rem ====================================================================

Print "4. Eine neue Schleife"
Do
  Print "Hallo Welt! (beliebiege Taste fuer Abbruch)"
  If Inkey$<>"" Then Exit
Loop

Print "Press any key...": Do : Loop While Inkey$=""

Print "5. Die Schleife beenden (Eingabe 10 fuer Abbruch)"
Do
  Input "Zahl eingeben";A
Loop Until A=10

Print "Press any key...": Do : Loop While Inkey$=""

Print "6. Das neue Zahlenratespiel"
GEHEIM=Int(Rnd*100)+1
Print "Ich habe mir eine Zahl von 1 bis 100 ausgedacht."
Do
  Input "Dein Tipp";TIPP
  If TIPP<GEHEIM Then
    Print "Zu klein!"
  ElseIf TIPP>GEHEIM Then
    Print "Zu gross!"
  Else
    Print "Richtig!"
  EndIf
Loop Until TIPP=GEHEIM

Print "Press any key...": Do : Loop While Inkey$=""

Print "8. Die Anzahl der Versuche zaehlen"
GEHEIM=Int(Rnd*100)+1
VERSUCHE=0
Do
  VERSUCHE=VERSUCHE+1
  Input "Dein Tipp";TIPP
  If TIPP<GEHEIM Then
    Print "Zu klein!"
  ElseIf TIPP>GEHEIM Then
    Print "Zu gross!"
  Else
    Print "Richtig!"
  EndIf
Loop Until TIPP=GEHEIM
Print
Print "Du hast ";VERSUCHE;" Versuche benoetigt."

Print "Press any key...": Do : Loop While Inkey$=""

Print "10. Eine persoenliche Begruessung"
Do
  Print "Wie heisst du?"
  Input NAME$
Loop While name$=""
Print
Print "Hallo ";NAME$
GEHEIM=Int(Rnd*100)+1
VERSUCHE=0
Do
  VERSUCHE=VERSUCHE+1
  Print "Dein";versuche;". Tipp";
  Input TIPP
  If TIPP<GEHEIM Then
    Print "Zu klein!"
  ElseIf TIPP>GEHEIM Then
    Print "Zu gross!"
  Else
    Print "Richtig!"
  EndIf
Loop Until TIPP=GEHEIM
Print
Print name$;", du hast ";VERSUCHE;" Versuche benoetigt."

Print "Press any key...": Do : Loop While Inkey$=""

Print "11. Experimentiere!"
Print "Probiere folgende Aenderungen aus:"
Print "- Verwende Zahlen von 1 bis 50."
Print "- Verwende Zahlen von 1 bis 1000."
Print "- Begrenze die Anzahl der Versuche."
Print "- Vergib Punkte fuer besonders gute Ergebnisse."

Print "Press any key...": Do : Loop While Inkey$=""

Print "12. Probier's selbst!"
Print "Versuche folgende Aufgaben:"
Print "1. Begrenze die Anzahl der Versuche auf 10."
Print "2. Gib nach dem Spiel die geheime Zahl aus."
Print "3. Vergib Punkte abhaengig von der Anzahl der Versuche."
Print "4. Frage nach jedem Spiel, ob noch einmal gespielt werden soll."
Print "5. Erweitere das Spiel um einen Highscore."
Print
Print "Ready..."
