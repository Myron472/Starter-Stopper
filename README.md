# Starter-Stopper
 
Starter-Stopper is 2 scripts for starting and stopping programs and services. Programs and services can be customized via .txt files.

Supported OS:
- Windows

## Adding programs / services to .txt files

To properly add your programs and services to .txt files follow these rules:
- Put one value in each line;
- In **path\_list.txt** write full path to a program. Parameters are also supported.
- In **service\_list.txt** write name of a service.
- To add UWP app put lines in both Starter and Stopper manually (they both have examples of commands to use).

*The reason opening/closing of UWP apps isn't supported yet is because you cannot just use regular path to .exe file in this case - after UWP app update it will change one of folder names resulting in breaking regular exe path. Instead you need to use special command which you can find in Starter script. For Starting UWP app you need to find it's PackageFamilyName and put in instead of \<PackageFamilyName\> presented in the example.
Despite this I added code in Starter script that will take PackageFamilyName values from uwp.txt and cycle through all of them launching these UWP apps.*

## NOTICE:
 
If you want to launch UWP Apps via *explorer shell:AppsFolder\\...* function or close them you have to <u>manually write code lines for each program</u>. This is because Batch is a very old scripting language and programming this feature is a huge pain for me.

## To Do

- ~~Rewrite Stopper to use *path\_list.txt* instead of *program\_list.txt*;~~
- ~~Rewrite this ReadMe for new release.~~
- Add UWP app support
- Make Python version of the script
- Make Bash version of script for Linux
- Make Powershell version of the script