Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 29_pong.bas
Rem Titel: Kapitel 29: Pong - das Spiel der Spiele
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 16.08.2026
Rem
Rem Beschreibung:
Rem
Rem Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
Rem
Rem ====================================================================

Option Continuation Lines On

MODE 2

Const SCHLAEGERBREITE=6
Const SCHLAEGERHOEHE=50
Const BALLRADIUS=5

Const SCHLAEGERGESCHWINDIGKEIT=4
Const COMPUTERGESCHWINDIGKEIT=2

Const GEWINNPUNKTE=10

SPIELERX=15
COMPUTERX=MM.HRES-15-SCHLAEGERBREITE

SPIELERY=MM.VRES/2-SCHLAEGERHOEHE/2
COMPUTERY=SPIELERY

SPIELERPUNKTE=0
COMPUTERPUNKTE=0

FRAMEBUFFER CREATE

NeuerBall 1

SPIELEN=1

Do While SPIELEN=1

  TASTE$=UCase$(Inkey$)

  If TASTE$="W" Then
    SPIELERY=SPIELERY-SCHLAEGERGESCHWINDIGKEIT
  EndIf

  If TASTE$="S" Then
    SPIELERY=SPIELERY+SCHLAEGERGESCHWINDIGKEIT
  EndIf

  If TASTE$=Chr$(27) Then
    SPIELEN=0
  EndIf

  BegrenzeSpieler

  BewegeComputer

  BewegeBall

  PruefeWaende

  PruefeSchlaeger

  PruefePunkt

  ZeichneSpiel

  If SPIELERPUNKTE>=GEWINNPUNKTE Or COMPUTERPUNKTE>=GEWINNPUNKTE Then

    ZeigeSpielende

    SPIELERPUNKTE=0
    COMPUTERPUNKTE=0

    SPIELERY=MM.VRES/2-SCHLAEGERHOEHE/2
    COMPUTERY=SPIELERY

    NeuerBall 1

  EndIf

  Pause 10

Loop

FRAMEBUFFER WRITE N
FRAMEBUFFER CLOSE

CLS RGB(BLACK)

Print "Pong wurde beendet."

End



Sub BegrenzeSpieler

  If SPIELERY<0 Then
    SPIELERY=0
  EndIf

  If SPIELERY>MM.VRES-SCHLAEGERHOEHE Then
    SPIELERY=MM.VRES-SCHLAEGERHOEHE
  EndIf

End Sub



Sub BewegeComputer

  MITTE=COMPUTERY+SCHLAEGERHOEHE/2

  If BALLY<MITTE-3 Then
    COMPUTERY=COMPUTERY-COMPUTERGESCHWINDIGKEIT
  ElseIf BALLY>MITTE+3 Then
    COMPUTERY=COMPUTERY+COMPUTERGESCHWINDIGKEIT
  EndIf

  If COMPUTERY<0 Then
    COMPUTERY=0
  EndIf

  If COMPUTERY>MM.VRES-SCHLAEGERHOEHE Then
    COMPUTERY=MM.VRES-SCHLAEGERHOEHE
  EndIf

End Sub



Sub BewegeBall

  BALLX=BALLX+BALLDX
  BALLY=BALLY+BALLDY

End Sub



Sub PruefeWaende

  If BALLY-BALLRADIUS<=0 Then

    BALLY=BALLRADIUS
    BALLDY=-BALLDY

  EndIf

  If BALLY+BALLRADIUS>=MM.VRES-1 Then

    BALLY=MM.VRES-1-BALLRADIUS
    BALLDY=-BALLDY

  EndIf

End Sub



Sub PruefeSchlaeger

  If BALLDX<0 Then

    If BALLX-BALLRADIUS <= SPIELERX+SCHLAEGERBREITE Then

      If BALLX>=SPIELERX Then

        If BALLY>=SPIELERY And BALLY<=SPIELERY+SCHLAEGERHOEHE Then

          BALLX=SPIELERX+SCHLAEGERBREITE+BALLRADIUS

          BALLDX=-BALLDX

          TREFFER=(BALLY-(SPIELERY+SCHLAEGERHOEHE/2)) / (SCHLAEGERHOEHE/2)

          BALLDY=BALLDY+TREFFER*2

          BegrenzeBallgeschwindigkeit

        EndIf

      EndIf

    EndIf

  EndIf

  If BALLDX>0 Then

    If BALLX+BALLRADIUS>=COMPUTERX Then

      If BALLX<=COMPUTERX+SCHLAEGERBREITE Then

        If BALLY>=COMPUTERY And BALLY<=COMPUTERY+SCHLAEGERHOEHE Then

          BALLX=COMPUTERX-BALLRADIUS

          BALLDX=-BALLDX

          TREFFER=(BALLY-(COMPUTERY+SCHLAEGERHOEHE/2)) / (SCHLAEGERHOEHE/2)

          BALLDY=BALLDY+TREFFER*2

          BegrenzeBallgeschwindigkeit

        EndIf

      EndIf

    EndIf

  EndIf

