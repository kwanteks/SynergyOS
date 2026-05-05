$devices = @(
    "Microsoft GS Wavetable Synth",
    "Composite Bus Enumerator",
    "NDIS Virtual Network Adapter Enumerator",
    "Microsoft GS Wavetable Synth"
)
Get-PnpDevice -FriendlyName $devices -ErrorAction Ignore | Disable-PnpDevice -Confirm:$false -ErrorAction Ignore
