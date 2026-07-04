function Test-PowerShell {

    if ($PSVersionTable.PSVersion.Major -lt 7) {
        Show-Error "PowerShell 7 is required."
        return $false
    }

    Show-Success "PowerShell $($PSVersionTable.PSVersion) detected."

    return $true
}

function Test-Winget {

    if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
        Show-Error "Winget is not installed."
        return $false
    }

    Show-Success "Winget detected."

    return $true
}

function Test-Git {

    if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
        Show-Error "Git is not installed."
        return $false
    }

    Show-Success "Git detected."

    return $true
}
