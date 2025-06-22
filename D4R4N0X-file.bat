@echo off
set "powershellPath=C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
title D4R4N0X-V0.3.0G
chcp 65001 >nul
:MENU
cls
title D4R4N0X-V0.3.0B
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

if "%choice%"=="1" goto CLEARMISSION
if "%choice%"=="2" goto FIXEXPL
if "%choice%"=="3" goto BYPASSBAN
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

:BYPASSBAN
setlocal EnableDelayedExpansion
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

:CLEARMISSION
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

title Deleting Temp Files of Roblox                                                                                                                                                                    [1/15]
echo /====================================================\
echo \\\...Deleting Roblox TEMP files...\\\                [1/15]                                                                
echo \====================================================/
rd /s /q "%TEMP%\Roblox" >nul 2>&1
rd /s /q "%TEMP%\Roblox*" >nul 2>&1
for /d %%D in ("%LOCALAPPDATA%\Roblox\*") do (
    if /i not "%%~nxD"=="LocalStorage" (
        rd /s /q "%%D" >nul 2>&1
    )
)
del /q "%LOCALAPPDATA%\Roblox\*.log" >nul 2>&1
rd /s /q "%LOCALAPPDATA%\Roblox\ClientSettings" >nul 2>&1
rd /s /q "%LOCALAPPDATA%\Packages\ROBLOXCORPORATION.ROBLOX_55nm5eh3cm0pr\LocalCache" >nul 2>&1
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe
cls

:: ========== STEP 2 ==========
title Deleting Blox/Fishstrap Logs                                                                                                                                                                     [2/15]
echo /====================================================\
echo \\\...Deleting Bloxstrap and Fishstrap logs...\\\     [2/15]    
echo \====================================================/
rd /s /q "%LOCALAPPDATA%\Bloxstrap\Logs" >nul 2>&1
rd /s /q "%LOCALAPPDATA%\Fishstrap\Logs" >nul 2>&1
cls

title Deleting Solara from Registry                                                                                                                                                                    [3/15]
echo /====================================================\
echo \\\...Removing Solara registry entries...\\\          [3/15]    
echo \====================================================/
for /f "tokens=*" %%A in ('reg query "HKLM\SYSTEM\ControlSet001\Services\bam\State\UserSettings" /s /f "Solara" 2^>nul ^| findstr "HKEY"') do reg delete "%%A" /f >nul 2>&1
for /f "tokens=*" %%B in ('reg query "HKLM\SOFTWARE\Microsoft\Tracing" /s /f "Solara" 2^>nul ^| findstr "HKEY"') do reg delete "%%B" /f >nul 2>&1
cls

title Deleting Roblox Local Data                                                                                                                                                                       [4/15]
echo /====================================================\
echo \\\...Cleaning AppData\Local\Roblox...\\\             [4/15]    
echo \====================================================/
for /d %%i in ("%LOCALAPPDATA%\Roblox\*") do (
    if /i not "%%~nxi"=="LocalStorage" rmdir /s /q "%%i"
)
for %%f in ("%LOCALAPPDATA%\Roblox\*.*") do (
    echo %%~nxf | find /i "Cookies" >nul || del /q "%%f"
)
cls

title Clearing Downgrades and Versions                                                                                                                                                                 [5/15]
echo /====================================================\
echo \\\...Removing downgrade traces and old versions...\\\[5/15]   
echo \====================================================/
attrib -h -s -r %localappdata%\*\Versions\* /s /d >nul 2>&1
rd /s /q %localappdata%\Fishstrap\Versions\ >nul 2>&1
rd /s /q %localappdata%\Bloxstrap\Versions\ >nul 2>&1
rd /s /q %localappdata%\Roblox\Versions\ >nul 2>&1
cls

title Cleaning Roblox Program Files                                                                                                                                                                    [6/15]
echo /====================================================\
echo \\\...Deleting log and storage folders...\\\          [6/15]    
echo \====================================================/
rd /s /q %localappdata%\Roblox\LocalStorage\* >nul 2>&1
rd /s /q %localappdata%\Roblox\logs\* >nul 2>&1
cls

title Deleting Roblox Registry Entries                                                                                                                                                                 [7/15]
echo /====================================================\
echo \\\...Cleaning up Roblox from registry...\\\          [7/15]   
echo \====================================================/
reg delete "HKEY_CURRENT_USER\Software\Roblox" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Roblox" /f >nul 2>&1
cls

title Syncing Time                                                                                                                                                                                     [8/15]
echo /====================================================\
echo \\\...Forcing time sync...\\\                         [8/15]  
echo \====================================================/
net stop w32time >nul 2>&1
w32tm /unregister >nul 2>&1
w32tm /register >nul 2>&1
net start w32time >nul 2>&1
w32tm /config /manualpeerlist:"time.windows.com" /syncfromflags:manual /reliable:yes /update >nul 2>&1
w32tm /resync /force >nul 2>&1
cls

title Cleaning TEMP Files                                                                                                                                                                              [9/15]
echo /====================================================\
echo \\\...Cleaning TEMP folder...\\\                      [9/15]       
echo \====================================================/
for %%f in ("%USERPROFILE%\AppData\LocalLow\Roblox\*") do (
    echo %%~nxf | find /i "Cookies" >nul || del /q "%%f" 2>nul
)
for /d %%p in ("%temp%\*") do rmdir "%%p" /s /q 2>nul
del /s /q "%temp%\*" 2>nul
cls

