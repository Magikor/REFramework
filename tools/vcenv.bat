@echo off
set "VSINSTALL=C:\Program Files (x86)\Microsoft Visual Studio\18\BuildTools"
if exist "%VSINSTALL%\VC\Auxiliary\Build\vcvars64.bat" (
  call "%VSINSTALL%\VC\Auxiliary\Build\vcvars64.bat"
  exit /b 0
)

set "VSINSTALL=C:\Program Files\Microsoft Visual Studio\18\Community"
if exist "%VSINSTALL%\VC\Auxiliary\Build\vcvars64.bat" (
  call "%VSINSTALL%\VC\Auxiliary\Build\vcvars64.bat"
  exit /b 0
)

echo vcvars64.bat not found. Install VS Build Tools / C++ workload.
exit /b 1
