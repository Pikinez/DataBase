@echo off
set "powershellPath=C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
title Support-BBD5-V1.0.1
Color 0A & Mode con cols=68 lines=28
:MENU
cls
Color 0A & Mode con cols=68 lines=28
echo         ____________________________________________________
echo        /====================================================\
echo        \                                                    /
echo        /====================================================\    
echo        \\==================================================//
echo         =\.______________________________________________./=
echo           \\\########::'########::'########::'########:///
echo            \\##.... ##: ##.... ##: ##.... ##: ##.....:://
echo             \##:::: ##: ##:::: ##: ##:::: ##: ##:::::::/
echo             /########:: ########:: ##:::: ##: #######::\
echo            //##.... ##: ##.... ##: ##:::: ##:...... ##:\\
echo            \/##:::: ##: ##:::: ##: ##:::: ##:'##::: ##:\/
echo            \/########:: ########:: ########::. ######::\/
echo      ______//........:::........:::........::::......::\\______
echo      \-____\____________________________________________/____-/
echo       \-___ \==========================================/ ___-/
echo        \-__/-\._____________...........______________./-\__-/
echo               \_\_\_\_\_\_/ \V3rmillion/ \_\_\_\_\_\_/
echo               //+//+//+//+\ .-VoidLust-. /+\\+\\+\\+\\
echo               \\_\\_\\_\\_/              \_//_//_//_//
echo.
echo                 1. Show list of Exploits' downloads
echo                   2. Show list of VPN's downloads (-closed-)
echo                       3. Show list of fixes
echo                       4. Join Discord server
echo.
echo                              5. Exit
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
Color 0A & Mode con cols=54 lines=28
echo /====================================================\
echo              \\\..List of Exploits...///              
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
echo                  1. Install Nezur
echo                   2. Install Solara
echo                  3. Install Celery (Disabled)
echo                   4. Install FluxTeam (Disabled)
echo                  5. Install JJSploit
echo                   6. Install Zorara
echo                7. Back
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
Color 0A & Mode con cols=54 lines=28
echo /====================================================\
echo                \\\..List of VPNs...///              
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
echo                   1. PlanetVPN (No sense)
echo                    2. Hide.me VPN (No sense)
echo                   3. XVPN (No sense)
echo                4. Back 
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
    color 0C
    echo /====================================================\
    echo           Invalid choice, please try again!
    echo \====================================================/
    pause
    goto LIST_VPN
)

if defined vpnName (
    echo /====================================================\
    echo                Downloading %vpnName%...
    echo \====================================================/
    "%powershellPath%" -Command "Invoke-WebRequest -Uri '%vpnUrl%' -OutFile '%USERPROFILE%\Downloads\%vpnName%.exe'"
    
    if %errorlevel% neq 0 (
        color 0C
        echo /====================================================\
        echo ERROR: Failed to download %vpnName%.
        echo \====================================================/
    ) else (
        start "" "%USERPROFILE%\Downloads\%vpnName%.exe"
        echo /====================================================\
        echo %vpnName% downloaded successfully and is now starting!
        echo \====================================================/
    )
)

pause
goto MENU


:LIST_FIXES
cls
Color 0A & Mode con cols=54 lines=28
echo /====================================================\
echo                \\\..List of Fixes...///            
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
echo  1. Delete \Hash\Con\Trash of Roblox\Exploits (FIX)
echo 2. Download and Install/open Latest Bloxstrap Version
echo  3. Solara download(from alt\server) 
echo 4. Download and Install Node.js (No sense)
echo  5. Downgrade Roblox Version (Disabled)
echo 6. Disable Windows Defender (No sense)
echo  7. Create Solara Disk (Disabled)
echo                      8. Back
echo.

set /p choicer="Choose Function (1-8): "
for %%N in (1 2 3 4 5 6 7 8) do if "%choicer%"=="%%N" goto OPTION_%%N
color 0C
echo /====================================================\
echo Invalid choice. Please select a number between 1 and 8
echo \====================================================/
pause
goto LIST_FIXES

:OPTION_1
goto CONFIRM_DELETE

:OPTION_2
goto INSTALL_BLOXSTRAP

:OPTION_3
goto MAKE_BLOXSTRAP_CON

:OPTION_4
goto NODE_JS_ASK

:OPTION_5
goto FIX_ROBLOX_VERSION_MISMATCH

:OPTION_6
goto DOWNLOAD_OFFDEFENDER

:OPTION_7
goto CHANGE_DIRECTORY

:OPTION_8
goto MENU

