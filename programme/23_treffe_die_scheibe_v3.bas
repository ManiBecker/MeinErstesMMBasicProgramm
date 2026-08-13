Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 23_treffe_die_scheibe_v3.bas
Rem Titel: Kapitel 23: Treffe die Scheibe Version 3
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 14.08.2026
Rem
Rem Beschreibung: Unser erstes Grafikspiel, Version 3
Rem
Rem Hardware/Voraussetzungen: keine/PicoMite/ColourMaxiMite
Rem
Rem ====================================================================

Option Continuation Lines On
MODE 2

Input "Name ";NAME$

Print
Print "1 = Leicht"
Print "2 = Mittel"
Print "3 = Schwer"

Input "Schwierigkeit ";LEVEL

If LEVEL=1 Then
  RADIUS=60
ElseIf LEVEL=2 Then
  RADIUS=40
Else
  RADIUS=25
EndIf

Dim TREFFER(9)
Dim PUNKTE(9)

GESAMTPUNKTE=0

For RUNDE=1 To 10

  CLS RGB(BLACK)

  TX=Int(Rnd*(MM.HRES-2*RADIUS))+RADIUS
  TY=Int(Rnd*(MM.VRES-2*RADIUS))+RADIUS

  ZeichneScheibe TX,TY,RADIUS

  Text MM.HRES/2,15,"Schuss "+Str$(RUNDE)+" von 10","CT",1,1,RGB(WHITE),-1
  Text MM.HRES/2,MM.VRES-20,"Klicke auf die Zielscheibe","CB",1,1,RGB(YELLOW),-1

  Do
  Loop Until DEVICE(MOUSE 2, L)<>0

  SX=DEVICE(MOUSE 2, X)
  SY=DEVICE(MOUSE 2, Y)

  Do
  Loop Until DEVICE(MOUSE 2, L)=0

  DIST=Sqr((SX-TX)^2+(SY-TY)^2)

  TREFFER(RUNDE-1)=DIST

  PUNKTE(RUNDE-1)=100-Int(DIST)

  If PUNKTE(RUNDE-1)<0 Then
    PUNKTE(RUNDE-1)=0
  EndIf

  GESAMTPUNKTE=GESAMTPUNKTE+PUNKTE(RUNDE-1)

  ZeichneTreffer SX,SY

  t$=Str$(Int(DIST))+" Pixel entfernt"
  Text MM.HRES/2,MM.VRES-55,t$,"CB",1,1,RGB(WHITE),-1
  t$=Str$(PUNKTE(RUNDE-1))+" Punkte"
  Text MM.HRES/2,MM.VRES-35,t$,"CB",1,1,RGB(CYAN),-1

  If DIST<=RADIUS*0.33 Then
    Text MM.HRES/2,MM.VRES/2,"VOLLTREFFER!","CM",2,2,RGB(YELLOW),-1
  ElseIf DIST<=RADIUS*0.66 Then
    Text MM.HRES/2,MM.VRES/2,"SEHR GUT!","CM",2,2,RGB(GREEN),-1
  ElseIf DIST<=RADIUS Then
    Text MM.HRES/2,MM.VRES/2,"GETROFFEN!","CM",2,2,RGB(CYAN),-1
  Else
   Text MM.HRES/2,MM.VRES/2,"DANEBEN!","CM",2,2,RGB(RED),-1
  EndIf

  Pause 1500

Next RUNDE

ZeigeAuswertung

SpeichereErgebnis

End

Sub ZeichneScheibe(X,Y,R)
  Circle X,Y,R,2,1,RGB(WHITE),RGB(BLUE)
  Circle X,Y,R*0.66,2,1,RGB(WHITE),RGB(RED)
  Circle X,Y,R*0.33,2,1,RGB(WHITE),RGB(YELLOW)
  Circle X,Y,3,1,1,RGB(BLACK),RGB(BLACK)
End Sub

Sub ZeichneTreffer(X,Y)
  Line X-7,Y,X+7,Y,2,RGB(WHITE)
  Line X,Y-7,X,Y+7,2,RGB(WHITE)
  Circle X,Y,4,1,1,RGB(BLACK),RGB(RED)
End Sub

Sub ZeigeAuswertung
  MODE 3
  CLS RGB(BLACK)
  Text MM.HRES/2,20,"SPIEL BEENDET","CT",2,2,RGB(YELLOW),-1
  Text MM.HRES/2,65,NAME$,"CT",1,2,RGB(WHITE),-1
  Text MM.HRES/2,100,"Gesamtpunkte: "+Str$(GESAMTPUNKTE),"CT",1,2,RGB(CYAN),-1
  BEST=TREFFER(0)
  SUMME=0
  For I=0 To 9
    SUMME=SUMME+TREFFER(I)
    If TREFFER(I)<BEST Then
      BEST=TREFFER(I)
    EndIf
  Next I

  DURCHSCHNITT=SUMME/10
  t$="Bester Schuss: "+Str$(Int(BEST))+" Pixel"
  Text MM.HRES/2,135,t$,"CT",1,1,RGB(GREEN),-1
  t$="Durchschnitt: "+Str$(Int(DURCHSCHNITT))+"Pixel"
  Text MM.HRES/2,160,t$,"CT",1,1,RGB(WHITE),-1
  Y=200
  t1$=". Schuss: "
  t2$=" Pixel, "
  t3$=" Punkte"
  For I=0 To 9
    t$=Str$(I+1)+t1$+Str$(Int(TREFFER(I)))+t2$+Str$(PUNKTE(I))+t3$
    Text MM.HRES/2,Y,t$,"CT",1,1,RGB(WHITE),-1
    Y=Y+18
  Next I
End Sub

Sub SpeichereErgebnis
  Open "highscore.txt" For APPEND As #1
  Print #1,Date$,Time$,NAME$,LEVEL,GESAMTPUNKTE
  Close #1
End Sub
