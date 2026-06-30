param(
    [Parameter(Mandatory = $true)]
    [string]$TreeFile
)

# --------------------------------------------------
# Vérification fichier
# --------------------------------------------------

if (-not (Test-Path $TreeFile)) {
    Write-Host "Fichier introuvable : $TreeFile"
    exit 1
}

# --------------------------------------------------
# Lecture lignes
# --------------------------------------------------

$lines = Get-Content $TreeFile

if ($lines.Count -lt 2) {
    Write-Host "tree.txt invalide"
    exit 1
}

# --------------------------------------------------
# Base path automatique
# --------------------------------------------------

$basePath = Split-Path $TreeFile

Write-Host "BASE : $basePath"
Write-Host ""

New-Item -ItemType Directory -Force -Path $basePath | Out-Null

# --------------------------------------------------
# Stack dossiers
# --------------------------------------------------

$stack = @()
$stack += $basePath

# --------------------------------------------------
# Parse
# --------------------------------------------------

for ($i = 0; $i -lt $lines.Count; $i++) {

    $line = $lines[$i]

    if ([string]::IsNullOrWhiteSpace($line)) {
        continue
    }

    # Ignore lignes décoratives
    if ($line.Trim() -eq "|") {
        continue
    }

    # ------------------------------------------
    # Calcul niveau
    # ------------------------------------------

    $level = 0
    while (
        $line.StartsWith("|   ") -or
        $line.StartsWith("    ")
    ) {
    
        $level++
        $line = $line.Substring(4)
    }

    # ------------------------------------------
    # Détection du noeud
    # ------------------------------------------

    if ($line.StartsWith("+-- ")) {

        $name = $line.Substring(4).Trim()
    }
    else {

        continue
    }

    # ------------------------------------------
    # Nom réel
    # ------------------------------------------

    $name = $line.Substring(4).Trim()

    Write-Host "LEVEL=$level NAME=$name"

    # ------------------------------------------
    # Ajuste stack
    # ------------------------------------------

    while ($stack.Count -gt ($level + 1)) {
        $stack = $stack[0..($stack.Count - 2)]
    }

    $parent = $stack[-1]

    # ------------------------------------------
    # Dossier ?
    # ------------------------------------------

    if ($name.EndsWith("/")) {

        $dirName = $name.TrimEnd("/")

        $fullPath = Join-Path $parent $dirName

        New-Item -ItemType Directory -Force -Path $fullPath | Out-Null

        $stack += $fullPath

        Write-Host "DIR  : $fullPath"
    }
    else {

        $fullPath = Join-Path $parent $name

        New-Item -ItemType File -Force -Path $fullPath | Out-Null

        Write-Host "FILE : $fullPath"
    }
}

Write-Host ""
Write-Host "Arborescence créée."