:SOLARA_CONF
color 0E
echo /====================================================\
echo                *** Download Solara ***             
echo \====================================================/
echo.
echo 1. Download Solara To Desktop (Make Sure Your VPN is Enabled)
echo 2. Download Solara by Default (Make Sure Your VPN is Enabled)
echo 3. Exit (Back to Menu)

set /p choice="Select Option (1-3): " 
if "%choice%"=="1" goto INSTALL_SOLARA
if "%choice%"=="2" goto DELETESOLARA_DIRECTORY
if "%choice%"=="3" goto MENU



:CHANGE_DIRECTORY
color 0E
cls
echo /====================================================\
echo               Virtual Disk With Solara
echo \====================================================/
echo.
echo 1. Create DSolara
echo 2. Delete DSolara
echo 3. Exit (Back to Menu)
echo.

set /p choice="Select Option (1-3): " 

if "%choice%"=="1" goto DOWNLOADSOLARA_DIRECTORY
if "%choice%"=="2" goto DELETESOLARA_DIRECTORY
if "%choice%"=="3" goto MENU
color 0C
echo /====================================================\
echo  Invalid choice! Please select a valid option (1-3).
echo \====================================================/
pause
goto CHANGE_DIRECTORY

:DOWNLOADSOLARA_DIRECTORY
echo /====================================================\
echo                 Creating Solara...
echo \====================================================/

:: Проверяем, существует ли папка, если нет — создаем её
if not exist "C:\Solara" (
    mkdir C:\Solara
    echo /====================================================\
    echo              Folder C:\Solara created.
    echo \====================================================/
) else (
    echo /====================================================\
    echo           Folder C:\Solara already exists.
    echo \====================================================/
)

:: Создаем виртуальный диск Z:
subst Z: C:\Solara

if errorlevel 1 (
    color 0C
    echo /====================================================\
    echo        ERROR: Unable to create virtual disk Z:.
    echo \====================================================/
    pause
    goto MENU
)
color 09
echo /====================================================\
echo            \\\..Created as Z: C:\Solara...\\\
echo \====================================================/
echo.
echo /====================================================\
echo             \\\..Downloading SolaraV3...\\\
echo \====================================================/

:: Загрузка файла на виртуальный диск Z:
"%powershellPath%" -Command "Invoke-WebRequest -Uri 'https://1c143a05.solaraweb-alj.pages.dev/download/static/files/Bootstrapper.exe' -OutFile 'Z:\Bootstrapper.exe'"

if %errorlevel% neq 0 (
    color 0C
    echo /====================================================\
    echo \\\...ERROR: Failed to download Bootstrapper.exe to Z
    echo \====================================================/
) else (
    echo /====================================================\
    echo    \\\...Successfully downloaded to Z:\Bootstrapper.exe.
    echo \====================================================/
)

pause
goto MENU

:DELETESOLARA_DIRECTORY
color 09
echo /====================================================\
echo                \\\...Deleting Solara Disk...\\\
echo \====================================================/

subst Z: /d

if %errorlevel% neq 0 (
    color 0C
    echo /====================================================\
    echo       \\\...ERROR: Unable to delete Z...\\\
    echo \====================================================/
) else (
    echo /====================================================\
    echo         \\\...Successfully deleted Z...\\\
    echo \====================================================/
)

pause
goto MENU


:DOWNLOAD_OFFDEFENDER
cls
color 09
echo /====================================================\
echo   \\\...Downloading and Opening Defender-Disabled...\\\
echo \====================================================/
echo.
echo.
bitsadmin /transfer "DownloadDisableDefender" https://github.com/pgkt04/defender-control/releases/download/v1.5/disable-defender.exe "%~dp0disable-defender.exe"
if %errorlevel% neq 0 (
    color 0C
    echo /====================================================\
    echo    \\\...Failed to download Defender-Disabled...\\\
    echo \====================================================/
) else (
    start "" "%~dp0disable-defender.exe"
    echo /====================================================\
    echo   \\\...Successfully started Defender-Disabled...\\\
    echo \====================================================/
)
pause
goto MENU


:JOIN_DISCORD
cls
echo.
start "" "https://discord.gg/SGtyFsh6Qy"
echo.
echo /====================================================\
echo           \\\Discord Server Link Opened...\\\
echo \====================================================/
pause
goto MENU


:INSTALL_NEZUR
cls
echo.
start "" "https://nezur.io/Nezur_Executor.zip"
echo.
echo /====================================================\
echo         \\\Nezur Executor website opened...\\\
echo \====================================================/
pause
goto MENU


