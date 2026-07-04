function Get-SilentRootVersion {

    $VersionFile = Join-Path (Get-ProjectRoot) "VERSION"

    if (Test-Path $VersionFile) {
        Get-Content $VersionFile
    }
    else {
        Show-Error "VERSION file not found."
    }
}
