$foldersToRemove = @(
    "CbsTemp",
    "Logs",
    "SoftwareDistribution",
    "System32\LogFiles",
    "System32\LogFiles\WMI,"
    "System32\SleepStudy",
    "System32\sru",
    "System32\WDI\LogFiles",
    "System32\winevt\Logs",
    "SystemTemp",
    "Temp"

    # "WinSxS\Backup"
    # "Panther",
    # "Prefetch"
)

foreach ($folderName in $foldersToRemove) {
    $folderPath = Join-Path $env:SystemRoot $folderName
    if (Test-Path $folderPath) {
        Remove-Item -Path "$folderPath\*" -Force -Recurse | Out-Null
    }
}
