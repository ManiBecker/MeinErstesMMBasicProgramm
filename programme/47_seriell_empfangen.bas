REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 47_seriell_empfangen.bas
REM Titel: Kapitel 47: Serielle Kommunikation
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 08.09.2026
REM
REM Beschreibung:
REM
REM Empfaengt zeilenweise Text ueber COM1 und wertet einfache
REM Befehle aus. Die UART liefert einen Zeichenstrom. Deshalb werden
REM die empfangenen Zeichen zunaechst in puffer$ gesammelt, bis ein
REM LF-Zeichen (CHR$(10)) das Ende einer Nachricht kennzeichnet.
REM
REM PicoMite HDMI/USB:
REM   GP0 = COM1 TX
REM   GP1 = COM1 RX
REM   GP2 = digitaler Ausgang fuer das LED-Beispiel
REM
REM Verbindung zu einem zweiten PicoMite oder USB-UART-Adapter:
REM   GP0 (TX) -> RX
REM   GP1 (RX) -> TX
REM   GND      -> GND
REM
REM Serielle Einstellung: 9600 Baud, 8 Datenbits, keine Paritaet,
REM                       1 Stopbit
REM
REM Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
REM
REM ====================================================================

OPTION EXPLICIT

DIM puffer$ LENGTH 512
DIM text$ LENGTH 256
DIM pos AS INTEGER
DIM anzahl AS INTEGER

' COM1 konfigurieren und oeffnen.
SETPIN GP1, GP0, COM1
OPEN "COM1:9600, 512" AS #1

' GP2 dient als Ausgang fuer die Beispielbefehle LED:ON/LED:OFF.
SETPIN GP2, DOUT
PIN(GP2) = 0

PRINT "Kapitel 47: Serielle Kommunikation"
PRINT
PRINT "Serieller Empfaenger gestartet"
PRINT "COM1: GP0=TX, GP1=RX, 9600 Baud"
PRINT "Befehle: LED:ON, LED:OFF"
PRINT

DO
  ' LOC() liefert die Zahl der Zeichen, die bereits im
  ' Empfangspuffer von COM1 warten.
  anzahl = LOC(#1)

  IF anzahl > 0 THEN
    ' INPUT$() liest nur die momentan vorhandenen Zeichen und
    ' blockiert nicht, wenn keine weiteren Daten vorhanden sind.
    puffer$ = puffer$ + INPUT$(anzahl, #1)

    ' Es koennen bereits mehrere komplette Zeilen angekommen sein.
    DO
      pos = INSTR(puffer$, CHR$(10))
      IF pos = 0 THEN EXIT DO

      ' Nachricht bis vor LF herausloesen.
      text$ = LEFT$(puffer$, pos - 1)

      ' PRINT sendet normalerweise CR/LF. Das CR am Ende der
      ' Nachricht entfernen wir deshalb vor der Auswertung.
      IF LEN(text$) > 0 THEN
        IF RIGHT$(text$, 1) = CHR$(13) THEN
          text$ = LEFT$(text$, LEN(text$) - 1)
        ENDIF
      ENDIF

      ' Verarbeitete Nachricht aus dem Puffer entfernen.
      puffer$ = MID$(puffer$, pos + 1)

      PRINT "Empfangen: "; text$

      SELECT CASE text$
        CASE "LED:ON"
          PIN(GP2) = 1
          PRINT "LED-Ausgang GP2: EIN"
          PRINT #1, "OK:LED:ON"

        CASE "LED:OFF"
          PIN(GP2) = 0
          PRINT "LED-Ausgang GP2: AUS"
          PRINT #1, "OK:LED:OFF"

        CASE ELSE
          PRINT #1, "OK:" + text$
      END SELECT
    LOOP
  ENDIF
LOOP

' Das Programm laeuft absichtlich endlos. Bei einem regulaeren
' Programmende wuerde die Schnittstelle mit CLOSE #1 geschlossen. 
