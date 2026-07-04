function Get-ProjectRoot {

    return (Resolve-Path (Join-Path $PSScriptRoot "..")).Path

}
