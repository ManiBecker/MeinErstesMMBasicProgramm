Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 16_geburtstagskalender.bas
Rem Titel: Kapitel 16: Geburtstagskalender
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 21.09.2026
Rem
Rem Beschreibung:
Rem Ein kleiner Geburtstagskalender zur Demonstration der Dateiverarbeitung.
Rem Geburtstage können gespeichert, angezeigt und gelöscht werden.
Rem Beim Programmstart und im Menü werden heutige Geburtstage angezeigt.
Rem Die Daten werden dauerhaft in einer Textdatei gespeichert.
Rem
Rem Hardware/Voraussetzungen: keine
Rem ====================================================================

CONST TRUE=1
CONST FALSE=0

DATEI$="geburtstage.txt"
TEMPDATEI$="geburtstage.tmp"

' Datendatei beim ersten Programmstart anlegen
IF MM.INFO(EXISTS FILE DATEI$)=FALSE THEN
  OPEN DATEI$ FOR OUTPUT AS #1
  CLOSE #1
ENDIF

DO

  CLS

  PRINT "GEBURTSTAGSKALENDER"
  PRINT "==================="
  PRINT

  GeburtstageHeute

  PRINT "1 - Geburtstag eintragen"
  PRINT "2 - Geburtstage anzeigen"
  PRINT "3 - Geburtstag loeschen"
  PRINT "4 - Beenden"
  PRINT

  INPUT "Auswahl"; AUSWAHL

  SELECT CASE AUSWAHL

    CASE 1
      GeburtstagEintragen

    CASE 2
      GeburtstageAnzeigen

    CASE 3
      GeburtstagLoeschen

    CASE 4
      PRINT
      PRINT "Auf Wiedersehen!"

    CASE ELSE
      PRINT
      PRINT "Ungueltige Auswahl."
      PRINT
      INPUT "Weiter mit ENTER"; DUMMY$

  END SELECT

LOOP UNTIL AUSWAHL=4

END


' --------------------------------------------------------------------
' Neuen Geburtstag eintragen
' --------------------------------------------------------------------

SUB GeburtstagEintragen

  LOCAL NAME$
  LOCAL TAG
  LOCAL MONAT
  LOCAL JAHR
  LOCAL DUMMY$

  CLS

  PRINT "GEBURTSTAG EINTRAGEN"
  PRINT "===================="
  PRINT

  INPUT "Name"; NAME$
  INPUT "Tag"; TAG
  INPUT "Monat"; MONAT
  INPUT "Jahr"; JAHR

  OPEN DATEI$ FOR APPEND AS #1

  PRINT #1,NAME$;";";TAG;";";MONAT;";";JAHR

  CLOSE #1

  PRINT
  PRINT "Geburtstag gespeichert."
  PRINT
  INPUT "Weiter mit ENTER"; DUMMY$

END SUB


' --------------------------------------------------------------------
' Alle Geburtstage anzeigen
' --------------------------------------------------------------------

