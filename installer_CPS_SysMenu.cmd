@echo off
setlocal
set "SRC=%~dp0"
set "SRC=%SRC:~0,-1%"
set "DEST=%LOCALAPPDATA%\CPS_SysMenu_App"
echo Ap enstale CPS SysMenu...
if not exist "%SRC%\CPS_SysMenu.bat" echo CPS_SysMenu.bat pa jwenn. & pause & exit /b
if not exist "%SRC%\cps_logo_icon.ico" echo cps_logo_icon.ico pa jwenn. & pause & exit /b
if not exist "%DEST%" mkdir "%DEST%"
copy /y "%SRC%\CPS_SysMenu.bat" "%DEST%\CPS_SysMenu.bat" >nul
copy /y "%SRC%\cps_logo_icon.ico" "%DEST%\cps_logo_icon.ico" >nul
if exist "%SRC%\plugins" xcopy "%SRC%\plugins" "%DEST%\plugins\" /e /i /y /q >nul
powershell -NoProfile -ExecutionPolicy Bypass -Command "$ws = New-Object -ComObject WScript.Shell; $desk = [Environment]::GetFolderPath('Desktop'); $s = $ws.CreateShortcut((Join-Path $desk 'CPS SysMenu.lnk')); $s.TargetPath = '%DEST%\CPS_SysMenu.bat'; $s.WorkingDirectory = '%DEST%'; $s.IconLocation = '%DEST%\cps_logo_icon.ico,0'; $s.Description = 'CPS SysMenu'; $s.Save()"
echo.
echo Enstalasyon fini! Raccourci CPS SysMenu la sou desktop la.
pause
exit /b
