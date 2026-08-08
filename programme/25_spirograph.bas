Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 25_spirograph.bas
Rem Titel: Kapitel 25: Geometrische Muster und Spirographen
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 29.07.2026
Rem
Rem Beschreibung:
Rem
Rem Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
Rem
Rem ====================================================================

MODE 3

CLS RGB(BLACK)
Print "4. Ein Kreis aus Punkten"
MX=MM.HRES/2
MY=MM.VRES/2
For I=0 To 360
  W=I*Pi/180
  X=MX+Sin(W)*100
  Y=MY-Cos(W)*100
  Pixel X,Y,RGB(YELLOW)
Next I

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "5. Ein Sonnenstrahlen-Muster"
MX=MM.HRES/2
MY=MM.VRES/2
For I=0 To 360 Step 5
  W=I*Pi/180
  X=MX+Sin(W)*150
  Y=MY-Cos(W)*150
  Line MX,MY,X,Y,,RGB(YELLOW)
Next I

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "6. Ein Stern"
MX=MM.HRES/2
MY=MM.VRES/2
Dim ax1(4)
Dim ay1(4)
For I=0 To 4
  W=I*72*Pi/180
  ax1(I)=MX+Sin(W)*120
  ay1(I)=MY-Cos(W)*120
Next I
For I=0 To 4
  J=(I+2) Mod 5
  Line ax1(I),ay1(I),ax1(J),ay1(J),,RGB(CYAN)
Next I

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "7. Ein Stern mit zehn Spitzen"
MX=MM.HRES/2
MY=MM.VRES/2
Dim ax2(9)
Dim ay2(9)
For I=0 To 9
  W=I*36*Pi/180
  ax2(I)=MX+Sin(W)*150
  ay2(I)=MY-Cos(W)*150
Next I
For I=0 To 9
  J=(I+3) Mod 10
  Line ax2(I),ay2(I),ax2(J),ay2(J),,RGB(GREEN)
Next I

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "8. Eine Rosette"
MX=MM.HRES/2
MY=MM.VRES/2
For I=0 To 355 Step 5
  W1=I*Pi/180
  W2=(I*3)*Pi/180
  X1=MX+Sin(W1)*150
  Y1=MY-Cos(W1)*150
  X2=MX+Sin(W2)*150
  Y2=MY-Cos(W2)*150
  Line X1,Y1,X2,Y2,,RGB(YELLOW)
Next I

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "9. Farben ins Spiel bringen"
MX=MM.HRES/2
MY=MM.VRES/2
For i=1 To 3600
  W=Rnd*360*Pi/180
  X=MX+Sin(W)*100
  Y=MY-Cos(W)*100
  FARBE=RGB( Int(Rnd*256), Int(Rnd*256), Int(Rnd*256))
  Pixel X,Y,FARBE
Next i

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "10. Ein einfacher Spirograph"
MX=MM.HRES/2
MY=MM.VRES/2
For I=0 To 1440 Step 2
  W=I*Pi/180
  X=MX+Cos(W)*150+Cos(W*5)*40
  Y=MY+Sin(W)*150+Sin(W*5)*40
  FARBE=RGB( Int(Rnd*256), Int(Rnd*256), Int(Rnd*256))
  Pixel X,Y,FARBE
Next I

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "11. Das Muster veraendern"
MX=MM.HRES/2
MY=MM.VRES/2
For I=0 To 1440 Step 2
  W=I*Pi/180
  X=MX+Cos(W)*140+Cos(W*9)*30
  Y=MY+Sin(W)*140+Sin(W*9)*30
  FARBE=RGB( Int(Rnd*256), Int(Rnd*256), Int(Rnd*256))
  Pixel X,Y,FARBE
Next I

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "12. Ein spektakulaerer Spirograph"
MX=MM.HRES/2
MY=MM.VRES/2
For I=0 To 3600 Step 1
  W=I*Pi/180
  X=MX+Cos(W)*120+Cos(W*7)*50
  Y=MY+Sin(W)*120+Sin(W*7)*50
  FARBE=RGB( Int(Rnd*256), Int(Rnd*256), Int(Rnd*256))
  Pixel X,Y,FARBE
Next I

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "13. Ein Blumenmuster"
MX=MM.HRES/2
MY=MM.VRES/2
For I=0 To 3600
  W=I*Pi/180
  R=120+40*Sin(W*8)
  X=MX+Cos(W)*R
  Y=MY+Sin(W)*R
  FARBE=RGB( Int(Rnd*256), Int(Rnd*256), Int(Rnd*256))
  Pixel X,Y,FARBE
Next I

Print "Ready..."
