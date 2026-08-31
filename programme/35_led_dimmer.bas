REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 35_led_dimmer.bas
REM Titel: Kapitel 35: PWM und LED-Dimmer
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 31.08.2026
REM
REM Beschreibung: PWM (Pulsweitenmodulation)
REM
REM Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
REM
REM ====================================================================

Option Continuation Lines On
CLS RGB(BLACK)

Print "8. PWM beim PicoMite"
Print
Print "Der PicoMite besitzt mehrere PWM-Kanäle."
Print "Ein PWM-Signal wird mit dem Befehl:"
Print "PWM Kanal,Frequenz,Tastverhaeltnis"
Print "erzeugt."
Print "Beispiel:"
Print "PWM 0,1000,50"
Print "Das bedeutet:"
Print "Parameter Bedeutung"
Print "0 PWM-Kanal"
Print "1000 1000 Hz Frequenz"
Print "50 50 % Tastverhältnis"
Print 
Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "9. PWM-Ausgänge konfigurieren"
Print "Bevor ein GPIO-Pin verwendet werden kann, muss er einem PWM-Kanal zugeordnet werden."
Print "Beispiel:"
Print "SETPIN GP0,PWM0A"
Print "Nun wird das PWM-Signal des Kanals 0 auf GP0 ausgegeben."
Print

SETPIN GP0,PWM0A

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "10. Erste PWM-Ausgabe"
Print "SETPIN GP0,PWM0A"
Print "PWM 0,1000,50"
Print "Die LED sollte nun etwa halb so hell leuchten."
Print

SETPIN GP0,PWM0A
PWM 0,1000,50

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "11. Verschiedene Helligkeiten"
Print "25 %:"
Print "PWM 0,1000,25"
Print "50 %:"
Print "PWM 0,1000,50"
Print "75 %:"
Print "PWM 0,1000,75"
Print "100 %:"
Print "PWM 0,1000,100"
Print

SETPIN GP0,PWM0A
For i=25 To 100 Step 25
  Print i;" %: ";
  Print "PWM 0,1000,";i
  PWM 0,1000,i
  Pause 500
Next i

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "12. PWM stoppen"
Print "PWM 0,OFF"
Print "Der PWM-Kanal wird abgeschaltet."
Print

PWM 0,OFF

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "13. Der Colour Maximite 2"
Print "Auch der Colour Maximite 2 unterstützt PWM."
Print "Dort werden PWM-Controller verwendet."
Print "Beispiel:"
Print
Print "PWM 1,1000,50"
Print "Dadurch wird auf dem ersten PWM-Ausgang ein Signal mit:"
Print "- 1000 Hz"
Print "- 50 % Tastverhältnis"
Print "erzeugt."
Print "Die Grundidee ist auf beiden Plattformen identisch."
Print

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "14. Eine LED langsam heller werden lassen"
Print "Nun erzeugen wir einen einfachen Aufblendeffekt."
Print "SETPIN GP0,PWM0A"
Print "FOR HELLIGKEIT=0 TO 100"
Print "  PWM 0,1000,HELLIGKEIT"
Print "  PAUSE 20"
Print "NEXT HELLIGKEIT"
Print "Die LED wird langsam heller."
Print

SETPIN GP0,PWM0A
FOR HELLIGKEIT=0 TO 100
  PWM 0,1000,HELLIGKEIT
  PAUSE 20
NEXT HELLIGKEIT

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "15. Eine LED langsam dunkler werden lassen"
Print "SETPIN GP0,PWM0A"
Print "FOR HELLIGKEIT=100 TO 0 STEP -1"
Print "  PWM 0,1000,HELLIGKEIT"
Print "  PAUSE 20"
Print "NEXT HELLIGKEIT"
Print "Die LED wird langsam dunkler."
Print

SETPIN GP0,PWM0A
FOR HELLIGKEIT=100 TO 0 STEP -1
  PWM 0,1000,HELLIGKEIT
  PAUSE 20
NEXT HELLIGKEIT

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "16. Atemlicht"
Print "Kombinieren wir beide Effekte.
Print
Print "SETPIN GP0,PWM0A"
Print "DO"
Print "  FOR H=0 TO 100"
Print "    PWM 0,1000,H"
Print "    PAUSE 10"
Print "  NEXT H"
Print "  FOR H=100 TO 0 STEP -1"
Print "    PWM 0,1000,H"
Print "    PAUSE 10"
Print "  NEXT H"
Print "LOOP"
Print "Die LED wirkt nun, als würde sie atmen."
Print

