Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 20_formen_demo.bas
Rem Titel: Kapitel 20: Rechtecke, Kreise und Texte
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 28.07.2026
Rem
Rem Beschreibung: BOX, RBOX, CIRCLE, ARC und TEXT
Rem
Rem Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
Rem
Rem ====================================================================

CLS RGB(BLACK)
Print "3. Ein Rechteck zeichnen"
Box 50,40,200,100

Print "Press any key...": Do : Loop While Inkey$=""

Print "4. Die Parameter von BOX"
Print "BOX X,Y,BREITE,HOEHE,LINIENBREITE,FARBE,FUELLFARBE"

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "5. Ein farbiges Rechteck"
Box 50,40,200,100,3,RGB(YELLOW),RGB(BLUE)

Print "Press any key...": Do : Loop While Inkey$=""

Print "6. Ein Rechteck ohne Fuellung"
Box 50,40,200,100,3,RGB(YELLOW)

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "7. Mehrere Rechtecke zeichnen"
Box 20,20,100,60,2,RGB(RED)
Box 50,50,100,60,2,RGB(GREEN)
Box 80,80,100,60,2,RGB(BLUE)

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "8. Abgerundete Rechtecke"
Print "RBOX X,Y,BREITE,HOEHE,RADIUS,FARBE,FUELLFARBE"
RBox 50,50,220,80,15,RGB(WHITE),RGB(BLUE)

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "9. Ein grafischer Schalter"
RBox 100,80,200,70,12,RGB(WHITE),RGB(GREEN)
Text 200,115,"START","CM"

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "10. Einen Kreis zeichnen"
Print "CIRCLE X,Y,RADIUS,LINIENBREITE,SEITENVERHAELTNIS,FARBE,FUELLFARBE"
Circle 160,120,50

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "11. Einen farbigen Kreis zeichnen"
Circle 160,120,50,3,1,RGB(YELLOW),RGB(BLUE)

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "12. Ellipsen zeichnen"
Circle 160,120,60,2,0.5,RGB(YELLOW)

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "13. Ein einfaches Ziel"
X=MM.HRES/2
Y=MM.VRES/2
Circle X,Y,100,2,1,RGB(WHITE)
Circle X,Y,75,2,1,RGB(YELLOW)
Circle X,Y,50,2,1,RGB(RED)
Circle X,Y,25,2,1,RGB(GREEN)

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "14. Kreisboegen zeichnen"
Print "ARC X,Y,INNENRADIUS,AUSSENRADIUS,STARTWINKEL,ENDWINKEL,FARBE"
Arc 160,120,45,55,0,180,RGB(YELLOW)

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "15. Mehrere Kreisboegen kombinieren"
X=MM.HRES/2
Y=MM.VRES/2
Arc X,Y,40,50,0,90,RGB(RED)
Arc X,Y,40,50,90,180,RGB(GREEN)
Arc X,Y,40,50,180,270,RGB(BLUE)
Arc X,Y,40,50,270,360,RGB(YELLOW)

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "16. Texte frei positionieren"
Print "TEXT X,Y,""Text"""
Text 50,40,"Hallo MMBasic"

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "17. Text ausrichten"
Print
Print "TEXT X,Y,""Text"",""AUSRICHTUNG"""
Print "Fuer die horizontale Ausrichtung stehen zur Verfuegung:"
Print "Buchstabe Bedeutung"
Print "L Linksbuendig"
Print "C Zentriert"
Print "R Rechtsbuendig"
Print "Fuer die vertikale Ausrichtung stehen zur Verfuegung:"
Print "Buchstabe Bedeutung"
Print "T Oben"
Print "M Mittig"
Print "B Unten"

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "18. Text in der Bildschirmmitte"
CLS RGB(BLACK)
Text MM.HRES/2,MM.VRES/2,"Hallo MMBasic","CM"

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "19. Schriftart und Skalierung"
Print "Schriftart 2, Skalierungsfaktor 2"
Text 100,80,"MMBasic","LT",2,2

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "20. Farbiger Text"
Text 100,80,"MMBasic","LT",2,2,RGB(YELLOW),RGB(BLUE)

Print "Press any key...": Do : Loop While Inkey$=""

Print "21. Transparenter Hintergrund"
Text 100,80,"MMBasic","LT",2,2,RGB(YELLOW),-1

Print "Press any key...": Do : Loop While Inkey$=""

Print "22. Text drehen"
Print "Ein dritter Buchstabe in der Ausrichtung legt die Orientierung des Textes fest."
Print "Buchstabe Ausrichtung"
Print "N Normal"
Print "V Buchstaben senkrecht untereinander"
Print "I Um 180 Grad gedreht"
Print "U Um 90 Grad gegen den Uhrzeigersinn gedreht"
Print "D Um 90 Grad im Uhrzeigersinn gedreht"
CLS RGB(BLACK)
Text 20,MM.VRES/2,"MMBasic","LMV",2

Print "Press any key...": Do : Loop While Inkey$=""

Print "23. Eine einfache Informationskarte"
CLS RGB(BLACK)
X=MM.HRES/2-150
Y=MM.VRES/2-70
RBox X,Y,300,140,15,RGB(WHITE),RGB(BLUE)
Text MM.HRES/2,Y+35,"MMBasic","CM",2,1,RGB(YELLOW),RGB(BLUE)
Text MM.HRES/2,Y+75,Date$,"CM",1,1,RGB(WHITE),RGB(BLUE)
Text MM.HRES/2,Y+105,Time$,"CM",1,1,RGB(CYAN),RGB(BLUE)

Print "Press any key...": Do : Loop While Inkey$=""

Print "24. Ein einfaches Gesicht"
CLS RGB(BLACK)
X=MM.HRES/2
Y=MM.VRES/2
Circle X,Y,100,3,1,RGB(YELLOW)
Circle X-35,Y-30,10,1,1,RGB(WHITE),RGB(WHITE)
Circle X+35,Y-30,10,1,1,RGB(WHITE),RGB(WHITE)
Arc X,Y+10,45,50,120,240,RGB(YELLOW)

Print "Press any key...": Do : Loop While Inkey$=""

Print "25. Experimentiere!"
Print "Probiere folgende Aenderungen aus:"
Print "- Zeichne Rechtecke mit verschiedenen Rahmenbreiten."
Print "- Verwende unterschiedliche Fuellfarben."
Print "- Erzeuge Kreise mit verschiedenen Radien."
Print "- Zeichne Ellipsen mit unterschiedlichen Seitenverhaeltnissen."
Print "- Positioniere Texte an verschiedenen Bildschirmraendern."
Print "- Drehe einen Text in alle verfuegbaren Richtungen."

Print "Press any key...": Do : Loop While Inkey$=""

Print "26. Probier's selbst!"
Print "Versuche folgende Aufgaben:"
Print "1. Zeichne eine Ampel aus einem Rechteck und drei Kreisen."
Print "2. Gestalte eine Schaltflaeche mit RBOX und TEXT."
Print "3. Zeichne eine Zielscheibe."
Print "4. Erzeuge eine digitale Uhr mit Rahmen."
Print "5. Zeichne ein einfaches Gesicht."
Print "6. Erstelle eine kleine Visitenkarte mit deinem Namen."
