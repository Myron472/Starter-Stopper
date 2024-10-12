# Starter-Stopper
 
Starter-Stopper is 2 scripts for starting and stopping programs and services. Programs and services can be customized via *.txt* files.

This program is represented in these programming languages:
- Batch file (.cmd)

Supported OS:
- Windows

## Adding programs / services to .txt files
First of all you need to put your own values into .txt files:

- Service names to *services.txt*;
- Paths to executable of a program to *paths.txt*;
- PackageFamilyName of the UWP app and just the executable name (e.g. thunderbird.exe).

To get PackageFamilyName value, open PowerShell console and type this:

	Get-AppxPackage | Select Name, PackageFamilyName

Then find app you want to automatically start/close via scripts and copy it's PackageFamilyName from 2nd column and paste it into the file.

To get executable name of a UWP App:

- Open Task Manager;
- Find UWP app you want to add;
- If it has arrow on the left of the name, click on it to see all processes;
- Right Click => Properties;
- Copy Location from opened window.

Separate values with linebreak (aka `Enter` key) in *paths.txt*, *services.txt*, and *uwp.txt*. In *services.txt* you can also separate values with space and in *uwp.txt* you can put PackageFamilyName and executable name on the same line and separate them with a space for better readability.
**Make sure that PackageFamilyName and program name alternate! That's because scripts determine PackageFamilyName and executable name by whether the value's position (values are separated by space and linebreak) is even or odd.**

To properly add your programs and services to .txt files follow these rules:

- Put one value in each line;
- In **path\_list.txt** write full path to a program. Parameters are also supported.
- In **service\_list.txt** write name of a service.
- To add UWP app put lines in both Starter and Stopper manually (they both have examples of commands to use).

## To Do

- ~~Rewrite Stopper to use *path\_list.txt* instead of *program\_list.txt*;~~
- ~~Rewrite this ReadMe for new release;~~
- ~~Add UWP app support;~~
	- Test it;
- Make Bash version of the script for Linux
- Make Python version of the script
- Make Powershell version of the script