Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 10_strukturiertes_programm.bas
Rem Titel: Kapitel 10: Programme strukturieren mit SUB und FUNCTION
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 24.07.2026
Rem Letzte Aenderung: 26.7.2026: Doppelte SUBs geloescht.
Rem
Rem Beschreibung: Programme in kleinere Bausteine aufzuteilen
Rem
Rem Hardware/Voraussetzungen: keine
Rem
Rem ====================================================================

Print "3. Unsere erste SUB"
Sub Begruessung
  Print "Hallo Welt!"
End Sub
Begruessung

Print "Press any key...": Do : Loop While Inkey$=""

Print "4. Eine SUB mehrfach aufrufen"
Begruessung
Begruessung
Begruessung

Print "Press any key...": Do : Loop While Inkey$=""

Print "5. Eine SUB mit Parametern"
Sub Begruessung2(NAME$)
  Print "Hallo ";NAME$
End Sub
Begruessung2("Manfred")
Begruessung2("Geoff")
Begruessung2("Peter")

Print "Press any key...": Do : Loop While Inkey$=""

Print "7. Unsere erste FUNCTION"
Function Quadrat(X)
  Quadrat=X*X
End Function
Print Quadrat(5)

Print "Press any key...": Do : Loop While Inkey$=""

Print "8. Weitere Funktionen"
Function Verdoppeln(X)
  Verdoppeln=X*2
End Function
Print Verdoppeln(10)

Print "Press any key...": Do : Loop While Inkey$=""

Print "9. Funktionen in Berechnungen verwenden"
Print Quadrat(5)+Quadrat(3)

Print "Press any key...": Do : Loop While Inkey$=""

Print "10. Eine Wuerfelfunktion"
Function Wuerfel()
  Wuerfel=Int(Rnd*6)+1
End Function
Print Wuerfel()
Print Wuerfel()
Print Wuerfel()

Print "Press any key...": Do : Loop While Inkey$=""

Print "11. Eine mathematische Funktion"
Print "F(x)=0.5*X^2+X+0.5"
Function F(X)
  F=0.5*X^2+X+0.5
End Function
For X=0 To 10
  Print X;" ";F(X)
Next X

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "12. Das Zahlenratespiel verbessern"
Function NeueZahl()
  NeueZahl=Int(Rnd*100)+1
End Function
Function VergleicheZahl$(t,z)
  If t>z Then
    VergleicheZahl$="zu gross"
  ElseIf t<z Then
    VergleicheZahl$="zu klein"
  Else
    VergleicheZahl$="gleich"
  EndIf
  Print "Deine Zahl ist ";VergleicheZahl$;"."
End Function
Function Nochmal$()
  Input "Nochmal (j/n)";i$
  If i$="j" Or i$="J" Then
    Nochmal$="J"
  Else
    Nochmal$="N"
  EndIf
End Function
Do
  geheimzahl=NeueZahl()
  Do
    Input "Rate meine Geheinzahl zwischn 1 und 100";tipp
  Loop While VergleicheZahl$(tipp,geheimzahl)<>"gleich"
Loop While Nochmal$()="J"

Print "Press any key...": Do : Loop While Inkey$=""

Print "15. Experimentiere!"
Print "Probiere folgende Aenderungen aus:"
Print "- Schreibe eine Funktion zur Berechnung des Dreifachen einer Zahl."
Print "- Schreibe eine Funktion fuer die Berechnung eines Kreises."
Print "- Erweitere die Wuerfelfunktion."
Print "- Erstelle eine SUB fuer eine persoenliche Begruessung."

Print "10.16. Probier's selbst!"
Print "Versuche folgende Aufgaben:"
Print "1. Schreibe eine Funktion zur Berechnung des Wuerfels einer Zahl."
Print "2. Schreibe eine Funktion zur Berechnung des Umfangs eines Quadrats."
Print "3. Erstelle eine SUB, die fuenfmal ""MMBasic"" ausgibt."
Print "4. Verwende eine Funktion innerhalb einer FOR-Schleife."
Print "5. Baue die Funktion NeueZahl() in dein Zahlenratespiel ein."
Print
Print "Ready..."
