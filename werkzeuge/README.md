# Werkzeuge

Dieser Ordner enthält Hilfsprogramme, Skripte und Konfigurationsdateien, die für die Erstellung des Tutorials verwendet werden.

Beispiele:

- PDF-Erzeugung
- Build-Skripte
- Vorlagen
- Konfigurationsdateien

## Entwicklungsumgebung einrichten

### Voraussetzungen

Folgende Software sollte installiert sein:

- Git
- Visual Studio Code
- Ruby + DevKit
- Asciidoctor
- Asciidoctor PDF
- VS Code Erweiterung **AsciiDoc**

### Ruby + DevKit installieren

Asciidoctor basiert auf Ruby. Installiere daher zunächst **Ruby + DevKit**.

1. Lade den aktuellen **Ruby+Devkit (x64)** Installer von der offiziellen Webseite herunter:
   https://rubyinstaller.org/

2. Starte den Installer.

3. Aktiviere während der Installation die Option:

   ```
   Add Ruby executables to your PATH
   ```

4. Nach Abschluss der Installation öffne ein neues Terminal und überprüfe die Installation:

   ```bash
   ruby --version
   gem --version
   ```

> **Hinweis**
>
> Nach der Installation von Ruby + DevKit muss Visual Studio Code (bzw. das Terminal) neu gestartet werden, damit die neuen PATH-Einstellungen übernommen werden. Erst danach stehen die Befehle `ruby`, `gem`, `asciidoctor` und `asciidoctor-pdf` im Terminal zur Verfügung.

### Asciidoctor installieren

```bash
gem install asciidoctor
```

Installation überprüfen:

```bash
asciidoctor --version
```

### PDF-Unterstützung installieren

```bash
gem install asciidoctor-pdf
```

Installation überprüfen:

```bash
asciidoctor-pdf --version
```

### VS Code Erweiterung

Für die Bearbeitung der Dokumentation empfiehlt sich die Installation der Erweiterung **AsciiDoc** von **asciidoctor**.

Die Erweiterung bietet unter anderem:

- Syntax-Highlighting
- Live-Vorschau
- Inhaltsverzeichnis
- Fehlererkennung

### Funktionstest

Erstelle eine Datei `test.adoc` mit folgendem Inhalt:

```asciidoc
= Test

Hallo Welt!

* Punkt 1
* Punkt 2
```

HTML erzeugen:

```bash
asciidoctor test.adoc
```

PDF erzeugen:

```bash
asciidoctor-pdf test.adoc
```

Nach erfolgreicher Installation werden die Dateien `test.html` bzw. `test.pdf` erzeugt.