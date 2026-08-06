Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 12_stringfunktionen.bas
Rem Titel: Kapitel 12: Mit Texten arbeiten
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 27.07.2026
Rem
Rem Beschreibung: Texte in Variablen zu speichern
Rem
Rem Hardware/Voraussetzungen: keine
Rem
Rem ====================================================================

Print "2. Zahlen und Texte"
Print "ALTER=60":ALTER=60
Print "PUNKTE=125":PUNKTE=125

Print "NAME$=""Manfred""":NAME$="Manfred"
Print "ORT$=""Sinsheim""":ORT$="Sinsheim"

Print "Press any key...": Do : Loop While Inkey$=""

Print "3. Wie lang darf ein Text sein?"
Print "Normale Zeichenketten koennen in MMBasic maximal 255 Zeichen enthalten."

Print "Press any key...": Do : Loop While Inkey$=""

Print "4. Texte ausgeben"
NAME$="Manfred"
Print NAME$

Print "Press any key...": Do : Loop While Inkey$=""

Print "5. Texte eingeben"
Input "Gebe deinen Namen ein:",NAME$
Print "Hallo ";NAME$

Print "Press any key...": Do : Loop While Inkey$=""

Print "6. Texte verbinden"
VORNAME$="Manfred"
NACHNAME$="Becker"
Print VORNAME$;" ";NACHNAME$

Print "Press any key...": Do : Loop While Inkey$=""

Print "7. Die Laenge eines Textes bestimmen"
NAME$="Manfred"
Print Len(NAME$)

Print "Press any key...": Do : Loop While Inkey$=""

Print "8. Das erste Zeichen ermitteln"
NAME$="Manfred"
Print Left$(NAME$,1)

Print "Press any key...": Do : Loop While Inkey$=""

Print "9. Mehrere Zeichen vom Anfang lesen"
NAME$="Manfred"
Print Left$(NAME$,3)

Print "Press any key...": Do : Loop While Inkey$=""

Print "10. Zeichen vom Ende lesen"
NAME$="Manfred"
Print Right$(NAME$,3)

Print "Press any key...": Do : Loop While Inkey$=""

Print "11. Zeichen aus der Mitte lesen"
NAME$="Manfred"
Print Mid$(NAME$,3,2)

Print "Press any key...": Do : Loop While Inkey$=""

Print "12. Gross- und Kleinbuchstaben"
NAME$="Manfred"
Print UCase$(NAME$)

Print "NAME$=""Manfred"""
Print LCase$(NAME$)

Print "Press any key...": Do : Loop While Inkey$=""

Print "13. Texte vergleichen"
Input "Ja oder Nein?",ANTWORT$
If ANTWORT$="JA" Then
  Print "Richtig"
EndIf

Print "Press any key...": Do : Loop While Inkey$=""

Print "14. Gross- und Kleinschreibung ignorieren"
Input "Ja oder Nein?",ANTWORT$
If UCase$(ANTWORT$)="JA" Then
  Print "Richtig"
EndIf

Print "Press any key...": Do : Loop While Inkey$=""

Print "15. In einem Text suchen"
Textausgabe$="MMBasic macht Spass"
Print Instr(Textausgabe$,"macht")

Textausgabe$="MMBasic macht Spass"
If Instr(Textausgabe$,"Basic")>0 Then
  Print "Text gefunden"
Else
  Print "Text nicht gefunden"
EndIf

Print "Press any key...": Do : Loop While Inkey$=""

Print "16. Zahlen und Texte umwandeln"
ZAHL=Val("123")
Print ZAHL+1

Textausgabe$=Str$(123)
Print "Die Zahl lautet ";Textausgabe$

Print "17. Datum und Uhrzeit"
Print Date$
Print Time$
Print "Heute ist ";Date$
Print "Es ist ";Time$

Print "Press any key...": Do : Loop While Inkey$=""

Print "18. Begruessung abhaengig von der Uhrzeit"
STUNDE=Val(Left$(Time$,2))
If STUNDE<12 Then
  Print "Guten Morgen!"
ElseIf STUNDE<18 Then
  Print "Guten Tag!"
Else
  Print "Guten Abend!"
EndIf

Print "Press any key...": Do : Loop While Inkey$=""

Print "19. Ein kleines Praxisprogramm"
Do
  Input "Dein Name eingeben:",NAME$
Loop While name$=""
Print
Print "Hallo ";NAME$
Print
Print "Heute ist ";Date$
Print "Aktuelle Uhrzeit: ";Time$
Print
Print "Dein Name hat ";Len(NAME$);" Zeichen."
Print "Er beginnt mit ";Left$(NAME$,1)
Print "Er endet mit ";Right$(NAME$,1)
If Val(Left$(Time$,2))<12 Then
  Print "Guten Morgen!"
ElseIf Val(Left$(Time$,2))<18 Then
  Print "Guten Tag!"
Else
  Print "Guten Abend!"
EndIf

Print "Press any key...": Do : Loop While Inkey$=""

Print "20. Experimentiere!"
Print "Probiere folgende Aenderungen aus:"
Print "- Gib die ersten drei Zeichen eines Namens aus."
Print "- Gib die letzten drei Zeichen aus."
Print "- Wandle einen Namen in Grossbuchstaben um."
Print "- Wandle einen Namen in Kleinbuchstaben um."
Print "- Suche nach einem Wort in einem Text."

Print "Press any key...": Do : Loop While Inkey$=""

Print "21. Probier's selbst!"
Print "Versuche folgende Aufgaben:"
Print "1. Frage den Namen des Benutzers ab."
Print "2. Gib die Anzahl der Zeichen aus."
Print "3. Gib den ersten Buchstaben aus."
Print "4. Gib den letzten Buchstaben aus."
Print "5. Gib den Namen komplett in Grossbuchstaben aus."
Print "6. Suche nach einem bestimmten Wort in einem Satz."
Print "7. Gib Datum und Uhrzeit aus."
Print
Print "Ready..."
