REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 19_grafikdemo.bas
REM Titel: Kapitel 19: Die ersten Grafikbefehle
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 28.07.2026
REM
REM Beschreibung: Turtle-Grafik
REM
REM Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
REM
REM ====================================================================

PRINT "24. Die Schildkröte zurücksetzen"
CLS
TURTLE RESET

PRINT "25. Ein Quadrat zeichnen"
CLS
TURTLE RESET
FOR I = 1 TO 4
  TURTLE FORWARD 100
  TURTLE RIGHT 90
NEXT I

PRINT "27. Experimentiere!"
PRINT "Verändere die Seitenlänge:"
CLS
TURTLE RESET
FOR I = 1 TO 4
  TURTLE FORWARD 150
  TURTLE RIGHT 90
NEXT I

PRINT "Oder ändere den Drehwinkel:"
FOR I = 1 TO 6
  TURTLE FORWARD 100
  TURTLE RIGHT 60
NEXT I

PRINT "28. Vielecke zeichnen"
PRINT "Der Drehwinkel bestimmt, welche Figur gezeichnet wird."
PRINT "Probiere zum Beispiel folgende Winkel aus:"
PRINT "- 120 grad -> Dreieck"
PRINT "- 90 grad -> Quadrat"
PRINT "- 72 grad -> Fünfeck"
PRINT "- 60 grad -> Sechseck"
PRINT "- 170 grad -> Stern- bzw. Rosettenfigur"
PRINT "Je kleiner der Drehwinkel ist, desto mehr Seiten besitzt die Figur."

PRINT "29. Eine Spirale"
CLS
TURTLE RESET
FOR I = 1 TO 80
  TURTLE FORWARD I * 3
  TURTLE RIGHT 20
NEXT I
