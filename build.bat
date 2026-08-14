@echo off
rem ============================================================================
rem  build.bat —— 一键双版本编译（Windows）
rem ----------------------------------------------------------------------------
rem  从 main.tex 一次产出：
rem    main.pdf       纸质版（黑白）
rem    main-elec.pdf  电子版（彩色）
rem  编译顺序：xelatex → bibtex → xelatex → xelatex（两版各一遍）
rem
rem  用法：双击本文件，或在 cmd 中执行 build.bat
rem  注意：本文件保持纯 ASCII（Windows 中文环境默认 GBK/936）
rem ============================================================================

rem 让 bibtex 优先搜索本仓库 bib/ 目录
set BIBINPUTS=.\bib;%BIBINPUTS%

echo == paper version main.pdf (b/w) ==
call :compile main

echo.
echo == electronic version main-elec.pdf (color) ==
call :compile main-elec

echo.
echo Done: main.pdf + main-elec.pdf
goto :eof

:compile
rem %~1 = jobname
echo   [1/4] xelatex (%~1, pass 1)...
xelatex -interaction=nonstopmode -synctex=1 -jobname=%~1 main.tex
echo   [2/4] bibtex (%~1)...
rem bibtex8 在 MiKTeX 下更稳定（bibtex.exe 在某些 shell 会段错误）
bibtex8 %~1
if errorlevel 1 echo     (bibtex8 对样式警告返回非零，但 .bbl 已生成)
echo   [3/4] xelatex (%~1, pass 2)...
xelatex -interaction=nonstopmode -synctex=1 -jobname=%~1 main.tex
echo   [4/4] xelatex (%~1, pass 3)...
xelatex -interaction=nonstopmode -synctex=1 -jobname=%~1 main.tex
goto :eof
