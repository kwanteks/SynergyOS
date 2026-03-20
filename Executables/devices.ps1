$devices = @(
    "WAN Miniport (IKEv2)",
    "WAN Miniport (IP)",
    "WAN Miniport (IPv6)",
    "WAN Miniport (L2TP)",
    "WAN Miniport (Network Monitor)",
    "WAN Miniport (PPPOE)",
    "WAN Miniport (PPTP)",
    "WAN Miniport (SSTP)",
    "Composite Bus Enumerator",
    "NDIS Virtual Network Adapter Enumerator",
    "Microsoft GS Wavetable Synth",
    "Microsoft Virtual Drive Enumerato"
)
Get-PnpDevice -FriendlyName $devices -ErrorAction Ignore | Disable-PnpDevice -Confirm:$false -ErrorAction Ignore
