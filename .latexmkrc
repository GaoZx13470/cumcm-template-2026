# .latexmkrc —— latexmk 配置（XeLaTeX + bibtex8）
#
# AI 提示：命令行一键双版本请用 build.sh / build.bat（latexmk 的 -jobname 与
#         bibtex8 的非零返回码有兼容问题），本配置主要用于 VSCode LaTeX Workshop
$pdf_mode  = 5;                                                       # xelatex
$xelatex   = 'xelatex -interaction=nonstopmode -synctex=1 %O %S';
$bibtex    = 'bibtex8 %O %B';
$bibtex_use = 2;                                                      # bibtex 用于参考文献
$clean_ext = 'aux bbl blg log out toc synctex.gz fls fdb_latexmk run.xml';

# 让 bibtex 优先搜索本仓库 bib/ 目录
$ENV{'BIBINPUTS'} = './bib:' . ($ENV{'BIBINPUTS'} || '');
