Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 12_hangman.bas
Rem Titel: Kapitel 12: Mit Texten arbeiten
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 21.09.2026
Rem
Rem Beschreibung:
Rem Einfaches textbasiertes Hangman-Spiel.
Rem Demonstriert die praktische Verarbeitung von Zeichenketten mit
Rem LEN(), MID$(), INSTR(), UCASE$() und LEFT$().
Rem Bereits geratene Buchstaben werden in einer Zeichenkette gespeichert.
Rem
Rem Hardware/Voraussetzungen: keine
Rem
Rem ====================================================================

CONST TRUE=1
CONST FALSE=0

WORT$="MMBASIC"
GERATEN$=""
FEHLER=0
MAXFEHLER=8

DO

  PRINT

  ' Wort anzeigen
  FERTIG=TRUE

  FOR I=1 TO LEN(WORT$)

    BUCHSTABE$=MID$(WORT$,I,1)

    IF INSTR(GERATEN$,BUCHSTABE$)>0 THEN
      PRINT BUCHSTABE$;" ";
    ELSE
      PRINT "_ ";
      FERTIG=FALSE
    ENDIF

  NEXT I

  PRINT
  PRINT

  ' Wurde das ganze Wort erraten?
  IF FERTIG=TRUE THEN

    PRINT "Geschafft!"
    PRINT "Du hast das Wort ";WORT$;" erraten."

  ELSE

    PRINT "Fehlversuche: ";FEHLER;" von ";MAXFEHLER
    INPUT "Buchstabe"; EINGABE$

    EINGABE$=UCASE$(EINGABE$)

    ' Nur das erste eingegebene Zeichen verwenden
    EINGABE$=LEFT$(EINGABE$,1)

    IF INSTR(GERATEN$,EINGABE$)>0 THEN

      PRINT "Diesen Buchstaben hast du bereits versucht."

    ELSE

      GERATEN$=GERATEN$+EINGABE$

      IF INSTR(WORT$,EINGABE$)=0 THEN
        FEHLER=FEHLER+1
        PRINT "Leider falsch!"
      ENDIF

    ENDIF

  ENDIF

LOOP UNTIL FERTIG=TRUE OR FEHLER=MAXFEHLER

PRINT

IF FERTIG=FALSE THEN
  PRINT "Leider verloren!"
  PRINT "Das gesuchte Wort war ";WORT$;"."
ENDIF
