# Starter-Stopper
 
 This project contains 2 cmd scripts for starting and stopping programs and services. Programs and services can be customized via .txt files.

# Adding programs / services to .txt files

 To properly add your programs and services to .txt files follow these rules:
 	- Put one value in each line;
 	- In **path\_list.txt** write full path to a program you want to be **started**. Write paths to your executables ONLY in double quotation marks - "C:\\...\program.exe". This is because scripts use strings from **paths_list.txt** as is, including double quotes that are necessary for code to work properly.
 	- In **program\_list.txt** write just the name of executable you want to be **stopped**. If executable has spaces in it's name put it in "" > *"My Program.exe"*.
 	- In **service\_list.txt** write service name of the service. This file works for both scripts.

### NOTICE:
 
 1. Starter script uses **path_list.txt** whether Stopper uses **program_list.txt** file so be sure to add your program paths/executables to both of them. This is because for launching a program Windows needs full path to executable but for stopping a program it only needs it's name. Currently I'm working on Stopper script to make it use **path_list.txt** file.
 2. If you want to launch your programs with parameters (-sampleparameter) or launch UWP Apps via *explorer shell:AppsFolder\\...* function you have to manually write code lines for each program. In the next release I will make script be able to run program that way.

# To Do

 - Rewrite Stopper to use *path\_list.txt* instead of *program\_list.txt*.
 - Rewrite this ReadMe for new release.