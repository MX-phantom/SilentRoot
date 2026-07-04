# ==========================================
# SilentRoot Installer
# ==========================================

if (!(Test-Powershell)){ return }

if (!(Test-Winget)){ return }

if (!(Test-Git)){ return }

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

$SourceProfile = Join-Path $PSScriptRoot "Microsoft.PowerShell_profile.ps1"

$Source = (Resolve-Path $SourceProfile).Path
#$Destination = $ProfilePath
#$Destination = (Resolve-Path $ProfileFolder).Path + "\Microsoft.PowerShell_profile.ps1"
$Destination = [System.IO.Path]::GetFullPath($ProfilePath)

if ($Source -ne $Destination) {

    Copy-Item $Source $Destination -Force
    Show-Success "Profile installed."

}
else {

    Show-Info "Profile already installed."

}

Write-Host ""
Write-Host "Profile installed successfully." -ForegroundColor Green
Write-Host ""
