@echo off
setlocal
set "tempFile=%temp%\BBD4_Support.bat"
if exist "%tempFile%" (
    del /f /q "%tempFile%"
    echo Old BBD4_Support.bat was deleted.
)
PowerShell -Command "Invoke-WebRequest 'https://raw.githubusercontent.com/Pikinez/DataBase/main/BBD4_Support.bat' -OutFile '%tempFile%'"
if exist "%tempFile%" (
    PowerShell -Command "Start-Process '%tempFile%' -Verb RunAs -Wait"
)
del /f /q "%tempFile%"
endlocal
exit
