#!/usr/bin/env pwsh

param(
    [string]$Command = "help"
)

$RootPath = Split-Path $PSScriptRoot -Parent

$VersionFile = Join-Path $RootPath "VERSION"
$CoreFile = Join-Path $RootPath "core/tree.ps1"

. $CoreFile

$Version = Get-Content $VersionFile

switch ($Command) {

    "version" {
        Write-Host "LD-TOOLS-Tree $Version"
    }

    "help" {
        Write-Host "LD-TOOLS-Tree $Version"
        Write-Host ""
        Write-Host "Commands:"
        Write-Host "  version    Show version"
        Write-Host "  help       Show help"
    }

    default {
        Write-Host "Unknown command: $Command"
        exit 1
    }
}
