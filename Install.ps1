# ==========================================
# SilentRoot Installer
# ==========================================

Clear-Host

Write-Host ""
Write-Host "===================================" -ForegroundColor Cyan
Write-Host "        SilentRoot Installer"
Write-Host "===================================" -ForegroundColor Cyan
Write-Host ""

$ProfilePath = $PROFILE.CurrentUserCurrentHost
$ProfileFolder = Split-Path $ProfilePath

if (!(Test-Path $ProfileFolder)) {
    New-Item -ItemType Directory -Path $ProfileFolder -Force | Out-Null
}

Copy-Item ".\Microsoft.PowerShell_profile.ps1" $ProfilePath -Force

Write-Host ""
Write-Host "Profile installed successfully." -ForegroundColor Green
Write-Host ""
