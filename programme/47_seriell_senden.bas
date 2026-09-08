REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 47_seriell_senden.bas
REM Titel: Kapitel 47: Serielle Kommunikation
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 08.09.2026
REM
REM Beschreibung:
REM
REM PicoMite / PicoMite HDMI/USB
REM COM1:
REM   TX = GP0
REM   RX = GP1
REM   9600 Baud, 8 Datenbits, keine Paritaet, 1 Stopbit
REM
REM Das Programm sendet Textzeilen ueber die serielle Schnittstelle.
REM Jede Eingabe wird mit PRINT #1 ueber COM1 ausgegeben.
REM
REM Beenden mit einer leeren Eingabe.
REM
REM Hardware/Voraussetzungen: keine/PicoMite/ColourMaxiMite
REM
REM ====================================================================

OPTION EXPLICIT

DIM text$

' COM1-Pins zuweisen.
' GP0 ist ein gueltiger COM1-TX-Pin.
' GP1 ist ein gueltiger COM1-RX-Pin.
SETPIN GP0, GP1, COM1

' Serielle Schnittstelle mit 9600 Baud oeffnen.
OPEN "COM1:9600" AS #1

PRINT "Serielles Sendeprogramm"
PRINT "COM1: 9600 Baud"
PRINT "TX = GP0, RX = GP1"
PRINT
PRINT "Text eingeben und mit ENTER senden."
PRINT "Leere Eingabe beendet das Programm."
PRINT

DO
  INPUT "Senden: ", text$

  IF text$ = "" THEN EXIT DO

  ' PRINT sendet die Zeichen plus Zeilenende.
  PRINT #1, text$

  PRINT "Gesendet: "; text$
LOOP

' CLOSE wartet darauf, dass der Sendepuffer geleert wurde
' und gibt danach die Schnittstelle wieder frei.
CLOSE #1

PRINT
PRINT "COM1 geschlossen."
PRINT "Programm beendet." 
