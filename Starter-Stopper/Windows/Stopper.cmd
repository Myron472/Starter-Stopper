:: This script uses .txt files that contain services and programs to stop.
:: It means that you can add or change services and processes you want to stop when
:: executing this script.
:: @echo off
setlocal EnableExtensions EnableDelayedExpansion

:: Stopping services
for /f "tokens=*" %%S in (services.txt) do (
	sc config %%S start=disabled
	sc stop %%S
)

:: Stopping programs
for /f "tokens=* delims=^" %%P in (paths.txt) do (
	set "name=%%~nP%%~xP"
	taskkill /im !name! /fi "Status eq Running" /f
)

:: UWP
:: Getting list of all even tokens
set "even_tokens="
for /f "tokens=* delims= ^" %%L in (uwp.txt) do (
	set /a div_rem=%%l %% 2
	if not !div_rem! == 0 set "even_tokens=!even_lines!%%L,"
)
set "even_tokens=%even_tokens:~0,-1%"

:: Stopping UWP app
for /f "tokens=%even_tokens% delims= ^" %%U in ("uwp.txt") do (
	taskkill /im %%U /fi "Status eq Running" /f
) 