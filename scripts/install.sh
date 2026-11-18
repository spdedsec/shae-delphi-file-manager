#!/usr/bin/env bash
# scripts/install.sh — shae-delphi-file-manager
#
# SHAE File Manager — a console-based file manager in Free Pascal / Delphi.
#
# Requires Free Pascal Compiler (fpc) or Lazarus / Delphi. Not available for
# compile-testing in this environment; see README.md.

set -euo pipefail

echo "=== shae-delphi-file-manager install ==="
echo ""

echo "Requirements:"
echo "  - Free Pascal Compiler (fpc) 3.2.2+  (or Lazarus / Delphi)"
echo ""

if command -v fpc >/dev/null 2>&1; then
  echo "fpc found: $(fpc -iV)"
else
  echo "fpc not found on PATH. Install Free Pascal:"
  echo "  Debian/Ubuntu: sudo apt-get install fpc"
  echo "  macOS:         brew install fpc"
  echo "  Arch:          sudo pacman -S fpc"
fi

echo ""
echo "=== Build & run ==="
echo "# From the project root:"
echo "  cd shae-delphi-file-manager/src"
echo "  fpc filemanager.pas"
echo "  ./filemanager"
echo ""
echo "Commands: ls, cd <dir>, up, open <file>, pwd, help, quit"
