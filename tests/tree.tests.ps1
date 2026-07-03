# ==========================================
# Tree Tests
# ==========================================

$script:TestNumber = 0
$script:Passed = 0
$script:Failed = 0

function Assert-TreeTest {

    param(
        [string]$Name,
        [bool]$Condition
    )

    $script:TestNumber++

    if ($Condition) {

        $script:Passed++

        Write-Host ("[{0:D2} OK] {1}" -f $script:TestNumber, $Name)
    }
    else {

        $script:Failed++

        Write-Host ("[{0:D2} FAIL] {1}" -f $script:TestNumber, $Name)
    }
}
function Write-TestSection {

    param(
        [string]$Name
    )

    Write-Host ""
    Write-Host $Name
    Write-Host "-------------------------------------"
}

. "$PSScriptRoot/../core/tree.ps1"

Write-Host ""
Write-Host "====================================="
Write-Host "Tree Tests"
Write-Host "====================================="

Write-TestSection "Tree Level"

# ------------------------------------------
# Test 1
# ------------------------------------------

$result = Get-TreeLevel "+-- README.md"

Assert-TreeTest "Level 0" (
    $result.Level -eq 0 -and
    $result.Line -eq "+-- README.md"
)

# ------------------------------------------
# Test 2
# ------------------------------------------

$result = Get-TreeLevel "|   +-- src/"

Assert-TreeTest "Level 1" (
    $result.Level -eq 1 -and
    $result.Line -eq "+-- src/"
)

# ------------------------------------------
# Test 3
# ------------------------------------------

$result = Get-TreeLevel "|   |   +-- file.txt"

Assert-TreeTest "Level 2" (
    $result.Level -eq 2 -and
    $result.Line -eq "+-- file.txt"
)

Write-TestSection "Tree Node"

# ------------------------------------------
# Test 4
# ------------------------------------------

$result = Get-TreeNode "+-- README.md"

Assert-TreeTest "File" (
    $result.Name -eq "README.md" -and
    -not $result.IsDirectory
)

# ------------------------------------------
# Test 5
# ------------------------------------------

$result = Get-TreeNode "+-- src/"

Assert-TreeTest "Directory" (
    $result.Name -eq "src" -and
    $result.IsDirectory
)

# ------------------------------------------
# Test 6
# ------------------------------------------

$result = Get-TreeNode "README.md"

Assert-TreeTest "Invalid node" (
    $null -eq $result
)

Write-TestSection "Tree Entry"

# ------------------------------------------
# Test 7
# ------------------------------------------

$result = Get-TreeEntry "|   +-- src/"

Assert-TreeTest "Tree Entry" (
    $result.Level -eq 1 -and
    $result.Name -eq "src" -and
    $result.IsDirectory
)

Write-TestSection "Filesystem"

# ------------------------------------------
# Test 8
# ------------------------------------------

$temp = Join-Path $env:TEMP "TreeTests"

Remove-Item $temp -Recurse -Force -ErrorAction SilentlyContinue

New-Item -ItemType Directory -Path $temp | Out-Null

$entry = @{
    Name        = "src"
    IsDirectory = $true
}

$result = New-TreeItem $temp $entry

Assert-TreeTest "Create directory" (
    Test-Path $result
)

# ------------------------------------------
# Test 9
# ------------------------------------------

$entry = @{
    Name        = "README.md"
    IsDirectory = $false
}

$result = New-TreeItem $temp $entry

Assert-TreeTest "Create file" (
    Test-Path $result
)

# ------------------------------------------
# Summary
# ------------------------------------------

Write-Host ""
Write-Host "====================================="
Write-Host "Summary"
Write-Host "====================================="
Write-Host ""

Write-Host "Tests : $script:TestNumber"
Write-Host "Passed: $script:Passed"
Write-Host "Failed: $script:Failed"

Write-Host ""
Write-Host "====================================="
