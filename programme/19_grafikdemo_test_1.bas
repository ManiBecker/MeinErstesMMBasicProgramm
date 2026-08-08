Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 19_grafikdemo_test_1.bas
Rem Titel: Kapitel 19: Die ersten Grafikbefehle
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 28.07.2026
Rem
Rem Beschreibung: Ein kleines Grafik-Testprogramm
Rem
Rem Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
Rem
Rem ====================================================================

MODE 2

CLS RGB(BLACK)
Print "1000 zufaellige Punkte"
For I=1 To 1000
  X=Int(Rnd*MM.HRES)
  Y=2*MM.Info(FONTHEIGHT)+Int(Rnd*MM.VRES)
  FARBE=RGB(Int(Rnd*256),Int(Rnd*256),Int(Rnd*256))
  Pixel X,Y,FARBE
Next I

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "1000 zufaellige Linien"
For I=1 To 1000
  X1=Int(Rnd*MM.HRES)
  Y1=2*MM.Info(FONTHEIGHT)+Int(Rnd*MM.VRES)
  X2=Int(Rnd*MM.HRES)
  Y2=2*MM.Info(FONTHEIGHT)+Int(Rnd*MM.VRES)
  LW=Int(Rnd*3)+1
  FARBE=RGB(Int(Rnd*256),Int(Rnd*256),Int(Rnd*256))
  Line X1,Y1,X2,Y2,LW,FARBE
Next I

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "1000 zufaellige Kreise"
For I=1 To 1000
  RADIUS=Int(Rnd*20)+2
  X=Int(Rnd*(MM.HRES-2*RADIUS))+RADIUS
  Y=2*MM.Info(FONTHEIGHT)+Int(Rnd*(MM.VRES-2*RADIUS))+RADIUS
  FARBE1=RGB(Int(Rnd*256),Int(Rnd*256),Int(Rnd*256))
  FARBE2=RGB(Int(Rnd*256),Int(Rnd*256),Int(Rnd*256))
  Circle X,Y,RADIUS,1,1,FARBE1,FARBE2
Next I

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "1000 zufaellige Rechtecke"
For I=1 To 1000
  BREITE=Int(Rnd*50)+5
  HOEHE=Int(Rnd*50)+5
  X=Int(Rnd*(MM.HRES-BREITE))
  Y=2*MM.Info(FONTHEIGHT)+Int(Rnd*(MM.VRES-HOEHE))
  FARBE1=RGB(Int(Rnd*256),Int(Rnd*256),Int(Rnd*256))
  FARBE2=RGB(Int(Rnd*256),Int(Rnd*256),Int(Rnd*256))
  Box X,Y,BREITE,HOEHE,1,FARBE1,FARBE2
Next I

Print "Ready..."
