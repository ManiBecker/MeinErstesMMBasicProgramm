REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 47_seriell_senden.bas
REM Titel: Kapitel 47: Serielle Kommunikation
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 23.09.2026
REM
REM Beschreibung:
REM Sendet Textzeilen ueber COM1. Jede Eingabe wird mit PRINT #1
REM ueber die serielle Schnittstelle ausgegeben.
REM
REM PicoMite HDMI/USB:
REM   GP0 = COM1 TX
REM   GP1 = COM1 RX
REM
REM Serielle Einstellung: 9600 Baud, 8 Datenbits, keine Paritaet,
REM                       1 Stopbit
REM
REM Beenden mit einer leeren Eingabe.
REM
REM Hardware/Voraussetzungen:
REM Zweiter PicoMite oder USB-UART-Adapter
REM ====================================================================

OPTION EXPLICIT

DIM text$

' COM1 konfigurieren und oeffnen.
SETPIN GP0, GP1, COM1
OPEN "COM1:9600" AS #1

PRINT "Kapitel 47: Serielle Kommunikation"
PRINT
PRINT "Serielles Sendeprogramm"
PRINT "COM1: GP0=TX, GP1=RX, 9600 Baud"
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
