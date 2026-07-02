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

# ------------------------------------------
# Test 4
# ------------------------------------------

$result = Get-TreeNode "+-- README.md"

if ($result.Name -eq "README.md" -and -not $result.IsDirectory) {
    Write-Host "[ OK ] File"
}
else {
    Write-Host "[FAIL] File"
}

# ------------------------------------------
# Test 5
# ------------------------------------------

$result = Get-TreeNode "+-- src/"

if ($result.Name -eq "src/" -and $result.IsDirectory) {
    Write-Host "[ OK ] Directory"
}
else {
    Write-Host "[FAIL] Directory"
}

# ------------------------------------------
# Test 6
# ------------------------------------------

$result = Get-TreeNode "README.md"

if ($null -eq $result) {
    Write-Host "[ OK ] Invalid node"
}
else {
    Write-Host "[FAIL] Invalid node"
}

# ------------------------------------------
# Test 7
# ------------------------------------------

$result = Get-TreeEntry "|   +-- src/"

if (
    $result.Level -eq 1 -and
    $result.Name -eq "src/" -and
    $result.IsDirectory
) {
    Write-Host "[ OK ] Tree Entry"
}
else {
    Write-Host "[FAIL] Tree Entry"
}