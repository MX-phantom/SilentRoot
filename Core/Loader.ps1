# ==========================================
# SilentRoot Loader
# ==========================================

$CorePath = Join-Path $PSScriptRoot "*.ps1"

Get-ChildItem $CorePath |
Where-Object { $_.Name -ne "Loader.ps1" } |
Sort-Object Name |
ForEach-Object {
    . $_.FullName
}

$ModulesPath = Join-Path $PSScriptRoot "..\Modules\*.ps1"

Get-ChildItem $ModulesPath |
Sort-Object Name |
ForEach-Object {
    . $_.FullName
}
