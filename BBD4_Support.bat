@echo off
set "powershellPath=C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"

:MENU
cls
echo /====================================================\
echo             *** IRON-MARK-BATON 8.8 ***                 
echo        *** Samuraa1 Support (Made by BBD4) ***             
echo \====================================================/
echo     ______________________________________________
echo     \'########::'########::'########::'##::::::::/
echo     / ##.... ##: ##.... ##: ##.... ##: ##:::'##::\
echo     \ ##:::: ##: ##:::: ##: ##:::: ##: ##::: ##::/
echo     / ########:: ########:: ##:::: ##: ##::: ##::\
echo     \ ##.... ##: ##.... ##: ##:::: ##: #########:/ 
echo     / ##:::: ##: ##:::: ##: ##:::: ##:...... ##::\
echo     \ ########:: ########:: ########:::::::: ##::/
echo     /........:::........:::........:::::::::..:::\ 
echo     \____________________________________________/
echo.
echo                   __              __
echo                  //+\ Options Or /+\\
echo                  \\_/ Functions  \_//
echo.
echo     1. Delete AppData\Hash\Con\Trash files of Roblox\Exploits
echo     2. Download and Install\open Latest Bloxstrap Version
echo     3. Make Bloxstrap Config
echo     4. Download and Open Better Celery Exploit
echo     5. Download SolaraV3 Exploit
echo     6. Download and Install Nezur Exploit 
echo     7. Show list of VPN's downloads (Fix Error 403/etc access)
echo     8. Download and Install Node.js (Fix tabs on exploit)
echo     9. Downgrade Roblox Version (Bloxstrap)
echo    10. ...
echo    11. Join Discord server Samuraa1 Community (If you want L:D )
echo    12. Exit
echo.
set /p choice=Select (1-12): 

if "%choice%"=="1" goto CONFIRM_DELETE
if "%choice%"=="2" goto INSTALL_BLOXSTRAP
if "%choice%"=="3" goto MAKE_BLOXSTRAP_CON
if "%choice%"=="4" goto INSTALL_CELERY
if "%choice%"=="5" goto INSTALL_SOLARA
if "%choice%"=="6" goto INSTALL_NEZUR
if "%choice%"=="7" goto INSTALL_VPN
if "%choice%"=="8" goto INSTALL_NODEJS
if "%choice%"=="9" goto FIX_ROBLOX_VERSION_MISMATCH
if "%choice%"=="10" goto END
if "%choice%"=="11" goto JOIN_DISCORD
if "%choice%"=="12" goto END

goto MENU

:INSTALL_NEZUR
cls
echo /====================================================\
echo    *** Downloading and Installing Nezur Executor ***
echo \====================================================/
echo.

:: Check if PowerShell path is defined, else use default
if not defined powershellPath set powershellPath=%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe

:: Download Nezur Executor
echo Downloading Nezur Executor...
"%powershellPath%" -Command "Invoke-WebRequest -Uri 'https://nezur.io/Nezur_Executor.zip' -OutFile '%temp%\Nezur_Executor.zip'"
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to download Nezur Executor.
    pause
    goto MENU
)

:: Extract the downloaded zip file
echo Extracting Nezur Executor...
"%powershellPath%" -Command "Expand-Archive -Path '%temp%\Nezur_Executor.zip' -DestinationPath '%temp%\Nezur_Executor' -Force"
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to extract Nezur Executor.
    pause
    goto MENU
)

:: Start Nezur Executor
echo Starting Nezur Executor...
start "" "%temp%\Nezur_Executor\Nezur_Executor.exe"
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to start Nezur Executor.
    pause
    goto MENU
)

:: Open Downloads folder
echo /====================================================\
echo           *** Opening Downloads folder... ***
echo \====================================================/
start "" "%USERPROFILE%\Downloads"
pause
goto MENU


echo.
echo /====================================================\
echo     *** Nezur Executor installation completed! ***
echo \====================================================/
pause
goto MENU



