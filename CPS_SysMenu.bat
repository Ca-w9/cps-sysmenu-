@echo off
title CPS SysMenu v2.3
chcp 65001 >nul
setlocal EnableExtensions EnableDelayedExpansion
for /f "tokens=1,2 delims=#" %%a in ('"prompt $H#$E# & echo on & for %%b in (1) do rem"') do set "ESC=%%b"
set "APP_VERSION=2.3"
set "UPDATE_URL=https://example.com/cps-sysmenu"
set "THEME_DIR=%APPDATA%\CPS_SysMenu"
set "BACKUP_DIR=%THEME_DIR%\backup"
set "PLUGIN_DIR=%~dp0plugins"
call :RESTORE
set "THEME=DARK"
if exist "%THEME_DIR%\theme.txt" set /p THEME=<"%THEME_DIR%\theme.txt"
call :APPLY_THEME
call :BACKUP
call :SPLASH

:LANG
cls
echo %CYAN%=======================================================%RESET%
echo   %GREEN%1.%RESET% %WHITE%Kreyòl%RESET%
echo   %GREEN%2.%RESET% %WHITE%Français%RESET%
echo   %GREEN%3.%RESET% %WHITE%English%RESET%
echo %CYAN%=======================================================%RESET%
set "pick="
set /p pick="%YELLOW%Chwazi lang / Choisir la langue / Choose language (1-3): %RESET%"
if "%pick%"=="1" set "LANG=KR"
if "%pick%"=="2" set "LANG=FR"
if "%pick%"=="3" set "LANG=EN"
if not defined LANG goto LANG
if "%LANG%"=="KR" goto STR_KR
if "%LANG%"=="FR" goto STR_FR
goto STR_EN

:SPLASH
cls
echo %STAR%
echo                         *
echo                        ***
echo                       *****
echo                       *****
echo                      *******
echo                     *********
echo                    ***********
echo      ***************************************
echo        ***********************************
echo           *****************************
echo             *************************
echo                *******************
echo                *******************
echo                *******************
echo               *********************
echo               *********   *********
echo              *******         *******
echo              ****               ****
echo             **                     **
echo %RESET%
echo %MAGENTA%              CPS SYSMENU%RESET%
timeout /t 2 >nul
exit /b

:RESTORE
if not exist "%THEME_DIR%" mkdir "%THEME_DIR%"
if not exist "%THEME_DIR%\theme.txt" if exist "%BACKUP_DIR%\theme.txt" copy /y "%BACKUP_DIR%\theme.txt" "%THEME_DIR%\theme.txt" >nul 2>&1
if not exist "%PLUGIN_DIR%\" if exist "%BACKUP_DIR%\plugins\" xcopy "%BACKUP_DIR%\plugins" "%PLUGIN_DIR%\" /e /i /y /q >nul 2>&1
exit /b

:BACKUP
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%"
if exist "%THEME_DIR%\theme.txt" copy /y "%THEME_DIR%\theme.txt" "%BACKUP_DIR%\theme.txt" >nul 2>&1
if exist "%PLUGIN_DIR%" xcopy "%PLUGIN_DIR%" "%BACKUP_DIR%\plugins\" /e /i /y /q >nul 2>&1
exit /b

