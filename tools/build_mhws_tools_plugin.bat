@echo off
setlocal

REM Use 8.3 paths to keep lines short.
set "VS=C:\PROGRA~2\MICROS~2\18\BUILDT~1"
set "VSFULL=C:\Program Files (x86)\Microsoft Visual Studio\18\BuildTools"
if not exist "%VS%\VC\Auxiliary\Build\vcvars64.bat" (
  echo ERROR: vcvars64.bat not found at %VS%
  exit /b 1
)

REM vcvars can fail with "The input line is too long" if PATH is already huge.
REM Reset PATH to a minimal baseline, then let vcvars populate it.
set "PATH=C:\Windows\System32;C:\Windows;C:\Windows\System32\Wbem"
if exist "C:\Program Files\Git\cmd\git.exe" (
  set "PATH=%PATH%;C:\Program Files\Git\cmd"
)

echo Using VS at: %VS%
echo Calling vcvars64...
call "%VS%\VC\Auxiliary\Build\vcvars64.bat"
if errorlevel 1 (
  echo ERROR: Failed to load VC environment.
  exit /b 1
)

cd /d "%~dp0.." || exit /b 1

REM Fresh configure to ensure cmkr regenerates CMakeLists with our plugin target.
if exist "build64_mhws_tools\CMakeCache.txt" (
  echo Removing old build64_mhws_tools - generator mismatch cleanup...
  rmdir /s /q "build64_mhws_tools"
)
cmake -S . -B build64_mhws_tools -G "Visual Studio 18 2026" -A x64 -DCMAKE_GENERATOR_INSTANCE="%VSFULL%"
if errorlevel 1 exit /b 1

REM Run configure again after cmkr bootstrap so the real project is generated.
cmake -S . -B build64_mhws_tools -G "Visual Studio 18 2026" -A x64 -DCMAKE_GENERATOR_INSTANCE="%VSFULL%"
if errorlevel 1 exit /b 1

cmake --build build64_mhws_tools --config Release --target mhws_tools_plugin
if errorlevel 1 exit /b 1

REM Find built DLL and copy to game plugins folder.
set "OUTDLL="
for /r "build64_mhws_tools" %%F in (mhws_tools_plugin.dll) do (
  set "OUTDLL=%%F"
  goto :found
)

:found
if "%OUTDLL%"=="" (
  echo ERROR: Built DLL not found under build64_mhws_tools
  exit /b 1
)

set "GAME=C:\Program Files (x86)\Steam\steamapps\common\MonsterHunterWilds"
if not exist "%GAME%\reframework\plugins" mkdir "%GAME%\reframework\plugins"

copy /Y "%OUTDLL%" "%GAME%\reframework\plugins\mhws_tools_plugin.dll" >nul
echo OK: Copied to %GAME%\reframework\plugins\mhws_tools_plugin.dll

endlocal
