REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 47_seriell_empfangen.bas
REM Titel: Kapitel 47: Serielle Kommunikation
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 23.09.2026
REM
REM Beschreibung:
REM Empfaengt zeilenweise Text ueber COM1 und wertet einfache Befehle aus.
REM Die UART liefert einen Zeichenstrom. Deshalb werden die Zeichen in
REM puffer$ gesammelt, bis LF (CHR$(10)) eine Nachricht beendet.
REM
REM Normale Strings sind auf 255 Zeichen begrenzt. Deshalb liest dieses
REM Beispiel immer nur so viele Zeichen ein, wie noch in puffer$ passen.
REM Fuer groessere Datenmengen siehe 47_longstring_empfangen.bas.
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
REM Hardware/Voraussetzungen:
REM Zweiter PicoMite oder USB-UART-Adapter
REM ====================================================================

OPTION EXPLICIT

DIM puffer$
DIM text$
DIM pos AS INTEGER
DIM anzahl AS INTEGER
DIM frei AS INTEGER

' COM1 konfigurieren und oeffnen.
SETPIN GP0, GP1, COM1
OPEN "COM1:9600,512" AS #1

' GP2 dient als Ausgang fuer LED:ON und LED:OFF.
SETPIN GP2, DOUT
PIN(GP2)=0

PRINT "Kapitel 47: Serielle Kommunikation"
PRINT
PRINT "Serieller Empfaenger gestartet"
PRINT "COM1: GP0=TX, GP1=RX, 9600 Baud"
PRINT "Befehle: LED:ON, LED:OFF"
PRINT

DO
  IF LOC(#1)>0 THEN

    ' Nur so viele Zeichen lesen, wie noch in den normalen
    ' String puffer$ passen.
    frei=255-LEN(puffer$)

    IF frei>0 THEN
      anzahl=LOC(#1)
      IF anzahl>frei THEN anzahl=frei
      puffer$=puffer$+INPUT$(anzahl,#1)
    ENDIF

    ' Es koennen bereits mehrere komplette Zeilen angekommen sein.
    pos=INSTR(puffer$,CHR$(10))

    DO WHILE pos>0
      text$=LEFT$(puffer$,pos-1)

      ' PRINT sendet normalerweise CR/LF. Das CR entfernen.
      IF LEN(text$)>0 THEN
        IF RIGHT$(text$,1)=CHR$(13) THEN
          text$=LEFT$(text$,LEN(text$)-1)
        ENDIF
      ENDIF

      PRINT "Empfangen: ";text$

      SELECT CASE text$
        CASE "LED:ON"
          PIN(GP2)=1
          PRINT "LED-Ausgang GP2: EIN"
          PRINT #1,"OK:LED:ON"

        CASE "LED:OFF"
          PIN(GP2)=0
          PRINT "LED-Ausgang GP2: AUS"
          PRINT #1,"OK:LED:OFF"

        CASE ELSE
          PRINT #1,"OK:"+text$
      END SELECT

      ' Verarbeitete Nachricht aus dem Puffer entfernen.
      puffer$=MID$(puffer$,pos+1)
      pos=INSTR(puffer$,CHR$(10))
    LOOP
  ENDIF
LOOP

' Das Programm laeuft absichtlich endlos. Bei einem regulaeren
' Programmende wuerde die Schnittstelle mit CLOSE #1 geschlossen. 
