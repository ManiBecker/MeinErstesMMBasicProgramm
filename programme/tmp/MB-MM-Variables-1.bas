'
' MM-Variables - Manfred Becker - 20.12.2024
'
Print "MM.Info(BColour) = "; MM.Info(BColour)
Print "MM.Info(CpuSpeed) = "; MM.Info(CpuSpeed)
Print "MM.Info$(Current) = "; MM.Info(Current)
'Print "MM.Info(Directory) = "; MM.Info(Directory)
Print "MM.Info(Disk Size) = "; MM.Info(Disk Size)
current$ = MM.Info(Current)
Print "MM.Info(Exists File ";current$;") = "; MM.Info(Exists File current$)
'directory$ = MM.Info(Directory)
directory$="b:/programme"
Print "MM.Info(Exists Dir ";directory$;") = "; MM.Info(Exists Dir directory$)
Print "MM.Info(FColour) = "; MM.Info(FColour)
Print "MM.Info(FileSize ";current$;") = "; MM.Info(FileSize current$)
Print "MM.Info(Font Address 1) = "; MM.Info(Font Address 1)
Print "MM.Info(Font Pointer 1) = "; MM.Info(Font Pointer 1)
Print "MM.Info(FontHeight) = "; MM.Info(FontHeight)
Print "MM.Info(FontWidth) = "; MM.Info(FontWidth)
'Print "MM.Info(FrameBuffer) = "; MM.Info(FrameBuffer)
'Print "MM.Info(FrameH) = "; MM.Info(FrameH)
'Print "MM.Info(FrameV) = "; MM.Info(FrameV)
Print "MM.Info(Free Space) = "; MM.Info(Free Space)
Print "MM.Info(HPos) = "; MM.Info(HPos)
Print "MM.Info(VPos) = "; MM.Info(VPos)
'Print "MM.Info$(Keyboard) = "; MM.Info(Keyboard)
'Print "MM.Info(Max Pages) = "; MM.Info(Max Pages)
'Print "MM.Info(Mode) = "; MM.Info(Mode)
Print "MM.Info$(Modified ";current$;") = "; MM.Info(Modified current$)
Print "MM.Info(Option Angle) = "; MM.Info(Option Angle)
Print "MM.Info(Option Autorun) = "; MM.Info(Option Autorun)
Print "MM.Info(Option Base) = "; MM.Info(Option Base)
Print "MM.Info(Option Break) = "; MM.Info(Option Break)
Print "MM.Info(Option Console) = "; MM.Info(Option Console Port)
Print "MM.Info(Option Default) = "; MM.Info(Option Default)
Print "MM.Info(Option Explicit) = "; MM.Info(Option Explicit)
'Print "MM.Info(Option Legacy) = "; MM.Info(Option Legacy)
'Print "MM.Info(Option Mouse) = "; MM.Info(Option Mouse)
'Print "MM.Info(Option Profiling) = "; MM.Info(Option Profiling)
'Print "MM.Info(Option UsbKeyboard) = "; MM.Info(Option UsbKeyboard)
'Print "MM.Info(Option Y_Axis) = "; MM.Info(Option Y_Axis)
'For i = 0 To 15
'  Print "MM.Info(Page Address";i;") = "; MM.Info(Page Address i)
'Next i
Print "MM.Info(Path) = "; MM.Info(Path)
Print "MM.Info$(Pin 1) = "; MM.Info(Pin 1)
Print "MM.Info(Program) = "; MM.Info(Program)
'Print "MM.Info$(Reset) = "; MM.Info(Reset)
Print "MM.Info$(SDCard) = "; MM.Info(SDCard)
'Print "MM.Info$(Search Path) = "; MM.Info(Search Path)
Print "MM.Info$(Sound) = "; MM.Info(Sound)
Print "MM.Info$(Track) = "; MM.Info(Track)
Print "MM.Info(Version) = "; MM.Info(Version)
'Print "MM.Info(Write Page) = "; MM.Info(Write Page)
Print "MM.Info(UpTime) = "; MM.Info(UpTime)
Print "--------------------------------------------------"
Print "MM.CmdLine$ = "; MM.CMDLINE$
Print "MM.Device$ = "; MM.DEVICE$
Print "MM.ErrNo = "; MM.Errno
Print "MM.ErrMsg$ = "; MM.ErrMsg$
Print "MM.I2C = "; MM.I2C
Print "MM.OneWire = "; MM.ONEWIRE
Print "MM.WatchDog = "; MM.WATCHDOG
Print "--------------------------------------------------"
Print "These are six read only variables which provide usefull information about the VGA video output:"
Print "MM.HRes = "; MM.HRES
Print "MM.VRes = "; MM.VRES
Print "MM.Info(FontHeight) = "; MM.Info(FontHeight)
Print "MM.Info(FontWidth) = "; MM.Info(FontWidth)
Print "MM.Info(HPos) = "; MM.Info(HPos)
Print "MM.Info(VPos) = "; MM.Info(VPos)
Print "end of list"
