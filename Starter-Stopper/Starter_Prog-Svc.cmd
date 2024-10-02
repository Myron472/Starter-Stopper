:: This script uses .txt files that contain services and programs to start.
:: It means that you can add or change services and processes you want to start when
:: executing this script.
:: There are still some cases I was not able to automate (launch keys and windows apps)
:: so there are custom commands at the end of file
setlocal EnableExtensions

:: Starting services
for /f "tokens=* delims=" %%s in (service_list.txt) do (
	sc config %%s start=enabled
	sc start %%s
)

:: Starting programs
for /f "tokens=* delims=" %%p in (path_list.txt) do (
	start "" %%p
)

:: Custom Commands
start "" "D:\PortableApps\W10T\Win 10 Tweaker.exe" -tray
start "" explorer shell:appsFolder\Microsoft.YourPhone_8wekyb3d8bbwe!App
start "" explorer shell:appsFolder\MozillaThunderbird.MZLA_h5892qc0xkpca!App