@echo off
setlocal
set "DEST=%LOCALAPPDATA%\CPS_SysMenu_App"
set "BK=%APPDATA%\CPS_SysMenu"
echo Dezinstalasyon CPS SysMenu
echo.
echo Sa ap efase: dosye aplikasyon an (%DEST%) ak raccourci a sou desktop la.
echo.
set "ok="
set /p ok="Èske ou sèten? (o/n): "
if /i not "%ok%"=="o" goto END
if exist "%DEST%" rd /s /q "%DEST%"
del /q "%USERPROFILE%\Desktop\CPS SysMenu.lnk" >nul 2>&1
del /q "%USERPROFILE%\OneDrive\Desktop\CPS SysMenu.lnk" >nul 2>&1
echo.
echo Aplikasyon an efase.
echo.
set "ok2="
set /p ok2="Èske ou vle efase tou backup paramèt yo? (o/n): "
if /i "%ok2%"=="o" if exist "%BK%" rd /s /q "%BK%"
echo Fini.
:END
echo.
pause
exit /b