End Sub



Sub BegrenzeBallgeschwindigkeit

  If BALLDY>5 Then
    BALLDY=5
  EndIf

  If BALLDY<-5 Then
    BALLDY=-5
  EndIf

End Sub



Sub PruefePunkt

  If BALLX<0 Then

    COMPUTERPUNKTE=COMPUTERPUNKTE+1

    ZeigePunkt "Punkt fuer den Computer"

    NeuerBall 1

  EndIf

  If BALLX>MM.HRES Then

    SPIELERPUNKTE=SPIELERPUNKTE+1

    ZeigePunkt "Punkt fuer den Spieler"

    NeuerBall -1

  EndIf

End Sub



Sub NeuerBall(RICHTUNG)

  BALLX=MM.HRES/2
  BALLY=MM.VRES/2

  BALLDX=3*RICHTUNG

  BALLDY=Int(Rnd*5)-2

  If BALLDY=0 Then
    BALLDY=1
  EndIf

  Pause 500

End Sub



Sub ZeichneSpiel

  FRAMEBUFFER WRITE F

  CLS RGB(BLACK)

  ZeichneMittellinie

  Box SPIELERX,SPIELERY,SCHLAEGERBREITE,SCHLAEGERHOEHE,0,RGB(WHITE),      RGB(WHITE)

  Box COMPUTERX,COMPUTERY,SCHLAEGERBREITE,SCHLAEGERHOEHE,0,RGB(WHITE),      RGB(WHITE)

  Circle BALLX,BALLY,BALLRADIUS,1,1,RGB(WHITE),RGB(WHITE)

  Text MM.HRES/2-40,20,Str$(SPIELERPUNKTE),"CT",2,2,RGB(WHITE),-1

  Text MM.HRES/2+40,20,Str$(COMPUTERPUNKTE),"CT",2,2,RGB(WHITE),-1

  FRAMEBUFFER COPY F,N,B

End Sub



Sub ZeichneMittellinie

  For Y=0 To MM.VRES-1 Step 20

    Y2=Y+10

    If Y2>MM.VRES-1 Then
      Y2=MM.VRES-1
    EndIf

    Line MM.HRES/2,Y,MM.HRES/2,Y2,1,RGB(GREY)

  Next Y

End Sub



Sub ZeigePunkt(TEXT$)

  FRAMEBUFFER WRITE F

  CLS RGB(BLACK)

  Text MM.HRES/2,MM.VRES/2,TEXT$,"CM",1,1,RGB(YELLOW),-1

  FRAMEBUFFER COPY F,N,B

  Pause 800

End Sub



Sub ZeigeSpielende

  FRAMEBUFFER WRITE F

  CLS RGB(BLACK)

  Text MM.HRES/2,MM.VRES/2-50,"SPIEL BEENDET","CM",2,2,RGB(YELLOW),-1

  If SPIELERPUNKTE>COMPUTERPUNKTE Then

    Text MM.HRES/2,MM.VRES/2,"DU HAST GEWONNEN!","CM",1,2,RGB(GREEN),-1

  Else

    Text MM.HRES/2,MM.VRES/2,"DER COMPUTER GEWINNT","CM",1,2,RGB(RED),-1

  EndIf

  Text MM.HRES/2,MM.VRES/2+45,Str$(SPIELERPUNKTE)+" : "+               Str$(COMPUTERPUNKTE),"CM",2,2,RGB(WHITE),-1

  Text MM.HRES/2,MM.VRES-25,"Taste fuer ein neues Spiel","CB",1,1,RGB(CYAN),-1

  FRAMEBUFFER COPY F,N,B

  Do

    T$=Inkey$

  Loop Until T$<>""

End Sub
