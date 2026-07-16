#!/usr/bin/env pwsh

$RootPath = Split-Path $PSScriptRoot -Parent
$Version = Get-Content (Join-Path $RootPath "VERSION")
$ScriptsPath = Join-Path $RootPath "windows\scripts"
$CreateScript = Join-Path $ScriptsPath "create-tree.cmd"
$ExportScript = Join-Path $ScriptsPath "export-tree.cmd"
$RegistryRoot = "HKCU:\Software\Classes\Directory\Background\shell\LD-TOOLS-Tree"
$ExportMenu = Join-Path $RegistryRoot "shell\Export"
$ExportCommand = Join-Path $ExportMenu "command"
$ExportLabel = "Export ASCII Tree"
$ExportCommandLine = "`"$ExportScript`" `"%V`""

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
Write-Host "Creating Export command..."
if (-not (Test-Path $ExportMenu)) {
    New-Item -Path $ExportMenu -Force | Out-Null
}
if (-not (Test-Path $ExportCommand)) {
    New-Item -Path $ExportCommand -Force | Out-Null
}
Set-ItemProperty -Path $ExportCommand -Name "(Default)" -Value $ExportCommandLine
Set-ItemProperty -Path $ExportMenu -Name "(Default)" -Value $ExportLabel
Write-Host "Ready."