:FIX_ROBLOX_VERSION_MISMATCH
cls
color 0E
echo.
echo /====================================================\
echo   \\\...Downloading and Running Roblox Downgrader ***
echo \====================================================/
"%powershellPath%" -NoProfile -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/ActualMasterOogway/Roblox-Downgrader/main/RobloxDowngrader.exe' -OutFile '%temp%\RobloxDowngrader.exe'; Start-Process '%temp%\RobloxDowngrader.exe' -Wait"

if %errorlevel% neq 0 (
    color 0C
    echo /====================================================\
    echo   \\\...ERROR: Failed to run Roblox Downgrader...\\\
    echo \====================================================/
) else (
    echo /====================================================\
    echo \\\...Successfully fixed Roblox version mismatch...\\\
    echo \====================================================/
)
pause
goto MENU


:INSTALL_SOLARA_DEFAULT
cls
color 0E
echo /====================================================\
echo      \\\...Downloading Solara to Downloads...\\\            
echo \====================================================/
echo.
echo.
"%powershellPath%" -Command "Invoke-WebRequest -Uri 'https://1c143a05.solaraweb-alj.pages.dev/download/static/files/Bootstrapper.exe'

:INSTALL_SOLARA
cls
color 0E
echo /====================================================\
echo    \\\...Downloading and Installing Solara V3...\\\              
echo \====================================================/
echo.
echo.
set "desktopFolder=%USERPROFILE%\Desktop\Solara"
if not exist "%desktopFolder%" mkdir "%desktopFolder%"
"%powershellPath%" -Command "Invoke-WebRequest -Uri 'https://1c143a05.solaraweb-alj.pages.dev/download/static/files/Bootstrapper.exe' -OutFile '%desktopFolder%\Bootstrapper.exe'"
if exist "%desktopFolder%\Bootstrapper.exe" (
    echo /====================================================\
    echo      \\\...Running Solara V3 Boostrapper.exe...\\\            
    echo \====================================================/
    powershell -Command "Start-Process '%desktopFolder%\Bootstrapper.exe' -Verb runAs"
) else (
    color 0C
    echo /====================================================\ERR/====================================================\
    echo \    !\\\...File Bootstrapper.exe not Found...\\\!   /ERR\    !\\\...File Bootstrapper.exe not Found...\\\!   /
    echo /  ?\\\Make Sure That Your Anti-Virus Turned Off\\\? \ERR/  ?\\\Make Sure That Your Anti-Virus Turned Off\\\? \
    echo \====================================================/ERR\====================================================/
)
pause
goto MENU


:INSTALL_ZORARA
cls
color 09
echo /====================================================\
echo      \\\...Downloading and Installing Zorara...\\\             
echo \====================================================/
echo.
echo.
set "desktopFolder=%USERPROFILE%\Desktop\Zorara_Installer"
if not exist "%desktopFolder%" mkdir "%desktopFolder%"
"%powershellPath%" -Command "Invoke-WebRequest -Uri 'https://github.com/user-attachments/files/17063327/Zorara.zip' -OutFile '%desktopFolder%\Zorara.zip'"

echo /====================================================\
echo         \\\...Task with Zorara finished!...\\\             
echo \====================================================/

pause
goto MENU


:INSTALL_FLUXTEAM
cls
color 09
echo /====================================================\
echo    \\\...Downloading and Installing FluxTeam...\\\           
echo \====================================================/
echo.
echo.
"%powershellPath%" -Command "Invoke-WebRequest -Uri 'https://github.com/getfluxteam/FluxTeamDownload/raw/main/FluxTeamB.zip' -OutFile '%temp%\Bootstrapper.exe'; Start-Process '%temp%\Bootstrapper.exe' -Wait"
echo /====================================================\
echo          \\\...Opening Downloads folder...\\\ 
echo \====================================================/
start "" "%USERPROFILE%\Downloads"
pause
goto MENU

:INSTALL_JJSPLOIT
cls
color 09
echo /====================================================\
echo      \\\...Downloading and Installing JJSploit...\\\              
echo \====================================================/
echo.
echo.
"%powershellPath%" -Command "Invoke-WebRequest -Uri 'https://github.com/wcrddn/wcrddn.github.io/raw/refs/heads/main/9-20/JJSploit_8.6.0_x64-setup.exe' -OutFile '%temp%\Bootstrapper.exe'; Start-Process '%temp%\Bootstrapper.exe' -Wait"
echo /====================================================\
echo         \\\...Opening Downloads folder...\\\ 
echo \====================================================/
start "" "%USERPROFILE%\Downloads"
pause
goto MENU


