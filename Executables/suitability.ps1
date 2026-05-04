Add-Type -AssemblyName System.Windows.Forms -ErrorAction SilentlyContinue

$title      = 'Unsupported Installation'
$msAccMsg   = 'Microsoft user accounts are not supported. Please try again on a local user account.'
$oemMsg     = 'Custom OS/OEM installations are not supported. Please try again on a fresh installation of Windows.'

function Show-Error {
    param([string]$Message)
    Stop-Process -Name 'AME Beta' -Force -ErrorAction SilentlyContinue
    [System.Windows.Forms.MessageBox]::Show(
        $Message, $title,
        [System.Windows.Forms.MessageBoxButtons]::OK,
        [System.Windows.Forms.MessageBoxIcon]::Error
    ) | Out-Null
    $global:LASTEXITCODE = 1
    exit 1
}

if ((Get-LocalUser $env:USERNAME).PrincipalSource -ne 'Local') {
    Show-Error $msAccMsg
}

$oem = Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation' -ErrorAction SilentlyContinue
if ($oem) {
    foreach ($field in @('Manufacturer', 'Model', 'SupportURL')) {
        if (([string]$oem.$field).Trim().Length -gt 0) {
            Show-Error $oemMsg
        }
    }
}

$global:LASTEXITCODE = 0
