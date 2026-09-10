Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 07_wuerfel.bas
Rem Titel: Kapitel 7: Zufallszahlen
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 24.07.2026
Rem
Rem Beschreibung: wie Zufallszahlen erzeugt werden
Rem
Rem Hardware/Voraussetzungen: keine
Rem
Rem ====================================================================

Print "Kapitel 7: Zufallszahlen"
Print
Print "Eine Zufallszahl erzeugen"
Print "Print Rnd":Print Rnd

Print "Press any key...": Do : Loop While Inkey$=""

Print "Zufallszahlen mehrfach erzeugen"
For I=1 To 10
  Print Rnd
Next I

Print "Press any key...": Do : Loop While Inkey$=""

Print "Einen Wuerfel simulieren"
Print "Print Int(Rnd*6)+1":Print Int(Rnd*6)+1

Print "Press any key...": Do : Loop While Inkey$=""

Print "Mehrfach wuerfeln"
For I=1 To 10
  Print Int(Rnd*6)+1
Next I

Print "Press any key...": Do : Loop While Inkey$=""

Print "Muenze werfen"
If Int(Rnd*2)=0 Then
  Print "Kopf"
Else
  Print "Zahl"
EndIf

Print "Press any key...": Do : Loop While Inkey$=""

Print "Lottozahlen erzeugen"
For I=1 To 6
  Print Int(Rnd*49)+1
Next I

Print "Press any key...": Do : Loop While Inkey$=""

Print "Ein Ratespiel"
GEHEIM=Int(Rnd*10)+1
Print "Rate eine Zahl von 1 bis 10"
Input TIPP
If TIPP=GEHEIM Then
  Print "Richtig!"
Else
  Print "Leider falsch."
EndIf

Print "Ready..."
