function size {
	param(
		[string]$Path = "."
	)

	$FullPath = Resolve-Path $Path
	$Items = Get-ChildItem $Path -File
	$Size = 0

	foreach ($Item in $Items) {
		$Size = $Size + $Item.Length

	}

	Write-Host "Path : $($FullPath)"
	Write-Host "Files Count : $($Items.Count)"

	if ($Size -ge 1GB){
		Write-Host "Files Size : $([Math]::Round($Size/1GB,2)) GB"
	}
	elseif ($Size -ge 1Mb){
		Write-Host "Files Size : $([Math]::Round($Size/1MB,2)) MB"
	}
	elseif ($Size -ge 1Kb){
		Write-Host "Files Size : $([Math]::Round($Size/1KB,2)) KB"
	}
	else{
		Write-Host "Files Size : $($Size) B"
	}
}
