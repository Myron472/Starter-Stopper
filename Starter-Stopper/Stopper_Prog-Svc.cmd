:: This script uses .txt files that contain services and programs to stop.
:: It means that you can add or change services and processes you want to stop when
:: executing this script.
setlocal EnableExtensions

:: Stopping services
for /f "tokens=* delims=" %%s in (service_list.txt) do (
	sc config %%s start=disabled
	sc stop %%s
)

:: Stopping programs
for /f "tokens=* delims=" %%p in (program_list.txt) do (
	taskkill /im %%p /fi "Status eq Running" /f
)

:: Stopping programs (modified code)
:: for /f "tokens=* delims=" %%~np in (path_list.txt) do (
::	taskkill /im %%p /fi "Status eq Running" /f
:: )