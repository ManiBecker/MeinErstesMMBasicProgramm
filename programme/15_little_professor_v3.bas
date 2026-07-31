REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 15_little_professor_v3.bas
REM Titel: Kapitel 15: Little Professor Version 3
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 27.07.2026
REM
REM Beschreibung:
REM
REM Hardware/Voraussetzungen: keine/PicoMite/ColourMaxiMite
REM
REM ====================================================================

RUNDE=1

PRINT "3. Die Aufgaben speichern"
DIM AUFGABE$(9)
DIM LOESUNG(9)
DIM EINGABE(9)
DIM TYP(9)

PRINT "4. Die Arrays fuellen"
AUFGABE$(RUNDE-1)=TEXT$
LOESUNG(RUNDE-1)=ERG
EINGABE(RUNDE-1)=ANTWORT
TYP(RUNDE-1)=OP

PRINT "5. Eine Aufgabe als Text speichern"
TEXT$=STR$(A)+" + "+STR$(B)
TEXT$=STR$(A)+" * "+STR$(B)

PRINT "6. Das komplette Programm"
PRINT "Findest du in 15_little_professor_v3_final.bas"

INPUT "Wie heisst du ";NAME$
DIM AUFGABE$(9)
DIM LOESUNG(9)
DIM EINGABE(9)
DIM TYP(9)
PUNKTE=0
FOR RUNDE=1 TO 10
  NeueAufgabe
  PRINT
  PRINT "Aufgabe ";RUNDE
  PRINT TEXT$;" = ?"
  INPUT ANTWORT
  AUFGABE$(RUNDE-1)=TEXT$
  LOESUNG(RUNDE-1)=ERG
  EINGABE(RUNDE-1)=ANTWORT
  TYP(RUNDE-1)=OP
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
PRINT
PRINT "Auswertung"
PRINT "-----------"
FOR I=0 TO 9
  IF EINGABE(I)=LOESUNG(I) THEN
    PRINT AUFGABE$(I);" = ";LOESUNG(I);"  OK"
  ELSE
    PRINT AUFGABE$(I);" = ";LOESUNG(I)
    PRINT "Deine Antwort: ";EINGABE(I)
  ENDIF
NEXT I
SUB NeueAufgabe
  OP=INT(RND*4)
  IF OP=0 THEN
    A=INT(RND*10)
    B=INT(RND*10)
    ERG=A+B
    TEXT$=STR$(A)+" + "+STR$(B)
  ELSEIF OP=1 THEN
    A=INT(RND*10)+10
    B=INT(RND*10)
    ERG=A-B
    TEXT$=STR$(A)+" - "+STR$(B)
  ELSEIF OP=2 THEN
    A=INT(RND*10)
    B=INT(RND*10)
    ERG=A*B
    TEXT$=STR$(A)+" * "+STR$(B)
  ELSE
    ERG=INT(RND*10)+1
    B=INT(RND*10)+1
    A=ERG*B
    TEXT$=STR$(A)+" / "+STR$(B)
  ENDIF
END SUB

PRINT "9. Fehler nach Rechenart zaehlen"
ADD=0
SUB=0
MUL=0
DIV=0
FOR I=0 TO 9
  IF EINGABE(I)<>LOESUNG(I) THEN
    IF TYP(I)=0 THEN ADD=ADD+1
    IF TYP(I)=1 THEN SUB=SUB+1
    IF TYP(I)=2 THEN MUL=MUL+1
    IF TYP(I)=3 THEN DIV=DIV+1
  ENDIF
NEXT I

PRINT
PRINT "Fehlerstatistik"
PRINT "Additionen:      ";ADD
PRINT "Subtraktionen:   ";SUB
PRINT "Multiplikation:  ";MUL
PRINT "Divisionen:      ";DIV

PRINT "11. Experimentiere!"
PRINT "Probiere folgende Aenderungen aus:"
PRINT "- Erhoehe die Anzahl der Aufgaben auf 20."
PRINT "- Speichere zusaetzlich die benoetigte Zeit."
PRINT "- Gib nur die falsch beantworteten Aufgaben aus."
PRINT "- Zaehle richtige Antworten je Rechenart."

PRINT "12. Probier’s selbst!"
PRINT "Versuche folgende Aufgaben:"
PRINT "1. Speichere den Namen des Spielers."
PRINT "2. Gib die erreichte Prozentzahl aus."
PRINT "3. Zeige nur die falschen Antworten an."
PRINT "4. Ermittle die schwierigste Rechenart."
PRINT "5. Vergib eine Schulnote."