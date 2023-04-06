@echo off

@REM set BASEDIR=%~dp0
@REM PUSHD %BASEDIR%

RMDIR /Q /S build

conan install . --output-folder=build 
cmake -G Ninja -S . -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_MODULE_PATH=build
ninja -C build
build\compressor.exe

@REM cd build
@REM cmake .. -G "Visual Studio 16 2019" -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake
@REM cmake --build . --config Release
@REM Release\compressor.exe
