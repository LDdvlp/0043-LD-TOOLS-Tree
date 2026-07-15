#!/usr/bin/env pwsh

$RootPath = Split-Path $PSScriptRoot -Parent
$Version = Get-Content (Join-Path $RootPath "VERSION")
$ScriptsPath = Join-Path $RootPath "windows\scripts"
$CreateScript = Join-Path $ScriptsPath "create-tree.cmd"
$ExportScript = Join-Path $ScriptsPath "export-tree.cmd"
$RegistryRoot = "HKCU:\Software\Classes\Directory\Background\shell\LD-TOOLS-Tree"

Write-Host "Installing LD-TOOLS-Tree $Version..."
Write-Host ""
Write-Host "Create script : $CreateScript"
Write-Host "Export script : $ExportScript"
Write-Host "Registry root : $RegistryRoot"
Write-Host "Ready."

