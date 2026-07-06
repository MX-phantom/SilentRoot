# =====================================
# Help.Index.Tests.ps1
# Mr Max CLI
# =====================================

Clear-Host

Write-Host ""
Write-Host "==========================================" -ForegroundColor DarkGray
Write-Host "        Help Engine Index Test" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor DarkGray
Write-Host ""

#--------------------------------------
# Build Index
#--------------------------------------

Write-Host "[1/4] Building Help Index..." -ForegroundColor Yellow

try {

    $Index = New-HelpIndex

    Write-Host "PASS  Index built successfully." -ForegroundColor Green

}
catch {

    Write-Host "FAIL  Index build failed." -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor DarkYellow
    return

}

Write-Host ""

#--------------------------------------
# Index.json Exists
#--------------------------------------

$IndexPath = Join-Path `
    $HOME `
    "Documents\PowerShell\HelpData\Index.json"

Write-Host "[2/4] Checking Index.json..." -ForegroundColor Yellow

if (Test-Path $IndexPath){

    Write-Host "PASS  Index.json exists." -ForegroundColor Green

}
else{

    Write-Host "FAIL  Index.json not found." -ForegroundColor Red
    return

}

Write-Host ""

#--------------------------------------
# Read Json
#--------------------------------------

Write-Host "[3/4] Reading Index..." -ForegroundColor Yellow

$Data = Get-Content `
    $IndexPath `
    -Raw |
ConvertFrom-Json

Write-Host "PASS  Loaded $($Data.Count) help topics." -ForegroundColor Green

Write-Host ""

#--------------------------------------
# Display Topics
#--------------------------------------

Write-Host "[4/4] Available Topics" -ForegroundColor Yellow
Write-Host ""

$Data |
Sort-Object Title |
Format-Table `
Title,
Category,
Version `
-AutoSize

Write-Host ""
Write-Host "==========================================" -ForegroundColor DarkGray
Write-Host " Index Test Finished" -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor DarkGrayelse{

    Write-Host "FAIL  Index.json not found." -ForegroundColor Red
    return

}

Write-Host ""

#--------------------------------------
# Read Json
#--------------------------------------

Write-Host "[3/4] Reading Index..." -ForegroundColor Yellow

$Data = Get-Content `
    $IndexPath `
    -Raw |
ConvertFrom-Json

Write-Host "PASS  Loaded $($Data.Count) help topics." -ForegroundColor Green

Write-Host ""

#--------------------------------------
# Display Topics
#--------------------------------------

Write-Host "[4/4] Available Topics" -ForegroundColor Yellow
Write-Host ""

$Data |
Sort-Object Title |
Format-Table `
Title,
Category,
Version `
-AutoSize

Write-Host ""
Write-Host "==========================================" -ForegroundColor DarkGray
Write-Host " Index Test Finished" -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor DarkGray\Documents\PowerShell\HelpData\Index.json"