:FIX_ROBLOX_VERSION_MISMATCH
cls
echo /====================================================\
echo        *** FIXING ROBLOX VERSION MISMATCH ***             
echo \====================================================/
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
echo /====================================================\
echo      *** Downloading and Installing Solara V3 ***              
echo \====================================================/
echo.
"%powershellPath%" -Command "Invoke-WebRequest -Uri 'https://1c143a05.solaraweb-alj.pages.dev/download/static/files/Bootstrapper.exe' -OutFile '%temp%\Bootstrapper.exe'; Start-Process '%temp%\Bootstrapper.exe' -Wait"
echo.
echo *** Opening Downloads folder... ***
start "" "%USERPROFILE%\Downloads"
pause
goto MENU

:INSTALL_NODEJS
cls
echo /====================================================\
echo   *** Checking for Existing Node.js Installation ***             
echo \====================================================/
echo.

set "nodejsPath=C:\Program Files\nodejs"

if exist "%nodejsPath%" (
    echo *** Found existing Node.js installation. Uninstalling... ***
    echo.
    call :UNINSTALL_NODEJS
    echo *** Node.js uninstalled successfully! ***
    echo.
) else (
    echo *** No existing Node.js installation found. ***
    echo.
)

echo /====================================================\
echo      *** Downloading and Installing Node.js ***             
echo \====================================================/
echo.
"%powershellPath%" -Command "Invoke-WebRequest -Uri 'https://nodejs.org/dist/v20.16.0/node-v20.16.0-x64.msi' -OutFile '%temp%\nodejs.msi'; Start-Process '%temp%\nodejs.msi' -Wait"
echo.
echo *** Node.js installation completed! ***
pause
goto MENU

:UNINSTALL_NODEJS
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
goto :EOF

:INSTALL_VPN
cls
echo /====================================================\
echo          *** List of VPNs (Download) ***             
echo \====================================================/
echo               ____                ____
echo              / //+\  Options Or  /+\\ \
echo             /__\\_/   Functions  \_//__\
echo             \__/_/  ____________  \_\__/
echo              \/_/  /___///\\\___\  \_\/
echo              //0\ //9\ \\\/// /8\\ /1\\
echo              \\_/ \\_/ ///\\\ \_// \_//
echo               -0    -  \\\///    0 _
echo                -  0     \VV/  0        0
echo                     _    \/ -        0
echo            -             0-      -     -
echo. 
echo 1. PlanetVPN
echo 2. Hide.me VPN (KEY: 50226389802992)
echo 3. XVPN
echo 4. Exit
echo.

set /p choice="Choose VPN to download (1-4): "

if "%choice%" == "1" (
    echo /====================================================\
    echo                Downloading PlanetVPN...
    echo \====================================================/
    "%powershellPath%" -Command "Invoke-WebRequest -Uri 'https://planetvpn-cdn.xyz/win/planetvpn.exe' -OutFile '%USERPROFILE%\Downloads\planetvpn.exe'"
    echo.
    echo *** Opening the downloaded file... ***
    start "" "%USERPROFILE%\Downloads\planetvpn.exe"
) else if "%choice%" == "2" (
    echo /====================================================\
    echo                Downloading Hide.me VPN...
    echo \====================================================/
    start https://member.hide.me/
) else if "%choice%" == "3" (
    echo /====================================================\
    echo                 Downloading XVPN...
    echo \====================================================/
    "%powershellPath%" -Command "Invoke-WebRequest -Uri 'https://xvpn.io/download/vpn-win?isAutoDownload=true&os=win' -OutFile '%USERPROFILE%\Downloads\xvpn.exe'"
    echo.
    echo *** Opening the downloaded file... ***
    start "" "%USERPROFILE%\Downloads\xvpn.exe"
) else if "%choice%" == "4" (
    goto MENU
) else (
    echo Invalid, try again!
    pause
    goto INSTALL_VPN
)

pause
goto MENU

:INSTALL_CELERY
cls
echo /====================================================\
echo    *** Downloading and Installing Better Celery ***              
echo \====================================================/
"%powershellPath%" -NoProfile -Command "irm 'https://bcelery.github.io/a' | iex"
echo.
echo *** Better Celery installation completed! ***
pause
goto MENU

