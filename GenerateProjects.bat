@echo OFF
color d
title Goblin Project Generator
:start
cls
echo clean             Remove all binaries and generated files
echo codelite          Generate CodeLite project files
echo gmake             Generate GNU makefiles for POSIX, MinGW, and Cygwin
echo gmake2            Generate GNU makefiles for POSIX, MinGW, and Cygwin
echo vs2005            Generate Visual Studio 2005 project files
echo vs2008            Generate Visual Studio 2008 project files
echo vs2010            Generate Visual Studio 2010 project files
echo vs2012            Generate Visual Studio 2012 project files
echo vs2013            Generate Visual Studio 2013 project files
echo vs2015            Generate Visual Studio 2015 project files
echo vs2017            Generate Visual Studio 2017 project files
echo vs2019            Generate Visual Studio 2019 project files
echo xcode4            Generate Apple Xcode 4 project files
echo Write Editor of choice: 
set /p input=""
cls
call vendor\bin\premake5\premake5.exe %input%
PAUSE
cls
set /p choice="Do you want to restart? Press 'y' and enter for Yes: "
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='y' goto start