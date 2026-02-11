# XFOIL 6.99 — macOS ARM64 Build

XFOIL is a subsonic airfoil analysis and design program by Mark Drela and Harold Youngren (MIT). This is the official 6.99 source patched to build on macOS Apple Silicon with gfortran and XQuartz.

Original source: https://web.mit.edu/drela/Public/web/xfoil/

This repository is not affiliated with or endorsed by the original authors or MIT.

## Prerequisites

- **gfortran** (via Homebrew): `brew install gcc`
- **XQuartz** (for GUI): `brew install --cask xquartz` — log out and back in after install

## Build

```bash
# 1. Build the plot library
cd plotlib && make && cd ..

# 2. Build XFOIL and plotting tools
cd bin && make xfoil pplot pxplot && cd ..
```

Binaries are built in `bin/`.

## Run

Start XQuartz before launching XFOIL if you want plotting/GUI:

```bash
open -a XQuartz
cd bin
./xfoil
```

By default, XFOIL builds without the Orr-Sommerfeld database dependency, so the binary is fully self-contained. To enable TS-wave frequency plotting, rebuild with the OS map support and set the `OSMAP` environment variable:

```bash
make xfoil OSOBJ="frplot.o ntcalc.o osmap.o getosfile.o"
export OSMAP=/path/to/orrs/osmap.dat
```

## Rebuilding the Orr-Sommerfeld database (optional)

The precomputed database (`orrs/osmap.dat`) is included. To regenerate it:

```bash
cd orrs/bin && make osgen && ./osgen
```

## Documentation

See `xfoil_doc.txt` for the full user guide.

## License

XFOIL is Copyright (C) 2000 Mark Drela, Harold Youngren, and is licensed under the [GNU General Public License v3](https://www.gnu.org/licenses/gpl-3.0.html) (originally distributed as GPL v2+). The Xplot11 plot library (`plotlib/`) is licensed under the [GNU Lesser General Public License v3](https://www.gnu.org/licenses/lgpl-3.0.html) (originally distributed as LGPL v2+).
