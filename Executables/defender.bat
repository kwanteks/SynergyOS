@echo off
:: disable defender

PowerShell -Command "Get-AppxPackage -AllUsers '*SecHealthUI*' | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage -AllUsers 'Microsoft.Windows.Apprep.ChxApp*' | Remove-AppxPackage"
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\wdboot" /v "Start" /t REG_DWORD /d 4 /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\wdfilter" /v "Start" /t REG_DWORD /d 4 /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\WinDefend" /v "Start" /t REG_DWORD /d 4 /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d 4 /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\wdnisdrv" /v "Start" /t REG_DWORD /d 4 /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\mssecflt" /v "Start" /t REG_DWORD /d 4 /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\WdNisSvc" /v "Start" /t REG_DWORD /d 4 /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Sense" /v "Start" /t REG_DWORD /d 4 /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\wscsvc" /v "Start" /t REG_DWORD /d 4 /f

Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d 1 /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableRoutinelyTakingAction" /t REG_DWORD /d 1 /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "ServiceKeepAlive" /t REG_DWORD /d 0 /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableBehaviorMonitoring" /t REG_DWORD /d 1 /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableIOAVProtection" /t REG_DWORD /d 1 /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d 1 /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d 1 /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableScanOnRealtimeEnable" /t REG_DWORD /d 1 /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Reporting" /v "DisableEnhancedNotifications" /t REG_DWORD /d 1 /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Notifications" /v "DisableNotifications" /t REG_DWORD /d 1 /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Microsoft Antimalware\Real-Time Protection" /v "DisableScanOnRealtimeEnable" /t REG_DWORD /d 1 /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Microsoft Antimalware\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d 1 /f
Reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d 0 /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WTDS\Components" /v "ServiceEnabled" /t REG_DWORD /d 0 /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "Off" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "SecurityHealth" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "WindowsDefender" /f