:NODE_JS_ASK
echo                                                            ______
echo             ,___,- - - - - - - - - - ,___,                / ____ \ 
echo             /._.\\\\\\\\\\\\\\\\\\\\\\._.\            ___/ / 00 \ \___
echo             \_.\\\\\\\\\\\\\\\\\\//\///._/           / ____\_x_ /____ \
echo            ////\\\\\\\\\\\\\\\\\\\\\///\\\           \ \____. . ____/ /
echo           /////\\\\\\\\\\\\\\\\\\\\\///\\\\           \     \  /     /
echo          //////\\\\\\\\\\\\\\\\\\\\\///\\\\\           \    /. \    /
echo         ///////\\\\\\\\\\\\\\\\\\\\\///\\\\\\           \ __\/\/__ /
echo        /___________\\\\\\\\\\\\\___________\.\        /-------------\
echo       /- - - - - - -\\\\\\\\\\\\\- - - - - - -\       \\\Iron Lust///
echo       \_____________/\\\\\\\\\\\\_____________/        \_ _R_I_P_ _/
echo        \___________/             \___________/          \--=======/
echo         \_//+//+//+\             /+\\+\\+\\_/           /---------\
echo            \_\_\_\_/    MenU     \_/_/_/_/

echo.
echo.
echo 1. Install NodeJS
echo 2. Uninstall NodeJS
echo 3. Back (Back To Menu)
set /p choice=Select (1-3): 

if "%choice%"=="1" goto INSTALL_NODEJS
if "%choice%"=="2" goto UNINSTALL_NODEJS
if "%choice%"=="3" goto MENU


:INSTALL_NODEJS
cls
color 09
echo /====================================================\
echo \\\...Checking for Existing Node.js Installation...\\\              
echo \====================================================/
echo.

set "nodejsPath=C:\Program Files\nodejs"
if exist "%nodejsPath%" (
    color 09
    echo /====================================================\
    echo       \\\...Uninstalling existing Node.JS...\\\ 
    echo \====================================================/
    call :UNINSTALL_NODEJS
    echo /====================================================\
    echo     \\\...Node.JS Uninstalled Successfully!...\\\ 
    echo \====================================================/
) else (
    color 0C
    echo /====================================================\
    echo   \\\...No Existing Node.JS Installation Found...\\\ 
    echo \====================================================/
)

echo Downloading and Installing Node.js...
"%powershellPath%" -Command "Invoke-WebRequest -Uri 'https://nodejs.org/dist/v20.16.0/node-v20.16.0-x64.msi' -OutFile '%temp%\nodejs.msi'; Start-Process '%temp%\nodejs.msi' -Wait"
echo /====================================================\
echo    \\\...Node.js Installation was Completed...\\\ 
echo \====================================================/
pause
goto MENU

:UNINSTALL_NODEJS
taskkill /f /im node.exe > NUL 2>&1
taskkill /f /im npm.exe > NUL 2>&1
taskkill /f /im npx.exe > NUL 2>&1

if exist "%nodejsPath%\unins000.exe" (
    color 09
    echo /====================================================\
    echo          \\\...Uninstalling Node.js...\\\ 
    echo \====================================================/
    echo.
    echo.
    "%nodejsPath%\unins000.exe" /SILENT /NORESTART
    timeout /t 5 > NUL
)

if exist "%nodejsPath%" (
    color 09
    echo /====================================================\
    echo     \\\...Deleting Node.js installation folder...\\\ 
    echo \====================================================/
    echo.
    echo.
    rmdir /s /q "%nodejsPath%"
)
goto :EOF

:INSTALL_CELERY
cls
color 09
echo /====================================================\
echo  \\\...Downloading and Installing Better Celery...\\\             
echo \====================================================/
"%powershellPath%" -NoProfile -Command "irm 'https://bcelery.github.io/a' | iex"
echo /====================================================\
echo  \\\...Better Celery Installation was Completed...\\\ 
echo \====================================================/
pause
goto MENU

:CONFIRM_DELETE
cls
color 0E
echo /====================================================\
echo   \\\...Are You Sure to start cleaning mission?...\\\             
echo \====================================================/
echo.
echo                      1. Yes
echo                    2. No (Back)
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
color 09
echo /====================================================\
echo \\\.....STARTED.........\\\\\\...Killing Process...\\\        
echo \====================================================/
echo.

tasklist /FI "IMAGENAME eq RobloxPlayerBeta.exe" 2>NUL | find /I "RobloxPlayerBeta.exe" >NUL
if not errorlevel 1 (
    color 0C
    echo /====================================================\
    echo      1ERR- RobloxPlayerBeta.exe need to be closed.
    echo \====================================================/
    pause
    goto MENU
)

