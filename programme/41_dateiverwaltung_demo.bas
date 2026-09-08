REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 41_dateiverwaltung_demo.bas
REM Titel: Kapitel 41: Dateiverwaltung auf der SD-Karte
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 09.09.2026
REM
REM Beschreibung:
REM
REM Demonstriert:
REM - aktuelles Laufwerk und Verzeichnis anzeigen
REM - freien und gesamten Speicher anzeigen
REM - Verzeichnis anlegen und wechseln
REM - Datei erzeugen
REM - Datei kopieren und umbenennen
REM - Existenz von Dateien und Verzeichnissen pruefen
REM - Dateien und Verzeichnis wieder loeschen
REM
REM Hinweis:
REM FILES kann laut PicoMite-Handbuch nur an der Kommandozeile
REM verwendet werden und ist deshalb nicht Teil dieses Programms.
REM
REM Hardware/Voraussetzungen: keine/PicoMite/ColourMaxiMite
REM
REM ====================================================================

Option Explicit

Dim demoDir$ = "KAP41_DEMO"
Dim original$ = "ORIGINAL.TXT"
Dim kopie$ = "KOPIE.TXT"
Dim neu$ = "UMBENANNT.TXT"

Print
Print "Kapitel 41 - Dateiverwaltung"
Print "---------------------------"
Print

Print "Aktives Laufwerk : "; MM.INFO(DRIVE)
Print "Verzeichnis      : "; CWD$
Print "Laufwerksgroesse : "; MM.INFO(DISK SIZE); " Bytes"
Print "Freier Speicher  : "; MM.INFO(FREE SPACE); " Bytes"
Print

' Vorhandenes Demo-Verzeichnis nicht anfassen
If MM.INFO(EXISTS DIR demoDir$) Then
    Print "Das Verzeichnis "; demoDir$; " existiert bereits."
    Print "Das Programm wird beendet, damit keine Daten ueberschrieben werden."
    End
EndIf

' Verzeichnis anlegen
Print "Erzeuge Verzeichnis "; demoDir$; " ..."
MKDIR demoDir$

If MM.INFO(EXISTS DIR demoDir$) Then
    Print "OK: Verzeichnis wurde angelegt."
Else
    Print "Fehler: Verzeichnis wurde nicht angelegt."
    End
EndIf

' In das neue Verzeichnis wechseln
CHDIR demoDir$
Print "Aktuelles Verzeichnis: "; CWD$
Print

' Eine kleine Textdatei erzeugen
Print "Erzeuge Datei "; original$; " ..."

Open original$ For Output As #1
Print #1, "MMBasic - Kapitel 41"
Print #1, "Dieses ist eine Testdatei."
Print #1, "Sie wurde vom Beispielprogramm erzeugt."
Close #1

If MM.INFO(EXISTS FILE original$) Then
    Print "OK: "; original$; " existiert."
Else
    Print "Fehler: Die Datei wurde nicht angelegt."
    CHDIR ".."
    End
EndIf

' Datei kopieren
Print "Kopiere "; original$; " nach "; kopie$; " ..."
COPY original$ TO kopie$

If MM.INFO(EXISTS FILE kopie$) Then
    Print "OK: Kopie wurde erstellt."
Else
    Print "Fehler beim Kopieren."
EndIf

' Kopie umbenennen
Print "Benenne "; kopie$; " in "; neu$; " um ..."
RENAME kopie$ AS neu$

If MM.INFO(EXISTS FILE neu$) Then
    Print "OK: Datei wurde umbenannt."
Else
    Print "Fehler beim Umbenennen."
EndIf

Print
Print "Die Testdateien werden jetzt wieder geloescht."

' Dateien loeschen
If MM.INFO(EXISTS FILE original$) Then KILL original$
If MM.INFO(EXISTS FILE neu$) Then KILL neu$

' Zurueck in das uebergeordnete Verzeichnis
CHDIR ".."

' Demo-Verzeichnis entfernen
If MM.INFO(EXISTS DIR demoDir$) Then
    RMDIR demoDir$
EndIf

Print
Print "Aufraeumen abgeschlossen."
Print "Aktuelles Verzeichnis: "; CWD$
Print
Print "Demo beendet." 
