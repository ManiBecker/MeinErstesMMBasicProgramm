Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 11_array_einfach.bas
Rem Titel: Kapitel 11: Arrays
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 27.07.2026
Rem
Rem Beschreibung: Umgang mit Arrays
Rem
Rem Hardware/Voraussetzungen: keine
Rem
Rem ====================================================================

Print "6. Arrays und FOR-Schleifen"
Dim VERSUCH(4)
For I=0 To 4
  Print "Gebe den";i+1;". von 5 Zahlenwerten ein";
  Input VERSUCH(I)
Next I

Print "Press any key...": Do : Loop While Inkey$=""

Print "7. Alle Werte ausgeben"
For I=0 To 4
  Print VERSUCH(I)
Next I

Print "Press any key...": Do : Loop While Inkey$=""

Print "8. Den Durchschnitt berechnen"
SUMME=0
For I=0 To 4
  SUMME=SUMME+VERSUCH(I)
Next I
Print
Print "Durchschnitt:"
Print SUMME/5

Print "Press any key...": Do : Loop While Inkey$=""

Print "9a. Den kleinsten Wert finden"
KLEIN=VERSUCH(0)
For I=1 To 4
  If VERSUCH(I)<KLEIN Then
    KLEIN=VERSUCH(I)
  EndIf
Next I
Print
Print "Kleinster Wert:";KLEIN

Print "Press any key...": Do : Loop While Inkey$=""

Print "9b. Den groessten Wert finden"
GROSS=VERSUCH(0)
For I=1 To 4
  If VERSUCH(I)>GROSS Then
    GROSS=VERSUCH(I)
  EndIf
Next I
Print
Print "Groesster Wert:";GROSS

Print "Press any key...": Do : Loop While Inkey$=""

Print "10. Arrays initialisieren"
Dim NAME$(2)=("Manfred","Geoff","Peter")
Print NAME$(0)
Print NAME$(1)
Print NAME$(2)

Print "Press any key...": Do : Loop While Inkey$=""

Print "11. Textarrays"
Dim SPIELER$(4)
SPIELER$(0)="Manfred"
SPIELER$(1)="Geoff"
SPIELER$(2)="Peter"
SPIELER$(3)="Tom"
SPIELER$(4)="Sarah"
For I=0 To 4
  Print SPIELER$(I)
Next I

Print "Press any key...": Do : Loop While Inkey$=""

Print "12. Wuerfelergebnisse speichern"
Dim WURF(9)
For I=0 To 9
  WURF(I)=Int(Rnd*6)+1
Next I
For I=0 To 9
  Print WURF(I)
Next I

Print "Press any key...": Do : Loop While Inkey$=""

Print "13. Eine Wertetabelle speichern"
Dim Y(10)
For X=0 To 10
  Y(X)=0.5*X^2+X+0.5
Next X
For X=0 To 10
  Print X;" ";Y(X)
Next X

Print "Press any key...": Do : Loop While Inkey$=""

Print "14. Mehrdimensionale Arrays"
Dim SCHUELER$(4)
SCHUELER$(0)="Anna"
SCHUELER$(1)="Ben"
SCHUELER$(2)="Clara"
SCHUELER$(3)="David"
SCHUELER$(4)="Emma"

Dim FACH$(2)
FACH$(0)="Deutsch"
FACH$(1)="Englisch"
FACH$(2)="Mathe"

Dim NOTE(4,2)

' Zufaellige Noten vergeben
For S=0 To 4
  For F=0 To 2
    NOTE(S,F)=Int(Rnd*6)+1
  Next F
Next S

' Tabelle ausgeben
Print "Schueler";
For F=0 To 2
  Print Tab(12+F*10);FACH$(F);
Next F
Print

For S=0 To 4
  Print SCHUELER$(S);
  For F=0 To 2
    Print Tab(12+F*10);NOTE(S,F);
  Next F
  Print
Next S

Print "Press any key...": Do : Loop While Inkey$=""

Print "15. Experimentiere!"
Print
Print "Probiere folgende Aenderungen aus:"
Print "- Speichere zehn Wuerfelergebnisse."
Print "- Speichere die Punkte von zehn Spielern."
Print "- Berechne einen Durchschnitt."
Print "- Vergroessere ein Array."

Print "Press any key...": Do : Loop While Inkey$=""

Print "16. Probier's selbst!"
Print
Print "Versuche folgende Aufgaben:"
Print "1. Speichere die Alter von fuenf Personen."
Print "2. Gib alle Werte mit einer FOR-Schleife aus."
Print "3. Berechne die Summe aller Werte."
Print "4. Ermittle den groessten Wert."
Print "5. Speichere fuenf Namen in einem Textarray."
Print
Print "Ready..."
