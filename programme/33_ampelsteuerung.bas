REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 33_ampelsteuerung.bas
REM Titel: Kapitel 33: Eine Ampelsteuerung
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 15.08.2026
REM
REM Beschreibung:
REM
REM Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
REM
REM ====================================================================

CLS RGB(BLACK)
Print "Die erste Ampel"

SETPIN GP0,DOUT
SETPIN GP1,DOUT
SETPIN GP2,DOUT

DO

  PIN(GP0)=1
  PIN(GP1)=0
  PIN(GP2)=0

  PAUSE 3000

  PIN(GP0)=1
  PIN(GP1)=1
  PIN(GP2)=0

  PAUSE 1000

  PIN(GP0)=0
  PIN(GP1)=0
  PIN(GP2)=1

  PAUSE 3000

  PIN(GP0)=0
  PIN(GP1)=1
  PIN(GP2)=0

  PAUSE 1000

LOOP While Inkey$=""

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "Die Ampel mit Zuständen"

STATUS=1

DO

  SELECT CASE STATUS
    CASE 1
      PRINT "Rot"
      STATUS=2
      PAUSE 3000
    CASE 2
      PRINT "Rot-Gelb"
      STATUS=3
      PAUSE 1000
    CASE 3
      PRINT "Gruen"
      STATUS=4
      PAUSE 3000
    CASE 4
      PRINT "Gelb"
      STATUS=1
      PAUSE 1000
  END SELECT

LOOP While Inkey$=""

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "Praxisprojekt: Fußgängerampel"

SETPIN GP0,DOUT
SETPIN GP1,DOUT
SETPIN GP2,DOUT

SETPIN GP3,DOUT
SETPIN GP4,DOUT

SETPIN GP5,DIN,PULLUP

STATUS=1
ANFORDERUNG=0

DO

  IF PIN(GP5)=0 THEN
    ANFORDERUNG=1
  ENDIF

  SELECT CASE STATUS

    CASE 1

      ' Autos Gruen

      PIN(GP0)=0
      PIN(GP1)=0
      PIN(GP2)=1

      PIN(GP3)=1
      PIN(GP4)=0

      IF ANFORDERUNG=1 THEN

        PAUSE 1000

        STATUS=2

      ENDIF

    CASE 2

      ' Autos Gelb

      PIN(GP0)=0
      PIN(GP1)=1
      PIN(GP2)=0

      PAUSE 2000

      STATUS=3

    CASE 3

      ' Autos Rot

      PIN(GP0)=1
      PIN(GP1)=0
      PIN(GP2)=0

      PAUSE 1000

      STATUS=4

    CASE 4

      ' Fussgaenger Gruen

      PIN(GP3)=0
      PIN(GP4)=1

      PAUSE 5000

      STATUS=5

    CASE 5

      ' Fussgaenger Rot

      PIN(GP3)=1
      PIN(GP4)=0

      PAUSE 1000

      STATUS=6

    CASE 6

      ' Autos Rot-Gelb

      PIN(GP0)=1
      PIN(GP1)=1
      PIN(GP2)=0

      PAUSE 1000

      ANFORDERUNG=0

      STATUS=1

  END SELECT

LOOP While Inkey$=""

Print "Press any key...": Do : Loop While Inkey$=""

Print "Ready..."
