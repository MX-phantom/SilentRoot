########################
#Ask from GPT
########################
########################
#Global Functin

function Show-AskHelp {

    Write-Host ""
    Write-Host "❌ Please enter a question."
    Write-Host ""
    Write-Host "Usage:"
    Write-Host "  ask <question>"
    Write-Host ""
    Write-Host "Example:"
    Write-Host "  ask How to create a PowerShell function?"
    Write-Host ""
}

########################


#PWA Mood

function ask {
	param(
		[parameter(ValueFromRemainingArguments)]
		[string[]]$Question
	)

	$Prompt = $Question -join " "

	if ([string]::IsNullOrWhiteSpace($Prompt)){
		 AskHelp
	}
	else {
		& $AHK "$AHKScripts\ChatGPT.ahk" $Prompt
	}
}


#Hidden Mood

function askh {
	param(
		[parameter(ValueFromRemainingArguments)]
		[string[]]$Question
	)

	$Prompt = $Question -join " "

	if ([string]::IsNullOrWhiteSpace($Prompt)){
		AskHelp
	}
	else {
		$Encoded = [uri]::EscapeDataString($Prompt)
		$Url = "https://chatgpt.com/?q=$Encoded"
		Start-Process $Url
	}
}
