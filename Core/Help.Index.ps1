function New-HelpIndex {

    [CmdletBinding()]
    param()

    # Paths
    $HelpPath = Join-Path `
        $HOME `
        "Documents\PowerShell\HelpData"

    $IndexPath = Join-Path `
        $HelpPath `
        "Index.json"

    # Statistics
    $Scanned = 0
    $Indexed = 0
    $Skipped = 0

    # Find Help Files
    $Files = Get-ChildItem `
        -Path $HelpPath `
        -Filter "*.help.md" `
        -File

    $Index = foreach ($File in $Files) {

        $Scanned++

        # Read Metadata
        $Metadata = Get-HelpMetadata `
            -Path $File.FullName

        if ($null -eq $Metadata) {

            $Skipped++

            Write-Verbose "Skipped: $($File.Name)"

            continue
        }

        $Indexed++

        # Build Index Entry
        [PSCustomObject]@{

            Title       = $Metadata.Title
            Description = $Metadata.Description
            Category    = $Metadata.Category
            Aliases     = $Metadata.Aliases
            Version     = $Metadata.Version
            Author      = $Metadata.Author

            File        = $File.Name
            Path        = $File.FullName
        }

    }

    # Save Index
    $Index |
        ConvertTo-Json -Depth 5 |
        Set-Content `
            -Path $IndexPath `
            -Encoding UTF8

    # Summary
    Write-Host ""
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkGray
    Write-Host " Help Index Builder" -ForegroundColor Cyan
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkGray

    Write-Host (" Files Scanned : {0}" -f $Scanned)
    Write-Host (" Indexed       : {0}" -f $Indexed) -ForegroundColor Green
    Write-Host (" Skipped       : {0}" -f $Skipped) -ForegroundColor Yellow

    Write-Host ""
    Write-Host " Index saved to:" -ForegroundColor DarkGray
    Write-Host " $IndexPath" -ForegroundColor Gray
    Write-Host ""

    return $Index
}
