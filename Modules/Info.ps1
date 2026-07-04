function Get-SilentRootInfo {
	$Version = Get-SilentRootversion

	Write-Host ""
	Write-Host "SilentRoot" -ForegroundColor Cyan
	Write-Host "----------"

	Write-Host "Version    : $Version"
	Write-Host "PowerShell : $($PSVersionTable.PSVersion)"
	Write-Host "Profile    : $PROFILE "
	Write-Host "Repository : $PSScriptRoot\.."

	Write-Host ""
}
