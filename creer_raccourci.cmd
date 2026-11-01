@echo off
setlocal
set "HERE=%~dp0"
set "HERE=%HERE:~0,-1%"
if not exist "%HERE%\CPS_SysMenu.bat" echo CPS_SysMenu.bat pa jwenn nan menm dosye a. & pause & exit /b
if not exist "%HERE%\cps_logo_icon.ico" echo cps_logo_icon.ico pa jwenn nan menm dosye a. & pause & exit /b
powershell -NoProfile -ExecutionPolicy Bypass -Command "$ws = New-Object -ComObject WScript.Shell; $desk = [Environment]::GetFolderPath('Desktop'); $s = $ws.CreateShortcut((Join-Path $desk 'CPS SysMenu.lnk')); $s.TargetPath = '%HERE%\CPS_SysMenu.bat'; $s.WorkingDirectory = '%HERE%'; $s.IconLocation = '%HERE%\cps_logo_icon.ico,0'; $s.Description = 'CPS SysMenu'; $s.Save(); Write-Host 'Raccourci kreye sou desktop la ak ikon an.'"
pause
exit /b
