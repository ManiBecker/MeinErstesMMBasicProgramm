@echo off
setlocal
chcp 65001 >nul

rem ================================================================
rem Erstellt eine flache Programmstruktur fuer das Buch
rem "Mein erstes MMBasic Programm".
rem
rem Alle BAS-Dateien werden direkt im Ordner "programme" angelegt.
rem Vorhandene Dateien werden NICHT ueberschrieben.
rem ================================================================

set "ROOT=programme"

if not exist "%ROOT%" mkdir "%ROOT%"

call :CREATE "01_hallo_welt.bas" "Kapitel 1: Hallo Welt"
call :CREATE "02_rechenarten.bas" "Kapitel 2: Mit MMBasic rechnen"
call :CREATE "03_variablen.bas" "Kapitel 3: Variablen"
call :CREATE "04_persoenliche_begruessung.bas" "Kapitel 4: Benutzereingaben mit INPUT"
call :CREATE "05_rechenquiz.bas" "Kapitel 5: Entscheidungen mit IF"
call :CREATE "06_einmaleins.bas" "Kapitel 6: Schleifen mit FOR NEXT"
call :CREATE "07_wuerfel.bas" "Kapitel 7: Zufallszahlen"
call :CREATE "08_zahlenraten.bas" "Kapitel 8: Unser erstes Spiel: Zahlenraten"
call :CREATE "09_zahlenraten_v2.bas" "Kapitel 9: Zahlenraten Version 2"
call :CREATE "10_strukturiertes_programm.bas" "Kapitel 10: Programme strukturieren mit SUB und FUNCTION"
call :CREATE "11_array_einfach.bas" "Kapitel 11: Arrays"
call :CREATE "12_stringfunktionen.bas" "Kapitel 12: Mit Texten arbeiten"
call :CREATE "13_little_professor.bas" "Kapitel 13: Little Professor"
call :CREATE "14_little_professor_v2.bas" "Kapitel 14: Little Professor Version 2"
call :CREATE "15_little_professor_v3.bas" "Kapitel 15: Little Professor Version 3"
call :CREATE "16_highscore_speichern.bas" "Kapitel 16: Dateien speichern und laden"
call :CREATE "17_grafikmodi.bas" "Kapitel 17: Die verschiedenen Grafikmodi"
call :CREATE "18_farben_und_schriften.bas" "Kapitel 18: Farben und Schriftarten"
call :CREATE "19_grafikdemo.bas" "Kapitel 19: Die ersten Grafikbefehle"
call :CREATE "20_formen_demo.bas" "Kapitel 20: Rechtecke, Kreise und Texte"
call :CREATE "21_treffe_die_scheibe.bas" "Kapitel 21: Treffe die Scheibe"
call :CREATE "22_treffe_die_scheibe_v2.bas" "Kapitel 22: Treffe die Scheibe Version 2"
call :CREATE "23_treffe_die_scheibe_v3.bas" "Kapitel 23: Treffe die Scheibe Version 3"
call :CREATE "24_bahnhofsuhr.bas" "Kapitel 24: Eine analoge Bahnhofsuhr"
call :CREATE "25_spirograph.bas" "Kapitel 25: Geometrische Muster und Spirographen"
call :CREATE "26_animation.bas" "Kapitel 26: Animationen und bewegte Grafiken"
call :CREATE "27_framebuffer_demo.bas" "Kapitel 27: Flackerfreie Grafik mit Framebuffer"
call :CREATE "28_layer_animation.bas" "Kapitel 28: Layerbuffer und bewegliche Objekte"
call :CREATE "29_pong.bas" "Kapitel 29: Pong - das Spiel der Spiele"
call :CREATE "30_ein_ausgang_test.bas" "Kapitel 30: Digitale Ein- und Ausgaenge"
call :CREATE "31_led_blinken.bas" "Kapitel 31: Eine LED zum Blinken bringen"
call :CREATE "32_taster_led.bas" "Kapitel 32: Taster und Schalter"
call :CREATE "33_ampelsteuerung.bas" "Kapitel 33: Eine Ampelsteuerung"
call :CREATE "34_adc_einlesen.bas" "Kapitel 34: Analoge Eingaenge"
call :CREATE "35_led_dimmer.bas" "Kapitel 35: PWM und LED-Dimmer"
call :CREATE "36_kleine_melodie.bas" "Kapitel 36: Toene und Piezo-Summer"
call :CREATE "37_senso.bas" "Kapitel 37: Senso - das elektronische Gedaechtnisspiel"
call :CREATE "38_editor_test.bas" "Kapitel 38: Der eingebaute Editor"
call :CREATE "39_mmedit_blinken.bas" "Kapitel 39: Programmieren mit MMEdit"
call :CREATE "40_library_test.bas" "Kapitel 40: Programme speichern und laden"
call :CREATE "41_dateiverwaltung_demo.bas" "Kapitel 41: Dateiverwaltung auf der SD-Karte"
call :CREATE "42_chain_start.bas" "Kapitel 42: Programme verketten mit CHAIN"
call :CREATE "42_chain_spiel.bas" "Kapitel 42: Programme verketten mit CHAIN"
call :CREATE "42_chain_ende.bas" "Kapitel 42: Programme verketten mit CHAIN"
call :CREATE "43_systembericht.bas" "Kapitel 43: Nuetzliche Systeminformationen"
call :CREATE "44_option_informationen.bas" "Kapitel 44: Wichtige OPTION-Befehle"
call :CREATE "45_interrupt_demo.bas" "Kapitel 45: Ereignisgesteuerte Programmierung mit Interrupts"
call :CREATE "46_datum_uhrzeit.bas" "Kapitel 46: Datum und Uhrzeit"
call :CREATE "47_seriell_senden.bas" "Kapitel 47: Serielle Kommunikation"
call :CREATE "47_seriell_empfangen.bas" "Kapitel 47: Serielle Kommunikation"
call :CREATE "48_ws2812_regenbogen.bas" "Kapitel 48: WS2812 RGB-LEDs"
call :CREATE "49_gamepad_test.bas" "Kapitel 49: Spielcontroller und Gamepads"
call :CREATE "50_sprite_demo.bas" "Kapitel 50: Sprites und BLIT"
call :CREATE "51_abschlussspiel.bas" "Kapitel 51: Von der Idee zum fertigen Spiel"
call :CREATE "52_dein_naechstes_programm.bas" "Kapitel 52: Wie geht es jetzt weiter?"

