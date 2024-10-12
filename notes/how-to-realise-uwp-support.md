# Plan for realising UWP apps support for Batch script variant

## The basic idea

Both scripts should use single uwp.txt file to open and close programs listed in this file. As far as I know, there is no way to translate 'shell:appsFolder\\\<PackageFamilyName>!App' to a regular path using batch script so there are two possible ways of realization:

1. Make a VBS script that will translate shell command to usual Windows path;
2. Make Starter and Stopper to read different lines of uwp.txt, where:
	- Starter would read odd tokens of uwp.txt;
	- Stopper would read even ones.

As I am planning to make this program in different scripting languages, second way is the preferred one.

## Problem

The **problem** is to code .cmd files to take even/odd lines (depending on script) and do operations with them. Also it should be programmed such a way that it would take any amount of even/odd lines.

Batch script has 'tokens' keyword in /f option in **for** loop, so if you need to take specific "tokens" you would write something like this:

	for /f "tokens=1,3,5 delimiters= ^" %%u in (uwp.txt) do(
		...
		)

Explanation:
**/f** option enable iterating and file parsing, **tokens** keyword define what tokens (or parts in other words) of text will be assigned to the variable, and **delims** (delimiters) keyword defines what symbols will represent a delimiter for these parts (**delims** keyword has a default set of characters so it is not necessary to use all the time).

So here we need to word with **tokens** keyword as it defines what tokens we will take from the file. There is no way to make **tokens** take even/odd lines 'functionally', because regular expression cannot do this trick and in general aside from regular expressions this keyword is <u>deterministic</u>. So we have to actually determine these lines via **for** loop, where it should return a single string of all even/odd lines separated by comma, and to assign it to a variable whick we will insert after **tokens=** words (e.g. tokens=%odd_lines%).

So if we have 47 strings in a file, this function should return string values *1,3,5,...,45,47* in Starter and *2,4,6,...,44,46* in Stopper.

## Goal

The goal is to write function that will return all text line numbers separated by a comma, odd in Starter and even in Stopper.