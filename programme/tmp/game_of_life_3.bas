' Game of Life fuer MMBasic
Option Explicit
Option Default None

Const MAX_X = 50
Const MAX_Y = 30

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
    'Pause 500
    BerechneNaechstesGitter GridA(), GridB()
    SwapGrids GridA(), GridB()
  Loop
End Sub

Sub ClearGrid(Grid() As Integer)
  Local x As integer, y As Integer

  For y = 1 To MAX_Y
    For x = 1 To MAX_X
      Grid(x, y) = 0
    Next x
  Next y
End Sub

Sub InitialisiereGitter(CurrentGrid() As Integer)
  Local x As integer, y As integer, startX As integer, startY As integer

  ClearGrid CurrentGrid()

  y = (MAX_X * MAX_Y)/10
  For x=1 To y
    CurrentGrid(Int(Rnd*MAX_X), Int(Rnd*MAX_Y)) = 1
  Next x
End Sub

Sub BerechneNaechstesGitter(CurrentGrid() As Integer, NextGrid() As Integer)
  Local x As Integer, y As Integer, NachbarnCount As Integer

  ClearGrid NextGrid()

  For y = 1 To MAX_Y
    For x = 1 To MAX_X
      NachbarnCount = ZaehleLebendeNachbarn(CurrentGrid(), x, y)

      If CurrentGrid(x, y) = 1 Then
        ' Lebende Zelle
        If NachbarnCount < 2 Or NachbarnCount > 3 Then
          NextGrid(x, y) = 0          ' stirbt
        Else
          NextGrid(x, y) = 1          ' ueberlebt
        End If
      Else
        ' Tote Zelle
        If NachbarnCount = 3 Then
          NextGrid(x, y) = 1          ' wird geboren
        Else
          NextGrid(x, y) = 0
        End If
      End If
    Next x
  Next y
End Sub

Function ZaehleLebendeNachbarn(Grid() As Integer, X_Zelle As Integer, Y_Zelle As Integer) As Integer
  Local Count As Integer, dx As Integer, dy As Integer
  Local NeighX As Integer, NeighY As Integer

  Count = 0
  For dy = -1 To 1
    For dx = -1 To 1
      If Not (dx = 0 And dy = 0) Then
        NeighX = X_Zelle + dx
        NeighY = Y_Zelle + dy
        If NeighX >= 1 And NeighX <= MAX_X And NeighY >= 1 And NeighY <= MAX_Y Then
          If Grid(NeighX, NeighY) = 1 Then Count = Count + 1
        End If
      End If
    Next dx
  Next dy

  ZaehleLebendeNachbarn = Count
End Function

Sub SwapGrids(GridA() As Integer, GridB() As Integer)
  Local x As Integer, y As Integer
  For y = 1 To MAX_Y
    For x = 1 To MAX_X
      GridA(x, y) = GridB(x, y)
    Next x
  Next y
End Sub

Sub ZeigeGitter(Grid() As Integer, i As integer)
  Local x As Integer, y As Integer, ZeileStr$, n As Integer
  Local counter As Integer
  counter = 0

  CLS
  ZeileStr$ = "Game of Life ["+Str$(i)+"]"
  n = MAX_X - Len(ZeileStr$)
  If n > 0 Then
    ZeileStr$ = String$(n\2,"-") + ZeileStr$ + String$(n-n\2,"-")
  EndIf
  Print ZeileStr$
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
  ZeileStr$ = "Counter ["+Str$(counter)+"]"
  n = MAX_X - Len(ZeileStr$)
  If n > 0 Then
    ZeileStr$ = String$(n\2,"-") + ZeileStr$ + String$(n-n\2,"-")
  EndIf
  Print ZeileStr$
End Sub
