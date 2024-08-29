@echo off
cls
:MENU
echo.
echo *** VERSION 0.7 ***
echo *** Samuraa1 Support (Made by BBD4) ***
echo.
echo  @@@@@@ @@@  @@@ @@@@@@@  @@@@@@@   @@@@@@  @@@@@@@  @@@@@@@    @@@@@@@  @@@@@@@  @@@@@@@  @@@  @@@ 
echo !@@     @@!  @@@ @@!  @@@ @@!  @@@ @@!  @@@ @@!  @@@   @!!      @@!  @@@ @@!  @@@ @@!  @@@ @@@  @@@ 
echo  !@@!!  @!@  !@! @!@@!@!  @!@@!@!  @!@  !@! @!@!!@!    @!!      @!@!@!@  @!@!@!@  @!@  !@! @!@!@!@! 
echo     !:! !!:  !!! !!:      !!:      !!:  !!! !!: :!!    !!:      !!:  !!! !!:  !!! !!:  !!!      !!! 
echo ::.: :   :.:: :   :        :        : :. :   :   : :    :       :: : ::  :: : ::  :: :  :       : : 
echo.
echo 1. Delete AppData\Hash\Con files of Roblox
echo 2. Download and Install Latest Bloxstrap 
echo 3. Make Bloxstrap Config
echo 4. Download and Install Better Celery
echo 5. Download and Install Solara
echo 6. Download and Install Planet VPN (Fix Error 403/etc access)
echo 7. Download and Install Node.js (Fix tabs on Solara/Wave/Celery)
echo 8. Software autofix with % (Celery, Solara)
echo 9. Exit
echo.
set /p choice=Select (1-9): 

if "%choice%"=="1" goto CONFIRM_DELETE
if "%choice%"=="2" goto INSTALL_BLOXSTRAP
if "%choice%"=="3" goto MAKE_BLOXSTRAP_CON
if "%choice%"=="4" goto INSTALL_CELERY
if "%choice%"=="5" goto INSTALL_SOLARA
if "%choice%"=="6" goto INSTALL_PLANETVPN
if "%choice%"=="7" goto INSTALL_NODEJS
if "%choice%"=="8" goto FIX_ROBLOX_VERSION_MISMATCH
if "%choice%"=="9" goto END

goto MENU

:FIX_ROBLOX_VERSION_MISMATCH
cls
echo *** Fixing Roblox Version Mismatch! ***
echo.
REM Replace with actual commands if necessary
echo Attempting to fix Roblox version mismatch...
pause
goto MENU

:INSTALL_SOLARA
cls
echo *** Downloading and Installing Solara V3 Bootstrapper ***
echo.
powershell -Command "Start-Process 'https://linkvertise.com/1208172/solara-bootstrapper?o=sharing' -Wait"
echo.
echo Opening Downloads folder...
start "" "%USERPROFILE%\Downloads"
pause
goto MENU

:INSTALL_NODEJS
cls
echo *** Downloading and Installing Node.js ***
echo.
powershell -Command "Invoke-WebRequest -Uri 'https://nodejs.org/dist/v20.16.0/node-v20.16.0-x64.msi' -OutFile '%temp%\nodejs.msi'; Start-Process '%temp%\nodejs.msi' -Wait"
echo.
echo Node.js installation completed!
pause
goto MENU

:INSTALL_PLANETVPN
cls
echo *** Downloading and Installing Planet VPN ***
echo.
powershell -Command "Invoke-WebRequest -Uri 'https://planetvpn-cdn.xyz/win/planetvpn.exe' -OutFile '%USERPROFILE%\Downloads\planetvpn.exe'"
echo.
echo Opening the downloaded file...
start "" "%USERPROFILE%\Downloads\planetvpn.exe"
pause
goto MENU

:INSTALL_CELERY
cls
echo *** Downloading and Installing Better Celery ***
powershell -NoProfile -Command "irm 'https://bcelery.github.io/a' | iex"
echo.
echo Better Celery installation completed!
pause
goto MENU

:CONFIRM_DELETE
cls
echo Deleting Roblox Files...
echo.
echo 1. Yes
echo 2. No (Back)
echo.
set /p confirm=Select (1-2): 

if "%confirm%"=="1" goto DELETE_ROBLOX
if "%confirm%"=="2" goto MENU

:DELETE_ROBLOX
cls
echo *** Deleting Roblox Files ***
echo.
taskkill /F /IM RobloxPlayerBeta.exe > NUL 2>&1
taskkill /f /im bloxstrap* > NUL 2>&1

echo Deleting temp files of Roblox... 1/6
del /s /q "%temp%\Roblox*.*"
cls

echo Deleting Roblox from AppData\Local... 2/6
cd /d "%localappdata%\Roblox"

REM Delete all files and folders except LocalStorage and SupportSam_b2
for /d %%i in (*) do (
    if /i not "%%i"=="LocalStorage" if /i not "%%i"=="SupportSam_b2" rmdir /s /q "%%i"
)
for %%i in (*) do (
    del /f /q "%%i"
)
cls

echo Deleting Roblox from AppData\Roaming... 3/6
del /s /q "%appdata%\Roblox*.*"
rmdir /s /q "%appdata%\Roblox"
cls

echo Deleting folder of Roblox in Program Files (if installed)... 4/6
rmdir /s /q "C:\Program Files\Roblox"
rmdir /s /q "C:\Program Files (x86)\Roblox"
cls

echo Deleting Roblox files from ProgramData... 5/6
del /s /q "%programdata%\Roblox*.*"
rmdir /s /q "%programdata%\Roblox"
cls

echo SUCCESSFULLY DELETED!
pause
goto MENU

:INSTALL_BLOXSTRAP
cls
echo *** Downloading and Installing Bloxstrap ***
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/pizzaboxer/bloxstrap/releases/download/v2.7.0/Bloxstrap-v2.7.0.exe' -OutFile '%temp%\Bloxstrap-v2.7.0.exe'; Start-Process '%temp%\Bloxstrap-v2.7.0.exe' -Wait"
echo Bloxstrap installation completed!
pause
goto MENU

:MAKE_BLOXSTRAP_CON
cls
echo *** Creating Bloxstrap Config ***
echo.
echo Are you sure? (Changes BloxStrap Settings)
echo 1. Yes
echo 2. Back
echo.
set /p confirm=Select (1-2): 

if "%confirm%"=="1" goto CREATE_BLOXSTRAP_CON
if "%confirm%"=="2" goto MENU

:CREATE_BLOXSTRAP_CON
cls
echo.
echo Killing Bloxstrap... 1/1
taskkill /f /im bloxstrap* > NUL 2>&1
cls

echo Setting CON (No logs)
powershell -Command "Set-Content -Path '%localappdata%\Bloxstrap\Settings.json' -Value '{ `"BootstrapperStyle`": `"Redesigned`", `"NoLogs`": `"true`" }'"
cls
goto MENU

:END
exit
