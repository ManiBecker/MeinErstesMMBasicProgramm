REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 38_editor_test.bas
REM Titel: Kapitel 38: Der eingebaute Editor
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 03.09.2026
REM
REM Beschreibung:
REM
REM Dieses kleine Programm eignet sich zum Ausprobieren
REM der Editorfunktionen des PicoMite.
REM
REM Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
REM
REM ====================================================================

Option Explicit

Dim Integer i
Dim String name$

Cls

Print "Kapitel 38: Der eingebaute Editor"
Print
Print "MMBasic Editor-Test"
Print "=================="
Print

Input "Wie heisst du"; name$
Print

For i = 1 To 3
  Print "Hallo "; name$; "! Willkommen beim PicoMite."
Next i

Print
Print "Jetzt testen wir eine kleine Verzweigung."

If Len(name$) > 5 Then
  Print "Dein Name hat mehr als fuenf Zeichen."
Else
  Print "Dein Name hat hoechstens fuenf Zeichen."
EndIf

Print
ZeigeHinweise

Print
Print "Programm beendet."
End

Sub ZeigeHinweise
  Print "Editor-Uebungen:"
  Print "1. Suche mit F3 nach PicoMite."
  Print "2. Springe mit F6 zur naechsten Fundstelle."
  Print "3. Ersetze PicoMite mit F7, z.B. durch MMBasic."
  Print "4. Markiere Text mit F4 und kopiere ihn mit F5."
  Print "5. Fuege den Text mit F5 wieder ein."
  Print "6. Veraendere die Einrueckung und druecke F12."
End Sub 
