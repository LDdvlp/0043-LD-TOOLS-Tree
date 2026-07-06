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

$temp = Join-Path ([System.IO.Path]::GetTempPath()) "TreeTests"

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

Write-TestSection "Regression"

# ------------------------------------------
# Test 10
# ------------------------------------------

$fixture = Join-Path $PSScriptRoot "fixtures/legacy-tree.txt"

$lines = Get-Content $fixture

$result = Get-TreeEntries $lines

Assert-TreeTest "Legacy parsing" (
    $result.Count -eq 4 -and

    $result[0].Name -eq "src" -and
    $result[0].Level -eq 0 -and
    $result[0].IsDirectory -and

    $result[1].Name -eq "app.ps1" -and
    $result[1].Level -eq 1 -and
    -not $result[1].IsDirectory
)

# ------------------------------------------
# Test 11
# ------------------------------------------

$output = Join-Path ([System.IO.Path]::GetTempPath()) "TreeRegression"

Remove-Item $output -Recurse -Force -ErrorAction SilentlyContinue

New-Item -ItemType Directory -Path $output | Out-Null

Invoke-TreeCreation $lines $output

Assert-TreeTest "Legacy filesystem creation" (
    (Test-Path (Join-Path $output "src")) -and
    (Test-Path (Join-Path $output "src/app.ps1")) -and
    (Test-Path (Join-Path $output "docs")) -and
    (Test-Path (Join-Path $output "docs/README.md"))
)

# ------------------------------------------
# Test 12
# ------------------------------------------

$asciiFixture = Join-Path $PSScriptRoot "fixtures/ascii-tree.txt"

$asciiLines = Get-Content $asciiFixture

$asciiResult = Get-TreeEntries $asciiLines

Assert-TreeTest "ASCII parsing" (
    $asciiResult.Count -eq 4 -and

    $asciiResult[0].Name -eq "src" -and
    $asciiResult[0].Level -eq 0 -and
    $asciiResult[0].IsDirectory -and

    $asciiResult[1].Name -eq "app.ps1" -and
    $asciiResult[1].Level -eq 1 -and
    -not $asciiResult[1].IsDirectory
)

# ------------------------------------------
# Test 13
# ------------------------------------------

$unicodeFixture = Join-Path $PSScriptRoot "fixtures/unicode-tree.txt"

$unicodeLines = Get-Content $unicodeFixture

$unicodeResult = Get-TreeEntries $unicodeLines

Assert-TreeTest "Unicode parsing" (
    $unicodeResult.Count -eq 4 -and

    $unicodeResult[0].Name -eq "src" -and
    $unicodeResult[0].Level -eq 0 -and
    $unicodeResult[0].IsDirectory -and

    $unicodeResult[1].Name -eq "app.ps1" -and
    $unicodeResult[1].Level -eq 1 -and
    -not $unicodeResult[1].IsDirectory
)

# ------------------------------------------
# Test 14
# ------------------------------------------

$emptyFixture = Join-Path $PSScriptRoot "fixtures/empty-lines-tree.txt"

$emptyLines = Get-Content $emptyFixture

$emptyResult = Get-TreeEntries $emptyLines

Assert-TreeTest "Ignore empty lines" (
    $emptyResult.Count -eq 4 -and

    $emptyResult[0].Name -eq "src" -and
    $emptyResult[0].Level -eq 0 -and
    $emptyResult[0].IsDirectory -and

    $emptyResult[1].Name -eq "app.ps1" -and
    $emptyResult[1].Level -eq 1 -and
    -not $emptyResult[1].IsDirectory
)

# ------------------------------------------
# Test 15
# ------------------------------------------

$commentsFixture = Join-Path $PSScriptRoot "fixtures/comments-tree.txt"

$commentsLines = Get-Content $commentsFixture

$commentsResult = Get-TreeEntries $commentsLines

Assert-TreeTest "Ignore comments" (
    $commentsResult.Count -eq 4 -and

    $commentsResult[0].Name -eq "src" -and
    $commentsResult[0].Level -eq 0 -and
    $commentsResult[0].IsDirectory -and

    $commentsResult[1].Name -eq "app.ps1" -and
    $commentsResult[1].Level -eq 1 -and
    -not $commentsResult[1].IsDirectory
)

# ------------------------------------------
# Summary
# ------------------------------------------

Write-Host ""
Write-Host "====================================="
Write-Host "Summary"
Write-Host "====================================="
Write-Host ""

Write-Host "Tests : $($script:TestNumber)" -ForegroundColor Blue

Write-Host "Passed: $($script:Passed)" -ForegroundColor Green

Write-Host "Failed: $($script:Failed)" -ForegroundColor Red

Write-Host ""
Write-Host "====================================="
