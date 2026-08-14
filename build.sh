#!/usr/bin/env bash
# ============================================================================
#  build.sh —— 一键双版本编译（Linux / macOS）
# ----------------------------------------------------------------------------
#  从 main.tex 一次产出：
#    main.pdf       纸质版（黑白）
#    main-elec.pdf  电子版（彩色）
#  编译顺序：xelatex → bibtex → xelatex → xelatex（两版各一遍）
#
#  用法：./build.sh
# ============================================================================
set -e

# 让 bibtex 优先搜索本仓库 bib/ 目录
export BIBINPUTS="./bib:${BIBINPUTS:-}"

# 选择可用的 bibtex：优先 bibtex8（MiKTeX 下更稳定）
if command -v bibtex8 >/dev/null 2>&1; then
  BIBTEX_CMD="bibtex8"
else
  BIBTEX_CMD="bibtex"
fi

compile() {
  local job="$1"
  echo "  [1/4] xelatex ($job, pass 1)..."
  xelatex -interaction=nonstopmode -synctex=1 -jobname="$job" main.tex
  echo "  [2/4] bibtex ($job)..."
  "$BIBTEX_CMD" "$job" || echo "  (bibtex8 对样式警告返回非零，但 .bbl 已生成)"
  echo "  [3/4] xelatex ($job, pass 2)..."
  xelatex -interaction=nonstopmode -synctex=1 -jobname="$job" main.tex
  echo "  [4/4] xelatex ($job, pass 3)..."
  xelatex -interaction=nonstopmode -synctex=1 -jobname="$job" main.tex
}

echo "== paper version main.pdf (b/w) =="
compile main

echo ""
echo "== electronic version main-elec.pdf (color) =="
compile main-elec

echo ""
echo "Done: main.pdf + main-elec.pdf"
