function Get-SilentRootConfig {

    $configPath = Join-Path (Get-ProjectRoot) "Config\config.json"

    if (-not (Test-Path $configPath)) {
        Show-Error "Config file not found."
        return $null
    }

    Get-Content $configPath -Raw | ConvertFrom-Json
}
