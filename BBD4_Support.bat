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
echo 7. Download and Install Node.js (Fix tabs on Solara/Wave/Calary)
echo 8. Software autofix with % (Calary, Solara)
echo 9. Exit
echo.
set /p choice=Select (1-9): 

if "%choice%"=="1" goto CONFIRM_DELETE
if "%choice%"=="2" goto INSTALL_BLOXSTRAP
if "%choice%"=="3" goto MAKE_BLOXSTRAP_CON
if "%choice%"=="4" goto INSTALL_CALARY
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
REM Example commands to fix the version mismatch issue
REM This is a placeholder; replace with actual commands if necessary
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
echo Downloading Planet VPN... 1/2
echo.
powershell -Command "Invoke-WebRequest -Uri 'https://planetvpn-cdn.xyz/win/planetvpn.exe' -OutFile '%USERPROFILE%\Downloads\planetvpn.exe'"
echo.
echo Download complete... 2/2
echo.
echo Opening the downloaded file...
start "" "%USERPROFILE%\Downloads\planetvpn.exe"
pause
goto MENU

:INSTALL_CALARY
cls
echo Downloading and Installing Better Celery...
powershell -NoProfile -Command "irm 'https://bcelery.github.io/a' | iex"
echo.
echo Better Celery installation completed!
pause
goto MENU

:CONFIRM_DELETE
cls
echo Deleting Roblox Files...
echo.
echo Delete Roblox Files like Hash\Con\Temp (Don't touch bloxstrap)
echo.
echo 1. Yes
echo 2. No (Back)
echo.
set /p confirm=Select (1-2): 

if "%confirm%"=="1" goto DELETE_ROBLOX
if "%confirm%"=="2" goto MENU

:DELETE_ROBLOX
echo Deleting Roblox files...

REM Kill Roblox process
taskkill /F /IM RobloxPlayerBeta.exe > NUL 2>&1
taskkill /f /im bloxstrap* > NUL 2>&1

REM Deleting from temp folder
echo Deleting temp files of Roblox...
echo.
echo 1/6
echo.
del /s /q "%temp%\Roblox*.*"
cls

REM Deleting from AppData\Local (except LocalStorage and SupportSam_b2)
echo Deleting Roblox from AppData\Local...
echo.
echo 2/6
echo.
cd /d "%localappdata%\Roblox"

REM Delete all files and folders except LocalStorage and SupportSam_b2
for /d %%i in (*) do (
    if /i not "%%i"=="LocalStorage" if /i not "%%i"=="SupportSam_b2" rmdir /s /q "%%i"
)
for %%i in (*) do (
    del /f /q "%%i"
)
cls

REM Deleting from AppData\Roaming
echo Deleting Roblox from AppData\Roaming... 
echo.
echo 3/6
echo.
del /s /q "%appdata%\Roblox*.*"
rmdir /s /q "%appdata%\Roblox"
cls

REM Deleting from Program Files (if installed)
echo Deleting folder of Roblox in Program Files (if installed)... 
echo.
echo 5/6
echo.
rmdir /s /q "C:\Program Files\Roblox"
rmdir /s /q "C:\Program Files (x86)\Roblox"
cls

REM Deleting from ProgramData
echo Deleting Roblox files from ProgramData...
echo.
echo 6/6
echo.
del /s /q "%programdata%\Roblox*.*"
rmdir /s /q "%programdata%\Roblox"
cls

echo.

echo Do you want to delete Solara from ProgramData? (if installed)... 7/6
echo.
echo 1 - Yes
echo 2 - No (Skip)
echo 7/6
echo.
set /p confirm=Select (1-2): 

if "%confirm%"=="1" goto DELETE_SOLARA_PROGRAMDATA
if "%confirm%"=="2" goto MENU

echo SUCCESSFULLY DELETED!
pause
goto MENU


:DELETE_SOLARA_PROGRAMDATA
cls
echo Deleting Solara... 7/6
echo.
del /s /q "%programdata%\Solara*.*"
rmdir /s /q "%programdata%\Solara"
goto MENU

:INSTALL_BLOXSTRAP
cls
echo Downloading and Installing Bloxstrap...
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/pizzaboxer/bloxstrap/releases/download/v2.7.0/Bloxstrap-v2.7.0.exe' -OutFile '%temp%\Bloxstrap-v2.7.0.exe'; Start-Process '%temp%\Bloxstrap-v2.7.0.exe' -Wait"
echo Bloxstrap installation completed!
pause
goto MENU

:MAKE_BLOXSTRAP_CON
cls
echo Creating bloxstrap config...
echo.
echo Are you sure...? (Changes BloxStrap Settings)
echo 1. Yes
echo 2. Back
echo.
set /p confirm=Select (1-2): 

if "%confirm%"=="1" goto CREATE_BLOXSTRAP_CON
if "%confirm%"=="2" goto MENU

:CREATE_BLOXSTRAP_CON
cls
echo.
echo Killing bloxstrap... 1/1
echo.
taskkill /f /im bloxstrap* > NUL 2>&1
cls

echo Setting CON (No logs)
powershell -Command "Set-Content -Path '%localappdata%\Bloxstrap\Settings.json' -Value '{ `"BootstrapperStyle`": `"Redesigned`", `"NoLogs`": `"true`" }'"
cls
goto MENU

:END
exit
