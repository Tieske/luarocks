@echo off
setlocal ENABLEDELAYEDEXPANSION
REM Check if binaries are available, if not, get sources and build them


Echo Checking binaries in: %LRT_TEMP%
if not exist "%LRT_TEMP%" ( 
   ECHO Temporary file store doesn't exist, now creating...
   md "%LRT_TEMP%"
)

IF not exist "%LRT_TEMP%Lua51source" (
   ECHO Lua 5.1 sources not found, now downloading them...
   md "%LRT_TEMP%Lua51source"
   cd "%LRT_TEMP%Lua51source"
   "%LRT_TOOLS%wget" http://www.lua.org/ftp/lua-5.1.5.tar.gz
   "%LRT_TOOLS%7z" -aoa x lua-5.1.5.tar.gz
   del lua-5.1.5.tar.gz
   "%LRT_TOOLS%7z" -aoa x lua-5.1.5.tar
   del lua-5.1.5.tar
)
IF not exist "%LRT_TEMP%Lua52source" (
   ECHO Lua 5.2 sources not found, now downloading them...
   md "%LRT_TEMP%Lua52source"
   cd "%LRT_TEMP%Lua52source"
   "%LRT_TOOLS%wget" http://www.lua.org/ftp/lua-5.2.3.tar.gz
   "%LRT_TOOLS%7z" -aoa x lua-5.2.3.tar.gz
   del lua-5.2.3.tar.gz
   "%LRT_TOOLS%7z" -aoa x lua-5.2.3.tar
   del lua-5.2.3.tar
)

REM Lua 5.1, 32bit, MinGW
IF not exist "%LRT_TEMP%Lua51mingw32" (
   ECHO Lua 5.1, MinGW, 32bit binaries not found, now building them...
   md "%LRT_TEMP%Lua51mingw32"
   cd "%LRT_TEMP%Lua51source\lua-5.1.5"
   SET "PATH=%LRT_MINGWPATH%;%LRT_OLD_PATH%"
   make clean
   make mingw
   make install INSTALL_TOP="./../../../Lua51mingw32" TO_BIN="lua.exe luac.exe lua51.dll"
)

REM Lua 5.2, 32bit, MinGW
IF not exist "%LRT_TEMP%Lua52mingw32" (
   ECHO Lua 5.2, MinGW, 32bit binaries not found, now building them...
   md "%LRT_TEMP%Lua52mingw32"
   cd "%LRT_TEMP%Lua52source\lua-5.2.3"
   SET "PATH=%LRT_MINGWPATH%;%LRT_OLD_PATH%"
   make clean
   make mingw
   make install INSTALL_TOP="./../../../Lua52mingw32" TO_BIN="lua.exe luac.exe lua52.dll"
)

REM Lua 5.1, 32bit, MSVC
IF not exist "%LRT_TEMP%Lua51msvc32" (
   ECHO Lua 5.1, MSVC, 32bit binaries not found, now building them...
   SET "PATH=%LRT_OLD_PATH%"
   md "%LRT_TEMP%Lua51msvc32"
   %LRT_MSVCx86%
   md "%LRT_TEMP%Lua51source\lua-5.1.5\etc"
   copy "%LRT_TEST%lua51*.bat" "%LRT_TEMP%Lua51source\lua-5.1.5\etc"
   cd "%LRT_TEMP%Lua51source\lua-5.1.5"
   call etc\lua51vs.bat
   call etc\lua51vsinstall.bat "%LRT_TEMP%Lua51msvc32"
)

REM Lua 5.1, 64bit, MSVC
IF not exist "%LRT_TEMP%Lua51msvc64" (
   ECHO Lua 5.1, MSVC, 64bit binaries not found, now building them...
   SET "PATH=%LRT_OLD_PATH%"
   md "%LRT_TEMP%Lua51msvc64"
   %LRT_MSVCx64%
   md "%LRT_TEMP%Lua51source\lua-5.1.5\etc"
   copy "%LRT_TEST%lua51*.bat" "%LRT_TEMP%Lua51source\lua-5.1.5\etc"
   cd "%LRT_TEMP%Lua51source\lua-5.1.5"
   call etc\lua51vs.bat
   call etc\lua51vsinstall.bat "%LRT_TEMP%Lua51msvc64"
)

REM Lua 5.2, 32bit, MSVC
IF not exist "%LRT_TEMP%Lua52msvc32" (
   ECHO Lua 5.2, MSVC, 32bit binaries not found, now building them...
   SET "PATH=%LRT_OLD_PATH%"
   md "%LRT_TEMP%Lua52msvc32"
   %LRT_MSVCx86%
   md "%LRT_TEMP%Lua52source\lua-5.2.3\etc"
   copy "%LRT_TEST%lua52*.bat" "%LRT_TEMP%Lua52source\lua-5.2.3\etc"
   cd "%LRT_TEMP%Lua52source\lua-5.2.3"
   call etc\lua52vs.bat
   call etc\lua52vsinstall.bat "%LRT_TEMP%Lua52msvc32"
)

REM Lua 5.2, 64bit, MSVC
IF not exist "%LRT_TEMP%Lua52msvc64" (
   ECHO Lua 5.2, MSVC, 64bit binaries not found, now building them...
   SET "PATH=%LRT_OLD_PATH%"
   md "%LRT_TEMP%Lua52msvc64"
   %LRT_MSVCx64%
   md "%LRT_TEMP%Lua52source\lua-5.2.3\etc"
   copy "%LRT_TEST%lua52*.bat" "%LRT_TEMP%Lua52source\lua-5.2.3\etc"
   cd "%LRT_TEMP%Lua52source\lua-5.2.3"
   call etc\lua52vs.bat
   call etc\lua52vsinstall.bat "%LRT_TEMP%Lua52msvc64"
)

