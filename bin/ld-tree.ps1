#!/usr/bin/env pwsh

param(
    [string]$Command = "help",
    [string]$InputFile,
    [string]$OutputPath
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

    "create" {

        if (-not $InputFile) {
            Write-Host "Missing parameter: InputFile"
            exit 1
        }

        if (-not $OutputPath) {
            Write-Host "Missing parameter: OutputPath"
            exit 1
        }

        $Lines = Get-Content $InputFile
            
        Invoke-TreeCreation `
            -Lines $Lines `
            -OutputPath $OutputPath
            
        Write-Host "Tree created"
    }

    "export" {

        if (-not $InputFile) {
            Write-Host "Missing parameter: InputFile"
            exit 1
        }

        if (-not $OutputPath) {
            Write-Host "Missing parameter: OutputPath"
            exit 1
        }

        $Lines = Export-Tree -Path $InputFile

        Set-Content `
            -Path $OutputPath `
            -Value $Lines

        Write-Host "Tree exported"
    }
    
    default {
        Write-Host "Unknown command: $Command"
        exit 1
    }
}
