@echo off
setlocal

REM ==========================================
REM export-tree.cmd
REM ==========================================

if "%~1"=="" (
    echo Usage: export-tree ^<directory^>
    exit /b 1
)

set "SCRIPT_DIR=%~dp0"
set "PS_SCRIPT=%SCRIPT_DIR%export-tree.ps1"

powershell -NoProfile -ExecutionPolicy Bypass ^
  -File "%PS_SCRIPT%" ^
  "%~1"

endlocal