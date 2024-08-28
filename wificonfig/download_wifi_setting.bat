@echo off

:input_number
set /p number=Input Desk Number (1~50): 
echo Input Desk Number is %number%
if %number% gtr 50 goto input_number
if %number% lss 1 goto input_number

:add_zero
if %number% gtr 9 goto create_folder
set number=0%number%
echo Input Desk Number is %number%

:create_folder
md "config\network" 2>nul

:download_file
set filename=my-network%number%.txt
set url=https://raw.githubusercontent.com/tirasol/ICQA/main/wificonfig/%filename%
powershell -Command "Invoke-WebRequest '%url%' -OutFile 'config\network\my-network'"

echo Task OK!!! Your IP Address is 192.168.88.1%number%
echo Insert microSD card and connect http://192.168.88.1%number%:8123

pause

