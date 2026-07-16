#!/usr/bin/env pwsh

$RootPath = Split-Path $PSScriptRoot -Parent
$Version = Get-Content (Join-Path $RootPath "VERSION")
$ScriptsPath = Join-Path $RootPath "windows\scripts"
$CreateScript = Join-Path $ScriptsPath "create-tree.cmd"
$ExportScript = Join-Path $ScriptsPath "export-tree.cmd"
$RegistryRoot = "HKCU:\Software\Classes\Directory\Background\shell\LD-TOOLS-Tree"
$ExportMenu = Join-Path $RegistryRoot "shell\Export"
$ExportCommand = Join-Path $ExportMenu "command"

Write-Host "Installing LD-TOOLS-Tree $Version..."
Write-Host ""
Write-Host "Create script : $CreateScript"
Write-Host "Export script : $ExportScript"
Write-Host "Registry root : $RegistryRoot"
Write-Host "Creating registry root..."
if (-not (Test-Path $RegistryRoot)) {
    New-Item -Path $RegistryRoot -Force | Out-Null
}
Set-ItemProperty -Path $RegistryRoot -Name "(Default)" -Value "LD-TOOLS-Tree"
Write-Host "Creating Export menu..."
if (-not (Test-Path $ExportMenu)) {
    New-Item -Path $ExportMenu -Force | Out-Null
}
Write-Host "Ready."

