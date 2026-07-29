# Werkzeuge

Dieser Ordner enthält Hilfsprogramme, Skripte und Konfigurationsdateien, die für die Erstellung des Tutorials verwendet werden.

Beispiele:

- PDF-Erzeugung
- Build-Skripte
- Vorlagen
- Konfigurationsdateien

# Entwicklungsumgebung einrichten

## Repository klonen

Das Repository sollte **nicht** über **"Download ZIP"** heruntergeladen werden, da hierbei die Git-Informationen verloren gehen.

Stattdessen das Repository mit Git klonen:

```bash
git clone https://github.com/<Benutzer>/<Repository>.git
```

Anschließend den Projektordner in Visual Studio Code öffnen.

---

## Voraussetzungen

Für die Bearbeitung und den PDF-Build werden folgende Programme benötigt:

- Git
- Visual Studio Code
- Ruby + DevKit
- Asciidoctor
- Asciidoctor PDF
- VS Code Erweiterung **AsciiDoc**

---

## Ruby + DevKit installieren

Asciidoctor basiert auf Ruby.

1. Lade den aktuellen **Ruby+Devkit (x64)** Installer von der offiziellen Webseite herunter:

   https://rubyinstaller.org/

2. Starte den Installer.

3. Aktiviere während der Installation die Option:

   ```
   Add Ruby executables to your PATH
   ```

4. Nach Abschluss der Installation den Haken bei

   ```
   Run 'ridk install' to set up MSYS2 and development toolchain
   ```

   aktiviert lassen.

5. Beim folgenden Dialog einfach **Enter** drücken, um die empfohlene Standardinstallation (`1,3`) auszuführen.

6. Visual Studio Code anschließend neu starten.

Installation überprüfen:

```bash
ruby --version
gem --version
```

---

## Asciidoctor installieren

```bash
gem install asciidoctor
```

Installation überprüfen:

```bash
asciidoctor --version
```

---

## Asciidoctor PDF installieren

```bash
gem install asciidoctor-pdf
```

Installation überprüfen:

```bash
asciidoctor-pdf --version
```

---

## Visual Studio Code

Installiere die Erweiterung:

- **AsciiDoc** (Publisher: **asciidoctor**)

Diese bietet unter anderem:

- Syntax-Highlighting
- Live-Vorschau
- Inhaltsverzeichnis
- Fehlererkennung

---

## PDF erzeugen

Das Projekt enthält einen Build-Task für Visual Studio Code.

Mit

**Strg+Shift+B**

wird automatisch

```text
book.pdf
```

aus der Datei

```text
book.adoc
```

erzeugt.

---

## Git

Nach Änderungen:

```bash
git status
git add .
git commit -m "Beschreibung der Änderung"
git push
```