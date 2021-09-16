@echo OFF
color 2
title Goblin Project Generator
echo GPG(Goblin Project Generator) Currently only supports vs2019 Automatically
echo Worse case you open up this batch file and change the premake parameter we cant stop you
call vendor\bin\premake5\premake5.exe vs2019
PAUSE