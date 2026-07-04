function Get-SearchHelp {

    Write-Host ""
    Show-Info "Find-InProject Help"

    Write-Host ""
    Write-Host "USAGE"
    Write-Host "  Find-InProject <text> [options]"
    Write-Host ""

    Write-Host "OPTIONS"

    Write-Host "  -List"
    Write-Host "      Show matching files only."
    Write-Host ""

    Write-Host "  -Count"
    Write-Host "      Show only summary."
    Write-Host ""

    Write-Host "  -Regex"
    Write-Host "      Enable regular expression search."
    Write-Host ""

    Write-Host "  -CaseSensitive"
    Write-Host "      Enable case-sensitive search."
    Write-Host ""

    Write-Host "EXAMPLES"

    Write-Host '  Find-InProject "Show-Success"'
    Write-Host '  Find-InProject "TODO" -List'
    Write-Host '  Find-InProject "TODO" -Count'
    Write-Host '  Find-InProject "Show-(Success|Error)" -Regex'

    Write-Host ""
}
