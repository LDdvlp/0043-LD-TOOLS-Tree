#!/usr/bin/env pwsh

$RootPath = Split-Path $PSScriptRoot -Parent

$VersionFile = Join-Path $RootPath "VERSION"
$CoreFile = Join-Path $RootPath "core/tree.ps1"

. $CoreFile

$Version = Get-Content $VersionFile

Write-Host "LD-TOOLS-Tree $Version"
Write-Host "Core loaded"
Write-Host "CLI ready"
