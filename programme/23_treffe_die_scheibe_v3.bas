REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 23_treffe_die_scheibe_v3.bas
REM Titel: Kapitel 23: Treffe die Scheibe Version 3
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 28.07.2026
REM
REM Beschreibung: Unser erstes Grafikspiel, Version 3
REM
REM Hardware/Voraussetzungen: keine/PicoMite/ColourMaxiMite
REM
REM ====================================================================

MODE 2

INPUT "Name ";NAME$

PRINT
PRINT "1 = Leicht"
PRINT "2 = Mittel"
PRINT "3 = Schwer"

INPUT "Schwierigkeit ";LEVEL

IF LEVEL=1 THEN
  RADIUS=60
ELSEIF LEVEL=2 THEN
  RADIUS=40
ELSE
  RADIUS=25
ENDIF

DIM TREFFER(9)
DIM PUNKTE(9)

GESAMTPUNKTE=0

FOR RUNDE=1 TO 10

  CLS RGB(BLACK)

  TX=INT(RND*(MM.HRES-2*RADIUS))+RADIUS
  TY=INT(RND*(MM.VRES-2*RADIUS))+RADIUS

  ZeichneScheibe TX,TY,RADIUS

  TEXT MM.HRES/2,15,"Schuss "+STR$(RUNDE)+" von 10","CT",1,1,RGB(WHITE),-1
  TEXT MM.HRES/2,MM.VRES-20,"Klicke auf die Zielscheibe","CB",1,1,RGB(YELLOW),-1

  DO
  LOOP UNTIL MOUSE(L)<>0

  SX=MOUSE(X)
  SY=MOUSE(Y)

  DO
  LOOP UNTIL MOUSE(L)=0

  DIST=SQR((SX-TX)^2+(SY-TY)^2)

  TREFFER(RUNDE-1)=DIST

  PUNKTE(RUNDE-1)=100-INT(DIST)

  IF PUNKTE(RUNDE-1)<0 THEN
    PUNKTE(RUNDE-1)=0
  ENDIF

  GESAMTPUNKTE=GESAMTPUNKTE+PUNKTE(RUNDE-1)

  ZeichneTreffer SX,SY

  TEXT MM.HRES/2,MM.VRES-55, _
       STR$(INT(DIST))+" Pixel entfernt","CB", _
       1,1,RGB(WHITE),-1

  TEXT MM.HRES/2,MM.VRES-35, _
       STR$(PUNKTE(RUNDE-1))+" Punkte","CB", _
       1,1,RGB(CYAN),-1

  IF DIST<=RADIUS*0.33 THEN
    TEXT MM.HRES/2,MM.VRES/2, _
         "VOLLTREFFER!","CM",2,2,RGB(YELLOW),-1
  ELSEIF DIST<=RADIUS*0.66 THEN
    TEXT MM.HRES/2,MM.VRES/2, _
         "SEHR GUT!","CM",2,2,RGB(GREEN),-1
  ELSEIF DIST<=RADIUS THEN
    TEXT MM.HRES/2,MM.VRES/2, _
         "GETROFFEN!","CM",2,2,RGB(CYAN),-1
  ELSE
   TEXT MM.HRES/2,MM.VRES/2, _
        "DANEBEN!","CM",2,2,RGB(RED),-1
  ENDIF

  PAUSE 1500

NEXT RUNDE

ZeigeAuswertung

SpeichereErgebnis

END

SUB ZeichneScheibe(X,Y,R)
  CIRCLE X,Y,R,2,1,RGB(WHITE),RGB(BLUE)
  CIRCLE X,Y,R*0.66,2,1,RGB(WHITE),RGB(RED)
  CIRCLE X,Y,R*0.33,2,1,RGB(WHITE),RGB(YELLOW)
  CIRCLE X,Y,3,1,1,RGB(BLACK),RGB(BLACK)
END SUB

SUB ZeichneTreffer(X,Y)
  LINE X-7,Y,X+7,Y,2,RGB(WHITE)
  LINE X,Y-7,X,Y+7,2,RGB(WHITE)
  CIRCLE X,Y,4,1,1,RGB(BLACK),RGB(RED)
END SUB

SUB ZeigeAuswertung
  CLS RGB(BLACK)
  TEXT MM.HRES/2,20,"SPIEL BEENDET","CT",2,2,RGB(YELLOW),-1
  TEXT MM.HRES/2,65,NAME$,"CT",1,2,RGB(WHITE),-1
  TEXT MM.HRES/2,100, _
       "Gesamtpunkte: "+STR$(GESAMTPUNKTE), _
       "CT",1,2,RGB(CYAN),-1
  BEST=TREFFER(0)
  SUMME=0
  FOR I=0 TO 9
    SUMME=SUMME+TREFFER(I)
    IF TREFFER(I)<BEST THEN
      BEST=TREFFER(I)
    ENDIF
  NEXT I

  DURCHSCHNITT=SUMME/10
  TEXT MM.HRES/2,135, _
       "Bester Schuss: "+STR$(INT(BEST))+" Pixel",_
       "CT",1,1,RGB(GREEN),-1
  TEXT MM.HRES/2,160, _
       "Durchschnitt: "+ _
       STR$(INT(DURCHSCHNITT))+" Pixel", _
       "CT",1,1,RGB(WHITE),-1
  Y=200
  FOR I=0 TO 9
    TEXT MM.HRES/2,Y, _
         STR$(I+1)+". Schuss: "+ _
         STR$(INT(TREFFER(I)))+" Pixel, "+ _
         STR$(PUNKTE(I))+" Punkte", _
         "CT",1,1,RGB(WHITE),-1
    Y=Y+18
  NEXT I
END SUB

SUB SpeichereErgebnis
  OPEN "highscore.txt" FOR APPEND AS #1
  WRITE #1,DATE$,TIME$,NAME$,LEVEL,GESAMTPUNKTE
  CLOSE #1
END SUB
