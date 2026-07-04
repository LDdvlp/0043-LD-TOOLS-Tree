Write-Host ""
Write-Host "====================================="
Write-Host "LD Tree CI"
Write-Host "====================================="
Write-Host ""

Write-Host "Running tests..."
Write-Host ""

pwsh ./tests/tree.tests.ps1

if ($LASTEXITCODE -ne 0) {

    Write-Host ""
    Write-Host "CI failed" -ForegroundColor Red
    Write-Host ""
    Write-Host "====================================="
    exit 1
}

Write-Host ""
Write-Host "CI passed" -ForegroundColor Green
Write-Host ""
Write-Host "====================================="

exit 0