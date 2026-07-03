#=======================================
# 🌐 Browser
# ======================================

function B {
	param(
		[string]$Url
	)

	#If don't have an adress !
	if ([string]::IsNullOrWhiteSpace($Url)){
		Start-Process "http://www.google.com"
		return
	}

	#Auto http
	if (
		$Url -notmatch '^[a-zA-Z][a-zA-Z0-9+\-.]*://'
	){
		$Url = "http://$Url"
	}

	Start-Process $Url
}

function S {
	param(
		[Parameter(ValueFromRemainingArguments)]
		[string[]]$Query
	)

	B "http://www.google.com/search?q=$($Query -join '+')"
}

function Gmail {
	B gmail.com
}

function AI {
	B chatgpt.com
}

function GH {
	B github.com
}
