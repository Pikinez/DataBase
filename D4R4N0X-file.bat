@echo off
set "powershellPath=C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
title D4R4N0X-V0.2.3A
chcp 65001 >nul
:MENU
cls
title D4R4N0X-V0.2.3A
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
echo [1].{Global Cleaning Misson} - (Velocity, Solara)
echo [2].{Fix Solara version Missmatch} 
echo [3].{Cookie Ban Bypass} - (Will fix Error 403)
echo [4].{Download Bloxstrap} - (FastFlags) 
echo [5].{}
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
echo /====================================================\
echo \\\...LOADING:PLEASE WAIT...\\\
echo \====================================================/
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

echo /====================================================\
echo \\\...EXPLOITS...\\\
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
title Roblox Cleanup Utility
mode con cols=60 lines=25
color 0E
cls
echo /====================================================\
echo  \\\...Bypassing Utility Launched...\\\
echo \====================================================/
echo.
title Bypassing Utility Launched
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo /====================================================\
    echo \\\...Admin rights required Attempting to elevate...\\
    echo \====================================================/
    title Admin rights required Attempting to elevate
    goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "cmd.exe", "/c %~s0", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
exit /B
:gotAdmin
pushd "%CD%"
cd /D "%~dp0"
echo /====================================================\
echo \\\...Cleaning Roblox local files.....\\\
echo \====================================================/
title Cleaning Roblox local files
timeout /t 1 >nul
setlocal
set "CookiesPath=%localappdata%\Roblox\LocalStorage\RobloxCookies.dat"
set "RobloxPath=%localappdata%\Roblox"
if exist "%CookiesPath%" (
    echo /====================================================\
    echo \\\...Deleting RobloxCookies.dat...\\\
    echo \====================================================/
    title Deleting RobloxCookies.dat
    del /f /q "%CookiesPath%"
) else (
    echo /====================================================\
    echo \\\...RobloxCookies.dat not found. Skipping...\\\
    echo \====================================================/
    title RobloxCookies.dat not found. Skipping
)
rd /s /q "%RobloxPath%"
timeout /t 1 >nul
echo.
title Cleanup complete
echo /====================================================\
echo \\\...Cleanup complete Roblox local data deleted...\\\
echo \====================================================/
pause
goto MENU

:CLEAR
cls
color 09 & Mode con cols=54 lines=27
echo /====================================================\
echo \\\.....S.T.A.R.T.E.D...\\\        
echo \====================================================/
echo.

powershell -Command "& {(Get-MpComputerStatus).RealTimeProtectionEnabled}" | findstr "True" >nul
if %errorlevel%==0 (
    color 0C
    cls
    echo /====================================================\
    echo 1ERR- Windows Defender is enabled. Turn it off.        
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
        echo 1ERR- %%p needs to be closed.
        echo /====================================================/
        pause
        goto MENU
    )
)

echo /====================================================\
echo \\\...Deleting Temp Files of Roblox...\\\                 /---1\15---\
echo \====================================================/
title Deleting Temp Files of Roblox 1/15
rd /s /q "%TEMP%\Roblox" >nul 2>&1
rd /s /q "%TEMP%\Roblox*" >nul 2>&1
cd /d "%LOCALAPPDATA%\Roblox"
for /d %%D in (*) do (
    if /i not "%%D"=="LocalStorage" (
        rd /s /q "%%D" >nul 2>&1
    )
)
del /q "%LOCALAPPDATA%\Roblox\*.log" >nul 2>&1
rd /s /q "%LOCALAPPDATA%\Roblox\ClientSettings" >nul 2>&1
rd /s /q "%LOCALAPPDATA%\Packages\ROBLOXCORPORATION.ROBLOX_55nm5eh3cm0pr\LocalCache" >nul 2>&1
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe
cls

title Deleting Blox/fish<strap> Logs 2/15
echo /====================================================\
echo \\\...Deleting Blox/fish<strap> Logs...\\\                /---2\15---\
echo \====================================================/
rd /s /q %localappdata%\Bloxstrap\Logs*
rd /s /q %localappdata%\Fishstrap\Logs*
cls

