Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 08_zahlenraten.bas
Rem Titel: Kapitel 8: Unser erstes Spiel: Zahlenraten
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 24.07.2026
Rem
Rem Beschreibung: wie mehrere Befehle zu einem vollstaendigen Programm
Rem               kombiniert werden.
Rem
Rem Hardware/Voraussetzungen: keine
Rem
Rem ====================================================================

Print "4. Das komplette Programm"
GEHEIM=Int(Rnd*10)+1
Print "Ich habe mir eine Zahl von 1 bis 10 ausgedacht."
Input "Dein Tipp";TIPP
If TIPP=GEHEIM Then
  Print "Richtig!"
Else
  Print "Leider falsch."
EndIf

Print "Press any key...": Do : Loop While Inkey$=""

Print "7. Mehrere Spielrunden"
For RUNDE=1 To 5
  GEHEIM=Int(Rnd*10)+1
  Print
  Print "Runde ";RUNDE
  Input "Dein Tipp";TIPP
  If TIPP=GEHEIM Then
    Print "Richtig!"
  Else
    Print "Leider falsch."
  EndIf
Next RUNDE

Print "Press any key...": Do : Loop While Inkey$=""

Print "8. Punkte sammeln"
PUNKTE=0
For RUNDE=1 To 5
  GEHEIM=Int(Rnd*10)+1
  Print
  Print "Runde ";RUNDE
  Input "Dein Tipp";TIPP
  If TIPP=GEHEIM Then
    Print "Richtig!"
    PUNKTE=PUNKTE+1
  Else
    Print "Leider falsch."
  EndIf
Next RUNDE
Print
Print "Du hast ";PUNKTE;" Punkte erreicht."

Print "Press any key...": Do : Loop While Inkey$=""

Print "10. Ideen fuer Erweiterungen"
Print "Vielleicht moechtest du das Spiel bereits jetzt erweitern."
Print "Zum Beispiel:"
Print "- Zahlen von 1 bis 20 verwenden"
Print "- Zahlen von 1 bis 100 verwenden"
Print "- zehn Spielrunden durchfuehren"
Print "- zwei Punkte fuer einen Treffer vergeben"
Print
Print "11. Experimentiere!"
Print "Probiere folgende Aenderungen aus:"
Print "- Erhoehe den Zahlenbereich auf 20."
Print "- Erhoehe den Zahlenbereich auf 100."
Print "- Spiele zehn Runden statt fuenf."
Print "- Vergib zwei Punkte fuer jeden Treffer."
Print "Welche Auswirkungen haben die Aenderungen?"
Print
Print "12. Probier's selbst!"
Print "Versuche folgende Aufgaben:"
Print "1. Erweitere das Spiel auf zehn Runden."
Print "2. Zaehle die Treffer."
Print "3. Gib die Gesamtpunktzahl aus."
Print "4. Verwende Zahlen von 1 bis 50."
Print "5. Frage den Namen des Spielers ab und begruesse ihn persoenlich."
Print
Print "Ready.."
