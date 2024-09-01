@echo off
set "powershellPath=C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"

:MENU
cls
echo.
echo ====================================================
echo    *** IRON-MARK-BATON 8.2 ***
echo    *** Samuraa1 Support (Made by BBD4) ***
echo ====================================================
echo.
echo @@@@@@ @@@  @@@ @@@@@@@  @@@@@@@   @@@@@@  @@@@@@@  @@@@@@@    @@@@@@@  @@@@@@@  @@@@@@@  @@@  @@@ 
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
echo 8. Downgrade Roblox (Bloxstrap)
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
echo ====================================================
echo           *** FIXING ROBLOX VERSION MISMATCH ***
echo ====================================================
echo.
echo *** Downloading and Running Roblox Downgrader ***
echo.
"%powershellPath%" -NoProfile -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/ActualMasterOogway/Roblox-Downgrader/main/RobloxDowngrader.exe' -OutFile '%temp%\RobloxDowngrader.exe'; Start-Process '%temp%\RobloxDowngrader.exe' -Wait"
echo.
echo *** SUCCESSFULLY FIXED ROBLOX VERSION MISMATCH! ***
pause
goto MENU

:INSTALL_SOLARA
cls
echo ====================================================
echo      *** Downloading and Installing Solara V3 ***
echo ====================================================
echo.
"%powershellPath%" -Command "Start-Process 'https://linkvertise.com/1208172/solara-bootstrapper?o=sharing' -Wait"
echo.
echo *** Opening Downloads folder... ***
start "" "%USERPROFILE%\Downloads"
pause
goto MENU

:INSTALL_NODEJS
cls
echo ====================================================
echo     *** Checking for Existing Node.js Installation ***
echo ====================================================
echo.

set "nodejsPath=C:\Program Files\nodejs"

if exist "%nodejsPath%" (
    echo *** Found existing Node.js installation. Uninstalling... ***
    echo.
    
    taskkill /f /im node.exe > NUL 2>&1
    taskkill /f /im npm.exe > NUL 2>&1
    taskkill /f /im npx.exe > NUL 2>&1
    
    if exist "%nodejsPath%\unins000.exe" (
        echo *** Uninstalling Node.js via the uninstaller... ***
        "%nodejsPath%\unins000.exe" /SILENT /NORESTART
        timeout /t 5 > NUL
    )

    if exist "%nodejsPath%" (
        echo *** Deleting Node.js installation folder... ***
        rmdir /s /q "%nodejsPath%"
    )
    
    echo *** Node.js uninstalled successfully! ***
    echo.
) else (
    echo *** No existing Node.js installation found. ***
    echo.
)

echo ====================================================
echo     *** Downloading and Installing Node.js ***
echo ====================================================
echo.
"%powershellPath%" -Command "Invoke-WebRequest -Uri 'https://nodejs.org/dist/v20.16.0/node-v20.16.0-x64.msi' -OutFile '%temp%\nodejs.msi'; Start-Process '%temp%\nodejs.msi' -Wait"
echo.
echo *** Node.js installation completed! ***
pause
goto MENU

:INSTALL_PLANETVPN
cls
echo ====================================================
echo     *** Downloading and Installing Planet VPN ***
echo ====================================================
echo.
"%powershellPath%" -Command "Invoke-WebRequest -Uri 'https://planetvpn-cdn.xyz/win/planetvpn.exe' -OutFile '%USERPROFILE%\Downloads\planetvpn.exe'"
echo.
echo *** Opening the downloaded file... ***
start "" "%USERPROFILE%\Downloads\planetvpn.exe"
pause
goto MENU

:INSTALL_CELERY
cls
echo ====================================================
echo      *** Downloading and Installing Better Celery ***
echo ====================================================
"%powershellPath%" -NoProfile -Command "irm 'https://bcelery.github.io/a' | iex"
echo.
echo *** Better Celery installation completed! ***
pause
goto MENU

:CONFIRM_DELETE
cls
echo ====================================================
echo           *** CONFIRM DELETE ROBLOX FILES ***
echo ====================================================
echo.
echo 1. Yes
echo 2. No (Back)
echo.
set /p confirm=Select (1-2): 

if "%confirm%"=="1" goto DELETE_ROBLOX
if "%confirm%"=="2" goto MENU

goto MENU

:DELETE_ROBLOX
cls
echo ====================================================
echo            *** DELETING ROBLOX FILES ***
echo ====================================================
echo.
taskkill /F /IM RobloxPlayerBeta.exe > NUL 2>&1
taskkill /f /im bloxstrap* > NUL 2>&1

echo *** Deleting temp files of Roblox... 1/6 ***
del /s /q "%temp%\Roblox*.*"
cls

echo *** Deleting Roblox from AppData\Local... 2/6 ***
cd /d "%localappdata%\Roblox"

for /d %%i in (*) do (
    if /i not "%%i"=="LocalStorage" if /i not "%%i"=="SupportSam_b2" rmdir /s /q "%%i"
)
for %%i in (*) do (
    del /f /q "%%i"
)
cls

echo *** Deleting Roblox from AppData\Roaming... 3/6 ***
del /s /q "%appdata%\Roblox*.*"
rmdir /s /q "%appdata%\Roblox"
cls

echo *** Deleting Roblox from Program Files... 4/6 ***
rmdir /s /q "C:\Program Files\Roblox"
rmdir /s /q "C:\Program Files (x86)\Roblox"
cls

echo *** Deleting Roblox files from ProgramData... 5/6 ***
del /s /q "%programdata%\Roblox*.*"
rmdir /s /q "%programdata%\Roblox"
cls

echo *** SUCCESSFULLY DELETED ROBLOX FILES! 6/6 ***
pause
goto MENU

:INSTALL_BLOXSTRAP
cls
echo ====================================================
echo       *** Downloading and Installing Bloxstrap ***
echo ====================================================
"%powershellPath%" -Command "Invoke-WebRequest -Uri 'https://github.com/pizzaboxer/bloxstrap/releases/download/v2.7.0/Bloxstrap-v2.7.0.exe' -OutFile '%temp%\Bloxstrap-v2.7.0.exe'; Start-Process '%temp%\Bloxstrap-v2.7.0.exe'"
echo.
echo *** Bloxstrap installation completed! ***
pause
goto MENU

:MAKE_BLOXSTRAP_CON
cls
echo ====================================================
echo       *** Creating Bloxstrap Configuration ***
echo ====================================================
echo.
echo Are you sure? (This will change Bloxstrap settings)
echo 1. Yes
echo 2. No (Back)
echo.
set /p confirm=Select (1-2): 

if "%confirm%"=="1" goto CREATE_BLOXSTRAP_CON
if "%confirm%"=="2" goto MENU

goto MENU

:CREATE_BLOXSTRAP_CON
cls
echo ====================================================
echo         *** CREATING BLOXSTRAP CONFIGURATION ***
echo ====================================================
echo.
echo *** Killing Bloxstrap Process... ***
taskkill /f /im bloxstrap* > NUL 2>&1
cls

echo *** Setting Bloxstrap Roblox Player Name to "Roblox" ***
echo.
"%powershellPath%" -Command "Set-Content -Path '%localappdata%\Bloxstrap\Bloxstrap.json' -Value (@'{', '""Launcher"": {', '""Channel"": ""LIVE"",', '""Settings"": {', '""UseBootstrapper"": false,', '""StartInFullscreen"": true', '}', '}', '}' -join [System.Environment]::NewLine) -Force"

echo *** Configuration completed! ***
pause
goto MENU

:END
exit
