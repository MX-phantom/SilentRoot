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

    # Find help files
    $Files = Get-ChildItem `
        -Path $HelpPath `
        -Filter "*.help.md" `
        -File

    $Index = foreach ($File in $Files) {

        # Read metadata
        $Metadata = Get-HelpMetadata -Path $File.FullName

        # Build index entry
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

    return $Index

}
