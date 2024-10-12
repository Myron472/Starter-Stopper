:: This script uses .txt files that contain services and programs to stop.
:: It means that you can add or change services and processes you want to stop when
:: executing this script.
:: @echo off
setlocal EnableExtensions EnableDelayedExpansion

:: Stopping services
for /f "tokens=*" %%s in (services.txt) do (
	sc config %%s start=disabled
	sc stop %%s
)

:: Stopping programs
for /f "tokens=* delims=^" %%p in (paths.txt) do (
	set name="%%~np.exe"
	taskkill /im !name! /fi "Status eq Running" /f
)

:: Custom commands (example below)
:: taskkill /im thunderbird.exe /fi "Status eq Running" /f
