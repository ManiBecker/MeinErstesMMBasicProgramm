Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 06_einmaleins.bas
Rem Titel: Kapitel 6: Schleifen mit FOR NEXT
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 24.07.2026
Rem
Rem Beschreibung: wie Schleifen funktionieren
Rem
Rem Hardware/Voraussetzungen: keine
Rem
Rem ====================================================================

Print "Kapitel 6: Schleifen mit FOR NEXT"
Print
Print "Warum Schleifen wichtig sind"
Print "Hallo Welt!"
Print "Hallo Welt!"
Print "Hallo Welt!"
Print "Hallo Welt!"
Print "Hallo Welt!"
Print "Hallo Welt!"
Print "Hallo Welt!"
Print "Hallo Welt!"
Print "Hallo Welt!"
Print "Hallo Welt!"

Print "Press any key...": Do : Loop While Inkey$=""

Print "Unsere erste Schleife"
For I=1 To 10
  Print "Hallo Welt!"
Next I

Print "Press any key...": Do : Loop While Inkey$=""

Print "Die Zaehlvariable ausgeben"
For I=1 To 10
  Print I
Next I

Print "Press any key...": Do : Loop While Inkey$=""

Print "Mit der Zaehlvariable rechnen"
For I=1 To 10
  Print I*I
Next I

Print "Press any key...": Do : Loop While Inkey$=""

Print "Das kleine Einmaleins"
For I=1 To 10
  Print I;" x 5 = ";I*5
Next I

Print "Press any key...": Do : Loop While Inkey$=""

Print "Rueckwaerts zaehlen"
For I=10 To 1 Step -1
  Print I
Next I

Print "Press any key...": Do : Loop While Inkey$=""

Print "Groessere Schritte"
For I=0 To 20 Step 2
  Print I
Next I

Print "Press any key...": Do : Loop While Inkey$=""

Print "Unser erster Countdown"
For I=10 To 1 Step -1
  Print I
Next I
Print "Start!"

Print "Press any key...": Do : Loop While Inkey$=""

Print "Schleifen und Entscheidungen"
For I=1 To 10
  If I Mod 2 = 0 Then
    Print I
  EndIf
Next I

Print "Press any key...": Do : Loop While Inkey$=""

Print "Eine mathematische Funktion berechnen"
For X=0 To 10
  Y=0.5*X^2+X+0.5
  Print "X=";X;" Y=";Y
Next X

Print "Press any key...": Do : Loop While Inkey$=""

Print "Experimentiere!"
Print "Probiere folgende Aenderungen aus:"
Print "Gib die Zahlen von 1 bis 20 aus. Zaehle von 100 bis 0 herunter. Gib alle Vielfachen von 3 aus."
Print "Berechne die Quadratzahlen von 1 bis 20."
Print
Print "Probier's selbst!"
Print "Versuche folgende Aufgaben:"
Print "1. Gib die Zahlen von 1 bis 50 aus."
Print "2. Gib nur die geraden Zahlen von 1 bis 20 aus."
Print "3. Erstelle einen Countdown von 20 bis 1."
Print "4. Erzeuge das Einmaleins der Zahl 7."
Print "5. Berechne die Quadratzahlen von 1 bis 15."
Print
Print "Ready..."
