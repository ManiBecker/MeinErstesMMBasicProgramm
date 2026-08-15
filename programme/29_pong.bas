REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 29_pong.bas
REM Titel: Kapitel 29: Pong - das Spiel der Spiele
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 15.08.2026
REM
REM Beschreibung:
REM
REM Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
REM
REM ====================================================================

Option Continuation Lines On

MODE 2

CONST SCHLAEGERBREITE=6
CONST SCHLAEGERHOEHE=50
CONST BALLRADIUS=5

CONST SCHLAEGERGESCHWINDIGKEIT=4
CONST COMPUTERGESCHWINDIGKEIT=2

CONST GEWINNPUNKTE=10

SPIELERX=15
COMPUTERX=MM.HRES-15-SCHLAEGERBREITE

SPIELERY=MM.VRES/2-SCHLAEGERHOEHE/2
COMPUTERY=SPIELERY

SPIELERPUNKTE=0
COMPUTERPUNKTE=0

FRAMEBUFFER CREATE

NeuerBall 1

SPIELEN=1

DO WHILE SPIELEN=1

  TASTE$=UCASE$(INKEY$)

  IF TASTE$="W" THEN
    SPIELERY=SPIELERY-SCHLAEGERGESCHWINDIGKEIT
  ENDIF

  IF TASTE$="S" THEN
    SPIELERY=SPIELERY+SCHLAEGERGESCHWINDIGKEIT
  ENDIF

  IF TASTE$=CHR$(27) THEN
    SPIELEN=0
  ENDIF

  BegrenzeSpieler

  BewegeComputer

  BewegeBall

  PruefeWaende

  PruefeSchlaeger

  PruefePunkt

  ZeichneSpiel

  IF SPIELERPUNKTE>=GEWINNPUNKTE OR          _
     COMPUTERPUNKTE>=GEWINNPUNKTE THEN

    ZeigeSpielende

    SPIELERPUNKTE=0
    COMPUTERPUNKTE=0

    SPIELERY=MM.VRES/2-SCHLAEGERHOEHE/2
    COMPUTERY=SPIELERY

    NeuerBall 1

  ENDIF

  PAUSE 10

LOOP

FRAMEBUFFER WRITE N
FRAMEBUFFER CLOSE

CLS RGB(BLACK)

PRINT "Pong wurde beendet."

END



SUB BegrenzeSpieler

  IF SPIELERY<0 THEN
    SPIELERY=0
  ENDIF

  IF SPIELERY>MM.VRES-SCHLAEGERHOEHE THEN
    SPIELERY=MM.VRES-SCHLAEGERHOEHE
  ENDIF

END SUB



SUB BewegeComputer

  MITTE=COMPUTERY+SCHLAEGERHOEHE/2

  IF BALLY<MITTE-3 THEN
    COMPUTERY=COMPUTERY-COMPUTERGESCHWINDIGKEIT
  ELSEIF BALLY>MITTE+3 THEN
    COMPUTERY=COMPUTERY+COMPUTERGESCHWINDIGKEIT
  ENDIF

  IF COMPUTERY<0 THEN
    COMPUTERY=0
  ENDIF

  IF COMPUTERY>MM.VRES-SCHLAEGERHOEHE THEN
    COMPUTERY=MM.VRES-SCHLAEGERHOEHE
  ENDIF

END SUB



SUB BewegeBall

  BALLX=BALLX+BALLDX
  BALLY=BALLY+BALLDY

END SUB



SUB PruefeWaende

  IF BALLY-BALLRADIUS<=0 THEN

    BALLY=BALLRADIUS
    BALLDY=-BALLDY

  ENDIF

  IF BALLY+BALLRADIUS>=MM.VRES-1 THEN

    BALLY=MM.VRES-1-BALLRADIUS
    BALLDY=-BALLDY

  ENDIF

END SUB



SUB PruefeSchlaeger

  IF BALLDX<0 THEN

    IF BALLX-BALLRADIUS<=                    _
       SPIELERX+SCHLAEGERBREITE THEN

      IF BALLX>=SPIELERX THEN

        IF BALLY>=SPIELERY AND               _
           BALLY<=SPIELERY+SCHLAEGERHOEHE THEN

          BALLX=SPIELERX+                    _
                SCHLAEGERBREITE+BALLRADIUS

          BALLDX=-BALLDX

          TREFFER=(BALLY-                    _
                   (SPIELERY+                _
                    SCHLAEGERHOEHE/2)) /     _
                  (SCHLAEGERHOEHE/2)

          BALLDY=BALLDY+TREFFER*2

          BegrenzeBallgeschwindigkeit

        ENDIF

      ENDIF

    ENDIF

  ENDIF

  IF BALLDX>0 THEN

    IF BALLX+BALLRADIUS>=COMPUTERX THEN

      IF BALLX<=COMPUTERX+SCHLAEGERBREITE THEN

        IF BALLY>=COMPUTERY AND              _
           BALLY<=COMPUTERY+SCHLAEGERHOEHE THEN

          BALLX=COMPUTERX-BALLRADIUS

          BALLDX=-BALLDX

          TREFFER=(BALLY-                    _
                   (COMPUTERY+               _
                    SCHLAEGERHOEHE/2)) /     _
                  (SCHLAEGERHOEHE/2)

          BALLDY=BALLDY+TREFFER*2

          BegrenzeBallgeschwindigkeit

        ENDIF

      ENDIF

    ENDIF

  ENDIF

