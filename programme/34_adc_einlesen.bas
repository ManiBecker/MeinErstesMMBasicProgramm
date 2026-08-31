REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 34_adc_einlesen.bas
REM Titel: Kapitel 34: Analoge Eingaenge
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 31.08.2026
REM
REM Beschreibung: Unterschied zwischen digitalen und analogen Eingängen
REM
REM Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
REM
REM ====================================================================

Option Continuation Lines On
CLS RGB(BLACK)
Print "16. Unser erstes Messprogramm"

SETPIN GP26,AIN
DO
  PRINT PIN(GP26)
  PAUSE 200
LOOP While Inkey$=""

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "17. Was bedeutet der Messwert?"
Print
Print "Je groeßer die gemessene Spannung ist, desto groeßer wird der Zahlenwert."
Print "Wert Bedeutung"
Print "0    0 Volt"
Print "512  etwa halbe Spannung"
Print "1023 maximale Spannung"
Print

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "18. Messwerte auf Prozent umrechnen"
Print
Print "Haeufig sind Prozentwerte einfacher zu verstehen."
Print "PROZENT=WERT*100/1023"
Print "Beispiele:"
Print "Messwert Prozent"
Print "0        0 %"
Print "512      50 %"
Print "1023     100 %"
Print

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "19. Eine Prozentanzeige
SETPIN GP26,AIN
DO
  WERT=PIN(GP26)
  PROZENT=WERT*100/1023
  CLS
  PRINT INT(PROZENT);" %"
  PAUSE 200
LOOP While Inkey$=""

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "20. Eine grafische Balkenanzeige"
Print "Messwerte lassen sich oft besser grafisch darstellen."
Print "Der Balken waechst und schrumpft nun beim Drehen des Potentiometers."

MODE 2
SETPIN GP26,AIN
DO
  WERT=PIN(GP26)
  BREITE=WERT*MM.HRES/1023
  CLS RGB(BLACK)
  BOX 20,50,BREITE,40,0,RGB(GREEN),RGB(GREEN)
  TEXT 20,110,STR$(INT(WERT*100/1023))+" %"
  PAUSE 50
LOOP While Inkey$=""

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "21. Schwankende Messwerte"
Print
Print "Manche Sensoren liefern leicht schwankende Werte."
Print "Beispielsweise:"
Print "512, 513, 511, 514, 512"
Print "Das ist voellig normal."
Print "Ursachen koennen sein:"
Print "• elektrisches Rauschen"
Print "• Versorgungsspannung"
Print "• Sensorungenauigkeiten"
Print

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "22. Mehrere Messungen mitteln"

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

CLS
Print "23. Praxisprojekt: Elektronische Tankanzeige"
Print
Print "Nun bauen wir eine einfache Tankanzeige."
Print "Dabei simuliert das Potentiometer den Tankgeber eines Fahrzeugs."

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

Print "Press any key...": Do : Loop While Inkey$=""

CLS


Print "25. Wo werden analoge Eingaenge verwendet?"
Print
Print "Analoge Eingaenge findet man ueberall:"
Print "• Temperaturfuehler"
Print "• Helligkeitssensoren"
Print "• Joysticks"
Print "• Potentiometer"
Print "• Drucksensoren"
Print "• Abstandssensoren"
Print "• Feuchtigkeitssensoren"
Print "Sie gehoeren zu den wichtigsten Funktionen moderner Mikrocontroller.
Print

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "26. Typische Fehler"
Print
Print "Wenn keine sinnvollen Werte erscheinen:"
Print "1. Ist das Potentiometer richtig angeschlossen?"
Print "2. Wurde der richtige ADC-Pin verwendet?"
Print "3. Wurde SETPIN …,AIN aufgerufen?"
Print "4. Sind 3,3 V und GND korrekt verbunden?"
Print

Print "Press any key...": Do : Loop While Inkey$=""

CLS

Print "27. Experimentiere!"
Print
Print "Probiere folgende Aenderungen aus:"
Print "• andere Potentiometer"
Print "• andere Farben"
Print "• groeßere Balkenanzeigen"
Print "• Prozentanzeige mit einer Nachkommastelle"
Print

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "28. Probier’s selbst!"
Print
Print "Versuche folgende Aufgaben:"
Print "1. Baue eine Temperaturanzeige mit einem geeigneten Sensor."
Print "2. Zeichne einen horizontalen Balken."
Print "3. Zeichne einen vertikalen Balken."
Print "4. Erstelle eine Tankwarnung unter 20 %."
Print "5. Zeige den Messwert zusaetzlich als Zahl an."
Print

Print "Ready..."
