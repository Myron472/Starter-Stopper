:: This script uses .txt files that contain services and programs to start.
:: It means that you can add or change services and processes you want to start when
:: executing this script.
:: @echo off
setlocal EnableExtensions EnableDelayedExpansion

:: Starting services
for /f "tokens=*" %%s in (services.txt) do (
	sc config %%s start=enabled
	sc start %%s
)

:: Starting programs
for /f "tokens=* delims= ^" %%p in (paths.txt) do (
	start "" %%p
)

:: UWP app start code (WIP)
:: for /f "tokens=* delims= ^" %%u in (uwp.txt) do (
::	set "family=%%u"
::	start explorer shell:appsFolder\!family!!App
::)

:: Custom commands
:: start explorer shell:appsFolder\MozillaThunderbird.MZLA_h5892qc0xkpca!App
