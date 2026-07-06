#=======================================
# Configuration
#=======================================

# Root PowerShell directory
$script:PowerShellRoot = Join-Path `
    $HOME `
    "Documents\PowerShell"

# Help system
$script:HelpDataPath = Join-Path `
    $script:PowerShellRoot `
    "HelpData"

$script:HelpIndexPath = Join-Path `
    $script:HelpDataPath `
    "Index.json"

$script:HelpTemplatePath = Join-Path `
    $script:HelpDataPath `
    "Template.help.md"


function Get-SilentRootConfig {

    $configPath = Join-Path (Get-ProjectRoot) "Config\config.json"

    if (-not (Test-Path $configPath)) {
        Show-Error "Config file not found."
        return $null
    }

    Get-Content $configPath -Raw | ConvertFrom-Json
}
