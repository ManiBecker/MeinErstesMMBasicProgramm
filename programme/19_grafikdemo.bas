Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 19_grafikdemo.bas
Rem Titel: Kapitel 19: Die ersten Grafikbefehle
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 28.07.2026
Rem
Rem Beschreibung: Pixel und Linien zeichnen
Rem
Rem Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
Rem
Rem ====================================================================

MODE 2

CLS
Print "3. Den Bildschirm loeschen"

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "4. Ein einzelner Pixel"
Pixel 100,100

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "5. Ein farbiger Pixel"
Pixel 100,100,RGB(RED)

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "6. Unser erstes Grafikprogramm"
Pixel 100,100,RGB(RED)

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "7. Mehrere Pixel zeichnen"
Pixel  96,100,RGB(YELLOW)
Pixel  98,100,RGB(GREEN)
Pixel 100,100,RGB(RED)
Pixel 102,100,RGB(WHITE)
Pixel 104,100,RGB(BLUE)

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "8. Linien zeichnen"
Line 0,20,100,20

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "9. Horizontale Linien"
Line 10,50,200,50

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "10. Vertikale Linien"
Line 100,20,100,200

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "11. Diagonale Linien"
Line 10,10,200,150

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "12. Linienfarben"
Line 10,10,200,100,,RGB(RED)

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "13. Mehrere Linien kombinieren"
Line 50,100,250,100
Line 150,20,150,180

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "14. Ein Dreieck zeichnen"
Line 100,50,50,150
Line 50,150,150,150
Line 150,150,100,50

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "15. Ein Haus zeichnen"
Line 50,150,150,150
Line 150,150,150,80
Line 150,80,50,80
Line 50,80,50,150
Line 50,80,100,30
Line 100,30,150,80

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "16. Das Haus vom Nikolaus"
Print "Eine bekannte Zeichenuebung ist das Haus vom Nikolaus."
Print "Versuche, es selbst mit LINE zu zeichnen."

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "17. Bildschirmmitte berechnen"
MITTEX=MM.HRES/2
MITTEY=MM.VRES/2
Pixel MITTEX,MITTEY,RGB(RED)

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "18. Ein Fadenkreuz zeichnen"
Line MM.HRES/2,0,MM.HRES/2,MM.VRES
Line 0,MM.VRES/2,MM.HRES,MM.VRES/2

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "19. Ein kleines Grafik-Testprogramm"
Print "Lade 19_grafikdemo_test_1.bas"
Print
Print "Press any key...": Do : Loop While Inkey$=""

Print "21. Probier's selbst!"
Print
Print "Versuche folgende Aufgaben:"
Print "1. Zeichne ein Quadrat aus vier Linien."
Print "2. Zeichne einen Stern."
Print "3. Zeichne ein eigenes Haus."
Print "4. Zeichne ein Spielfeld fuer Tic-Tac-Toe."
Print "5. Zeichne die Umrisse eines Briefumschlags."

Print "Press any key...": Do : Loop While Inkey$=""

Print "22. Experimentiere!"
Print
Print "Probiere folgende Aenderungen aus:"
Print "- Verwende andere Farben."
Print "- Zeichne ein groesseres Haus."
Print "- Zeichne mehrere Dreiecke."
Print "- Zeichne ein Gitter aus Linien."
Print
Print "Ready..."
