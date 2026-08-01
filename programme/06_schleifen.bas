REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 06_einmaleins.bas
REM Titel: Kapitel 6: Schleifen mit FOR NEXT
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 24.07.2026
REM
REM Beschreibung: wie Schleifen funktionieren
REM
REM Hardware/Voraussetzungen: keine
REM
REM ====================================================================

PRINT "2. Warum Schleifen wichtig sind"
PRINT "Hallo Welt!"
PRINT "Hallo Welt!"
PRINT "Hallo Welt!"
PRINT "Hallo Welt!"
PRINT "Hallo Welt!"
PRINT "Hallo Welt!"
PRINT "Hallo Welt!"
PRINT "Hallo Welt!"
PRINT "Hallo Welt!"
PRINT "Hallo Welt!"

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "3. Unsere erste Schleife"
FOR I=1 TO 10
  PRINT "Hallo Welt!"
NEXT I

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "5. Die Zaehlvariable ausgeben"
FOR I=1 TO 10
  PRINT I
NEXT I

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "6. Mit der Zaehlvariable rechnen"
FOR I=1 TO 10
  PRINT I*I
NEXT I

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "7. Das kleine Einmaleins"
FOR I=1 TO 10
  PRINT I;" x 5 = ";I*5
NEXT I

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "8. Rueckwaerts zaehlen"
FOR I=10 TO 1 STEP -1
  PRINT I
NEXT I

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "9. Groessere Schritte"
FOR I=0 TO 20 STEP 2
  PRINT I
NEXT I

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "10. Unser erster Countdown"
FOR I=10 TO 1 STEP -1
  PRINT I
NEXT I
PRINT "Start!"

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "11. Schleifen und Entscheidungen"
FOR I=1 TO 10
  IF I MOD 2 = 0 THEN
    PRINT I
  ENDIF
NEXT I

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "12. Eine mathematische Funktion berechnen"
FOR X=0 TO 10
  Y=0.5*X^2+X+0.5
  PRINT "X=";X;" Y=";Y
NEXT X

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "13. Experimentiere!"
PRINT "Probiere folgende Aenderungen aus:"
PRINT "Gib die Zahlen von 1 bis 20 aus. Zaehle von 100 bis 0 herunter. Gib alle Vielfachen von 3 aus."
PRINT "Berechne die Quadratzahlen von 1 bis 20."

PRINT "14. Probier’s selbst!"
PRINT "Versuche folgende Aufgaben:"
PRINT "1. Gib die Zahlen von 1 bis 50 aus."
PRINT "2. Gib nur die geraden Zahlen von 1 bis 20 aus."
PRINT "3. Erstelle einen Countdown von 20 bis 1."
PRINT "4. Erzeuge das Einmaleins der Zahl 7."
PRINT "5. Berechne die Quadratzahlen von 1 bis 15."
