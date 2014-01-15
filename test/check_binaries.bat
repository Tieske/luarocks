@echo off
setlocal
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
REM Lua 5.1, 64bit, MSVC
REM Lua 5.2, 32bit, MSVC
REM Lua 5.2, 64bit, MSVC
