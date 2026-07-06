#=======================================
# Help Loader
#=======================================

function Load-HelpIndex {

    [CmdletBinding()]
    param()

    $IndexPath = $script:HelpIndexPath

    if (-not (Test-Path $IndexPath)) {

        throw @"
Help index not found.

Run:

    New-HelpIndex

to generate a new index.
"@

    }

    $Index = Get-Content `
        -Path $IndexPath `
        -Raw `
        -Encoding UTF8 |
        ConvertFrom-Json


    # Cache
    $script:HelpIndexCache = $Index

    return $script:HelpIndexCache

}

function Get-HelpIndex {

    [CmdletBinding()]
    param()

    if ($null -eq $script:HelpIndexCache) {

        Load-HelpIndex | Out-Null

    }

    return $script:HelpIndexCache

}

#function Get-HelpTopic {
#
#    [CmdletBinding()]
#    param(
#        [Parameter(Mandatory)]
#        [string]$Path
#    )
#
#    Get-HelpMetadata -Path $Path
#
#}
