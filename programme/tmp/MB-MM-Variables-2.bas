'
' MM-Variables - Manfred Becker - 20.12.2024
'
Dim l(100) As STRING, n As INTEGER, i As INTEGER: n=0

l(n) = "MM.Info(BColour) = " + Str$( MM.Info(BColour) ): n=n+1
'l(n) = "MM.Info(CpuSpeed) = " + Str$( MM.Info(CpuSpeed) ): n=n+1
l(n) = "MM.Info$(Current) = " + MM.Info(Current): n=n+1
'l(n) = "MM.Info(Directory) = " + MM.Info(Directory): n=n+1
l(n) = "MM.Info(Disk Size) = " + Str$( MM.Info(Disk Size) ): n=n+1
current$ = MM.Info(Current)
l(n) = "MM.Info(Exists File " + current$ + ") = " + Str$( MM.Info(Exists File current$) ): n=n+1
'directory$ = MM.Info(Directory)
directory$ = "b:/programme"
l(n) = "MM.Info(Exists Dir " + directory$ + ") = " + Str$( MM.Info(Exists Dir directory$) ): n=n+1
l(n) = "MM.Info(FColour) = " + Str$( MM.Info(FColour) ): n=n+1
l(n) = "MM.Info(FileSize " + current$ + ") = " + Str$( MM.Info(FileSize current$) ): n=n+1
l(n) = "MM.Info(Font Address 1) = " + Str$( MM.Info(Font Address 1) ): n=n+1
l(n) = "MM.Info(Font Pointer 1) = " + Str$( MM.Info(Font Pointer 1) ): n=n+1
l(n) = "MM.Info(FontHeight) = " + Str$( MM.Info(FontHeight) ): n=n+1
l(n) = "MM.Info(FontWidth) = " + Str$( MM.Info(FontWidth) ): n=n+1
'l(n) = "MM.Info(FrameBuffer) = " + Str$( MM.Info(FrameBuffer) ): n=n+1
'l(n) = "MM.Info(FrameH) = " + Str$( MM.Info(FrameH) ): n=n+1
'l(n) = "MM.Info(FrameV) = " + Str$( MM.Info(FrameV) ): n=n+1
l(n) = "MM.Info(Free Space) = " + Str$( MM.Info(Free Space) ): n=n+1
l(n) = "MM.Info(HPos) = " + Str$( MM.Info(HPos) ): n=n+1
l(n) = "MM.Info(VPos) = " + Str$( MM.Info(VPos) ): n=n+1
'l(n) = "MM.Info$(Keyboard) = " + MM.Info(Keyboard): n=n+1
'l(n) = "MM.Info(Max Pages) = " + Str$( MM.Info(Max Pages) ): n=n+1
'l(n) = "MM.Info(Mode) = " + Str$( MM.Info(Mode) ): n=n+1
l(n) = "MM.Info$(Modified " + current$ + ") = " + MM.Info(Modified current$): n=n+1
l(n) = "MM.Info(Option Angle) = " + MM.Info(Option Angle): n=n+1
l(n) = "MM.Info(Option Autorun) = " + MM.Info(Option Autorun): n=n+1
l(n) = "MM.Info(Option Base) = " + Str$( MM.Info(Option Base) ): n=n+1
l(n) = "MM.Info(Option Break) = " + Str$( MM.Info(Option Break) ): n=n+1
l(n) = "MM.Info(Option Console) = " + MM.Info(Option Console Port): n=n+1
l(n) = "MM.Info(Option Default) = " + MM.Info(Option Default): n=n+1
l(n) = "MM.Info(Option Explicit) = " + MM.Info(Option Explicit): n=n+1
'l(n) = "MM.Info(Option Legacy) = " + MM.Info(Option Legacy): n=n+1
'l(n) = "MM.Info(Option Mouse) = " + Str$( MM.Info(Option Mouse) ): n=n+1
'l(n) = "MM.Info(Option Profiling) = " + MM.Info(Option Profiling): n=n+1
'l(n) = "MM.Info(Option UsbKeyboard) = " + MM.Info(Option UsbKeyboard): n=n+1
'l(n) = "MM.Info(Option Y_Axis) = " + MM.Info(Option Y_Axis): n=n+1
'For i = 0 To 15
'  l(n) = "MM.Info(Page Address" + Str$(i) + ") = " + Str$( MM.Info(Page Address i) ): n=n+1
'Next i
l(n) = "MM.Info(Path) = " + MM.Info(Path): n=n+1
l(n) = "MM.Info$(Pin 1) = " + MM.Info(Pin 1): n=n+1
l(n) = "MM.Info(Program) = " + Str$( MM.Info(Program) ): n=n+1
'l(n) = "MM.Info$(Reset) = " + MM.Info(Reset): n=n+1
l(n) = "MM.Info$(SDCard) = " + MM.Info(SDCard): n=n+1
'l(n) = "MM.Info$(Search Path) = " + MM.Info(Search Path): n=n+1
l(n) = "MM.Info$(Sound) = " + MM.Info(Sound): n=n+1
l(n) = "MM.Info$(Track) = " + MM.Info(Track): n=n+1
l(n) = "MM.Info(Version) = " + Str$( MM.Info(Version) ): n=n+1
'l(n) = "MM.Info(Write Page) = " + Str$( MM.Info(Write Page) ): n=n+1
l(n) = "MM.Info(UpTime) = " + Str$( MM.Info(UpTime) ): n=n+1
l(n) = "--------------------------------------------------"
l(n) = "MM.CmdLine$ = " + MM.CMDLINE$: n=n+1
l(n) = "MM.Device$ = " + MM.DEVICE$: n=n+1
l(n) = "MM.ErrNo = " + Str$( MM.Errno ): n=n+1
l(n) = "MM.ErrMsg$ = " + MM.ErrMsg$: n=n+1
l(n) = "MM.I2C = " + Str$( MM.I2C ): n=n+1
l(n) = "MM.OneWire = " + Str$( MM.ONEWIRE ): n=n+1
l(n) = "MM.WatchDog = " + Str$( MM.WATCHDOG ): n=n+1
l(n) = "--------------------------------------------------"
l(n) = "These are six read only variables which provide usefull"
l(n) = "information about the VGA video output:"
l(n) = "MM.HRes = " + Str$( MM.HRES ): n=n+1
l(n) = "MM.VRes = " + Str$( MM.VRES ): n=n+1
l(n) = "MM.Info(FontHeight) = " + Str$( MM.Info(FontHeight) ): n=n+1
l(n) = "MM.Info(FontWidth) = " + Str$( MM.Info(FontWidth) ): n=n+1
l(n) = "MM.Info(HPos) = " + Str$( MM.Info(HPos) ): n=n+1
l(n) = "MM.Info(VPos) = " + Str$( MM.Info(VPos) ): n=n+1
l(n) = "end of list"


' =================
' Anzeige und Menue
' =================
s=0
z=Int(MM.VRES / MM.Info(FontHeight))
ds=z-5
Do
  CLS
  Print MM.Info(Current); " - "; MM.Info(Modified current$); " - "; Str$( MM.Info(FileSize current$) ); " Bytes"
  Print
  For i=s To s+ds-1
    If i<n Then
      If i<9 Then Print " ";
      Print i+1;".) ";l(i)
    Else
      Print ""
    EndIf
  Next i
  Print
  Print "[S]tart, [N]aechste, [V]orhergehende, [E]nde, [+] oder [-], [Q]uit"

  Do : k$=Inkey$ : Loop Until k$ <> ""
  Select Case UCase$(k$)
    Case "S": s=0
    Case "N": If i<n Then s=s+ds
    Case "V": If s>=ds Then s=s-ds Else s=0
    Case "E": s=n-ds
    Case "+": If s<n-1 Then s=s+1
    Case "-": If s>0 Then s=s-1
    Case "Q": CLS : End
  End Select
Loop
