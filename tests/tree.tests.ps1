# ==========================================
# Tree Tests
# ==========================================

. "$PSScriptRoot/../core/tree.ps1"

Write-Host ""
Write-Host "====================================="
Write-Host "Tree Tests"
Write-Host "====================================="
Write-Host ""

# ------------------------------------------
# Test 1
# ------------------------------------------

$result = Get-TreeLevel "+-- README.md"

if ($result.Level -eq 0 -and $result.Line -eq "+-- README.md") {

    Write-Host "[ OK ] Level 0"
}
else {

    Write-Host "[FAIL] Level 0"
}

# ------------------------------------------
# Test 2
# ------------------------------------------

$result = Get-TreeLevel "|   +-- src/"

if ($result.Level -eq 1 -and $result.Line -eq "+-- src/") {

    Write-Host "[ OK ] Level 1"
}
else {

    Write-Host "[FAIL] Level 1"
}

# ------------------------------------------
# Test 3
# ------------------------------------------

$result = Get-TreeLevel "|   |   +-- file.txt"

if ($result.Level -eq 2 -and $result.Line -eq "+-- file.txt") {

    Write-Host "[ OK ] Level 2"
}
else {

    Write-Host "[FAIL] Level 2"
}