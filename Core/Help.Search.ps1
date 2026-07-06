#=======================================
# Help Search
#=======================================

function Find-HelpTopic {

    [CmdletBinding()]
    param(

        [Parameter(Mandatory)]
        [string]$Query

    )

    # Load Help Index
    $Index = Get-HelpIndex

    # Normalize Query
    $Query = $Query.Trim().ToLower()

    #==================================================
    # Exact Title Match
    #==================================================

    $Result = $Index | Where-Object {

        $_.Title.ToLower() -eq $Query

    }

    if ($Result) {
        return $Result
    }

    #==================================================
    # Exact Alias Match
    #==================================================

    $Result = $Index | Where-Object {

        foreach ($Alias in $_.Aliases) {

            if ($Alias.ToLower() -eq $Query) {
                return $true
            }

        }

        return $false

    }

    if ($Result) {
        return $Result
    }

    #==================================================
    # StartsWith Title Match
    #==================================================

    $Result = $Index | Where-Object {

        $_.Title.ToLower().StartsWith($Query)

    }

    if ($Result) {
        return $Result
    }

    #==================================================
    # StartsWith Alias Match
    #==================================================

    $Result = $Index | Where-Object {

        foreach ($Alias in $_.Aliases) {

            if ($Alias.ToLower().StartsWith($Query)) {
                return $true
            }

        }

        return $false

    }

    if ($Result) {
        return $Result
    }

    return $null

}
