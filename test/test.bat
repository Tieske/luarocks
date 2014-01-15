@echo off
REM How to use:
REM This script will build binaries if not available yet. To do this, it must be run from the
REM Visual Studio commandprompt.
REM 
REM USAGE: test [/clean]
REM
REM   /clean  : cleans all temporary files, and will rebuild all binaries (takes a while...)
REM
REM Any options can be set by editing 'config.bat'


REM First call config to setup the environment
call config.bat
setlocal
echo Executing from: %LRT_TEST%

REM Check if we need to clean...
IF [%1]==[/clean] (
   ECHO Cleaning ...
   RD /S /Q "%LRT_TEMP%"
)

REM Check binaries (will build them if not available)
call "%LRT_TEST%check_binaries.bat"



REM Clean up
ECHO Cleaning environment...
call "%LRT_TEST%config.bat" /clean
ECHO Done.