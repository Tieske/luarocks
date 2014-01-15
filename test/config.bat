@echo off
REM Configuration file for the Windows test, call with "/clear" to reset to original values

REM Directory paths should end with a '\'

REM Store active directory
SET LRT_OLDDIR=%CD%

REM System path before starting
SET LRT_OLD_PATH=%PATH%

REM PATH to be added to sys path to find MinGW compiler and 'make' command
SET LRT_MINGWPATH=c:\mingw\bin\;c:\mingw\msys\1.0\bin\

REM Command for MSVC x64 compiler setup
SET LRT_MSVCx64=call "C:\Program Files\Microsoft SDKs\Windows\v7.0\Bin\SetEnv.cmd" /win7 /x64 /release

REM Command for MSVC x86 compiler setup
SET LRT_MSVCx86=call "C:\Program Files\Microsoft SDKs\Windows\v7.0\Bin\SetEnv.cmd" /win7 /x86 /release

REM Path to test files/directory
SET LRT_TEST=%~dp0

REM PATH to included binary tools
SET LRT_TOOLS=%LRT_TEST%..\win32\bin\bin\

REM PATH to temporary files/binaries created
SET LRT_TEMP=%LRT_TEST%win_testfiles\

if not [%1]==[/clear] goto exit_file
REM Restore settings
SET PATH=%LRT_OLD_PATH%
chdir /d "%LRT_OLDDIR%"
SET LRT_OLDDIR=
SET LRT_OLD_PATH=
SET LRT_MINGWPATH=
SET LRT_MSVCx86=
SET LRT_MSVCx64=
SET LRT_TEST=
SET LRT_TEMP=
SET LRT_TOOLS=

:exit_file