:CONFIRM_DELETE
cls
echo /====================================================\
echo          *** CONFIRM DELETE ROBLOX FILES ***             
echo \====================================================/
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
echo /====================================================\
echo               *** DELETING ROBLOX FILES ***             
echo \====================================================/
echo.
taskkill /F /IM RobloxPlayerBeta.exe > NUL 2>&1
taskkill /f /im bloxstrap* > NUL 2>&1
taskkill /f /im WpfApp1* > NUL 2>&1

echo /====================================================\
echo      *** Deleting temp files of Roblox... 1/6 ***
echo \====================================================/
del /s /q "%temp%\Roblox*.*"
cls

echo /====================================================\
echo   *** Deleting Roblox from AppData\Local... 2/6 ***
echo \====================================================/
cd /d "%localappdata%\Roblox"

for /d %%i in (*) do (
    if /i not "%%i"=="LocalStorage" if /i not "%%i"=="SupportSam_b2" rmdir /s /q "%%i"
)
for %%i in (*) do (
    del /f /q "%%i"
)
cls

echo /====================================================\
echo  *** Deleting Roblox from AppData\Roaming... 3/6 ***
echo \====================================================/
del /s /q "%appdata%\Roblox*.*"
rmdir /s /q "%appdata%\Roblox"
cls

echo /====================================================\
echo   *** Deleting Roblox from Program Files... 4/6 ***
echo \====================================================/
rmdir /s /q "C:\Program Files\Roblox"
rmdir /s /q "C:\Program Files (x86)\Roblox"
cls

echo /====================================================\
echo   *** Del Roblox and Solara files from PD... 5/6 ***
echo \====================================================/
del /s /q "%programdata%\Roblox*.*"
rmdir /s /q "%programdata%\Roblox"
del /s /q "%programdata%\Solara.zip"
rmdir /s /q "%programdata%\Solara"
cls

echo /====================================================\
echo     *** SUCCESSFULLY DELETED ROBLOX FILES! 6/6 ***
echo \====================================================/
pause
goto MENU

:INSTALL_BLOXSTRAP
cls
echo /====================================================\
echo      *** Downloading and Installing Bloxstrap ***              
echo \====================================================/
echo.
"%powershellPath%" -Command "Invoke-WebRequest -Uri 'https://github.com/bloxstrap/bloxstrap/releases/download/v2.6.7/Bloxstrap-Windows-x64.exe' -OutFile '%temp%\Bloxstrap-Windows-x64.exe'; Start-Process '%temp%\Bloxstrap-Windows-x64.exe' -Wait"
echo.
echo /====================================================\
echo      *** Bloxstrap installation completed! ***
echo \====================================================/
pause
goto MENU

:MAKE_BLOXSTRAP_CON
cls
echo /====================================================\
echo          *** Creating Bloxstrap Configuration ***              
echo \====================================================/
echo.
set "configPath=%USERPROFILE%\AppData\Local\Bloxstrap\config.json"
echo {
echo   "game": "roblox",
echo   "locale": "en-us",
echo   "user_data": "None"
echo } > "%configPath%"
echo.
echo /====================================================\
echo       *** Bloxstrap configuration created! ***
echo \====================================================/
pause
goto MENU

:END
cls
echo  _______________________________________
echo /'########::'##:::'##:'########:'####:\.\
echo \ ##.... ##:. ##:'##:: ##.....:: ####:/ /
echo / ##:::: ##::. ####::: ##::::::: ####:\.\
echo \ ########::::. ##:::: ######:::: ##::/ /
echo / ##.... ##:::: ##:::: ##...:::::..:::\.\
echo \ ##:::: ##:::: ##:::: ##:::::::'####:/ /
echo / ########::::: ##:::: ########: ####:\.\
echo \........::::::..:::::........::....::/ /
echo /_____________________________________\.\
timeout /t 2 /nobreak > NUL
exit