END SUB



SUB BegrenzeBallgeschwindigkeit

  IF BALLDY>5 THEN
    BALLDY=5
  ENDIF

  IF BALLDY<-5 THEN
    BALLDY=-5
  ENDIF

END SUB



SUB PruefePunkt

  IF BALLX<0 THEN

    COMPUTERPUNKTE=COMPUTERPUNKTE+1

    ZeigePunkt "Punkt fuer den Computer"

    NeuerBall 1

  ENDIF

  IF BALLX>MM.HRES THEN

    SPIELERPUNKTE=SPIELERPUNKTE+1

    ZeigePunkt "Punkt fuer den Spieler"

    NeuerBall -1

  ENDIF

END SUB



SUB NeuerBall(RICHTUNG)

  BALLX=MM.HRES/2
  BALLY=MM.VRES/2

  BALLDX=3*RICHTUNG

  BALLDY=INT(RND*5)-2

  IF BALLDY=0 THEN
    BALLDY=1
  ENDIF

  PAUSE 500

END SUB



SUB ZeichneSpiel

  FRAMEBUFFER WRITE F

  CLS RGB(BLACK)

  ZeichneMittellinie

  BOX SPIELERX,SPIELERY,                    _
      SCHLAEGERBREITE,SCHLAEGERHOEHE,       _
      0,RGB(WHITE),RGB(WHITE)

  BOX COMPUTERX,COMPUTERY,                  _
      SCHLAEGERBREITE,SCHLAEGERHOEHE,       _
      0,RGB(WHITE),RGB(WHITE)

  CIRCLE BALLX,BALLY,BALLRADIUS,            _
         1,1,RGB(WHITE),RGB(WHITE)

  TEXT MM.HRES/2-40,20,                     _
       STR$(SPIELERPUNKTE),                 _
       "CT",2,2,RGB(WHITE),-1

  TEXT MM.HRES/2+40,20,                     _
       STR$(COMPUTERPUNKTE),                _
       "CT",2,2,RGB(WHITE),-1

  FRAMEBUFFER COPY F,N,B

END SUB



SUB ZeichneMittellinie

  FOR Y=0 TO MM.VRES-1 STEP 20

    Y2=Y+10

    IF Y2>MM.VRES-1 THEN
      Y2=MM.VRES-1
    ENDIF

    LINE MM.HRES/2,Y,                       _
         MM.HRES/2,Y2,                     _
         1,RGB(GREY)

  NEXT Y

END SUB



SUB ZeigePunkt(TEXT$)

  FRAMEBUFFER WRITE F

  CLS RGB(BLACK)

  TEXT MM.HRES/2,MM.VRES/2,                 _
       TEXT$,"CM",1,2,RGB(YELLOW),-1

  FRAMEBUFFER COPY F,N,B

  PAUSE 800

END SUB



SUB ZeigeSpielende

  FRAMEBUFFER WRITE F

  CLS RGB(BLACK)

  TEXT MM.HRES/2,MM.VRES/2-50,              _
       "SPIEL BEENDET",                     _
       "CM",2,2,RGB(YELLOW),-1

  IF SPIELERPUNKTE>COMPUTERPUNKTE THEN

    TEXT MM.HRES/2,MM.VRES/2,               _
         "DU HAST GEWONNEN!",               _
         "CM",1,2,RGB(GREEN),-1

  ELSE

    TEXT MM.HRES/2,MM.VRES/2,               _
         "DER COMPUTER GEWINNT",            _
         "CM",1,2,RGB(RED),-1

  ENDIF

  TEXT MM.HRES/2,MM.VRES/2+45,              _
       STR$(SPIELERPUNKTE)+" : "+           _
       STR$(COMPUTERPUNKTE),                _
       "CM",2,2,RGB(WHITE),-1

  TEXT MM.HRES/2,MM.VRES-25,                _
       "Taste fuer ein neues Spiel",        _
       "CB",1,1,RGB(CYAN),-1

  FRAMEBUFFER COPY F,N,B

  DO

    T$=INKEY$

  LOOP UNTIL T$<>""

END SUB