:STR_KR
set "T_SUB=Meni Zouti ak Kontwòl Sistèm"
set "T_1=Ouvri tout aplikasyon yo (shell:AppsFolder)"
set "T_2=Ouvri Corbeille (Recycle Bin)"
set "T_3=Netwaye fichye tanporè yo"
set "T_4=Netwayaj Disk (Disk Cleanup)"
set "T_5=Ouvri Task Manager (Jere Pwosesis)"
set "T_6=Pwogram ki demare ak Windows (Startup Apps)"
set "T_7=Redemare machin nan (Restart)"
set "T_8=Ouvri Panèl de Kontwòl (Control Panel)"
set "T_9=Bloke ekran an (Lock Screen)"
set "T_10=Etenn machin nan (Shutdown)"
set "T_11=Rechèch sou entènèt (Search)"
set "T_12=Chanje tèm (klè/sonm)"
set "T_13=Plugin yo (fonksyon siplemantè)"
set "T_14=Restaure paramèt yo (backup)"
set "T_0=Kòde / Sòti"
set "T_PICK=Chwazi yon opsyon (0-14 oswa lèt) epi peye Enter: "
set "T_SEARCH=Ki sa ou vle chèche? "
set "T_CLEAN=Ap netwaye fichye tanporè yo..."
set "T_CLEAN_OK=Netwayaj fini!"
set "T_RESTART=Machin nan ap redemare nan 5 segonn..."
set "T_SHUT=Machin nan ap etenn nan 5 segonn..."
set "T_CONF_R=Èske ou sèten ou vle redemare?"
set "T_CONF_S=Èske ou sèten ou vle etenn?"
set "T_CONF_RESTORE=Èske ou sèten ou vle restore paramèt yo? Sa ap ranplase sa ki la kounye a."
set "T_RESTORE_OK=Paramèt yo restore!"
set "T_YN=o/n"
set "T_YES=o"
set "T_UPD=Gen yon nouvo vèsyon disponib:"
set "T_UPD_FAIL=Mizajou an echwe. Eseye pita."
set "T_PLUG_HEAD=Plugin yo ki disponib:"
set "T_PLUG_NONE=Pa gen okenn plugin. Mete fichye .cmd nan dosye plugins ki kote script la ye."
set "T_PLUG_PICK=Chwazi yon plugin (nimewo) oswa Enter pou retounen: "
goto CHECKUPD

:STR_FR
set "T_SUB=Menu d'outils et contrôle système"
set "T_1=Ouvrir toutes les applications (shell:AppsFolder)"
set "T_2=Ouvrir la Corbeille (Recycle Bin)"
set "T_3=Nettoyer les fichiers temporaires"
set "T_4=Nettoyage de disque (Disk Cleanup)"
set "T_5=Ouvrir le Gestionnaire des tâches"
set "T_6=Programmes au démarrage (Startup Apps)"
set "T_7=Redémarrer l'ordinateur"
set "T_8=Ouvrir le Panneau de configuration"
set "T_9=Verrouiller l'écran"
set "T_10=Éteindre l'ordinateur"
set "T_11=Recherche sur Internet"
set "T_12=Changer le thème (clair/sombre)"
set "T_13=Plugins (fonctions supplémentaires)"
set "T_14=Restaurer les paramètres (sauvegarde)"
set "T_0=Quitter"
set "T_PICK=Choisissez une option (0-14 ou lettre) puis Entrée : "
set "T_SEARCH=Que voulez-vous chercher ? "
set "T_CLEAN=Nettoyage des fichiers temporaires..."
set "T_CLEAN_OK=Nettoyage terminé !"
set "T_RESTART=Redémarrage dans 5 secondes..."
set "T_SHUT=Extinction dans 5 secondes..."
set "T_CONF_R=Voulez-vous vraiment redémarrer ?"
set "T_CONF_S=Voulez-vous vraiment éteindre ?"
set "T_CONF_RESTORE=Voulez-vous restaurer les paramètres ? Cela remplacera les réglages actuels."
set "T_RESTORE_OK=Paramètres restaurés !"
set "T_YN=o/n"
set "T_YES=o"
set "T_UPD=Une nouvelle version est disponible :"
set "T_UPD_FAIL=La mise à jour a échoué. Réessayez plus tard."
set "T_PLUG_HEAD=Plugins disponibles :"
set "T_PLUG_NONE=Aucun plugin. Placez des fichiers .cmd dans le dossier plugins à côté du script."
set "T_PLUG_PICK=Choisissez un plugin (numéro) ou Entrée pour revenir : "
goto CHECKUPD