SETPIN GP0,PWM0A
DO
  FOR H=0 TO 100
    PWM 0,1000,H
    PAUSE 10
  NEXT H
  FOR H=100 TO 0 STEP -1
    PWM 0,1000,H
    PAUSE 10
  NEXT H
LOOP While Inkey$=""

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "17. PWM als analoger Ausgang"
Print
Print "PWM wird häufig verwendet, um analoge Spannungen zu simulieren."
Print "Betrachten wir folgende Werte:"
Print "PWM Mittlere Spannung"
Print "0 % 0,0 V"
Print "50 % ca. 1,65 V"
Print "100 % ca. 3,3 V"
Print "Mit einem Tiefpassfilter kann daraus eine nahezu analoge Spannung erzeugt werden."
Print

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "18. PWM in der Praxis"
Print
Print "PWM wird verwendet für:"
Print "- LED-Dimmer"
Print "- Motorsteuerungen"
Print "- Lüfterregelungen"
Print "- Servoansteuerungen"
Print "- Audioausgabe"
Print "- Netzteile"
Print "Es gehört zu den wichtigsten Techniken moderner Mikrocontroller."
Print

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "19. Praxisprojekt: Dimmer mit Potentiometer"
Print
Print "Nun verbinden wir die Kapitel 34 und 35."
Print "Das Potentiometer liefert den Sollwert."
Print "PWM steuert die Helligkeit."
Print

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "20. Die Hardware"
Print "Benötigt werden:"
Print "- Potentiometer an GP26"
Print "- LED an GP0"
Print "- Vorwiderstand 330 Ohm"
Print "GP26 -> Potentiometer"
Print "GP0 -> LED"
Print

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "21. Programm"
Print "SETPIN GP26,AIN"
Print "SETPIN GP0,PWM0A"
Print "DO"
Print "  WERT=PIN(GP26)"
Print "  HELLIGKEIT=WERT*100/1023"
Print "  PWM 0,1000,HELLIGKEIT"
Print "  PAUSE 20"
Print "LOOP"
Print "Nun kann die Helligkeit der LED mit dem Potentiometer eingestellt werden."
Print

SETPIN GP26,AIN
SETPIN GP0,PWM0A
DO
  WERT=PIN(GP26)
  HELLIGKEIT=WERT*100/1023
  PWM 0,1000,HELLIGKEIT
  PAUSE 20
LOOP While Inkey$=""

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "22. Erweiterung: Anzeige der Helligkeit"
Print
Print "SETPIN GP26,AIN"
Print "SETPIN GP0,PWM0A"
Print "DO"
Print "  WERT=PIN(GP26)"
Print "  HELLIGKEIT=WERT*100/1023"
Print "  PWM 0,1000,HELLIGKEIT"
Print "  CLS"
Print "  PRINT "Helligkeit:" PRINT INT(HELLIGKEIT);\" %\""
Print "  PAUSE 100"
Print "LOOP"
Print "Die aktuelle Helligkeit wird zusätzlich angezeigt."
Print

SETPIN GP26,AIN
SETPIN GP0,PWM0A
DO
  WERT=PIN(GP26)
  HELLIGKEIT=WERT*100/1023
  PWM 0,1000,HELLIGKEIT
  CLS
  PRINT "Helligkeit:" PRINT INT(HELLIGKEIT);" %"
  PAUSE 100
LOOP While Inkey$=""

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "23. Typische Fehler"
Print
Print "Wenn die LED nicht reagiert:"
Print "1. Ist der richtige PWM-Pin verwendet?"
Print "2. Wurde SETPIN korrekt aufgerufen?"
Print "3. Ist die LED richtig angeschlossen?"
Print "4. Ist ein Vorwiderstand vorhanden?"
Print "5. Wurde der richtige PWM-Kanal verwendet?"
Print

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "24. Experimentiere!"
Print
Print "Probiere folgende Aenderungen aus:"
Print "Andere PWM-Frequenzen mehrere LEDs unterschiedliche Helligkeitskurven 
Print "langsamere oder schnellere Atemeffekte"
Print

Print "Press any key...": Do : Loop While Inkey$=""

Print "25. Probier’s selbst!"
Print
Print "Versuche folgende Aufgaben:"
Print "1. Erzeuge einen sanften Sonnenaufgang."
Print "2. Lasse zwei LEDs gegeneinander dimmen."
Print "3. Verwende zwei Potentiometer für zwei LEDs."
Print "4. Baue eine einfache Instrumentenbeleuchtung."
Print "5. Simuliere das Blinken einer Warnleuchte."
Print
Print "Ready..."