echo.
echo Fertig. Alle Programmdateien wurden direkt unter "%ROOT%" angelegt.
echo Bereits vorhandene Dateien wurden nicht veraendert.
echo.
pause
exit /b

:CREATE
set "FILE=%~1"
set "TITLE=%~2"

if exist "%ROOT%\%FILE%" (
    echo Uebersprungen: %ROOT%\%FILE%
    exit /b
)

> "%ROOT%\%FILE%" echo REM ====================================================================
>>"%ROOT%\%FILE%" echo REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
>>"%ROOT%\%FILE%" echo REM Datei: %FILE%
>>"%ROOT%\%FILE%" echo REM Titel: %TITLE%
>>"%ROOT%\%FILE%" echo REM Buch:  Mein erstes MMBasic Programm
>>"%ROOT%\%FILE%" echo REM Autor: Manfred Becker
>>"%ROOT%\%FILE%" echo REM Datum: 27.07.2026
>>"%ROOT%\%FILE%" echo REM
>>"%ROOT%\%FILE%" echo REM Beschreibung:
>>"%ROOT%\%FILE%" echo REM
>>"%ROOT%\%FILE%" echo REM Hardware/Voraussetzungen: keine/PicoMite/ColourMaxiMite
>>"%ROOT%\%FILE%" echo REM
>>"%ROOT%\%FILE%" echo REM ====================================================================
>>"%ROOT%\%FILE%" echo.

echo Erstellt:     %ROOT%\%FILE%
exit /b
