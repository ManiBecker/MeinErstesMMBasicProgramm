Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 26_animation_2.bas
Rem Titel: Kapitel 26: Animationen und bewegte Grafiken
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 13.08.2026
Rem
Rem Beschreibung: Der Bildschirmschoner Mystify
Rem
Rem Hardware/Voraussetzungen: PicoMite/Colour Maximite
Rem ====================================================================

Mode 3
Cls

Const cFigures = 2
Const cTrail   = 7
Const cSpeed   = 10

' Positionen der vier Eckpunkte.
' Der zweite Index speichert die letzten sieben Positionen.
Dim aX1(cFigures-1,cTrail-1), aY1(cFigures-1,cTrail-1)
Dim aX2(cFigures-1,cTrail-1), aY2(cFigures-1,cTrail-1)
Dim aX3(cFigures-1,cTrail-1), aY3(cFigures-1,cTrail-1)
Dim aX4(cFigures-1,cTrail-1), aY4(cFigures-1,cTrail-1)

' Nur die aktuelle Figur benötigt Geschwindigkeiten.
Dim aDX1(cFigures-1), aDY1(cFigures-1)
Dim aDX2(cFigures-1), aDY2(cFigures-1)
Dim aDX3(cFigures-1), aDY3(cFigures-1)
Dim aDX4(cFigures-1), aDY4(cFigures-1)

Dim aC(cFigures-1)

For i=0 To cFigures-1
  ' Zufällige Startpositionen der vier Eckpunkte
  aX1(i,0)=Int(Rnd*MM.HRES)
  aY1(i,0)=Int(Rnd*MM.VRES)
  aX2(i,0)=Int(Rnd*MM.HRES)
  aY2(i,0)=Int(Rnd*MM.VRES)
  aX3(i,0)=Int(Rnd*MM.HRES)
  aY3(i,0)=Int(Rnd*MM.VRES)
  aX4(i,0)=Int(Rnd*MM.HRES)
  aY4(i,0)=Int(Rnd*MM.VRES)

  ' Zufällige Geschwindigkeiten und Richtungen
  aDX1(i)=Int(Rnd*cSpeed)+1 : If Rnd<0.5 Then aDX1(i)=-aDX1(i)
  aDY1(i)=Int(Rnd*cSpeed)+1 : If Rnd<0.5 Then aDY1(i)=-aDY1(i)
  aDX2(i)=Int(Rnd*cSpeed)+1 : If Rnd<0.5 Then aDX2(i)=-aDX2(i)
  aDY2(i)=Int(Rnd*cSpeed)+1 : If Rnd<0.5 Then aDY2(i)=-aDY2(i)
  aDX3(i)=Int(Rnd*cSpeed)+1 : If Rnd<0.5 Then aDX3(i)=-aDX3(i)
  aDY3(i)=Int(Rnd*cSpeed)+1 : If Rnd<0.5 Then aDY3(i)=-aDY3(i)
  aDX4(i)=Int(Rnd*cSpeed)+1 : If Rnd<0.5 Then aDX4(i)=-aDX4(i)
  aDY4(i)=Int(Rnd*cSpeed)+1 : If Rnd<0.5 Then aDY4(i)=-aDY4(i)

  ' Anfangsposition in alle Elemente des Nachziehspeichers kopieren
  For j=1 To cTrail-1
    aX1(i,j)=aX1(i,0) : aY1(i,j)=aY1(i,0)
    aX2(i,j)=aX2(i,0) : aY2(i,j)=aY2(i,0)
    aX3(i,j)=aX3(i,0) : aY3(i,j)=aY3(i,0)
    aX4(i,j)=aX4(i,0) : aY4(i,j)=aY4(i,0)
  Next j

  aC(i)=RGB(Int(Rnd*200)+55,Int(Rnd*200)+55,Int(Rnd*200)+55)
Next i

