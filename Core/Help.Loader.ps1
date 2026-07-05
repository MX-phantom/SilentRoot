function Get-HelpTopic {

    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    Get-HelpMetadata -Path $Path

}
