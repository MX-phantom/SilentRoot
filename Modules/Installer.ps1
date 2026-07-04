function Install-SilentRoot {

    $Installer = Join-Path (Get-ProjectRoot) "Install.ps1"

    & $Installer

}
