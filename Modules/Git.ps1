function Stage {
	git status
	git add .
	Show-Success "Changes staged."
}

function Commit {
	
	Param(
		[Parameter(Madantory)]
		[sting]$Message
	)

	git commit -m $Message

	if ($LASTEXITCODE -eq 0){
		Show-Success "Commit created."
	}
	else {
		Show-Error "Commit failed."
	}
}