:STR_EN
set "T_SUB=System tools and controls"
set "T_1=Open all apps (shell:AppsFolder)"
set "T_2=Open Recycle Bin"
set "T_3=Clean temporary files"
set "T_4=Disk Cleanup"
set "T_5=Open Task Manager"
set "T_6=Startup apps (Startup Apps)"
set "T_7=Restart the computer"
set "T_8=Open Control Panel"
set "T_9=Lock screen"
set "T_10=Shut down the computer"
set "T_11=Search the web"
set "T_12=Switch theme (light/dark)"
set "T_13=Plugins (extra features)"
set "T_14=Restore settings (from backup)"
set "T_0=Exit"
set "T_PICK=Choose an option (0-14 or letter) then press Enter: "
set "T_SEARCH=What do you want to search for? "
set "T_CLEAN=Cleaning temporary files..."
set "T_CLEAN_OK=Cleanup done!"
set "T_RESTART=Restarting in 5 seconds..."
set "T_SHUT=Shutting down in 5 seconds..."
set "T_CONF_R=Are you sure you want to restart?"
set "T_CONF_S=Are you sure you want to shut down?"
set "T_CONF_RESTORE=Restore settings? This will replace the current settings."
set "T_RESTORE_OK=Settings restored!"
set "T_YN=y/n"
set "T_YES=y"
set "T_UPD=A new version is available:"
set "T_UPD_FAIL=Update failed. Try again later."
set "T_PLUG_HEAD=Available plugins:"
set "T_PLUG_NONE=No plugins found. Put .cmd files in the plugins folder next to this script."
set "T_PLUG_PICK=Pick a plugin (number) or press Enter to go back: "
goto CHECKUPD

:CHECKUPD
set "latest="
powershell -NoProfile -Command "try { (Invoke-WebRequest -UseBasicParsing -Uri '%UPDATE_URL%/version.txt' -TimeoutSec 5).Content.Trim() | Out-File -Encoding ascii '%temp%\cps_latest.txt' } catch {}" >nul 2>&1
if exist "%temp%\cps_latest.txt" set /p latest=<"%temp%\cps_latest.txt"
del "%temp%\cps_latest.txt" >nul 2>&1
if "%latest%"=="" goto MENU
if "%latest%"=="%APP_VERSION%" goto MENU
set "ok="
set /p ok="%YELLOW%%T_UPD% %latest% (%T_YN%): %RESET%"
if /i not "%ok%"=="%T_YES%" goto MENU
powershell -NoProfile -Command "try { Invoke-WebRequest -UseBasicParsing -Uri '%UPDATE_URL%/CPS_SysMenu.bat' -OutFile '%temp%\cps_new.bat' -TimeoutSec 20 } catch { exit 1 }"
if errorlevel 1 goto UPD_FAIL
start "" powershell -NoProfile -WindowStyle Hidden -Command "Start-Sleep 2; Copy-Item '%temp%\cps_new.bat' '%~f0' -Force; Start-Process '%~f0'"
exit

:UPD_FAIL
echo %RED%%T_UPD_FAIL%%RESET%
timeout /t 3 >nul
goto MENU