echo /====================================================\
echo \\\...Deleting Solara from Register ...\\\                /---3\15---\ 
echo \====================================================/
title Deleting Solara from Register 3/15
setlocal enabledelayedexpansion
for /f "tokens=*" %%A in ('reg query "HKLM\SYSTEM\ControlSet001\Services\bam\State\UserSettings" /s /f "Solara" 2^>nul ^| findstr "HKEY"') do (
    reg delete "%%A" /f >nul 2>&1
)
for /f "tokens=*" %%B in ('reg query "HKLM\SOFTWARE\Microsoft\Tracing" /s /f "Solara" 2^>nul ^| findstr "HKEY"') do (
    reg delete "%%B" /f >nul 2>&1
)

cls


echo /====================================================\
echo \\\...Deleting Roblox from AppData\Local...\\\            /---4\15---\
echo \====================================================/
title Deleting Roblox from AppData\Local 4/15
cd /d "%localappdata%\Roblox"
for /d %%i in (*) do ( if /i not "%%i"=="LocalStorage" ( rmdir /s /q "%%i" ) )
for %%f in (*.*) do (
    echo %%f | find /i "Cookies" > nul
    if errorlevel 1 ( del /q "%%f" )
)

cls


echo /====================================================\
echo  \\\...Clearing Potential Downgrades + Versions..\\\      /---5\15---\
echo \====================================================/
title Clearing Potential Downgrades + Versions 5/15

#powershell -Command "Start-Process 'https://clientsettingscdn.roblox.com/v2/client-version/WindowsPlayer' -Wait"

attrib -h -s -r %localappdata%\Bloxstrap\Versions\* /s /d
attrib -h -s -r %localappdata%\Roblox\Versions\* /s /d
attrib -h -s -r %localappdata%\Fishstrap\Versions* /s /d

rd /s /q %localappdata%\Fishstrap\Versions\
rd /s /q %localappdata%\Bloxstrap\Versions\
rd /s /q %localappdata%\Roblox\Versions\
cls

echo /====================================================\
echo \\\...Cleaning Roblox Files from Program Files..\\\       /---6\15---\
echo \====================================================/
title Cleaning Roblox Files from Program Files 6/15
rd /s /q %localappdata%\\Roblox\\LocalStorage\\*
rd /s /q %localappdata%\\Roblox\\logs\\*
cls

echo /====================================================\
echo \\...Deleting Roblox in Registry...\\\                    /---7\15---\
echo \====================================================/
title Deleting Roblox in Registry 7/15
reg delete "HKEY_CURRENT_USER\Software\Roblox" /f > NUL 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Roblox" /f > NUL 2>&1
cls

echo /====================================================\
echo \\\Forcing time sync......\\\                             /---8\15---\ 
echo \====================================================/
title Forcing time sync 8/15
net stop w32time >nul 2>&1
w32tm /unregister >nul 2>&1
w32tm /register >nul 2>&1.
net start w32time >nul 2>&1
w32tm /config /manualpeerlist:"time.windows.com" /syncfromflags:manual /reliable:yes /update >nul 2>&1
w32tm /resync /force
w32tm /query /status
cls

echo /====================================================\
echo \\\...Cleaning TEMP...\\\                                 /---9\15---\
echo \====================================================/
title Cleaning TEMP 9/15
for %%f in ("%USERPROFILE%\AppData\LocalLow\Roblox\*") do (
    echo %%~nxf | find /i "Cookies" > NUL
    if errorlevel 1 (
        del /q "%%f" 2>nul
    )
)
for /d %%p in ("%temp%\*") do (
    rmdir "%%p" /s /q 2>nul
)
del /s /q "%temp%\*" 2>nul

