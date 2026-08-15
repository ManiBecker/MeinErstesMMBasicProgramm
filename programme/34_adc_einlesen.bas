REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 34_adc_einlesen.bas
REM Titel: Kapitel 34: Analoge Eingaenge
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 15.08.2026
REM
REM Beschreibung:
REM
REM Hardware/Voraussetzungen: keine/PicoMite/ColourMaxiMite
REM
REM ====================================================================

Option Continuation Lines On
CLS RGB(BLACK)
Print "Unser erstes Messprogramm"

SETPIN GP26,AIN
DO
  PRINT PIN(GP26)
  PAUSE 200
LOOP While Inkey$=""

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB
Print "Mehrere Messungen mitteln"

SETPIN GP26,AIN
SUMME=0
FOR I=1 TO 10
  WERT=PIN(GP26)
  PRINT WERT
  SUMME=SUMME+WERT
  PAUSE 200
NEXT I
WERT=SUMME/10
PRINT WERT

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB
Print "Praxisprojekt: Elektronische Tankanzeige"

MODE 2

SETPIN GP26,AIN

DO
  WERT=PIN(GP26)
  PROZENT=WERT*100/1023
  CLS RGB(BLACK)

  TEXT MM.HRES/2,20,      _
       "Tankanzeige",     _
       "CT"

  BOX 40,80,200,30

  BOX 40,80,              _
      PROZENT*2,30,       _
      0,                  _
      RGB(GREEN),         _
      RGB(GREEN)

  TEXT MM.HRES/2,140,     _
       STR$(INT(PROZENT))+" %", _
       "CT"

  PAUSE 100

LOOP While Inkey$=""

Print "Ready..."
