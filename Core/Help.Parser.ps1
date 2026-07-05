function Get-HelpMetadata {

    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    # Check file exists
    if (-not (Test-Path $Path)) {
        throw "Help file not found: $Path"
    }

    # Read file
    $Lines = Get-Content `
        -Path $Path `
        -Encoding UTF8

    # Find Front Matter
    $Start = -1
    $End   = -1

    for ($i = 0; $i -lt $Lines.Count; $i++) {

        if ($Lines[$i] -eq '---') {

            if ($Start -eq -1) {
                $Start = $i
            }
            else {
                $End = $i
                break
            }

        }

    }

    # Validate Front Matter
    if ($Start -eq -1 -or $End -eq -1) {
        throw "Invalid help file. Front Matter not found."
    }

    # Extract Metadata
    $MetadataLines = $Lines[($Start + 1)..($End - 1)]

    # Build Hashtable
    $Metadata = @{}

    foreach ($Line in $MetadataLines) {

        if ([string]::IsNullOrWhiteSpace($Line)) {
            continue
        }

        if ($Line -notmatch ':') {
            continue
        }

        $Key, $Value = $Line -split ':', 2

        $Key = $Key.Trim()
        $Value = $Value.Trim()

        # Convert comma-separated values to array
        if ($Value.Contains(',')) {

            $Value = $Value.Split(',') |
                ForEach-Object {
                    $_.Trim()
                }

        }

        $Metadata[$Key] = $Value

    }

    return [PSCustomObject]$Metadata

}