:MENU
cls
echo %MAGENTA% ██████╗██████╗ ███████╗    ███████╗██╗   ██╗███████╗███╗   ███╗███████╗███╗   ██╗██╗   ██╗%RESET%
echo %MAGENTA%██╔════╝██╔══██╗██╔════╝    ██╔════╝╚██╗ ██╔╝██╔════╝████╗ ████║██╔════╝████╗  ██║██║   ██║%RESET%
echo %MAGENTA%██║     ██████╔╝███████╗    ███████╗ ╚████╔╝ ███████╗██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║%RESET%
echo %MAGENTA%██║     ██╔═══╝ ╚════██║    ╚════██║  ╚██╔╝  ╚════██║██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║%RESET%
echo %MAGENTA%╚██████╗██║     ███████║    ███████║   ██║   ███████║██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝%RESET%
echo %MAGENTA% ╚═════╝╚═╝     ╚══════╝    ╚══════╝   ╚═╝   ╚══════╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝ %RESET%
echo %BLUE%              %T_SUB%%RESET%
echo %CYAN%=======================================================%RESET%
echo.
echo   %GREEN%1.%RESET% %WHITE%%T_1%%RESET%  %YELLOW%[A]%RESET%
echo   %GREEN%2.%RESET% %WHITE%%T_2%%RESET%  %YELLOW%[B]%RESET%
echo   %GREEN%3.%RESET% %WHITE%%T_3%%RESET%  %YELLOW%[T]%RESET%
echo   %GREEN%4.%RESET% %WHITE%%T_4%%RESET%  %YELLOW%[D]%RESET%
echo   %GREEN%5.%RESET% %WHITE%%T_5%%RESET%  %YELLOW%[M]%RESET%
echo   %GREEN%6.%RESET% %WHITE%%T_6%%RESET%  %YELLOW%[S]%RESET%
echo   %RED%7.%RESET% %WHITE%%T_7%%RESET%  %YELLOW%[R]%RESET%
echo   %GREEN%8.%RESET% %WHITE%%T_8%%RESET%  %YELLOW%[P]%RESET%
echo   %GREEN%9.%RESET% %WHITE%%T_9%%RESET%  %YELLOW%[L]%RESET%
echo   %RED%10.%RESET% %WHITE%%T_10%%RESET%  %YELLOW%[O]%RESET%
echo   %GREEN%11.%RESET% %WHITE%%T_11%%RESET%  %YELLOW%[W]%RESET%
echo   %GREEN%12.%RESET% %WHITE%%T_12%%RESET%  %YELLOW%[H]%RESET%
echo   %GREEN%13.%RESET% %WHITE%%T_13%%RESET%  %YELLOW%[G]%RESET%
echo   %YELLOW%14.%RESET% %WHITE%%T_14%%RESET%  %YELLOW%[X]%RESET%
echo   %YELLOW%0.%RESET% %WHITE%%T_0%%RESET%  %YELLOW%[Q]%RESET%
echo.
echo %CYAN%=======================================================%RESET%
set "chwa="
set /p chwa="%YELLOW%%T_PICK%%RESET%"
if /i "%chwa%"=="A" set "chwa=1"
if /i "%chwa%"=="B" set "chwa=2"
if /i "%chwa%"=="T" set "chwa=3"
if /i "%chwa%"=="D" set "chwa=4"
if /i "%chwa%"=="M" set "chwa=5"
if /i "%chwa%"=="S" set "chwa=6"
if /i "%chwa%"=="R" set "chwa=7"
if /i "%chwa%"=="P" set "chwa=8"
if /i "%chwa%"=="L" set "chwa=9"
if /i "%chwa%"=="O" set "chwa=10"
if /i "%chwa%"=="W" set "chwa=11"
if /i "%chwa%"=="H" set "chwa=12"
if /i "%chwa%"=="G" set "chwa=13"
if /i "%chwa%"=="X" set "chwa=14"
if /i "%chwa%"=="Q" set "chwa=0"
if "%chwa%"=="1" goto OPSYON1
if "%chwa%"=="2" goto OPSYON2
if "%chwa%"=="3" goto OPSYON3
if "%chwa%"=="4" goto OPSYON4
if "%chwa%"=="5" goto OPSYON5
if "%chwa%"=="6" goto OPSYON6
if "%chwa%"=="7" goto OPSYON7
if "%chwa%"=="8" goto OPSYON8
if "%chwa%"=="9" goto OPSYON9
if "%chwa%"=="10" goto OPSYON10
if "%chwa%"=="11" goto OPSYON11
if "%chwa%"=="12" goto OPSYON12
if "%chwa%"=="13" goto OPSYON13
if "%chwa%"=="14" goto OPSYON14
if "%chwa%"=="0" exit
goto MENU

