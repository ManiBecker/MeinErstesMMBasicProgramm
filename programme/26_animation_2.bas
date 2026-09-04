Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 26_animation_2.bas
Rem Titel: Kapitel 26: Animationen und bewegte Grafiken
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 17.08.2026
Rem
Rem Beschreibung: Der Bildschirmschoner Mystify
Rem
Rem Hardware/Voraussetzungen: PicoMite/Colour Maximite
Rem ====================================================================

Option Base 0

Const cFigures   = 2          ' Anzahl der Figuren
Const cTrail     = 5          ' Anzahl der sichtbaren Positionen je Figur
Const cSpeed     = 10         ' Maximale Geschwindigkeit eines Eckpunkts
Const cDelay     = 50         ' Pause in Millisekunden
Const cBackColor = RGB(BLACK) ' Hintergrundfarbe

MODE 3
CLS cBackColor


' Vier Eckpunkte einer Figur.
' Index 0 ist die aktuelle Position. Die Indizes 1 bis cTrail-1
' bilden den sichtbaren Nachlauf; Index cTrail dient als Loeschposition.
Dim aX1(cFigures-1,cTrail), aY1(cFigures-1,cTrail)
Dim aX2(cFigures-1,cTrail), aY2(cFigures-1,cTrail)
Dim aX3(cFigures-1,cTrail), aY3(cFigures-1,cTrail)
Dim aX4(cFigures-1,cTrail), aY4(cFigures-1,cTrail)

' Zu jeder gespeicherten Position wird auch ihre Farbe gespeichert.
Dim aC(cFigures-1,cTrail)

' Die Geschwindigkeiten gelten nur fuer die aktuelle Position einer Figur.
Dim aDX1(cFigures-1), aDY1(cFigures-1)
Dim aDX2(cFigures-1), aDY2(cFigures-1)
Dim aDX3(cFigures-1), aDY3(cFigures-1)
Dim aDX4(cFigures-1), aDY4(cFigures-1)


' Initialisierung der Figuren
For i=0 To cFigures-1

  ' Zufaellige Startpositionen der vier Eckpunkte
  aX1(i,0)=Int(Rnd*MM.HRES)
  aY1(i,0)=Int(Rnd*MM.VRES)
  aX2(i,0)=Int(Rnd*MM.HRES)
  aY2(i,0)=Int(Rnd*MM.VRES)
  aX3(i,0)=Int(Rnd*MM.HRES)
  aY3(i,0)=Int(Rnd*MM.VRES)
  aX4(i,0)=Int(Rnd*MM.HRES)
  aY4(i,0)=Int(Rnd*MM.VRES)

  ' Zufaellige Geschwindigkeiten und Richtungen
  aDX1(i)=Int(Rnd*cSpeed)+1 : If Rnd<0.5 Then aDX1(i)=-aDX1(i)
  aDY1(i)=Int(Rnd*cSpeed)+1 : If Rnd<0.5 Then aDY1(i)=-aDY1(i)
  aDX2(i)=Int(Rnd*cSpeed)+1 : If Rnd<0.5 Then aDX2(i)=-aDX2(i)
  aDY2(i)=Int(Rnd*cSpeed)+1 : If Rnd<0.5 Then aDY2(i)=-aDY2(i)
  aDX3(i)=Int(Rnd*cSpeed)+1 : If Rnd<0.5 Then aDX3(i)=-aDX3(i)
  aDY3(i)=Int(Rnd*cSpeed)+1 : If Rnd<0.5 Then aDY3(i)=-aDY3(i)
  aDX4(i)=Int(Rnd*cSpeed)+1 : If Rnd<0.5 Then aDX4(i)=-aDX4(i)
  aDY4(i)=Int(Rnd*cSpeed)+1 : If Rnd<0.5 Then aDY4(i)=-aDY4(i)

  ' Zufaellige Farbe der vier Linien
  aC(i,0)=RGB(Int(Rnd*200)+55,Int(Rnd*200)+55,Int(Rnd*200)+55)

  ' Alle Speicherpositionen starten an derselben Position und mit derselben Farbe
  For j=1 To cTrail
    aX1(i,j)=aX1(i,0) : aY1(i,j)=aY1(i,0)
    aX2(i,j)=aX2(i,0) : aY2(i,j)=aY2(i,0)
    aX3(i,j)=aX3(i,0) : aY3(i,j)=aY3(i,0)
    aX4(i,j)=aX4(i,0) : aY4(i,j)=aY4(i,0)
    aC(i,j)=aC(i,0)
  Next j

