REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 09_zahlenraten_v2.bas
REM Titel: Kapitel 9: Zahlenraten Version 2
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 24.07.2026
REM
REM Beschreibung: wie ein Spiel mehrere Versuche erlauben kann
REM
REM Hardware/Voraussetzungen: keine
REM
REM ====================================================================

PRINT "4. Eine neue Schleife"
DO
  PRINT "Hallo Welt!"
LOOP

PRINT "5. Die Schleife beenden"
DO
  INPUT A
LOOP UNTIL A=10

PRINT "6. Das neue Zahlenratespiel"
GEHEIM=INT(RND*100)+1
PRINT "Ich habe mir eine Zahl von 1 bis 100 ausgedacht."
DO
  INPUT TIPP
  IF TIPP<GEHEIM THEN
  PRINT "Zu klein!"
  ELSEIF TIPP>GEHEIM THEN
  PRINT "Zu gross!"
  ELSE
  PRINT "Richtig!"
  ENDIF
LOOP UNTIL TIPP=GEHEIM

PRINT "8. Die Anzahl der Versuche zaehlen"
VERSUCHE=0
DO
  VERSUCHE=VERSUCHE+1
  INPUT TIPP
  IF TIPP<GEHEIM THEN
    PRINT "Zu klein!"
  ELSEIF TIPP>GEHEIM THEN
    PRINT "Zu gross!"
  ELSE
    PRINT "Richtig!"
  ENDIF
LOOP UNTIL TIPP=GEHEIM
PRINT
PRINT "Du hast ";VERSUCHE;" Versuche benoetigt."

PRINT "10. Eine persoenliche Begruessung"
PRINT "Wie heisst du?"
INPUT NAME$
PRINT
PRINT "Hallo ";NAME$
GEHEIM=INT(RND*100)+1
VERSUCHE=0
DO
  VERSUCHE=VERSUCHE+1
  INPUT TIPP
  IF TIPP<GEHEIM THEN
    PRINT "Zu klein!"
  ELSEIF TIPP>GEHEIM THEN
    PRINT "Zu gross!"
  ELSE
    PRINT "Richtig!"
  ENDIF
LOOP UNTIL TIPP=GEHEIM
PRINT
PRINT "Du hast ";VERSUCHE;" Versuche benoetigt."

PRINT "11. Experimentiere!"
PRINT "Probiere folgende Aenderungen aus:"
PRINT "- Verwende Zahlen von 1 bis 50."
PRINT "- Verwende Zahlen von 1 bis 1000."
PRINT "- Begrenze die Anzahl der Versuche."
PRINT "- Vergib Punkte fuer besonders gute Ergebnisse."

PRINT "12. Probier’s selbst!"
PRINT "Versuche folgende Aufgaben:"
PRINT "1. Begrenze die Anzahl der Versuche auf 10."
PRINT "2. Gib nach dem Spiel die geheime Zahl aus."
PRINT "3. Vergib Punkte abhaengig von der Anzahl der Versuche."
PRINT "4. Frage nach jedem Spiel, ob noch einmal gespielt werden soll."
PRINT "5. Erweitere das Spiel um einen Highscore."


