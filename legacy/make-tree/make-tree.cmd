@echo off
setlocal

REM ==========================================
REM make-tree.cmd
REM Wrapper Windows pour make-tree.ps1
REM Usage:
REM   make-tree "D:\path\to\tree.txt"
REM ==========================================

if "%~1"=="" (
  echo Usage: make-tree ^<tree-file.txt^>
  exit /b 1
)

REM Dossier ou se trouve ce script
set "SCRIPT_DIR=%~dp0"

REM Script PowerShell reel
set "PS_SCRIPT=%SCRIPT_DIR%make-tree.ps1"

if not exist "%PS_SCRIPT%" (
  echo ERREUR: make-tree.ps1 introuvable:
  echo %PS_SCRIPT%
  exit /b 2
)

powershell -NoProfile -ExecutionPolicy Bypass ^
  -File "%PS_SCRIPT%" ^
  "%~1"

endlocal
exit /b %ERRORLEVEL%
