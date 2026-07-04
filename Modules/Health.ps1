function Test-SilentRoot {
	$Root = Join-Path $PSScriptRoot ".."

	$Items = @(
		"VERSION"
		"Microsoft.PowerShell_profile.ps1"
		"Core"
		"Modules"
		"Docs"
	)

	foreach ($Item in $Items){
		$Path = Join-Path $Root $Item
		
		if (Test-Path $Path){
			Show-Success $Item
		}
		else {
			Show-Error "$Item is missing."
		}
	}
}
