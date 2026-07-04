function Find-InProject {

    [CmdletBinding()]
    param(
        [Parameter(Mandatory, Position = 0)]
        [string]$Text,

        [switch]$Regex,

        [switch]$List,

        [switch]$Count,

        [switch]$CaseSensitive
    )

    $Root = Get-ProjectRoot

    $Files = Get-ChildItem $Root -Recurse -File |
    Where-Object {
        $_.FullName -notmatch '\\.git\\'
    }

    $SearchParams = @{
        Pattern       = $Text
        CaseSensitive = $CaseSensitive
    }

    if (-not $Regex) {
        $SearchParams.SimpleMatch = $true
    }

    $Results = $Files | Select-String @SearchParams

    if (-not $Results) {
        Show-Warning "No matches found."
        return
    }

    $FileCount  = ($Results.Path | Select-Object -Unique).Count
    $MatchCount = $Results.Count

    if ($Count) {

        Write-Host ""
        Show-Info "Search Summary"
        Write-Host "Pattern : $Text"
        Write-Host "Files   : $FileCount"
        Write-Host "Matches : $MatchCount"
        Write-Host ""

        return
    }

    if ($List) {

        Write-Host ""
        Show-Info "Matching Files"
        Write-Host ""

        $Results |
        Select-Object -ExpandProperty Path -Unique |
        ForEach-Object {

            $Relative = Resolve-Path $_ -Relative

            Write-Host "📄 $Relative" -ForegroundColor Cyan

        }

        Write-Host ""
        Show-Info "$FileCount file(s)."

        return
    }

    Write-Host ""
    Show-Info "Search Summary"

    Write-Host "Pattern : $Text"
    Write-Host "Files   : $FileCount"
    Write-Host "Matches : $MatchCount"

    Write-Host ""

    $Results |
    Group-Object Path |
    ForEach-Object {

        $Relative = Resolve-Path $_.Name -Relative

        Write-Host "📄 $Relative" -ForegroundColor Cyan
        Write-Host ("─" * 70) -ForegroundColor DarkGray

        foreach ($Match in $_.Group) {

            $Number = "{0,4}" -f $Match.LineNumber

            Write-Host "$Number │ " -ForegroundColor Yellow -NoNewline
            Write-Host $Match.Line

        }

        Write-Host ""

    }

    Write-Host ("─" * 70) -ForegroundColor DarkGray
    Show-Success "Search completed."

}
