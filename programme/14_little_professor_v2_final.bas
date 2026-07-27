REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 14_little_professor_v2.bas
REM Titel: Kapitel 14: Little Professor Version 2
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 27.07.2026
REM
REM Beschreibung: Das komplette Programm
REM
REM Hardware/Voraussetzungen: keine
REM
REM ====================================================================

INPUT "Wie heisst du ";NAME$
PRINT
PRINT "Hallo ";NAME$
PRINT
PUNKTE=0
FOR RUNDE=1 TO 10
  PRINT
  PRINT "Aufgabe ";RUNDE
  NeueAufgabe
  INPUT ANTWORT
  IF ANTWORT=ERG THEN
    PRINT "Richtig!"
    PUNKTE=PUNKTE+1
  ELSE
    PRINT "Leider falsch!"
    PRINT "Richtig waere ";ERG
  ENDIF
NEXT RUNDE
PRINT
PRINT NAME$;", du hast ";PUNKTE;" von 10 Punkten erreicht."
PROZENT=PUNKTE*100/10
IF PROZENT=100 THEN
  PRINT "Perfekt!"
ELSEIF PROZENT>=90 THEN
  PRINT "Sehr gut!"
ELSEIF PROZENT>=80 THEN
  PRINT "Gut gemacht!"
ELSEIF PROZENT>=60 THEN
  PRINT "Das war ordentlich."
ELSE
  PRINT "Weiter ueben!"
ENDIF
SUB NeueAufgabe
  OP=INT(RND*4)
  IF OP=0 THEN
    A=INT(RND*10)
    B=INT(RND*10)
    ERG=A+B
    PRINT A;" + ";B;" = ?"
  ELSEIF OP=1 THEN
    A=INT(RND*10)+10
    B=INT(RND*10)
    ERG=A-B
    PRINT A;" - ";B;" = ?"
  ELSEIF OP=2 THEN
    A=INT(RND*10)
    B=INT(RND*10)
    ERG=A*B
    PRINT A;" * ";B;" = ?"
  ELSE
    ERG=INT(RND*10)+1
    B=INT(RND*10)+1
    A=ERG*B
    PRINT A;" / ";B;" = ?"
  ENDIF
END SUB