param(
    [Parameter(Mandatory = $true)]
    [string]$BasePath
)

# --------------------------------------------------
# Vérification
# --------------------------------------------------

if (-not (Test-Path $BasePath)) {
    Write-Host "Dossier introuvable : $BasePath"
    exit 1
}

$BasePath = Resolve-Path $BasePath

$outputFile = Join-Path $BasePath "tree.txt"

# --------------------------------------------------
# Fonction récursive
# --------------------------------------------------

function Export-Tree {
    param(
        [string]$Path,
        [string]$Prefix = ""
    )

    $items = Get-ChildItem -LiteralPath $Path

    $count = $items.Count

    for ($i = 0; $i -lt $count; $i++) {

        $item = $items[$i]

        $isLast = ($i -eq ($count - 1))

        if ($isLast) {
            $connector = "+-- "
            $nextPrefix = $Prefix + "    "
        }
        else {
            $connector = "+-- "
            $nextPrefix = $Prefix + "|   "
        }

        $line = $Prefix + $connector + $item.Name

        if ($item.PSIsContainer) {
            $line += "/"
        }

        Add-Content -Path $outputFile -Value $line

        if ($item.PSIsContainer) {
            Export-Tree -Path $item.FullName -Prefix $nextPrefix
        }
    }
}

# --------------------------------------------------
# Création tree.txt
# --------------------------------------------------

"" | Set-Content $outputFile

Export-Tree -Path $BasePath

Write-Host ""
Write-Host "ASCII tree exporté :"
Write-Host $outputFile