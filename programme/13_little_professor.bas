REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 13_little_professor.bas
REM Titel: Kapitel 13: Little Professor
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 27.07.2026
REM
REM Beschreibung:  eigenen kleinen Mathematiktrainer programmieren
REM
REM Hardware/Voraussetzungen: keine
REM
REM ====================================================================

PRINT "3. Unsere erste Rechenaufgabe"
A=INT(RND*10)
B=INT(RND*10)
PRINT A;" + ";B;" = ?"
INPUT ANTWORT
IF ANTWORT=A+B THEN
  PRINT "Richtig!"
ELSE
  PRINT "Leider falsch!"
ENDIF

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "5. Mehrere Aufgaben hintereinander"
FOR RUNDE=1 TO 10
  A=INT(RND*10)
  B=INT(RND*10)
  PRINT
  PRINT "Aufgabe ";RUNDE
  PRINT A;" + ";B;" = ?"
  INPUT ANTWORT
  IF ANTWORT=A+B THEN
    PRINT "Richtig!"
  ELSE
    PRINT "Leider falsch!"
  ENDIF
NEXT RUNDE

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "6. Punkte zaehlen"
PUNKTE=0
PUNKTE=PUNKTE+1

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "7. Die richtige Loesung anzeigen"
IF ANTWORT=A+B THEN
  PRINT "Richtig!"
  PUNKTE=PUNKTE+1
ELSE
  PRINT "Leider falsch!"
  PRINT "Richtig waere ";A+B
ENDIF

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "8. Das komplette Programm"
CLS
PUNKTE=0
FOR RUNDE=1 TO 10
  A=INT(RND*10)
  B=INT(RND*10)
  PRINT
  PRINT "Aufgabe ";RUNDE
  PRINT A;" + ";B;" = ?"
  INPUT ANTWORT
  IF ANTWORT=A+B THEN
    PRINT "Richtig!"
    PUNKTE=PUNKTE+1
  ELSE
    PRINT "Leider falsch!"
    PRINT "Richtig waere ";A+B
  ENDIF
NEXT RUNDE
PRINT
PRINT "Du hast ";PUNKTE;" von 10 Punkten erreicht."