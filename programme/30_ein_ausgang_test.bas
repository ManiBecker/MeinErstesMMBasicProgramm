REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 30_ein_ausgang_test.bas
REM Titel: Kapitel 30: Digitale Ein- und Ausgaenge
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
Print "Ein Ausgang"

SETPIN GP0,DOUT

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "Einen Ausgang einschalten"
PIN(GP0)=1

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "Einen Ausgang ausschalten"
PIN(GP0)=0

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "Das erste Hardwareprogramm"
Print "Dieses Beispiel schaltet einen Ausgang ein."
SETPIN GP0,DOUT
PIN(GP0)=1

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "Einen Ausgang blinken lassen"
SETPIN GP0,DOUT

DO
  PIN(GP0)=1
  PAUSE 500
  PIN(GP0)=0
  PAUSE 500
LOOP While Inkey$=""

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "Ein Eingang"
SETPIN GP1,DIN

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "Einen Eingang abfragen"
WERT=PIN(GP1)

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "Den Zustand anzeigen"
SETPIN GP1,DIN

DO

  PRINT PIN(GP1)

  PAUSE 200

LOOP While Inkey$=""

Print "Ready..."
