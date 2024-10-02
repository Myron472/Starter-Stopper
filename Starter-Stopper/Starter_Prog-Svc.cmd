:: This script uses .txt files that contain services and programs to start.
:: It means that you can add or change services and processes you want to start when
:: executing this script.
:: There are still some cases I was not able to automate (program launch parameters and windows apps)
:: so this file also have examples of custom commands at the end of file you can use to make
:: your own lines of code
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
:: Here are examples of code you can use as a reference
:: start /d "C:\..." yourprogram.exe -parameter
:: start "" "C:\...\yourprogram.exe" -parameter
:: start "" explorer shell:appsFolder\MozillaThunderbird.MZLA_h5892qc0xkpca!App