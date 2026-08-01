REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 11_array_einfach.bas
REM Titel: Kapitel 11: Arrays
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 27.07.2026
REM
REM Beschreibung: Umgang mit Arrays
REM
REM Hardware/Voraussetzungen: keine
REM
REM ====================================================================

PRINT "6. Arrays und FOR-Schleifen"
DIM VERSUCH(4)
FOR I=0 TO 4
  INPUT VERSUCH(I)
NEXT I

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "7. Alle Werte ausgeben"
FOR I=0 TO 4
  PRINT VERSUCH(I)
NEXT I

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "8. Den Durchschnitt berechnen"
DIM VERSUCH(4)
SUMME=0
FOR I=0 TO 4
  INPUT VERSUCH(I)
  SUMME=SUMME+VERSUCH(I)
NEXT I
PRINT
PRINT "Durchschnitt:"
PRINT SUMME/5

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "9. Den besten Spieler finden"
DIM VERSUCH(4)
FOR I=0 TO 4
  INPUT VERSUCH(I)
NEXT I
BEST=VERSUCH(0)
FOR I=1 TO 4
  IF VERSUCH(I)<BEST THEN
  BEST=VERSUCH(I)
  ENDIF
NEXT I
PRINT
PRINT "Bester Spieler:"
PRINT BEST;" Versuche"

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "10. Arrays initialisieren"
DIM NAME$(2)=("Manfred","Geoff","Peter")
PRINT NAME$(0)
PRINT NAME$(1)
PRINT NAME$(2)

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "11. Textarrays"
DIM SPIELER$(4)
SPIELER$(0)="Manfred"
SPIELER$(1)="Geoff"
SPIELER$(2)="Peter"
SPIELER$(3)="Tom"
SPIELER$(4)="Sarah"
FOR I=0 TO 4
  PRINT SPIELER$(I)
NEXT I

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "12. Wuerfelergebnisse speichern"
DIM WURF(9)
FOR I=0 TO 9
  WURF(I)=INT(RND*6)+1
NEXT I
FOR I=0 TO 9
  PRINT WURF(I)
NEXT I

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "13. Eine Wertetabelle speichern"
DIM Y(10)
FOR X=0 TO 10
  Y(X)=0.5*X^2+X+0.5
NEXT X
FOR X=0 TO 10
  PRINT X;" ";Y(X)
NEXT X

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "14. Mehrdimensionale Arrays"
DIM SCHUELER$(4)
SCHUELER$(0)="Anna"
SCHUELER$(1)="Ben"
SCHUELER$(2)="Clara"
SCHUELER$(3)="David"
SCHUELER$(4)="Emma"

DIM FACH$(2)
FACH$(0)="Deutsch"
FACH$(1)="Englisch"
FACH$(2)="Mathe"

DIM NOTE(4,2)

' Zufaellige Noten vergeben
FOR S=0 TO 4
  FOR F=0 TO 2
    NOTE(S,F)=INT(RND*6)+1
  NEXT F
NEXT S

' Tabelle ausgeben
PRINT "Schueler",
FOR F=0 TO 2
  PRINT FACH$(F),
NEXT F
PRINT

FOR S=0 TO 4
  PRINT SCHUELER$(S),
  FOR F=0 TO 2
    PRINT NOTE(S,F),
  NEXT F
  PRINT
NEXT S

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "15. Experimentiere!"
PRINT "Probiere folgende Aenderungen aus:"
PRINT "- Speichere zehn Wuerfelergebnisse."
PRINT "- Speichere die Punkte von zehn Spielern."
PRINT "- Berechne einen Durchschnitt."
PRINT "- Vergroessere ein Array."

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "16. Probier’s selbst!"
PRINT "Versuche folgende Aufgaben:"
PRINT "1. Speichere die Alter von fuenf Personen."
PRINT "2. Gib alle Werte mit einer FOR-Schleife aus."
PRINT "3. Berechne die Summe aller Werte."
PRINT "4. Ermittle den groessten Wert."
PRINT "5. Speichere fuenf Namen in einem Textarray."