:OPSYON1
start shell:AppsFolder
goto MENU
:OPSYON2
start shell:RecycleBinFolder
goto MENU
:OPSYON3
echo %YELLOW%%T_CLEAN%%RESET%
del /q /f /s "%temp%\*" >nul 2>&1
rd /s /q "%temp%" >nul 2>&1
echo %GREEN%%T_CLEAN_OK%%RESET%
timeout /t 2 >nul
goto MENU
:OPSYON4
start cleanmgr.exe
goto MENU
:OPSYON5
start taskmgr.exe
goto MENU
:OPSYON6
start ms-settings:startup
goto MENU
:OPSYON7
set "ok="
set /p ok="%YELLOW%%T_CONF_R% (%T_YN%): %RESET%"
if /i not "%ok%"=="%T_YES%" goto MENU
echo %RED%%T_RESTART%%RESET%
shutdown /r /t 5
pause
goto MENU
:OPSYON8
start control
goto MENU
:OPSYON9
rundll32.exe user32.dll,LockWorkStation
goto MENU
:OPSYON10
set "ok="
set /p ok="%YELLOW%%T_CONF_S% (%T_YN%): %RESET%"
if /i not "%ok%"=="%T_YES%" goto MENU
echo %RED%%T_SHUT%%RESET%
shutdown /s /t 5
pause
goto MENU
:OPSYON11
set "rech="
set /p rech="%YELLOW%%T_SEARCH%%RESET%"
if "%rech%"=="" goto MENU
set "q=%rech: =+%"
start "" "https://www.google.com/search?q=%q%"
goto MENU
:OPSYON12
if "%THEME%"=="DARK" (set "THEME=LIGHT") else (set "THEME=DARK")
call :APPLY_THEME
if not exist "%THEME_DIR%" mkdir "%THEME_DIR%"
> "%THEME_DIR%\theme.txt" echo %THEME%
call :BACKUP
goto MENU
:OPSYON13
set "PN=0"
if not exist "%PLUGIN_DIR%" mkdir "%PLUGIN_DIR%"
cls
echo %CYAN%=======================================================%RESET%
echo %MAGENTA%  %T_PLUG_HEAD%%RESET%
echo %CYAN%=======================================================%RESET%
for %%F in ("%PLUGIN_DIR%\*.cmd") do (
    set /a PN+=1
    set "PLUG!PN!=%%~fF"
    echo   %GREEN%!PN!.%RESET% %WHITE%%%~nF%RESET%
)
if "%PN%"=="0" goto PLUG_NONE
set "pl="
set /p pl="%YELLOW%%T_PLUG_PICK%%RESET%"
if "%pl%"=="" goto MENU
if not defined PLUG%pl% goto MENU
set "PFILE=!PLUG%pl%!"
call "%PFILE%" RUN
pause
goto MENU
:PLUG_NONE
echo %YELLOW%%T_PLUG_NONE%%RESET%
pause
goto MENU
:OPSYON14
set "ok="
set /p ok="%YELLOW%%T_CONF_RESTORE% (%T_YN%): %RESET%"
if /i not "%ok%"=="%T_YES%" goto MENU
if exist "%BACKUP_DIR%\theme.txt" copy /y "%BACKUP_DIR%\theme.txt" "%THEME_DIR%\theme.txt" >nul 2>&1
if exist "%BACKUP_DIR%\plugins\" xcopy "%BACKUP_DIR%\plugins" "%PLUGIN_DIR%\" /e /i /y /q >nul 2>&1
set "THEME=DARK"
if exist "%THEME_DIR%\theme.txt" set /p THEME=<"%THEME_DIR%\theme.txt"
call :APPLY_THEME
echo %GREEN%%T_RESTORE_OK%%RESET%
timeout /t 2 >nul
goto MENU

:APPLY_THEME
if "%THEME%"=="LIGHT" goto APPLY_LIGHT
color 07
set "RESET=%ESC%[0m"
set "CYAN=%ESC%[36m"
set "GREEN=%ESC%[32m"
set "YELLOW=%ESC%[33m"
set "RED=%ESC%[31m"
set "MAGENTA=%ESC%[35m"
set "BLUE=%ESC%[34m"
set "WHITE=%ESC%[37m"
set "STAR=%ESC%[93m"
goto :eof

:APPLY_LIGHT
color F0
set "RESET=%ESC%[0;30;47m"
set "CYAN=%ESC%[34;47m"
set "GREEN=%ESC%[32;47m"
set "YELLOW=%ESC%[35;47m"
set "RED=%ESC%[31;47m"
set "MAGENTA=%ESC%[35;47m"
set "BLUE=%ESC%[34;47m"
set "WHITE=%ESC%[30;47m"
set "STAR=%ESC%[35;47m"
goto :eof
