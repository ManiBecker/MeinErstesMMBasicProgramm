REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 37_senso.bas
REM Titel: Kapitel 37: Senso - das elektronische Gedaechtnisspiel
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 31.08.2026
REM
REM Beschreibung: Ein vollstaendiges elektronisches Gedaechtnisspiel
REM
REM Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
REM
REM ====================================================================

DIM FOLGE(100)
LEVEL=1
DO
  FOLGE(LEVEL)=INT(RND*4)+1
  FOR I=1 TO LEVEL
    ZeigeFarbe FOLGE(I)
  NEXT I
  FEHLER=0
  FOR I=1 TO LEVEL
    TASTE=HoleTaste()
    IF TASTE<>FOLGE(I) THEN
      FEHLER=1
      EXIT FOR
    ENDIF
  NEXT I
  IF FEHLER=1 THEN
    Call Fehleranimation 3
    EXIT DO
  ENDIF
  LEVEL=LEVEL+1
LOOP

PRINT
PRINT "Spiel beendet"
PRINT "Erreichte Runde:"
PRINT LEVEL

IF LEVEL>BESTE_RUNDE THEN
  BESTE_RUNDE=LEVEL
ENDIF

End

SUB ZeigeFarbe(FARBE)
  SELECT CASE FARBE
  CASE 1
    PIN(GP0)=1
    TONE 262,300
    PIN(GP0)=0
  CASE 2
    PIN(GP1)=1
    TONE 330,300
    PIN(GP1)=0
  CASE 3
    PIN(GP2)=1
    TONE 392,300
    PIN(GP2)=0
  CASE 4
    PIN(GP3)=1
    TONE 523,300
    PIN(GP3)=0
  END SELECT
  PAUSE 150
END SUB

FUNCTION HoleTaste()
  DO
    IF PIN(GP4)=0 THEN
      HoleTaste=1
      ZeigeFarbe 1
      WarteAufLoslassen GP4
      EXIT FUNCTION
    ENDIF
    IF PIN(GP5)=0 THEN
      HoleTaste=2
      ZeigeFarbe 2
      WarteAufLoslassen GP5
      EXIT FUNCTION
    ENDIF
    IF PIN(GP6)=0 THEN
      HoleTaste=3
      ZeigeFarbe 3
      WarteAufLoslassen GP6
      EXIT FUNCTION
    ENDIF
    IF PIN(GP7)=0 THEN
      HoleTaste=4
      ZeigeFarbe 4
      WarteAufLoslassen GP7
      EXIT FUNCTION
    ENDIF
  LOOP
END FUNCTION

SUB WarteAufLoslassen(PINNUMMER)
  DO
  LOOP UNTIL PIN(PINNUMMER)=1
  PAUSE 30
END SUB

SUB Fehleranimation(ANZAHL)
  FOR I=1 TO ANZAHL
    PIN(GP0)=1
    PIN(GP1)=1
    PIN(GP2)=1
    PIN(GP3)=1
    PAUSE 200
    PIN(GP0)=0
    PIN(GP1)=0
    PIN(GP2)=0
    PIN(GP3)=0
    PAUSE 200
  NEXT I
END SUB
