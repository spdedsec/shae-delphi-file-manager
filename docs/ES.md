# shae-delphi-file-manager — Guía de instalación y uso (Español)

SHAE File Manager — un gestor de archivos basado en consola escrito en
Free Pascal / Delphi (Object Pascal).

Aplicado el **Sistema de Diseño SHAE Field Manual** (a una interfaz de
texto): datos alineados monoespaciados, tinta sobre papel conceptual
mapeada a la terminal, una señal óxido por encabezado/acción, sin ruido
decorativo. Véase `DESIGN.md`.

## Características

- Explorar contenidos de directorios (nombre, tamaño, tipo)
- Navegar hacia arriba / dentro de carpetas (`up`, `cd <dir>`)
- Seleccionar y abrir archivos (`open <file>` entra a directorios o imprime
  archivos de texto)
- Imprimir directorio de trabajo (`pwd`)
- Ayuda integrada (`help`) y salida limpia (`quit`)

## Requisitos

- Free Pascal Compiler (fpc) 3.2.2+ — o Lazarus / Delphi

> **Nota:** fpc no está instalado en este entorno, por lo que el programa no
> puede compilarse ni probarse localmente aquí. Véase `scripts/install.sh`.

## Instalación

```bash
git clone https://github.com/spdedsec/shae-delphi-file-manager.git
cd shae-delphi-file-manager
./scripts/install.sh
```

## Compilación

```bash
cd src
fpc filemanager.pas
```

Esto produce el ejecutable `filemanager`.

## Ejecución

```bash
./filemanager
```

Sesión de ejemplo:
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

## Licencia

MIT. Véase `LICENSE`.