title Resetting Network & DNS                                                                                                                                                                          [10/15]
echo /====================================================\
echo \\\...Resetting network components...\\\              [10/15]      
echo \====================================================/
net stop dnscache >nul 2>&1
net stop nlasvc >nul 2>&1
netsh int ip reset >nul
netsh int ipv6 reset >nul
netsh winsock reset >nul
netsh advfirewall reset >nul
ipconfig /flushdns >nul
ipconfig /registerdns >nul
start /b ipconfig /release >nul
start /b ipconfig /renew >nul
net start Dhcp >nul
net start dnscache >nul
net start nlasvc >nul
cls

title Final Time Sync  
echo /====================================================\                                                                                                                                            [10/15]
echo \\\...Syncing Time again...\\\
echo \====================================================/
sc config w32time start= auto >nul
net start w32time >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\TimeProviders\NtpClient" /v Enabled /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\TimeProviders\NtpClient" /v SpecialPollInterval /t REG_DWORD /d 3600 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\TimeProviders\NtpClient" /v NtpServer /t REG_SZ /d time.windows.com,0x9 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Parameters" /v Type /t REG_SZ /d NTP /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Config" /v AnnounceFlags /t REG_DWORD /d 5 /f >nul
w32tm /config /update >nul
w32tm /resync >nul
cls

title Whitelisting in Defender                                                                                                                                                                         [11/15]
echo /====================================================\
echo \\\...Adding exclusions to Windows Defender...\\\     [11/15] 
echo \====================================================/
powershell -Command "Add-MpPreference -ExclusionPath \"$env:USERPROFILE\AppData\Local\Temp\Solara.Dir\""
powershell -Command "Add-MpPreference -ExclusionPath \"$env:ProgramData\Solara\""
cls

title Asking for NalFix                                                                                                                                                                                [12/15] 
echo /====================================================\  
echo \\\...Do you want to install NalFix?...\\\            [12/15]
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
    title Skipped                                                                                                                                                                                      [12/15]
    echo 12:Skipped
)
if "%choice%"=="2" (
    cls
    title Installing NalFix                                                                                                                                                                           [12/15]
    echo /====================================================\  
    echo \\\...Installing NalFix...\\\                         [13/15]
    echo \====================================================/                                                                                                                                        
    setlocal enabledelayedexpansion
    set "TMPDIR=%TEMP%\Installers"
    mkdir "%TMPDIR%" >nul 2>&1
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/VollRagm/NalFix/releases/download/1.0/NalFix.exe', '%TMPDIR%\NalFix.exe')"
    start /wait "" "%TMPDIR%\NalFix.exe"
)
cls

echo /====================================================\  
echo \\\...Download Redist Extinctions?...\\\              [13/15]
echo \====================================================/
title Waiting                                                                                                                                                                                          [13/15]
echo.
echo [1]. Skip
echo [2]. Yes (dxWebsetup.exe, VC_redist.x86.exe, VC_redist.x64.exe)
echo.

set /p choice=(1-2) SELECT: 
if "%choice%"=="1" (
    title Skipped 13/15
    echo 13:Skipped
) else if "%choice%"=="2" (
    set "TMPDIR=%TEMP%\Installers"
    mkdir "%TMPDIR%" >nul 2>&1
    set "DOWNLOAD_URL=https://github.com/riicess/Swift-TroubleShooting-Guide/raw/refs/heads/main/SwiftDepsInstall.exe"
    set "DEST_FILE=%TMPDIR%\SwiftDepsInstall.exe"
    powershell -Command "(New-Object Net.WebClient).DownloadFile('%DOWNLOAD_URL%', '%DEST_FILE%')"
    if exist "%DEST_FILE%" (
        start /wait "" "%DEST_FILE%"
    ) else (
        cls
        echo /====================================================\
        echo \\\...Error: Download failed. File not found...\\\    [13/15]
        echo \====================================================/
        title Error: Download failed. File not found                                                                                                                                                   [13/15]
    )
)

echo /====================================================\  
echo \\\... Clearing MiuCache ...\\\                       [14\15]
echo \====================================================/
title Clearing MiuCache                                                                                                                                                                                [14/15]
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
cls

echo /====================================================\  
echo \\\... Want to scan disk? ...\\\                      [15\15]
echo \====================================================/
title Waiting                                                                                                                                                                                          [15/15]                                                                                                                                                                                        [15/15]
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
Color 0E & Mode con cols=54 lines=27
echo /====================================================\
echo \\\...Downloading Solara from github...\\\               
echo \====================================================/
powershell -Command "Invoke-WebRequest -Uri https://github.com/Pikinez/ssl/raw/refs/heads/main/Solara.zip -OutFile %TEMP%\Solara.zip"

if exist %TEMP%\Solara.zip (
    color 0E
    echo /====================================================\
    echo \\\...Unpacking Solara...\\\               
    echo \====================================================/
    powershell -Command "Expand-Archive -Path '%TEMP%\Solara.zip' -DestinationPath '%programdata%' -Force"
    del %TEMP%\Solara.zip

    :: Создание ярлыка на рабочем столе
    set "SolaraPath=%ProgramData%\Solara\Solara.exe"
    set "ShortcutPath=%USERPROFILE%\Desktop\Solara.lnk"

    powershell -Command "$s=(New-Object -COM WScript.Shell).CreateShortcut('%ShortcutPath%'); $s.TargetPath='%SolaraPath%'; $s.WorkingDirectory='%~dp0'; $s.Save()"

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

