REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 31_led_blinken.bas
REM Titel: Kapitel 31: Eine LED zum Blinken bringen
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 15.08.2026
REM
REM Beschreibung:
REM
REM Hardware/Voraussetzungen: keine/PicoMite/ColourMaxiMite
REM
REM ====================================================================

CLS RGB(BLACK)
Print "Erstes Blinkprogramm"
SETPIN GP25,DOUT
DO
  PIN(GP25)=1
  PAUSE 500
  PIN(GP25)=0
  PAUSE 500
LOOP While Inkey$=""

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "Die Blinkgeschwindigkeit verändern"
SETPIN GP25,DOUT
DO
  PIN(GP25)=1
  PAUSE Rnd*1000+100
  PIN(GP25)=0
  PAUSE Rnd*1000+100
LOOP While Inkey$=""

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "Mehrfach blinken"
SETPIN GP25,DOUT
FOR I=1 TO 10
  PIN(GP0)=1
  PAUSE 200
  PIN(GP0)=0
  PAUSE 200
NEXT I

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "Eine Blinkfunktion erstellen"
SUB Blinke(ANZEIT,AUSZEIT)
  PIN(GP0)=1
  PAUSE ANZEIT
  PIN(GP0)=0
  PAUSE AUSZEIT
END SUB

Print "Verwendung:"

Blinke 200,200


Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "Praxisbeispiel: SOS"
SETPIN GP0,DOUT
DO
  Kurzsignal
  Kurzsignal
  Kurzsignal
  Langsignal
  Langsignal
  Langsignal
  Kurzsignal
  Kurzsignal
  Kurzsignal
  PAUSE 2000
LOOP While Inkey$=""

SUB Kurzsignal
  PIN(GP0)=1
  PAUSE 200
  PIN(GP0)=0
  PAUSE 200
END SUB

SUB Langsignal
  PIN(GP0)=1
  PAUSE 600
  PIN(GP0)=0
  PAUSE 200
END SUB

Print "Ready..."
