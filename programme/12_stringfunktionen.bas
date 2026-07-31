REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 12_stringfunktionen.bas
REM Titel: Kapitel 12: Mit Texten arbeiten
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 27.07.2026
REM
REM Beschreibung: Texte in Variablen zu speichern
REM
REM Hardware/Voraussetzungen: keine
REM
REM ====================================================================

PRINT "2. Zahlen und Texte"
ALTER=60
PUNKTE=125

NAME$="Manfred"
ORT$="Schwetzingen"

PRINT "3. Wie lang darf ein Text sein?"
PRINT "Normale Zeichenketten koennen in MMBasic maximal 255 Zeichen enthalten."

PRINT "4. Texte ausgeben"
NAME$="Manfred"
PRINT NAME$

PRINT "5. Texte eingeben"
INPUT NAME$
PRINT "Hallo ";NAME$

PRINT "6. Texte verbinden"
VORNAME$="Manfred"
NACHNAME$="Becker"
PRINT VORNAME$;" ";NACHNAME$

PRINT "7. Die Laenge eines Textes bestimmen"
NAME$="Manfred"
PRINT LEN(NAME$)

PRINT "8. Das erste Zeichen ermitteln"
NAME$="Manfred"
PRINT LEFT$(NAME$,1)

PRINT "9. Mehrere Zeichen vom Anfang lesen"
NAME$="Manfred"
PRINT LEFT$(NAME$,3)

PRINT "10. Zeichen vom Ende lesen"
NAME$="Manfred"
PRINT RIGHT$(NAME$,3)

PRINT "11. Zeichen aus der Mitte lesen"
NAME$="Manfred"
PRINT MID$(NAME$,3,2)

PRINT "12. Gross- und Kleinbuchstaben"
NAME$="Manfred"
PRINT UCASE$(NAME$)

PRINT "NAME$="Manfred"
PRINT LCASE$(NAME$)

PRINT "13. Texte vergleichen"
INPUT ANTWORT$
IF ANTWORT$="JA" THEN
  PRINT "Richtig"
ENDIF

PRINT "14. Gross- und Kleinschreibung ignorieren"
INPUT ANTWORT$
IF UCASE$(ANTWORT$)="JA" THEN
  PRINT "Richtig"
ENDIF

PRINT "15. In einem Text suchen"
TEXT$="MMBasic macht Spass"
PRINT INSTR(TEXT$,"macht")

TEXT$="MMBasic macht Spass"
IF INSTR(TEXT$,"Basic")>0 THEN
  PRINT "Text gefunden"
ELSE
  PRINT "Text nicht gefunden"
ENDIF

PRINT "16. Zahlen und Texte umwandeln"
ZAHL=VAL("123")
PRINT ZAHL+1

TEXT$=STR$(123)
PRINT "Die Zahl lautet ";TEXT$

PRINT "17. Datum und Uhrzeit"
PRINT DATE$
PRINT TIME$
PRINT "Heute ist ";DATE$
PRINT "Es ist ";TIME$

PRINT "18. Begruessung abhaengig von der Uhrzeit"
STUNDE=VAL(LEFT$(TIME$,2))
IF STUNDE<12 THEN
  PRINT "Guten Morgen!"
ELSEIF STUNDE<18 THEN
  PRINT "Guten Tag!"
ELSE
  PRINT "Guten Abend!"
ENDIF

PRINT "19. Ein kleines Praxisprogramm"
INPUT NAME$
PRINT
PRINT "Hallo ";NAME$
PRINT
PRINT "Heute ist ";DATE$
PRINT "Aktuelle Uhrzeit: ";TIME$
PRINT
PRINT "Dein Name hat ";LEN(NAME$);" Zeichen."
PRINT "Er beginnt mit ";LEFT$(NAME$,1)
PRINT "Er endet mit ";RIGHT$(NAME$,1)
IF VAL(LEFT$(TIME$,2))<12 THEN
  PRINT "Guten Morgen!"
ELSEIF VAL(LEFT$(TIME$,2))<18 THEN
  PRINT "Guten Tag!"
ELSE
  PRINT "Guten Abend!"
ENDIF

PRINT "20. Experimentiere!"
PRINT "Probiere folgende Aenderungen aus:"
PRINT "- Gib die ersten drei Zeichen eines Namens aus."
PRINT "- Gib die letzten drei Zeichen aus."
PRINT "- Wandle einen Namen in Grossbuchstaben um."
PRINT "- Wandle einen Namen in Kleinbuchstaben um."
PRINT "- Suche nach einem Wort in einem Text."

PRINT "21. Probier’s selbst!"
PRINT "Versuche folgende Aufgaben:"
PRINT "1. Frage den Namen des Benutzers ab."
PRINT "2. Gib die Anzahl der Zeichen aus."
PRINT "3. Gib den ersten Buchstaben aus."
PRINT "4. Gib den letzten Buchstaben aus."
PRINT "5. Gib den Namen komplett in Grossbuchstaben aus."
PRINT "6. Suche nach einem bestimmten Wort in einem Satz."
PRINT "7. Gib Datum und Uhrzeit aus."
