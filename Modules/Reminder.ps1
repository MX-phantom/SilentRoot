$Global:ReminderPath = "$HOME\Documents\MrMaxCLI"

$Global:TasksFile = Join-Path $ReminderPath "Tasks.json"
$Global:DailyFile = Join-Path $ReminderPath "Daily.json"

if (!(Test-Path $ReminderPath)) {
    New-Item -ItemType Directory -Path $ReminderPath | Out-Null
}

if (!(Test-Path $TasksFile)) {
    Set-Content -Path $TasksFile -Value "[]"
}

if (!(Test-Path $DailyFile)) {
    Set-Content -Path $DailyFile -Value "[]"
}
