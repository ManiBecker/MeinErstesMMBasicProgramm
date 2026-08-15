REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 32_taster_led.bas
REM Titel: Kapitel 32: Taster und Schalter
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
Print "Das erste Tasterprogramm"
Print "PicoMite:"
SETPIN GP1,DIN,PULLUP
DO
  IF PIN(GP1)=0 THEN
    PRINT "Gedrueckt"
  ENDIF
LOOP

Print "Colour Maximite 2:"
SETPIN 31,DIN,PULLUP
DO
  IF PIN(31)=0 THEN
    PRINT "Gedrueckt"
  ENDIF
LOOP

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "Eine LED mit einem Taster schalten"
Print "PicoMite:"

SETPIN GP0,DOUT
SETPIN GP1,DIN,PULLUP
DO
  IF PIN(GP1)=0 THEN
    PIN(GP0)=1
  ELSE
    PIN(GP0)=0
  ENDIF
LOOP While Inkey$=""

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "Ein Schalter mit Speicherfunktion"
SETPIN GP0,DOUT
SETPIN GP1,DIN,PULLUP
LICHT=0
DO
  PIN(GP0)=LICHT
  Do : Loop While PIN(GP1)=0
  Do : Loop While PIN(GP1)=1
  IF LICHT=0 THEN
    LICHT=1
  ELSE
    LICHT=0
  ENDIF
LOOP While Inkey$=""

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "Warum zählt mein Taster mehrfach?"
SETPIN GP1,DIN,PULLUP
ZAHL=0
DO
  IF PIN(GP1)=0 THEN
    ZAHL=ZAHL+1
    PRINT ZAHL
  ENDIF
LOOP While Inkey$=""

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "Eine einfache Entprellung"
SETPIN GP1,DIN,PULLUP
ZAHL=0
DO
  IF PIN(GP1)=0 THEN
    ZAHL=ZAHL+1
    PAUSE 50
    PRINT ZAHL
  ENDIF
LOOP While Inkey$=""
Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "Flankenerkennung"
SETPIN GP1,DIN,PULLUP
ZAHL=0
ALT=1
DO
  AKTUELL=PIN(GP1)
  IF AKTUELL=0 AND ALT=1 THEN
    ZAHL=ZAHL+1
    PRINT ZAHL
  ENDIF
  ALT=AKTUELL
LOOP While Inkey$=""

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "Praxisprojekt: Reaktionsspiel"
SETPIN GP0,DOUT
SETPIN GP1,DIN,PULLUP
PRINT
PRINT "Warte auf das Signal..."

PAUSE 2000

WARTEZEIT=1000+INT(RND*4000)

PAUSE WARTEZEIT

PIN(GP0)=1

START=TIMER

DO : LOOP UNTIL PIN(GP1)=0

REAKTION=TIMER-START

PIN(GP0)=0

PRINT
PRINT "Deine Reaktionszeit:"
PRINT REAKTION;" ms"
If REAKTION <= 200
  Print "Ausgezeichnet"
ElseIf REAKTION <= 300
  Print "Sehr gut"
ElseIf REAKTION <= 400
  Print "Gut"
Else
  Print "Weiter üben"
EndiF

Print "Ready..."
