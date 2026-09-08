REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 48_ws2812_regenbogen.bas
REM Titel: Kapitel 48: WS2812 RGB-LEDs
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 08.09.2026
REM
REM Beschreibung: Regenbogeneffekt mit WS2812B-LEDs
REM
REM Hardware/Voraussetzungen: keine/PicoMite/ColourMaxiMite
REM  Datenleitung: GP5
REM ====================================================================

CONST LEDS = 8
CONST FARBEN = 6

DIM leds%(LEDS - 1)
DIM palette%(FARBEN - 1)

' Regenbogenfarben festlegen
palette%(0) = RGB(40, 0, 0)      ' Rot
palette%(1) = RGB(40, 20, 0)     ' Orange
palette%(2) = RGB(40, 40, 0)     ' Gelb
palette%(3) = RGB(0, 40, 0)      ' Gruen
palette%(4) = RGB(0, 0, 40)      ' Blau
palette%(5) = RGB(30, 0, 40)     ' Violett

' Datenpin fuer die WS2812B-Kette vorbereiten
SETPIN GP5, DOUT

PRINT "WS2812B-Regenbogen"
PRINT "Beenden mit einer Taste"

offset = 0

DO
  ' Fuer jede LED eine Farbe aus der Palette waehlen
  FOR i = 0 TO LEDS - 1
    farbindex = (i + offset) MOD FARBEN
    leds%(i) = palette%(farbindex)
  NEXT i

  ' Komplette LED-Kette aktualisieren
  WS2812 B, GP5, LEDS, leds%()

  ' Regenbogen um eine Position verschieben
  offset = (offset + 1) MOD FARBEN

  PAUSE 150
LOOP UNTIL INKEY$ <> ""

' Alle LEDs ausschalten
FOR i = 0 TO LEDS - 1
  leds%(i) = RGB(BLACK)
NEXT i

WS2812 B, GP5, LEDS, leds%()

PRINT "Programm beendet." 
