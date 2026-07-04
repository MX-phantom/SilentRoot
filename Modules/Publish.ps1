function Push {
	
	param (
		[Parameter(Mandatory)]
		[string]$Message
	)

	git commit -m $Message

	if ($LASTEXITCODE -ne 0){
		Show-Error "Commit failed."
		return
	}

	git push

	if ($LASTEXITCODE -ne 0){
		Show-Success "Change published."
	}

	else {
		Show-Error "Push failed"
	}

}
