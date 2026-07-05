function Help {
    param(
        [Parameter(Position = 0)]
        [string]$Topic
    )

    $HelpPath = Join-Path $HOME "Documents\PowerShell\HelpData"

    if ([string]::IsNullOrWhiteSpace($Topic)) {
        Get-ChildItem $HelpPath -Filter "*.help.md" |
            Sort-Object Name |
            Select-Object -ExpandProperty BaseName
        return
    }

    $File = Join-Path $HelpPath "$Topic.help.md"

    if (Test-Path $File) {
        Get-Content $File
    }
    else {
        Write-Host "Help topic '$Topic' not found." -ForegroundColor Red
    }
}
