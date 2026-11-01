@echo off
if /i not "%~1"=="RUN" exit /b
:RUN
echo.
echo Ap verifye Ollama...
echo.
where ollama >nul 2>&1
if errorlevel 1 goto NOT_INSTALLED
ollama --version
echo.
echo Modèl ki disponib:
ollama list
echo.
powershell -NoProfile -Command "try { Invoke-RestMethod -Uri 'http://localhost:11434/api/tags' -TimeoutSec 3 | Out-Null; Write-Host 'Sèvis Ollama ap kouri sou localhost:11434' -ForegroundColor Green } catch { Write-Host 'Ollama enstale, men sèvis la pa ap kouri. Louvri Ollama oswa kouri ollama serve.' -ForegroundColor Yellow }"
echo.
pause
exit /b
:NOT_INSTALLED
echo Ollama pa enstale sou PC a. Enstale l depi ollama.com.
echo.
pause
exit /b
