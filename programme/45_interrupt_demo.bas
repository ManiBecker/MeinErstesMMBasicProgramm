REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 45_interrupt_demo.bas
REM Titel: Kapitel 45: Ereignisgesteuerte Programmierung mit Interrupts
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 27.07.2026
REM
REM Beschreibung:
REM Schaltung:
REM   Taster zwischen GP14 und GND
REM   LED an GP15
REM
REM Der Tastereingang verwendet den internen Pull-up-Widerstand.
REM Beim Druecken wechselt GP14 deshalb von HIGH nach LOW.
REM INTL loest den Interrupt bei dieser fallenden Flanke aus.
REM
REM Hardware/Voraussetzungen: keine/PicoMite/ColourMaxiMite
REM
REM ====================================================================

DIM ereignis = 0
DIM anzahl = 0
DIM led = 0
DIM letzteZeit = -100

SETPIN GP14, INTL, TasterGedrueckt, PULLUP
SETPIN GP15, DOUT

PIN(GP15) = led

CLS
PRINT "Interrupt-Demo"
PRINT "--------------"
PRINT
PRINT "Taster an GP14 druecken."
PRINT "Jeder gueltige Tastendruck schaltet die LED um"
PRINT "und erhoeht den Ereigniszaehler."
PRINT
PRINT "Mit Q wird das Programm beendet."
PRINT
PRINT "Tastendruecke: "; anzahl

DO
  ' Die eigentliche Verarbeitung findet im Hauptprogramm statt.
  IF ereignis THEN
    ereignis = 0

    anzahl = anzahl + 1
    led = 1 - led
    PIN(GP15) = led

    PRINT "Tastendruecke: "; anzahl; "   LED: "; led
  ENDIF

  IF UCASE$(INKEY$) = "Q" THEN EXIT DO
LOOP

' Nicht mehr benoetigten Interrupt deaktivieren.
SETPIN GP14, OFF
PIN(GP15) = 0

PRINT
PRINT "Programm beendet."
END

SUB TasterGedrueckt
  ' Interrupt-Subroutinen muessen moeglichst kurz bleiben.
  ' Deshalb wird hier weder gewartet noch ausgegeben.

  ' Taster entprellen: Ereignisse innerhalb von 50 ms ignorieren.
  IF TIMER - letzteZeit < 50 THEN EXIT SUB

  letzteZeit = TIMER
  ereignis = 1
END SUB 
