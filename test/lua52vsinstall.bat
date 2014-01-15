@echo off
rem Script to install Lua 5.2 under "Visual Studio .NET Command Prompt".
rem Do not run from this directory; run it from the toplevel: etc\luavsinstall.bat .
rem It creates the standard Lua structure with ./bin ./include ./lib etc. folders.

rem This command does for Visual Studio as `make install` does with the MinGW toolchain,
rem where the parameter [TargetDirectory] equals the `INSTALL_TOP=[TargetDirectory]`
rem parameter in the MinGW setup, other parameters are not supported.

setlocal

if [%1]==[] (
    echo USAGE: etc\luavsinstall.bat [TargetDirectory]
    echo Do not run from its own location, but run it from the toplevel.
    echo First build using `etc\luavs.bat` before calling `etc\luavsinstall.bat`
    echo.
    exit /B 1
)

REM @echo on
cd src
mkdir %1\bin
mkdir %1\include
mkdir %1\lib
mkdir %1\lib\lua
mkdir %1\lib\lua\5.2
mkdir %1\man
mkdir %1\man\man1
mkdir %1\share
mkdir %1\share\lua\5.2
copy lua.exe %1\bin
copy luac.exe %1\bin
copy lua52.dll %1\bin
copy lauxlib.h %1\include
copy lua.h %1\include
copy lua.hpp %1\include
copy luaconf.h %1\include
copy lualib.h %1\include
copy lua52.lib %1\lib
cd ..\doc
copy lua.1 %1\man\man1
copy luac.1 %1\man\man1
cd ..
