' Game of Life fuer MMBasic
Option Explicit
Option Default None

Const MAX_X = 50
Const MAX_Y = 30
Const STARTANTEIL = 10       ' Anteil lebender Zellen in Prozent

Dim GridA(MAX_X, MAX_Y) As Integer
Dim GridB(MAX_X, MAX_Y) As Integer

' ======================== Hauptprogramm ========================
MainLoop
End

' ======================== Subs & Functions ========================

Sub MainLoop
  Local iteration As Integer

  iteration = 0
  InitialisiereGitter GridA()

  Do
    ZeigeGitter GridA(), iteration
    iteration = iteration + 1

    ' Optional: Animation verlangsamen
    ' Pause 500

    BerechneNaechstesGitter GridA(), GridB()
    UebernehmeGitter GridB(), GridA()
  Loop
End Sub


' Setzt alle Zellen eines Gitters auf 0.
Sub ClearGrid(Grid() As Integer)
  Local x As Integer, y As Integer

  For y = 1 To MAX_Y
    For x = 1 To MAX_X
      Grid(x, y) = 0
    Next x
  Next y
End Sub


' Erzeugt eine zufaellige Startbelegung.
' Es werden exakt STARTANTEIL Prozent der Zellen gesetzt.
Sub InitialisiereGitter(CurrentGrid() As Integer)
  Local x As Integer, y As Integer
  Local AnzahlZellen As Integer, GesetzteZellen As Integer

  ClearGrid CurrentGrid()

  AnzahlZellen = (MAX_X * MAX_Y * STARTANTEIL) \ 100
  GesetzteZellen = 0

  Do While GesetzteZellen < AnzahlZellen
    x = Int(Rnd * MAX_X) + 1
    y = Int(Rnd * MAX_Y) + 1

    ' Nur neue Zellen zaehlen. Dadurch entstehen exakt
    ' AnzahlZellen unterschiedliche lebende Startzellen.
    If CurrentGrid(x, y) = 0 Then
      CurrentGrid(x, y) = 1
      GesetzteZellen = GesetzteZellen + 1
    End If
  Loop
End Sub


' Berechnet aus CurrentGrid die naechste Generation in NextGrid.
Sub BerechneNaechstesGitter(CurrentGrid() As Integer, NextGrid() As Integer)
  Local x As Integer, y As Integer
  Local NachbarnCount As Integer

  For y = 1 To MAX_Y
    For x = 1 To MAX_X
      NachbarnCount = ZaehleLebendeNachbarn(CurrentGrid(), x, y)

      If CurrentGrid(x, y) = 1 Then
        ' Lebende Zelle:
        ' Bei 2 oder 3 lebenden Nachbarn ueberlebt sie.
        If NachbarnCount = 2 Or NachbarnCount = 3 Then
          NextGrid(x, y) = 1
        Else
          NextGrid(x, y) = 0
        End If
      Else
        ' Tote Zelle:
        ' Bei genau 3 lebenden Nachbarn wird sie geboren.
        If NachbarnCount = 3 Then
          NextGrid(x, y) = 1
        Else
          NextGrid(x, y) = 0
        End If
      End If
    Next x
  Next y
End Sub


' Zaehlt die lebenden Nachbarn einer Zelle.
' Zellen ausserhalb des Spielfelds gelten als tot.
Function ZaehleLebendeNachbarn(Grid() As Integer, X_Zelle As Integer, Y_Zelle As Integer) As Integer
  Local Count As Integer
  Local dx As Integer, dy As Integer
  Local NeighX As Integer, NeighY As Integer

  Count = 0

  For dy = -1 To 1
    For dx = -1 To 1
      ' Die Zelle selbst darf nicht mitgezaehlt werden.
      If Not (dx = 0 And dy = 0) Then
        NeighX = X_Zelle + dx
        NeighY = Y_Zelle + dy

        If NeighX>=1 And NeighX<=MAX_X And NeighY>=1 And NeighY<=MAX_Y Then
          If Grid(NeighX, NeighY) = 1 Then Count = Count + 1
        End If
      End If
    Next dx
  Next dy

  ZaehleLebendeNachbarn = Count
End Function


' Kopiert das berechnete Gitter in das aktuelle Gitter.
Sub UebernehmeGitter(SourceGrid() As Integer, TargetGrid() As Integer)
  Local x As Integer, y As Integer

  For y = 1 To MAX_Y
    For x = 1 To MAX_X
      TargetGrid(x, y) = SourceGrid(x, y)
    Next x
  Next y
End Sub


' Gibt das Spielfeld und einige Statusinformationen aus.
Sub ZeigeGitter(Grid() As Integer, iteration As Integer)
  Local x As Integer, y As Integer
  Local ZeileStr$ As String
  Local n As Integer, counter As Integer

  counter = 0
  CLS

  ' Ueberschrift auf MAX_X Zeichen zentrieren.
  ZeileStr$ = " Game of Life [" + Str$(iteration) + "] "
  n = MAX_X - Len(ZeileStr$)
  If n > 0 Then
    ZeileStr$ = String$(n \ 2, "-") + ZeileStr$ + String$(n - n \ 2, "-")
  End If
  Print ZeileStr$

  ' Spielfeld ausgeben.
  For y = 1 To MAX_Y
    ZeileStr$ = ""

    For x = 1 To MAX_X
      If Grid(x, y) = 1 Then
        ZeileStr$ = ZeileStr$ + Chr$(219)   ' voller Block
        counter = counter + 1
      Else
        ZeileStr$ = ZeileStr$ + "."
      End If
    Next x

    Print ZeileStr$
  Next y

  ' Anzahl lebender Zellen ausgeben.
  ZeileStr$ = " Living cells [" + Str$(counter) + "] "
  n = MAX_X - Len(ZeileStr$)
  If n > 0 Then
    ZeileStr$ = String$(n \ 2, "-") + ZeileStr$ + String$(n - n \ 2, "-")
  End If
  Print ZeileStr$
End Sub