Next i

Do
  For i=0 To cFigures-1

    ' Gelegentlich eine neue Farbe waehlen
    If Int(Rnd*100)=0 Then
      aC(i,0)=RGB(Int(Rnd*200)+55,Int(Rnd*200)+55,Int(Rnd*200)+55)
    EndIf

    ' Aelteste Position loeschen, danach aktuelle Figur und Nachlauf zeichnen
    For j=cTrail To 0 Step -1
      If j=cTrail Then
        ' Das Loeschen erfolgt durch Zeichnen der Figur
        ' in der Hintergrundfarbe
        col=cBackColor
      Else
        col=aC(i,j)
      EndIf

      Line aX1(i,j),aY1(i,j),aX2(i,j),aY2(i,j),1,col
      Line aX2(i,j),aY2(i,j),aX3(i,j),aY3(i,j),1,col
      Line aX3(i,j),aY3(i,j),aX4(i,j),aY4(i,j),1,col
      Line aX4(i,j),aY4(i,j),aX1(i,j),aY1(i,j),1,col
    Next j

    ' Alte Positionen nach hinten schieben
    For j=cTrail To 1 Step -1
      aX1(i,j)=aX1(i,j-1) : aY1(i,j)=aY1(i,j-1)
      aX2(i,j)=aX2(i,j-1) : aY2(i,j)=aY2(i,j-1)
      aX3(i,j)=aX3(i,j-1) : aY3(i,j)=aY3(i,j-1)
      aX4(i,j)=aX4(i,j-1) : aY4(i,j)=aY4(i,j-1)
      aC(i,j)=aC(i,j-1)
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

    ' An den Bildschirmraendern abprallen
    If aX1(i,0)<0 Then
      aX1(i,0)=0
      aDX1(i)=Int(Rnd*cSpeed)+1
    EndIf
    If aX1(i,0)>MM.HRES-1 Then
      aX1(i,0)=MM.HRES-1
      aDX1(i)=-(Int(Rnd*cSpeed)+1)
    EndIf
    If aY1(i,0)<0 Then
      aY1(i,0)=0
      aDY1(i)=Int(Rnd*cSpeed)+1
    EndIf
    If aY1(i,0)>MM.VRES-1 Then
      aY1(i,0)=MM.VRES-1
      aDY1(i)=-(Int(Rnd*cSpeed)+1)
    EndIf
    If aX2(i,0)<0 Then
      aX2(i,0)=0
      aDX2(i)=Int(Rnd*cSpeed)+1
    EndIf
    If aX2(i,0)>MM.HRES-1 Then
      aX2(i,0)=MM.HRES-1
      aDX2(i)=-(Int(Rnd*cSpeed)+1)
    EndIf
    If aY2(i,0)<0 Then
      aY2(i,0)=0
      aDY2(i)=Int(Rnd*cSpeed)+1
    EndIf
    If aY2(i,0)>MM.VRES-1 Then
      aY2(i,0)=MM.VRES-1
      aDY2(i)=-(Int(Rnd*cSpeed)+1)
    EndIf
    If aX3(i,0)<0 Then
      aX3(i,0)=0
      aDX3(i)=Int(Rnd*cSpeed)+1
    EndIf
    If aX3(i,0)>MM.HRES-1 Then
      aX3(i,0)=MM.HRES-1
      aDX3(i)=-(Int(Rnd*cSpeed)+1)
    EndIf
    If aY3(i,0)<0 Then
      aY3(i,0)=0
      aDY3(i)=Int(Rnd*cSpeed)+1
    EndIf
    If aY3(i,0)>MM.VRES-1 Then
      aY3(i,0)=MM.VRES-1
      aDY3(i)=-(Int(Rnd*cSpeed)+1)
    EndIf
    If aX4(i,0)<0 Then
      aX4(i,0)=0
      aDX4(i)=Int(Rnd*cSpeed)+1
    EndIf
    If aX4(i,0)>MM.HRES-1 Then
      aX4(i,0)=MM.HRES-1
      aDX4(i)=-(Int(Rnd*cSpeed)+1)
    EndIf
    If aY4(i,0)<0 Then
      aY4(i,0)=0
      aDY4(i)=Int(Rnd*cSpeed)+1
    EndIf
    If aY4(i,0)>MM.VRES-1 Then
      aY4(i,0)=MM.VRES-1
      aDY4(i)=-(Int(Rnd*cSpeed)+1)
    EndIf
  Next i

  Pause cDelay
Loop While Inkey$=""

Print "Ready..." 
