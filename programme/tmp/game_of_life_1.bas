'// https://www.thebackshed.com/forum/ViewTopic.php?TID=19005&P=2#257525


'Option EXPLICIT
'Option DEFAULT NONE


'// --- KONSTANTEN DEFINIEREN ---

Const MAX_X = 50 ' Breite des Spielfelds
Const MAX_Y = 20 ' Hvhe des Spielfelds

Dim GridA(MAX_X, MAX_Y) As INTEGER ' Das aktuelle Gitter
Dim GridB(MAX_X, MAX_Y) As INTEGER ' Das ndchste zu berechnende Gitter

' Aufruf des Spiels
Call MainLoop()

End

'// --- HAUPTPROGRAMM-SCHLEIFE ---
Sub MainLoop()
   Call InitialisiereGitter(GridA()) ' Setzt ein Startmuster (optional)

   Do
       Call ZeigeGitter(GridA()) ' 1. Aktuellen Zustand anzeigen
       Pause (500) ' Kurze Pause zum Sehen

       Call BerechneNaechstesGitter(GridA(), GridB()) ' 2. Die Logik des Lebens anwenden

       ' Tauschen der Gitter: Das "Ndchste" wird das neue "Aktuelle"
       SwapGrids(GridA(), GridB())

   Loop While TRUE ' Lduft unendlich, bis gestoppt
End Sub

'// ========================================
'// FUNKTIONEN
'// ========================================

Sub ClearGrid(Grid() As INTEGER)
   ' Setzt das gesamte Gitter auf 0 (Tot)
   Local x, y
   For y = 1 To MAX_Y
       For x = 1 To MAX_X
           Grid(x, y) = 0
       Next x
   Next y
End Sub


Sub InitialisiereGitter(CurrentGrid() As INTEGER)
   Local x, y, startX, startY
   Call ClearGrid(CurrentGrid())

   ' --- HIER EIN STARTMUSTER PLATZIEREN (zB ein Quadrat von Lebendzellen) ---
   startX = MAX_X / 2 - 3
   startY = MAX_Y / 2 - 3
   For y = 0 To 1 '{ ' Nur 2 Zeilen hoch
       For x = 0 To 2
           CurrentGrid(startX + x, startY + y) = 1
       Next x
   Next y

End Sub


Sub BerechneNaechstesGitter(CurrentGrid() As INTEGER, NextGrid() As INTEGER)
   ' Setzt das Zielgitter (NextGrid) einmalig auf 0
   Call ClearGrid(NextGrid())

   For y = 1 To MAX_Y
       For x = 1 To MAX_X
           Local NachbarnCount As INTEGER
           NachbarnCount = ZaehleLebendeNachbarn(CurrentGrid, x, y)

           ' Wenden der Spielregeln an:
           If CurrentGrid(x, y) = 1 Then ' Zell ist LEBEND
               If NachbarnCount < 2 Or NachbarnCount > 3 Then
                   NextGrid(x, y) = 0 ' Stirbt
               Else
                   NextGrid(x, y) = 1 ' \berlebt
               End If
           Else ' Zell ist TOT (CurrentGrid(x, y) = 0)
               If NachbarnCount = 3 Then
                   NextGrid(x, y) = 1 ' Wird geboren
               Else
                   NextGrid(x,y) = 0 ' Bleibt tot
               End If
           End If
       Next x
   Next y

End Sub


Function ZaehleLebendeNachbarn(Grid() As INTEGER, X_Zelle, Y_Zelle)
   Local Count As INTEGER: Count = 0

   ' Durch die 3x3 Nachbarschaft Schleifen (ohne das Zentrum selbst!)
   For dy = -1 To 1
       For dx = -1 To 1
           If dx = 0 And dy = 0 Then Continue For' Springe |ber die Zelle selbst

           Local NeighX As INTEGER: NeighX = X_Zelle + dx
           Local NeighY As INTEGER: NeighY = Y_Zelle + dy

           ' Randpr|fung (Stellt sicher, dass wir nicht au_erhalb des Spielfeldes sind)
           If NeighX >= 1 And NeighX <= MAX_X And NeighY >= 1 And NeighY <= MAX_Y Then
               If Grid(NeighX, NeighY) = 1 Then
                   Count = Count + 1
               End If
           End If
       Next dx
   Next dy

   ZaehleLebendeNachbarn = Count
End Function


Sub SwapGrids(GridA() As INTEGER, GridB() As INTEGER)
   ' Tauscht die Inhalte von A und B (vereinfacht dargestellt)
   ' In echtem MMBasic m|sste hier der Inhalt jedes Pixels/Arrays kopiert werden.
   For y = 1 To MAX_Y
       For x = 1 To MAX_X
           GridA(x, y) = GridB(x, y) ' Kopiere B nach A
           ' Wenn du das System nicht |berschreibst, ist dies ausreichend:
           ' GridA(x, y) <-> GridB(x, y)
       Next x
   Next y
End Sub


Sub ZeigeGitter(Grid() As INTEGER)
  CLS
  Print "--- Game of Life ---"
   For y = 1 To MAX_Y Step 1
       Local ZeileStr As STRING: ZeileStr = ""
       For x = 1 To MAX_X Step 1
           If Grid(x, y) = 1 Then
               ZeileStr = ZeileStr + "&" ' Darstellung f|r Lebend (Block)
           Else
               ZeileStr = ZeileStr + " " ' Leerzeichen f|r Tot
           End If
       Next x
       Print ZeileStr
   Next y
   Print "-------"
End Sub
