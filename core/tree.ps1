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