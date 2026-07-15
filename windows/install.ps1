#!/usr/bin/env pwsh

$RootPath = Split-Path $PSScriptRoot -Parent
$Version = Get-Content (Join-Path $RootPath "VERSION")
$ScriptsPath = Join-Path $RootPath "windows\scripts"

Write-Host "Installing LD-TOOLS-Tree $Version..."
Write-Host ""
Write-Host "Ready."