SUB GeburtstageAnzeigen

  LOCAL ZEILE$
  LOCAL NAME$
  LOCAL NR
  LOCAL TAG
  LOCAL MONAT
  LOCAL JAHR
  LOCAL DUMMY$

  CLS

  PRINT "GESPEICHERTE GEBURTSTAGE"
  PRINT "========================"
  PRINT

  NR=0

  OPEN DATEI$ FOR INPUT AS #1

  DO WHILE NOT EOF(#1)

    LINE INPUT #1,ZEILE$

    NR=NR+1

    DatensatzLesen ZEILE$,NAME$,TAG,MONAT,JAHR

    PRINT NR;"  ";
    PRINT NAME$;"  ";
    PRINT FORMAT$(TAG,"%02g");".";
    PRINT FORMAT$(MONAT,"%02g");".";
    PRINT FORMAT$(JAHR,"%04g")

  LOOP

  CLOSE #1

  IF NR=0 THEN
    PRINT "Keine Geburtstage gespeichert."
  ENDIF

  PRINT
  INPUT "Weiter mit ENTER"; DUMMY$

END SUB


' --------------------------------------------------------------------
' Einen Geburtstag loeschen
' --------------------------------------------------------------------

SUB GeburtstagLoeschen

  LOCAL ZEILE$
  LOCAL NAME$
  LOCAL NR
  LOCAL TAG
  LOCAL MONAT
  LOCAL JAHR
  LOCAL LOESCHEN
  LOCAL DUMMY$

  CLS

  PRINT "GEBURTSTAG LOESCHEN"
  PRINT "==================="
  PRINT

  NR=0

  OPEN DATEI$ FOR INPUT AS #1

  DO WHILE NOT EOF(#1)

    LINE INPUT #1,ZEILE$

    NR=NR+1

    DatensatzLesen ZEILE$,NAME$,TAG,MONAT,JAHR

    PRINT NR;"  ";
    PRINT NAME$;"  ";
    PRINT FORMAT$(TAG,"%02g");".";
    PRINT FORMAT$(MONAT,"%02g");".";
    PRINT FORMAT$(JAHR,"%04g")

  LOOP

  CLOSE #1

  IF NR=0 THEN

    PRINT "Keine Geburtstage gespeichert."

  ELSE

    PRINT
    INPUT "Welcher Eintrag soll geloescht werden"; LOESCHEN

    IF LOESCHEN<1 OR LOESCHEN>NR THEN

      PRINT
      PRINT "Ungueltige Nummer."

    ELSE

      OPEN DATEI$ FOR INPUT AS #1
      OPEN TEMPDATEI$ FOR OUTPUT AS #2

      NR=0

      DO WHILE NOT EOF(#1)

        LINE INPUT #1,ZEILE$

        NR=NR+1

        IF NR<>LOESCHEN THEN
          PRINT #2,ZEILE$
        ENDIF

      LOOP

      CLOSE #1
      CLOSE #2

      KILL DATEI$
      RENAME TEMPDATEI$ AS DATEI$

      PRINT
      PRINT "Eintrag geloescht."

    ENDIF

  ENDIF

  PRINT
  INPUT "Weiter mit ENTER"; DUMMY$

END SUB


' --------------------------------------------------------------------
' Heutige Geburtstage anzeigen
' --------------------------------------------------------------------

SUB GeburtstageHeute

  LOCAL ZEILE$
  LOCAL NAME$
  LOCAL TAG
  LOCAL MONAT
  LOCAL JAHR
  LOCAL HEUTETAG
  LOCAL HEUTEMONAT
  LOCAL HEUTEJAHR
  LOCAL ALTER
  LOCAL GEFUNDEN

  ' Aktuelles Datum zerlegen
  HEUTETAG=VAL(LEFT$(DATE$,2))
  HEUTEMONAT=VAL(MID$(DATE$,4,2))
  HEUTEJAHR=VAL(RIGHT$(DATE$,4))

  GEFUNDEN=FALSE

  OPEN DATEI$ FOR INPUT AS #1

  DO WHILE NOT EOF(#1)

    LINE INPUT #1,ZEILE$

    DatensatzLesen ZEILE$,NAME$,TAG,MONAT,JAHR

    IF TAG=HEUTETAG AND MONAT=HEUTEMONAT THEN

      IF GEFUNDEN=FALSE THEN
        PRINT "HEUTE HAT GEBURTSTAG"
        PRINT "--------------------"
        GEFUNDEN=TRUE
      ENDIF

      ALTER=HEUTEJAHR-JAHR

      PRINT
      PRINT NAME$;" wird heute ";ALTER;" Jahre alt."

    ENDIF

  LOOP

  CLOSE #1

  IF GEFUNDEN=TRUE THEN
    PRINT
    PRINT "Alles Gute zum Geburtstag!"
    PRINT
  ENDIF

END SUB


' --------------------------------------------------------------------
' Einen Datensatz zerlegen
'
' Format:
' Name;Tag;Monat;Jahr
'
' Beispiel:
' Manfred;27;7;1966
' --------------------------------------------------------------------

SUB DatensatzLesen(ZEILE$,NAME$,TAG,MONAT,JAHR)

  LOCAL P1
  LOCAL P2
  LOCAL P3
  LOCAL REST$

  ' Name abtrennen
  P1=INSTR(ZEILE$,";")

  NAME$=LEFT$(ZEILE$,P1-1)
  REST$=MID$(ZEILE$,P1+1)

  ' Tag abtrennen
  P2=INSTR(REST$,";")

  TAG=VAL(LEFT$(REST$,P2-1))
  REST$=MID$(REST$,P2+1)

  ' Monat abtrennen
  P3=INSTR(REST$,";")

  MONAT=VAL(LEFT$(REST$,P3-1))
  JAHR=VAL(MID$(REST$,P3+1))

END SUB