cls
echo /====================================================\  
echo \\...Resetting Network and DNS...\\\                      /---10\15---\
echo \====================================================/
title Resetting Network and DNS 10/15
net stop dnscache
net stop nlasvc
cls
echo /====================================================\ 
echo \\\...Resetting network components...\\\                  /---10\15---\
echo \====================================================/
title Resetting network components 10/15
netsh int ip reset c:\resetlog.txt
netsh int ipv6 reset c:\resetlog.txt
netsh int ip reset
netsh winsock reset
netsh advfirewall reset
cls
echo /====================================================\ 
echo \\\...Flushing DNS...\\\                                  /---10\15---\
echo \====================================================/
title Flushing DNS 10/15
ipconfig /flushdns
ipconfig /registerdns
cls
echo /====================================================\ 
echo \\\...Renewing IP address...\\\                           /---10\15---\
echo \====================================================/
title Renewing IP address 10/15
start /b ipconfig /release 
start /b ipconfig /renew 
cls
echo /====================================================\ 
echo \\\...Restarting network services...\\\                   /---10\15---\
echo \====================================================/
title Restarting network services 10/15
net start Dhcp 
net start dnscache
net start nlasvc 
cls
echo /====================================================\  
echo \\...Adding to Windows WhiteList...\\\                    /---11\15---\
echo \====================================================/
title Adding to Windows WhiteList 11/15
powershell -Command "Add-MpPreference -ExclusionPath \"$env:USERPROFILE\AppData\Local\Temp\Solara.Dir\""
powershell -Command "Add-MpPreference -ExclusionPath \"$env:ProgramData\Solara\""
cls

echo /====================================================\  
echo \\\...Do you want to install NalFix?...\\\                /---12\15---\
echo \====================================================/
title Waiting... 12/15
echo.
echo [1]. Skip
echo [2]. Yes
echo.

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\CredentialGuard" /v "Enabled" /t REG_DWORD /d 0 /f

set /p choice=(1-2) SELECT: 
if "%choice%"=="1" (
    title Skipped 12/15
    echo 12:Skipped
)
if "%choice%"=="2" (
    cls
    title Installing NalFix 12/15
    setlocal enabledelayedexpansion
    set "TMPDIR=%TEMP%\Installers"
    mkdir "%TMPDIR%" >nul 2>&1
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/VollRagm/NalFix/releases/download/1.0/NalFix.exe', '%TMPDIR%\NalFix.exe')"
    start /wait "" "%TMPDIR%\NalFix.exe"
)
cls

echo /====================================================\  
echo \\\...Download Redist Extinctions?...\\\                  /---13\15---\
echo \====================================================/
title Waiting 13/15
echo.
echo [1]. Skip
echo [2]. Yes (dxWebsetup.exe, VC_redist.x86.exe, VC_redist.x64.exe)
echo.

set /p choice=(1-2) SELECT: 
if "%choice%"=="1" (
    title Skipped 13/15
    echo 13:Skipped
)
if "%choice%"=="2" (
    cls
    title Downloading Redist Extinctions 13/15
    setlocal enabledelayedexpansion
    set "TMPDIR=%TEMP%\Installers"
    mkdir "%TMPDIR%" >nul 2>&1
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://download.microsoft.com/download/1/7/1/1718CCC4-6315-4D8E-9543-8E28A4E18C4C/dxwebsetup.exe', '%TMPDIR%\dxwebsetup.exe')"
    start /wait "" "%TMPDIR%\dxwebsetup.exe"
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://download.visualstudio.microsoft.com/download/pr/5cc0a375-ebc5-4a27-8a76-aa43097a8949/ED1967C2AC27D806806D121601B526F84E497AE1B99ED139C0C4C6B50147DF4A/VC_redist.x86.exe', '%TMPDIR%\vc_x86.exe')"
    start /wait "" "%TMPDIR%\vc_x86.exe"
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://download.visualstudio.microsoft.com/download/pr/368cc6bf-087b-49f9-93e6-ab05b70a58e0/814E9DA5EC5E5D6A8FA701999D1FC3BADDF7F3ADC528E202590E9B1CB73E4A11/VC_redist.x64.exe', '%TMPDIR%\vc_x64.exe')"
    start /wait "" "%TMPDIR%\vc_x64.exe"
)
cls

