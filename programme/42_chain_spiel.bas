' 42_chain_spiel.bas
' Beispielprogramm zu Kapitel 42:
' Programme verketten mit CHAIN
'
' Dieses Programm wird von 42_chain_start.bas gestartet.
' Die Variablen spieler$ und punkte bleiben durch CHAIN erhalten.

CLS

PRINT "========================"
PRINT "      SPIEL"
PRINT "========================"
PRINT
PRINT "Spieler: "; spieler$
PRINT "Punkte beim Start: "; punkte
PRINT

PRINT "Du erhaeltst 50 Punkte."
punkte = punkte + 50

PRINT "Neuer Punktestand: "; punkte
PRINT
PRINT "Uebergebener Parameter: "; MM.CMDLINE$
PRINT
PRINT "Weiter mit beliebiger Taste ..."

DO
LOOP UNTIL INKEY$ <> ""

CHAIN "42_chain_ende.bas", "SPIEL BEENDET" 
