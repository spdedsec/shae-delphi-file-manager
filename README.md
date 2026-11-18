# shae-delphi-file-manager

SHAE File Manager — a console-based file manager written in Free Pascal /
Delphi (Object Pascal).

Built to the **SHAE Field Manual Design System** (applied to a text UI):
mono-spaced aligned data, ink on paper concept mapped to the terminal, one
oxide-red signal for headers/actions, no decorative noise. See `DESIGN.md`.

## Features

- Browse directory contents (name, size, type)
- Navigate up / into folders (`up`, `cd <dir>`)
- Select and open files (`open <file>` enters directories or prints text files)
- Print working directory (`pwd`)
- Built-in help (`help`) and clean exit (`quit`)

## Requirements

- Free Pascal Compiler (fpc) 3.2.2+ — or Lazarus / Delphi

> **Note:** fpc is not installed in this environment, so the program cannot
> be compiled or tested locally here. See `scripts/install.sh`.

## Install

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

This produces the `filemanager` executable.

## Run

```bash
./filemanager
```

Example session:
```
SHAE File Manager v0.1.0
========================================
...
/home/spdedsec> ls
Directory: /home/spdedsec
----------------------------------------
NAME                                        SIZE       TYPE
----------------------------------------
tier3                                       <DIR>      Directory
Documents                                   <DIR>      Directory
...
/home/spdedsec> cd tier3
/home/spdedsec/tier3> open README.md
--- README.md ---
...
--- end ---
/home/spdedsec/tier3> up
/home/spdedsec> quit
Goodbye.
```

## Project structure

```
src/
  filemanager.pas   # Free Pascal / Delphi source
scripts/install.sh
Makefile
README.md
DESIGN.md
.github/workflows/release.yml
docs/DE.md
docs/ES.md
LICENSE
```

## Release

Releases are created from git tags (`v*`) via
`.github/workflows/release.yml` and packaged as a zip of `src/`.

## License

MIT. See `LICENSE`.
