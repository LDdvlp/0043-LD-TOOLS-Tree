#!/usr/bin/env pwsh

$VersionFile = Join-Path $PSScriptRoot "../VERSION"
$Version = Get-Content $VersionFile

Write-Host "LD-TOOLS-Tree $Version"
Write-Host "CLI ready"