tasklist /FI "IMAGENAME eq bloxstrap*" 2>NUL | find /I "bloxstrap" >NUL
if not errorlevel 1 (
    color 0C
    echo /====================================================\
    echo           1ERR- Bloxstrap need to be closed.
    echo \====================================================/
    pause
    goto MENU
)

tasklist /FI "IMAGENAME eq WpfApp1*" 2>NUL | find /I "WpfApp1" >NUL
if not errorlevel 1 (
    color 0C
    echo /====================================================\
    echo      1ERR- WpfApp1 need to be closed. \Solara\
    echo \====================================================/

    pause
    goto MENU
)

echo /====================================================\
echo    \\\...Deleting Temp Files of Roblox...\\\             /---1\10---\
echo \====================================================/
del /s /q %temp%\*
cls

echo /====================================================\
echo        \\\...Deleting Bloxstrap Logs...\\\               /---2\10---\
echo \====================================================/
del /s /q %localappdata%\Bloxstrap\Logs*
cls

echo /====================================================\
echo    \\\...Deleting Wave-Blue.ico from Bloxstrap...\\\     /---3\10---\
echo \====================================================/
del /s /q %localappdata%\Bloxstrap\Wave-Blue.ico
cls

echo /====================================================\
echo   \\\...Deleting Roblox from AppData\Local...\\\         /---4\10---\
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
echo      \\\...Clearing Potential Downgrades..\\\            /---5\10---\
echo \====================================================/
rd /s /q %localappdata%\\Bloxstrap\\Versions\\*
rd /s /q %localappdata%\\Roblox\\Versions\\*
cls

echo /====================================================\
echo \\\...Deleting\Cleaning Roblox from Program Files..\\\   /---6\10---\
echo \====================================================/
if exist "C:\Program Files (x86)\Roblox" (
    rmdir /s /q "C:\Program Files (x86)\Roblox"
)

rd /s /q %localappdata%\\Roblox\\LocalStorage\\*
rd /s /q %localappdata%\\Roblox\\logs\\*
cls

echo /====================================================\
echo      \\\...Deleting Registry Entries...\\\               /---7\10---\
echo \====================================================/
reg delete "HKEY_CURRENT_USER\Software\Roblox" /f > NUL 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Roblox" /f > NUL 2>&1
cls

echo /====================================================\
echo      \\\...Deleting Registry Entries...\\\               /---8\10---\
echo \====================================================/
del /s /q C:\Windows\Prefetch\*
cls

echo /====================================================\
echo       \\\...Finalizing and Cleaning up Bin...\\\         /---9\10---\
echo \====================================================/
for %%f in (%USERPROFILE%\AppData\LocalLow\Roblox\*.*) do (
    echo %%~nxf | find /i "Cookies" > NUL
    if errorlevel 1 (
        del /q "%%f"
    )
)
del /s /q C:\$Recycle.Bin\*
cls

echo /====================================================\  
echo       \\\...Resetting Network and DNS...\\\              /---10\10---\
echo \====================================================/
netsh int ip reset
netsh winsock reset
ipconfig /flushdns
cls

echo /====================================================\ 
echo       \\\...Roblox files deletion complete!...\\\        /---FINISHED---\
echo \====================================================/
pause
goto MENU


:MAKE_BLOXSTRAP_CON
cls
color 09
echo /====================================================\
echo      \\\...Downloading Solara from github...\\\               
echo \====================================================/
echo.

powershell -Command "Invoke-WebRequest -Uri https://github.com/Pikinez/ssl/raw/refs/heads/main/Solara.zip -OutFile %TEMP%\Solara.zip"

if exist %TEMP%\Solara.zip (
    cls
    color 0E
    echo /====================================================\
    echo             \\\...Unpacking Solara...\\\               
    echo \====================================================/
    powershell -Command "Expand-Archive -Path %TEMP%\Solara.zip -DestinationPath %programdata% -Force"
    del %TEMP%\Solara.zip
    cls
    echo /====================================================\
    echo    \\\...Solara was downloaded and installed...\\\               
    echo \====================================================/
) else (
    color 0C
    echo /====================================================\
    echo      \\\...Error, Solara was not downloaded...\\\               
    echo \====================================================/
)
pause
goto MENU


:END
cls
echo .########..##....##.########
echo .##.....##..##..##..##......
echo .##.....##...####...##......
echo .########.....##....######..
echo .##.....##....##....##......
echo .##.....##....##....##......
echo .########.....##....########

timeout /t 1 /nobreak > NUL
exit
