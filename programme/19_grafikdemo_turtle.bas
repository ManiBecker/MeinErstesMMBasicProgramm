Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 19_grafikdemo_turtle.bas
Rem Titel: Kapitel 19: Die ersten Grafikbefehle
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 28.07.2026
Rem
Rem Beschreibung: Turtle-Grafik
Rem
Rem Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
Rem
Rem ====================================================================

MODE 2

Turtle RESET
CLS
Print "24. Die Schildkroete zuruecksetzen"
Print "Press any key...": Do : Loop While Inkey$=""

Turtle RESET
CLS
Print "25. Ein Quadrat zeichnen"
For I = 1 To 4
  Turtle FORWARD 10
  Turtle RIGHT 90
Next I
Print "Press any key...": Do : Loop While Inkey$=""

Turtle RESET
CLS
Print "27. Experimentiere!"
Print "Veraendere die Seitenlaenge:"
For I = 1 To 4
  Turtle FORWARD 30
  Turtle RIGHT 90
Next I
Print "Press any key...": Do : Loop While Inkey$=""

Turtle RESET
CLS
Print "Oder aendere den Drehwinkel:"
For I = 1 To 6
  Turtle FORWARD 10
  Turtle RIGHT 60
Next I
Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "28. Vielecke zeichnen"
Print
Print "Der Drehwinkel bestimmt, welche Figur gezeichnet wird."
Print "Probiere zum Beispiel folgende Winkel aus:"
Print "- 120 grad -> Dreieck"
Print "- 90 grad -> Quadrat"
Print "- 72 grad -> Fuenfeck"
Print "- 60 grad -> Sechseck"
Print "- 170 grad -> Stern- bzw. Rosettenfigur"
Print "Je kleiner der Drehwinkel ist, desto mehr Seiten besitzt die Figur."
Print
Print "Press any key...": Do : Loop While Inkey$=""


Turtle RESET
CLS
Print "29. Eine Spirale"
For I = 1 To 80
  Turtle FORWARD I * 2
  Turtle RIGHT 50
Next I
Print "Press any key...": Do : Loop While Inkey$=""

Turtle RESET
CLS
Print "30. Ein Stern"
For I = 1 To 80
  Turtle FORWARD I * 2
  Turtle RIGHT 120 + I
Next I
Print "Ready..."
