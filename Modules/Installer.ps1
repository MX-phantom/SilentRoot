function Install-SilentRoot {

    $Installer = Join-Path $PSScriptRoot "..\Install.ps1"

    & $Installer

}