Do
  For i=0 To cFigures-1

    ' Gelegentlich eine neue Farbe wählen
    If Int(Rnd*100)=0 Then
      aC(i)=RGB(Int(Rnd*200)+55,Int(Rnd*200)+55,Int(Rnd*200)+55)
    EndIf

    ' Älteste Figur löschen, danach alle sichtbaren Figuren zeichnen
    For j=cTrail-1 To 0 Step -1
      If j=cTrail-1 Then
        col=RGB(BLACK)
      Else
        col=aC(i)
      EndIf

      Line aX1(i,j),aY1(i,j),aX2(i,j),aY2(i,j),1,col
      Line aX2(i,j),aY2(i,j),aX3(i,j),aY3(i,j),1,col
      Line aX3(i,j),aY3(i,j),aX4(i,j),aY4(i,j),1,col
      Line aX4(i,j),aY4(i,j),aX1(i,j),aY1(i,j),1,col
    Next j

    ' Alte Positionen im Nachziehspeicher nach hinten schieben
    For j=cTrail-1 To 1 Step -1
      aX1(i,j)=aX1(i,j-1) : aY1(i,j)=aY1(i,j-1)
      aX2(i,j)=aX2(i,j-1) : aY2(i,j)=aY2(i,j-1)
      aX3(i,j)=aX3(i,j-1) : aY3(i,j)=aY3(i,j-1)
      aX4(i,j)=aX4(i,j-1) : aY4(i,j)=aY4(i,j-1)
    Next j

    ' Aktuelle Eckpunkte bewegen
    aX1(i,0)=aX1(i,0)+aDX1(i)
    aY1(i,0)=aY1(i,0)+aDY1(i)
    aX2(i,0)=aX2(i,0)+aDX2(i)
    aY2(i,0)=aY2(i,0)+aDY2(i)
    aX3(i,0)=aX3(i,0)+aDX3(i)
    aY3(i,0)=aY3(i,0)+aDY3(i)
    aX4(i,0)=aX4(i,0)+aDX4(i)
    aY4(i,0)=aY4(i,0)+aDY4(i)

    ' An den Bildschirmrändern abprallen
    If aX1(i,0)<0 Then aX1(i,0)=0 : aDX1(i)=Int(Rnd*cSpeed)+1
    If aX1(i,0)>MM.HRES-1 Then aX1(i,0)=MM.HRES-1 : aDX1(i)=-(Int(Rnd*cSpeed)+1)
    If aY1(i,0)<0 Then aY1(i,0)=0 : aDY1(i)=Int(Rnd*cSpeed)+1
    If aY1(i,0)>MM.VRES-1 Then aY1(i,0)=MM.VRES-1 : aDY1(i)=-(Int(Rnd*cSpeed)+1)

    If aX2(i,0)<0 Then aX2(i,0)=0 : aDX2(i)=Int(Rnd*cSpeed)+1
    If aX2(i,0)>MM.HRES-1 Then aX2(i,0)=MM.HRES-1 : aDX2(i)=-(Int(Rnd*cSpeed)+1)
    If aY2(i,0)<0 Then aY2(i,0)=0 : aDY2(i)=Int(Rnd*cSpeed)+1
    If aY2(i,0)>MM.VRES-1 Then aY2(i,0)=MM.VRES-1 : aDY2(i)=-(Int(Rnd*cSpeed)+1)

    If aX3(i,0)<0 Then aX3(i,0)=0 : aDX3(i)=Int(Rnd*cSpeed)+1
    If aX3(i,0)>MM.HRES-1 Then aX3(i,0)=MM.HRES-1 : aDX3(i)=-(Int(Rnd*cSpeed)+1)
    If aY3(i,0)<0 Then aY3(i,0)=0 : aDY3(i)=Int(Rnd*cSpeed)+1
    If aY3(i,0)>MM.VRES-1 Then aY3(i,0)=MM.VRES-1 : aDY3(i)=-(Int(Rnd*cSpeed)+1)

    If aX4(i,0)<0 Then aX4(i,0)=0 : aDX4(i)=Int(Rnd*cSpeed)+1
    If aX4(i,0)>MM.HRES-1 Then aX4(i,0)=MM.HRES-1 : aDX4(i)=-(Int(Rnd*cSpeed)+1)
    If aY4(i,0)<0 Then aY4(i,0)=0 : aDY4(i)=Int(Rnd*cSpeed)+1
    If aY4(i,0)>MM.VRES-1 Then aY4(i,0)=MM.VRES-1 : aDY4(i)=-(Int(Rnd*cSpeed)+1)

  Next i

  Pause 50
Loop While Inkey$=""

Print "Ready..."
