REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 47_longstring_empfangen.bas
REM Titel: Kapitel 47: Serielle Kommunikation mit Long Strings
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 23.09.2026
REM
REM Beschreibung:
REM Empfaengt einen groesseren Datenblock ueber COM1 und sammelt ihn in
REM einem Long String. INPUT$() liefert normale Strings und liest deshalb
REM immer nur Bloecke von maximal 255 Zeichen.
REM
REM PicoMite HDMI/USB:
REM   GP0 = COM1 TX
REM   GP1 = COM1 RX
REM
REM Serielle Einstellung: 9600 Baud, 8 Datenbits, keine Paritaet,
REM                       1 Stopbit
REM
REM Hardware/Voraussetzungen:
REM Zweiter PicoMite oder USB-UART-Adapter
REM ====================================================================

OPTION EXPLICIT

CONST MAXLEN=2048

DIM INTEGER empfang(MAXLEN/8)
DIM anzahl AS INTEGER
DIM block AS INTEGER
DIM text$

' COM1 konfigurieren. Der UART-Empfangspuffer ist 1024 Byte gross.
SETPIN GP0, GP1, COM1
OPEN "COM1:9600,1024" AS #1

PRINT "Kapitel 47: Long Strings"
PRINT
PRINT "Warte auf serielle Daten ..."
PRINT "Beenden mit einer Taste."
PRINT

DO
  IF LOC(#1)>0 THEN
    anzahl=LOC(#1)

    DO WHILE anzahl>0
      ' INPUT$() liefert einen normalen String.
      ' Deshalb maximal 255 Zeichen auf einmal lesen.
      block=anzahl
      IF block>255 THEN block=255

      text$=INPUT$(block,#1)

      ' Nur anhaengen, wenn der reservierte Long String ausreicht.
      IF LLEN(empfang())+LEN(text$)<=MAXLEN THEN
        LONGSTRING APPEND empfang(),text$
      ELSE
        PRINT
        PRINT "Long-String-Puffer ist voll."
        EXIT DO
      ENDIF

      anzahl=LOC(#1)
    LOOP
  ENDIF
LOOP WHILE INKEY$=""

CLOSE #1

PRINT
PRINT "Empfangen: ";LLEN(empfang());" Zeichen"
PRINT
LONGSTRING PRINT empfang() 
