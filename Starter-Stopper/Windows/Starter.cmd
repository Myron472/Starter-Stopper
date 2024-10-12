:: This script uses .txt files that contain services and programs to start.
:: It means that you can add or change services and processes you want to start when
:: executing this script.
:: @echo off
setlocal EnableExtensions EnableDelayedExpansion

:: Starting services
for /f "tokens=*" %%S in (services.txt) do (
	sc config %%S start=enabled
	sc start %%S
)

:: Starting programs
for /f "tokens=* delims=^" %%P in (paths.txt) do (
	start "" %%P
)

:: UWP
:: Getting list of all odd tokens
set "odd_tokens="
for /f "tokens=* delims= ^" %%L in (uwp.txt) do (
	set /a div_rem=%%L %% 2
	if !div_rem! == 0 set "odd_tokens=!odd_tokens!%%L,"
)
set "odd_tokens=%odd_:~0,-1%"

:: Code for starting UWP apps
for /f "tokens=%odd_tokens% delims= ^" %%U in (uwp.txt) do (
	set "family=%%U"
	start explorer shell:appsFolder\!family!!App
)