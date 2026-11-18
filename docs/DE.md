# shae-delphi-file-manager — Installations- und Nutzungsanleitung (Deutsch)

SHAE File Manager — ein konsolenbasierter Dateimanager in Free Pascal /
Delphi (Object Pascal).

Entsprechend dem **SHAE Field Manual Design System** (auf eine Text-UI
angewendet): monospace-ausgerichtete Daten, Tinte auf Papier konzeptuell
auf das Terminal übertragen, ein Oxid-Rot-Signal für Header/Aktionen, keine
dekorativen Elemente. Siehe `DESIGN.md`.

## Features

- Verzeichnisinhalte durchsuchen (Name, Größe, Typ)
- Nach oben / in Ordner navigieren (`up`, `cd <dir>`)
- Dateien auswählen und öffnen (`open <file>` betritt Verzeichnisse oder
  gibt Textdateien aus)
- Arbeitsverzeichnis ausgeben (`pwd`)
- Integrierte Hilfe (`help`) und sauberer Abbruch (`quit`)

## Voraussetzungen

- Free Pascal Compiler (fpc) 3.2.2+ — oder Lazarus / Delphi

> **Hinweis:** fpc ist in dieser Umgebung nicht installiert, sodass das
> Programm hier nicht kompiliert oder getestet werden kann. Siehe
> `scripts/install.sh`.

## Installation

```bash
git clone https://github.com/spdedsec/shae-delphi-file-manager.git
cd shae-delphi-file-manager
./scripts/install.sh
```

## Build

```bash
cd src
fpc filemanager.pas
```

Daraus entsteht die ausführbare Datei `filemanager`.

## Ausführen

```bash
./filemanager
```

Beispielsitzung:
```
SHAE File Manager v0.1.0
...
/home/spdedsec> ls
...
/home/spdedsec> cd tier3
/home/spdedsec/tier3> open README.md
...
/home/spdedsec/tier3> up
/home/spdedsec> quit
Goodbye.
```

## Lizenz

MIT. Siehe `LICENSE`.
