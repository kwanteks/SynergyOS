$devices = @(
    "Composite Bus Enumerator",
    "Microsoft RRAS Root Enumerator",
    "Microsoft GS Wavetable Synth"
)
Get-PnpDevice -FriendlyName $devices -ErrorAction Ignore | Disable-PnpDevice -Confirm:$false -ErrorAction Ignore
