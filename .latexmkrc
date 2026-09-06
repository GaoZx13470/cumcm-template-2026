# 单一彩色输出 main.pdf；构建脚本与 VSCode 共用此配置。
# latexmk 自动运行 XeLaTeX / BibTeX，直到引用与页码稳定。
$pdf_mode = 5;
$xelatex = 'xelatex -interaction=nonstopmode -halt-on-error -file-line-error -synctex=1 %O %S';
$bibtex = 'bibtex8 %O %B';
$bibtex_use = 2;
@default_files = ('main.tex');
$clean_ext = 'aux bbl blg log out toc synctex.gz fls fdb_latexmk run.xml';

# 样式文件在 bib/；保留尾部分隔符以继续搜索 TeX 默认目录。
my $path_sep = ($^O eq 'MSWin32') ? ';' : ':';
$ENV{'BSTINPUTS'} = './bib' . $path_sep . ($ENV{'BSTINPUTS'} || '');
$ENV{'BIBINPUTS'} = '.' . $path_sep . ($ENV{'BIBINPUTS'} || '');
