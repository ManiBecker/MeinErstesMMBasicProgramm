REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 08_zahlenraten.bas
REM Titel: Kapitel 8: Unser erstes Spiel: Zahlenraten
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 24.07.2026
REM
REM Beschreibung: wie mehrere Befehle zu einem vollständigen Programm
REM               kombiniert werden.
REM
REM Hardware/Voraussetzungen: keine
REM
REM ====================================================================

PRINT "4. Das komplette Programm"
GEHEIM=INT(RND*10)+1
PRINT "Ich habe mir eine Zahl von 1 bis 10 ausgedacht."
INPUT TIPP
IF TIPP=GEHEIM THEN
  PRINT "Richtig!"
ELSE
  PRINT "Leider falsch."
ENDIF

PRINT "7. Mehrere Spielrunden"
FOR RUNDE=1 TO 5
  GEHEIM=INT(RND*10)+1
  PRINT
  PRINT "Runde ";RUNDE
  INPUT TIPP
  IF TIPP=GEHEIM THEN
  PRINT "Richtig!"
  ELSE
  PRINT "Leider falsch."
  ENDIF
NEXT RUNDE

PRINT "8. Punkte sammeln"
PUNKTE=0
FOR RUNDE=1 TO 5
  GEHEIM=INT(RND*10)+1
  PRINT
  PRINT "Runde ";RUNDE
  INPUT TIPP
  IF TIPP=GEHEIM THEN
  PRINT "Richtig!"
  PUNKTE=PUNKTE+1
  ELSE
  PRINT "Leider falsch."
  ENDIF
NEXT RUNDE
PRINT
PRINT "Du hast ";PUNKTE;" Punkte erreicht."

PRINT "10. Ideen für Erweiterungen"
PRINT "Vielleicht möchtest du das Spiel bereits jetzt erweitern."
PRINT "Zum Beispiel:"
PRINT "- Zahlen von 1 bis 20 verwenden"
PRINT "- Zahlen von 1 bis 100 verwenden"
PRINT "- zehn Spielrunden durchführen"
PRINT "- zwei Punkte für einen Treffer vergeben"

PRINT "11. Experimentiere!"
PRINT "Probiere folgende Änderungen aus:"
PRINT "- Erhöhe den Zahlenbereich auf 20."
PRINT "- Erhöhe den Zahlenbereich auf 100."
PRINT "- Spiele zehn Runden statt fünf."
PRINT "- Vergib zwei Punkte für jeden Treffer."
PRINT "Welche Auswirkungen haben die Änderungen?"

PRINT "12. Probier’s selbst!"
PRINT "Versuche folgende Aufgaben:"
PRINT "1. Erweitere das Spiel auf zehn Runden."
PRINT "2. Zähle die Treffer."
PRINT "3. Gib die Gesamtpunktzahl aus."
PRINT "4. Verwende Zahlen von 1 bis 50."
PRINT "5. Frage den Namen des Spielers ab und begrüße ihn persönlich."



