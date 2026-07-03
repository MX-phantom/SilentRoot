function Show-Info {
    param(
        [string]$Message
    )

    Write-Host "[INFO]  $Message" -ForegroundColor Cyan
}

function Show-Success {
    param(
        [string]$Message
    )

    Write-Host "[ OK ]  $Message" -ForegroundColor Green
}

function Show-Warning {
    param(
        [string]$Message
    )

    Write-Host "[WARN]  $Message" -ForegroundColor Yellow
}

function Show-Error {
    param(
        [string]$Message
    )

    Write-Host "[FAIL]  $Message" -ForegroundColor Red
}
