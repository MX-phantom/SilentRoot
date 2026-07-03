function A {
	param(
		[Parameter(ValueFromRemainingArguments)]
		[string[]]$Name
	)

	$AppName = $Name -join " "
	
	$ExactMatch = Get-StartApps |
		Where-Object {$_.Name -eq $AppName} 

	$PartialMatch = Get-StartApps |
		Where-Object {$_.Name -like "*$AppName*"} 

	if ($PartialMatch.Count -eq 0){
		Write-Host "❌ App Not Found : $AppName"
		return
	}

	if ($ExactMatch.Count -eq 1){
		Start-Process "shell:AppsFolder\$($ExactMatch.AppID)"
		return
	}
	
	else {
		Write-Host ""
		Write-Host "Found $($PartialMatch.Count) apps:`n"

		$i = 1
		foreach ($Application in $PartialMatch ) {
			Write-Host "$i. $($Application.Name)"
			$i++
		}

		$Choice = Read-Host "Select"

		if ([string]::IsNullOrWhiteSpace($Choice)){
			Write-Host "🚪 App Launcher cancelled."
			return
		}
		if ($Choice -notmatch "^\d+$"){
			Write-Host "❌ Please enter a number."
			return
		}
		$SelectedApp = $PartialMatch[$Choice - 1]
		if ($null -eq $SelectedApp){
			Write-Host "❌ Invalid selection"
			return
		}
		else {
			Start-Process "shell:AppsFolder\$($SelectedApp.AppID)"
		}
		return
	}
}
