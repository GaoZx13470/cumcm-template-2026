#!/usr/bin/env bash
# 一键编译彩色 main.pdf（Linux / macOS）；自动处理参考文献和交叉引用。
set -euo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
latexmk -cd "$SCRIPT_DIR/main.tex"
echo "Done: main.pdf (color)"
