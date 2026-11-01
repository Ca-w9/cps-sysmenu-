@echo off
if /i not "%~1"=="RUN" exit /b
:RUN
set "BK=%APPDATA%\CPS_SysMenu\backup"
echo.
if not exist "%BK%" echo Pa gen okenn backup toujou. & echo. & exit /b
echo Dosye backup: %BK%
echo.
if exist "%BK%\theme.txt" for %%F in ("%BK%\theme.txt") do echo Dènye backup: %%~tF
echo.
dir "%BK%" /s
echo.
set "ok="
set /p ok="Èske ou vle EFASEL backup sa a? (o/n): "
if /i not "%ok%"=="o" exit /b
rd /s /q "%BK%"
echo Backup la efase. Paramèt ou yo rete menm jan.
exit /b
