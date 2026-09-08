REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 46_datum_uhrzeit.bas
REM Titel: Kapitel 46: Datum und Uhrzeit
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 08.09.2026
REM
REM Beschreibung:
REM   Das Beispiel zeigt DATE$, TIME$ und TIMER.
REM   Voraussetzung fuer korrekte Zeitangaben ist, dass Datum und Uhrzeit
REM   eingestellt wurden oder beim Start aus einer RTC uebernommen werden.
REM
REM Hardware/Voraussetzungen: keine/PicoMite/ColourMaxiMite
REM
REM ====================================================================

CLS

PRINT "Datum und Uhrzeit"
PRINT "-----------------"
PRINT
PRINT "Datum   : "; DATE$
PRINT "Uhrzeit : "; TIME$
PRINT

' TIMER kann fuer Zeitmessungen auf 0 gesetzt werden.
PRINT "Zeitmessung mit TIMER"
PRINT "Warte etwa zwei Sekunden ..."
TIMER = 0
PAUSE 2000
PRINT "Gemessene Zeit: "; TIMER; " ms"
PRINT

' Eine kleine Stoppuhr: Die Messung endet mit einem Tastendruck.
PRINT "Stoppuhr"
PRINT "Druecke eine beliebige Taste zum Starten."
DO
LOOP UNTIL INKEY$ <> ""

' Eventuell noch im Tastaturpuffer vorhandene Zeichen verwerfen.
DO WHILE INKEY$ <> ""
LOOP

PRINT "Stoppuhr laeuft - zum Stoppen Taste druecken."
TIMER = 0

DO
LOOP UNTIL INKEY$ <> ""

zeit = TIMER
sekunden = INT(zeit / 1000)
minuten = sekunden \ 60
rest = sekunden MOD 60

PRINT
PRINT "Gemessene Zeit: "; zeit; " ms"
PRINT "Das sind "; minuten; " Minuten und "; rest; " Sekunden."
PRINT

' Zum Abschluss wird eine laufende digitale Uhr angezeigt.
PRINT "Digitale Uhr"
PRINT "Zum Beenden eine Taste druecken."
PAUSE 1500

DO
  CLS
  PRINT "Digitale Uhr"
  PRINT
  PRINT DATE$
  PRINT TIME$
  PRINT
  PRINT "Beliebige Taste beendet das Programm."

  PAUSE 250
LOOP UNTIL INKEY$ <> ""

CLS
PRINT "Programm beendet." 