cls

echo /====================================================\  
echo \\\... Clearing MiuCache ...\\\                          /---14\15---\
echo \====================================================/
title Clearing MiuCache 14/15
setlocal enabledelayedexpansion
for /f "tokens=2 delims=\" %%A in ('whoami') do set USERNAME=%%A
for /f "tokens=*" %%S in ('wmic useraccount where name^="!USERNAME!" get sid ^| findstr /R "S-1-5-21"') do set SID=%%S
set KEY="HKU\%SID%\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache"
reg export %KEY% "%temp%\muicache.reg" /y >nul

type nul > "%temp%\clean_muicache.reg"
echo "%temp%\clean_muicache.reg"
echo.>>"%temp%\clean_muicache.reg"
for /f "usebackq tokens=*" %%L in ("%temp%\muicache.reg") do (
    set "line=%%L"
    echo !line! | findstr /i "Roblox" >nul
    if errorlevel 1 (
        echo !line!>>"%temp%\clean_muicache.reg"
    ) else (
        echo [Deleted] !line!
    )
)
reg delete %KEY% /f >nul
reg import "%temp%\clean_muicache.reg"
del "%temp%\muicache.reg" >nul 2>&1
del "%temp%\clean_muicache.reg" >nul 2>&1

pause



cls

echo /====================================================\  
echo \\\... Want to scan disk? ...\\\                          /---15\15---\
echo \====================================================/
echo.
echo [1]. Skip
echo [2]. Do it
echo.
title Waiting 15/15
set /p choice=(1-2) SELECT: 
if "%choice%"=="1" (
    title Skipped 15/15
    echo 15:Skipped
)

if "%choice%"=="2" (
    cls
    title Running health checks 15/15
    echo Running health checks...
    sfc /scannow
    DISM /Online /Cleanup-Image /RestoreHealth
    mdsched.exe
    msconfig
)


cls
color 0A
title Global Mission Cleaning Finished
echo /====================================================\ 
echo \\\...Global Mission Cleaning Finished\\\      
echo \====================================================/
pause
GOTO MENU

:FIXEXPL
cls
Color 0E & Mode con cols=54 lines=27
echo /====================================================\
echo \\\...Downloading Solara from github...\\\               
echo \====================================================/
powershell -Command "Invoke-WebRequest -Uri https://github.com/Pikinez/ssl/raw/refs/heads/main/Solara.zip -OutFile %TEMP%\Solara.zip"
if exist %TEMP%\Solara.zip (
    cls
    color 0E
    echo /====================================================\
    echo \\\...Unpacking Solara...\\\               
    echo \====================================================/
    powershell -Command "Expand-Archive -Path %TEMP%\Solara.zip -DestinationPath %programdata% -Force"
    del %TEMP%\Solara.zip
    cls
    echo /====================================================\
    echo \\\...Solara was downloaded and installed...\\\               
    echo \====================================================/
) else (
    color 0C
    echo /====================================================\
    echo \\\...Error, Solara was not downloaded...\\\               
    echo \====================================================/
)
pause
goto MENU

:FIX3
echo /====================================================\
echo \\\...Bloxstrap Downlaoding...\\\ 
echo \====================================================/
powershell -Command "Start-Process 'https://objects.githubusercontent.com/github-production-release-asset-2e65be/520583586/f5975dfa-97e1-489e-9f14-41f125402efc?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=releaseassetproduction%2F20241019%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20241019T153845Z&X-Amz-Expires=300&X-Amz-Signature=b130eb5c62fb6149c3bf01b6bf0e4d0918290c370b0e450b6416f7b3ec0eac9e&X-Amz-SignedHeaders=host&response-content-disposition=attachment%3B%20filename%3DBloxstrap-v2.8.0.exe&response-content-type=application%2Foctet-stream' -Wait"
echo /====================================================\
echo \\\...Process Finished!...\\\ 
echo \====================================================/
pause
goto MENU

