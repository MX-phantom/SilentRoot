#OH MY POSH
oh-my-posh init pwsh --config "$HOME\source\dotfiles\oh-my-posh\theme.json" | Invoke-Expression

#Load Modules
$Modules = "$HOME\Documents\Powershell\Modules"

Get-ChildItem "$Modules\*.ps1" |
Sort-Object Name |
ForEach-Object {
	.$_.FullName
}

. "$PSScriptRoot\Core\Loader.ps1"
