function Get-SilentRootVersion {

    $VersionFile = Join-Path $PSScriptRoot "..\VERSION"

    if (Test-Path $VersionFile) {
        Get-Content $VersionFile
    }
    else {
        Show-Error "VERSION file not found."
    }
}
