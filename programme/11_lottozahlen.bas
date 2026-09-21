Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 11_lottozahlen.bas
Rem Titel: Kapitel 11: Arrays
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 21.09.2026
Rem
Rem Beschreibung:
Rem Ziehung von sechs verschiedenen Lottozahlen und einer Zusatzzahl.
Rem Ein Array merkt sich, welche Zahlen bereits gezogen wurden.
Rem Die Lottozahlen werden anschließend sortiert ausgegeben.
Rem Die Ziehung kann beliebig oft wiederholt werden.
Rem
Rem Hardware/Voraussetzungen: keine
Rem
Rem ====================================================================

CONST TRUE=1
CONST FALSE=0

DIM GEZOGEN(49)

DO

  ' Array fuer eine neue Ziehung loeschen
  FOR ZAHL=1 TO 49
    GEZOGEN(ZAHL)=FALSE
  NEXT ZAHL

  ' Sechs verschiedene Lottozahlen ziehen
  FOR I=1 TO 6

    DO
      ZAHL=INT(RND*49)+1
    LOOP WHILE GEZOGEN(ZAHL)=TRUE

    GEZOGEN(ZAHL)=TRUE

  NEXT I

  ' Zusatzzahl ziehen
  DO
    ZUSATZZAHL=INT(RND*49)+1
  LOOP WHILE GEZOGEN(ZUSATZZAHL)=TRUE

  ' Lottozahlen sortiert ausgeben
  PRINT "Ziehung der Lottozahlen: ";

  ERSTE=TRUE

  FOR ZAHL=1 TO 49

    IF GEZOGEN(ZAHL)=TRUE THEN

      IF ERSTE=FALSE THEN PRINT ", ";

      PRINT ZAHL;
      ERSTE=FALSE

    ENDIF

  NEXT ZAHL

  PRINT ". Zusatzzahl: ";ZUSATZZAHL

  ' Weitere Ziehung?
  INPUT "Noch einmal ziehen (J/N)"; NOCHMAL$

LOOP WHILE UCASE$(NOCHMAL$)="J"
