function Get-TreeLevel {

    param(
        [string]$Line
    )

    $level = 0

    while (
        $Line.StartsWith("│   ") -or
        $Line.StartsWith("|    ") -or
        $Line.StartsWith("     ") -or
        $Line.StartsWith("|   ") -or
        $Line.StartsWith("    ")
    ) {

        if (
            $Line.StartsWith("|    ") -or
            $Line.StartsWith("     ")
        ) {

            $Line = $Line.Substring(5)
        }
        else {

            $Line = $Line.Substring(4)
        }

        $level++
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

    if ($Line.StartsWith("+--- ")) {

        $name = $Line.Substring(5).Trim()
    }
    elseif ($Line.StartsWith("+-- ")) {

        $name = $Line.Substring(4).Trim()
    }
    elseif (
        $Line.StartsWith("├── ") -or
        $Line.StartsWith("└── ")
    ) {

        $name = $Line.Substring(4).Trim()
    }
    else {

        return $null
    }

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
function Get-TreeEntries {

    param(
        [string[]]$Lines
    )

    $entries = @()

    foreach ($line in $Lines) {

        $entry = Get-TreeEntry $line

        if ($null -ne $entry) {
            $entries += $entry
        }
    }

    return $entries
}
function Invoke-TreeCreation {

    param(
        [string[]]$Lines,
        [string]$OutputPath
    )

    $entries = Get-TreeEntries $Lines

    $stack = @()
    $stack += $OutputPath

    foreach ($entry in $entries) {

        while ($stack.Count -gt ($entry.Level + 1)) {
            $stack = $stack[0..($stack.Count - 2)]
        }

        $parent = $stack[-1]

        $created = New-TreeItem $parent $entry

        if ($entry.IsDirectory) {
            $stack += $created
        }
    }
}