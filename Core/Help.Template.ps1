function New-HelpTopic {

    [CmdletBinding(
        SupportsShouldProcess = $true,
        ConfirmImpact = 'Medium'
    )]
    param(

        [Parameter(Mandatory)]
        [string]$Title,

        [string]$Category = "General",

        [string]$Icon = "📄",

        [string]$Author = "Mr Max",

        [string]$Version = "0.1.0",

        [switch]$Open,

        [switch]$Force

    )

    # --------------------------------------------------
    # Paths
    # --------------------------------------------------

    $HelpPath = Join-Path `
        $HOME `
        "Documents\PowerShell\HelpData"

    $Template = Join-Path `
        $HelpPath `
        "Template.help.md"

    $Destination = Join-Path `
        $HelpPath `
        "$Title.help.md"

    # --------------------------------------------------
    # Check template
    # --------------------------------------------------

    if (-not (Test-Path $Template)) {
        throw "Template.help.md not found."
    }

    # --------------------------------------------------
    # File exists
    # --------------------------------------------------

    if (Test-Path $Destination) {

        if (-not $Force) {

            Write-Warning ""

            Write-Host "Help topic '$Title' already exists." `
                -ForegroundColor Yellow

            Write-Host ""

            Write-Host "Use -Force to overwrite." `
                -ForegroundColor DarkYellow

            return

        }

    }

    # --------------------------------------------------
    # Read template
    # --------------------------------------------------

    $Content = Get-Content `
        $Template `
        -Raw

    # --------------------------------------------------
    # Replace placeholders
    # --------------------------------------------------

    $Content = $Content.Replace(
        "{{Title}}",
        $Title
    )

    $Content = $Content.Replace(
        "{{Category}}",
        $Category
    )

    $Content = $Content.Replace(
        "{{Version}}",
        $Version
    )

    $Content = $Content.Replace(
        "{{Author}}",
        $Author
    )

    $Content = $Content.Replace(
        "{{Created}}",
        (Get-Date).ToString("yyyy-MM-dd")
    )

    $Content = $Content.Replace(
        "{{Icon}}",
        $Icon
    )

    # --------------------------------------------------
    # Write file
    # --------------------------------------------------

    if ($PSCmdlet.ShouldProcess($Destination,"Create Help Topic")) {

        Set-Content `
            -Path $Destination `
            -Value $Content `
            -Encoding UTF8

    }

    # --------------------------------------------------
    # Update Index
    # --------------------------------------------------

    if (Get-Command New-HelpIndex -ErrorAction SilentlyContinue) {

        New-HelpIndex | Out-Null

    }

    # --------------------------------------------------
    # Success
    # --------------------------------------------------

    Write-Host ""

    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" `
        -ForegroundColor Cyan

    Write-Host " Help Topic Created" `
        -ForegroundColor Cyan

    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" `
        -ForegroundColor Cyan

    Write-Host ""

    Write-Host " Title :" `
        -NoNewline

    Write-Host " $Title"

    Write-Host " File  :" `
        -NoNewline

    Write-Host " $Destination"

    Write-Host ""

    # --------------------------------------------------
    # Open file
    # --------------------------------------------------

    if ($Open) {

        if (Get-Command nvim -ErrorAction SilentlyContinue) {

            nvim $Destination

        }
        elseif (Get-Command code -ErrorAction SilentlyContinue) {

            code $Destination

        }
        else {

            Invoke-Item $Destination

        }

    }

}
