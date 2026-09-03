Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 34_adc_einlesen.bas
Rem Titel: Kapitel 34: Analoge Eingaenge
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 03.09.2026
Rem
Rem Beschreibung: Analoge Spannungen mit einem ADC-Eingang messen
Rem
Rem Hardware/Voraussetzungen: PicoMite/Colour Maximite 2
Rem
Rem ====================================================================

Option Continuation Lines On
CLS RGB(BLACK)
Print "16. Unser erstes Messprogramm"

SetPin GP40, AIN
Do
  Print Pin(GP40)
  Pause 200
Loop While Inkey$=""

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "17. Was bedeutet der Messwert?"
Print
Print "PIN() liefert die gemessene Spannung direkt in Volt."
Print "Bei einem Messbereich von 0 bis 3,3 V gilt zum Beispiel:"
Print "Spannung Bedeutung"
Print "0,0 V     minimale Spannung"
Print "1,65 V    etwa halbe Spannung"
Print "3,3 V     maximale Spannung"
Print

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "18. Messwerte auf Prozent umrechnen"
Print
Print "Haeufig sind Prozentwerte einfacher zu verstehen."
Print "PROZENT=WERT*100/3.3"
Print "Beispiele:"
Print "Spannung Prozent"
Print "0,0 V      0 %"
Print "1,65 V    50 %"
Print "3,3 V    100 %"
Print

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "19. Eine Prozentanzeige"

SetPin GP40,AIN
Do
  WERT=Pin(GP40)
  PROZENT=WERT*100/3.3
  'CLS
  Print Int(PROZENT);" %"
  Pause 200
Loop While Inkey$=""

Print "Press any key...": Do : Loop While Inkey$=""

CLS
MODE 2
Print "20. Eine grafische Balkenanzeige"
Print "Messwerte lassen sich oft besser grafisch darstellen."
Print "Der Balken waechst und schrumpft nun beim Drehen des Potentiometers."

SetPin GP40,AIN
Do
  WERT=Pin(GP40)
  BREITE=WERT*MM.HRES/3.3
  'CLS RGB(BLACK)
  Box 20,50,BREITE,40,0,RGB(GREEN),RGB(GREEN)
  Text 20,110,Str$(Int(WERT*100/3.3))+" %"
  Pause 50
Loop While Inkey$=""

Print "Press any key...": Do : Loop While Inkey$=""

CLS
MODE 1
Print "21. Schwankende Messwerte"
Print
Print "Manche Sensoren liefern leicht schwankende Werte."
Print "Beispielsweise:"
Print "1.648, 1.651, 1.647, 1.652, 1.650"
Print "Das ist voellig normal."
Print "Ursachen koennen sein:"
Print "- elektrisches Rauschen"
Print "- Versorgungsspannung"
Print "- Sensorungenauigkeiten"
Print

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "22. Mehrere Messungen mitteln"

SetPin GP40,AIN
SUMME=0
For I=1 To 10
  WERT=Pin(GP40)
  Print WERT
  SUMME=SUMME+WERT
  Pause 200
Next I
WERT=SUMME/10
Print WERT

Print "Press any key...": Do : Loop While Inkey$=""

CLS
MODE 2
Print "23. Praxisprojekt: Elektronische Tankanzeige"
Print
Print "Nun bauen wir eine einfache Tankanzeige."
Print "Dabei simuliert das Potentiometer den Tankgeber eines Fahrzeugs."

SetPin GP40,AIN

Do
  WERT=Pin(GP40)
  PROZENT=WERT*100/3.3
  'CLS RGB(BLACK)

  Text MM.HRES/2,20,"Tankanzeige","CT"

  Box 40,80,200,30

  Box 40,80,PROZENT*2,30,0,RGB(GREEN),RGB(GREEN)

  Text MM.HRES/2,140,Str$(Int(PROZENT))+" %","CT"

  Pause 100

Loop While Inkey$=""

Print "Press any key...": Do : Loop While Inkey$=""

CLS
MODE 1

Print "24. Wo werden analoge Eingaenge verwendet?"
Print
Print "Analoge Eingaenge findet man ueberall:"
Print "- Temperaturfuehler"
Print "- Helligkeitssensoren"
Print "- Joysticks"
Print "- Potentiometer"
Print "- Drucksensoren"
Print "- Abstandssensoren"
Print "- Feuchtigkeitssensoren"
Print "Sie gehoeren zu den wichtigsten Funktionen moderner Mikrocontroller."
Print

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "25. Typische Fehler"
Print
Print "Wenn keine sinnvollen Werte erscheinen:"
Print "1. Ist das Potentiometer richtig angeschlossen?"
Print "2. Wurde der richtige ADC-Pin verwendet?"
Print "3. Wurde SETPIN GP40,AIN aufgerufen?"
Print "4. Sind 3,3 V und GND korrekt verbunden?"
Print

Print "Press any key...": Do : Loop While Inkey$=""

CLS

Print "26. Experimentiere!"
Print
Print "Probiere folgende Aenderungen aus:"
Print "- andere Potentiometer"
Print "- andere Farben"
Print "- groessere Balkenanzeigen"
Print "- Prozentanzeige mit einer Nachkommastelle"
Print

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "27. Probiers selbst!"
Print
Print "Versuche folgende Aufgaben:"
Print "1. Baue eine Temperaturanzeige mit einem geeigneten Sensor."
Print "2. Zeichne einen horizontalen Balken."
Print "3. Zeichne einen vertikalen Balken."
Print "4. Erstelle eine Tankwarnung unter 20 %."
Print "5. Zeige den Messwert zusaetzlich als Zahl an."
Print

Print "Ready..." 
