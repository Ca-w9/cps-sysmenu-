@echo off
if /i not "%~1"=="RUN" exit /b
:RUN
echo.
where ollama >nul 2>&1
if not errorlevel 1 goto ALREADY
echo Ollama pa enstale. Komand ofisyèl la ap telechaje epi enstale l.
echo Sa se menm komand ou te kouri nan PowerShell.
echo.
set "ok="
set /p ok="Èske ou vle enstale Ollama kounye a? (o/n): "
if /i not "%ok%"=="o" goto END
powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://ollama.com/install.ps1 | iex"
echo.
echo Fini. Si enstalasyon an reyisi, kounye a kouri ollama pull llama3.2 pou telechaje modèl la.
goto END
:ALREADY
echo Ollama deja enstale sou PC a.
:END
echo.
pause
exit /b
