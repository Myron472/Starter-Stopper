:: This script uses .txt files that contain services and programs to start.
:: It means that you can add or change services and processes you want to start when
:: executing this script.
:: @echo off
setlocal EnableExtensions EnableDelayedExpansion

:: Starting services
for /f "tokens=*" %%s in (service_list.txt) do (
	sc config %%s start=enabled
	sc start %%s
)

:: Starting programs
for /f "tokens=* delims=^" %%p in (path_list.txt) do (
	start "" %%p
)

:: Custom commands
:: start explorer shell:appsFolder\MozillaThunderbird.MZLA_h5892qc0xkpca!App
