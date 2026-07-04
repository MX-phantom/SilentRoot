function Stage {
	git status
	git add .
	Show-Success "Changes staged."
}

function Commit {
	
	Param(
		[Parameter(Mandatory)]
		[string]$Message
	)

	git commit -m $Message

	if ($LASTEXITCODE -eq 0){
		Show-Success "Commit created."
	}
	else {
		Show-Error "Commit failed."
	}
}

function Push {

    git push

    if ($LASTEXITCODE -eq 0) {
        Show-Success "Changes published."
    }
    else {
        Show-Error "Push failed."
    }

}
