#!/usr/bin/env bash
# ============================================================================
#  fonts/download.sh —— 自动下载模板所需开源字体（可选）
# ----------------------------------------------------------------------------
#  字体均为 SIL Open Font License 1.1（OFL）开源授权。
#  下载完成后请核对文件与 fonts/README.md 清单一致。
#
#  用法（在 Linux / macOS / Git Bash 下）：
#    cd fonts
#    bash download.sh
# ============================================================================
set -e

BASE_NOTO="https://github.com/notofonts/noto-cjk/raw/main"
BASE_LIBE="https://github.com/alerque/libertinus/raw/master/static/OTF"

echo "[1/3] 下载 Noto Serif/Sans CJK SC ..."
curl -L --fail -o NotoSerifCJKsc-Regular.otf "$BASE_NOTO/Serif/OTF/SimplifiedChinese/NotoSerifCJKsc-Regular.otf"
curl -L --fail -o NotoSerifCJKsc-Bold.otf    "$BASE_NOTO/Serif/OTF/SimplifiedChinese/NotoSerifCJKsc-Bold.otf"
curl -L --fail -o NotoSansCJKsc-Regular.otf  "$BASE_NOTO/Sans/OTF/SimplifiedChinese/NotoSansCJKsc-Regular.otf"
curl -L --fail -o NotoSansCJKsc-Bold.otf     "$BASE_NOTO/Sans/OTF/SimplifiedChinese/NotoSansCJKsc-Bold.otf"

echo "[2/3] 下载 Libertinus Serif/Sans/Math ..."
for f in LibertinusSerif-Regular LibertinusSerif-Bold LibertinusSerif-Italic \
         LibertinusSerif-BoldItalic LibertinusSans-Regular LibertinusSans-Bold \
         LibertinusMath-Regular; do
  curl -L --fail -o "$f.otf" "$BASE_LIBE/$f.otf"
done

echo "[3/3] 下载 TeX Gyre Cursor ..."
BASE_TGC="https://mirrors.ctan.org/fonts/tex-gyre/opentype"
for f in texgyrecursor-regular texgyrecursor-bold texgyrecursor-italic texgyrecursor-bolditalic; do
  curl -L --fail -o "$f.otf" "$BASE_TGC/$f.otf"
done

echo ""
echo "字体下载完成（15 个文件，已放入 fonts/ 顶层）。"
