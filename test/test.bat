@echo off
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