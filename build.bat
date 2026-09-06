@echo off
setlocal
rem Build the single color PDF beside main.tex, from any working directory.
latexmk -cd "%~dp0main.tex"
if errorlevel 1 exit /b 1
echo Done: main.pdf (color)
exit /b 0
