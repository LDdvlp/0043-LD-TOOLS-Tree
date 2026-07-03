function Get-TreeLevel {

    param(
        [string]$Line
    )

    $level = 0

    while (
        $Line.StartsWith("|   ") -or
        $Line.StartsWith("    ")
    ) {

        $level++
        $Line = $Line.Substring(4)
    }

    return @{
        Level = $level
        Line  = $Line
    }
}

function Get-TreeNode {

    param(
        [string]$Line
    )

    if (-not $Line.StartsWith("+-- ")) {
        return $null
    }

    $name = $Line.Substring(4).Trim()

    $isDirectory = $name.EndsWith("/")

    if ($isDirectory) {
        $name = $name.TrimEnd("/")
    }

    return @{
        Name        = $name
        IsDirectory = $isDirectory
    }
}

function Get-TreeEntry {

    param(
        [string]$Line
    )

    $level = Get-TreeLevel $Line

    $node = Get-TreeNode $level.Line

    if ($null -eq $node) {
        return $null
    }

    return @{
        Level       = $level.Level
        Name        = $node.Name
        IsDirectory = $node.IsDirectory
    }
}

function New-TreeItem {

    param(
        [string]$Parent,
        [hashtable]$Entry
    )

    $fullPath = Join-Path $Parent $Entry.Name

    if ($Entry.IsDirectory) {

        New-Item -ItemType Directory -Force -Path $fullPath | Out-Null
    }
    else {

        New-Item -ItemType File -Force -Path $fullPath | Out-Null
    }

    return $fullPath
}