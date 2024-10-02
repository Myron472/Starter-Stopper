# Starter-Stopper
 
 This project contains 2 cmd scripts for starting and stopping programs and services. Programs and services can be customized via .txt files.

# Adding programs / services to .txt files

 To properly add your programs and services to .txt files follow these rules:
 - Put one value in each line;
 - In **path\_list.txt** write full path to a program. Parameters are also supported.
 - In **service\_list.txt** write name of a service.

### NOTICE:
 
 If you want to launch UWP Apps via *explorer shell:AppsFolder\\...* function or close them you have to <u>manually write code lines for each program</u>. This is because Batch is a very old scripting language and the only way to program Starter and Stopper to use one string for UWP app and do different actions to it is to manually filter characters which is a huge pain for me. So there's a chance that one time I will rewrite this program in VBS or Powershell :P

# To Do

 - ~~Rewrite Stopper to use *path\_list.txt* instead of *program\_list.txt*;~~
 - ~~Rewrite this ReadMe for new release.~~