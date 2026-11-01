@echo off
if /i not "%~1"=="RUN" exit /b
:RUN
set "AI_MODEL=llama3.2"
set "AI_URL=http://localhost:11434/api/generate"
set "q="
set /p q="Kesyon pou asistan AI lokal la: "
if "%q%"=="" exit /b
set "AI_Q=%q%"
echo.
echo Asistan an ap reflechi...
powershell -NoProfile -Command "try { $r = Invoke-RestMethod -Uri '%AI_URL%' -Method Post -ContentType 'application/json' -Body (@{model='%AI_MODEL%'; prompt=$env:AI_Q; stream=$false} | ConvertTo-Json); Write-Host $r.response } catch { Write-Host 'Asistan an pa disponib. Enstale Ollama sou PC a epi telechaje modèl la (ollama pull %AI_MODEL%).' }"
echo.
exit /b
