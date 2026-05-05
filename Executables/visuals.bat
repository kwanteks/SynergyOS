@echo off
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v MaxAnimate /t REG_SZ /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableFirstLogonAnimation /t REG_DWORD /d 0 /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarBadges /t REG_DWORD /d 0 /f

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoLowDiskSpaceChecks" /t REG_DWORD /d "1" /f

reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{f874310e-b6b7-47dc-bc84-b9e6b38f5903}" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 1 /f

reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v JPEGImportQuality /t REG_DWORD /d 100 /f



reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v MouseSensitivity /t REG_SZ /d 10 /f
reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 0 /f
reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 0 /f
reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 0 /f
reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v MouseHoverTime /t REG_SZ /d 100 /f
reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v MouseTrails /t REG_SZ /d 0 /f
reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v MouseDelay /t REG_SZ /d 0 /f
reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v MouseAccel /t REG_SZ /d 0 /f
reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v DoubleClickSpeed /t REG_SZ /d 200 /f
reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v SwapMouseButtons /t REG_SZ /d 0 /f
reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v RawInput /t REG_SZ /d 1 /f
reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v SnapToDefaultButton /t REG_SZ /d 0 /f
reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v ActiveWindowTracking /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v Beep /t REG_SZ /d "No" /f
reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v ExtendedSounds /t REG_SZ /d "No" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed" /v CursorUpdateInterval /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mouhid\Parameters" /v TreatAbsolutePointerAsAbsolute /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mouhid\Parameters" /v TreatAbsoluteAsRelative /t REG_DWORD /d 0 /f
:: questionable212122
reg add "HKCU\Control Panel\Mouse" /v "RawMouseThrottleDuration" /t REG_DWORD /d "20" /f
reg add "HKCU\Control Panel\Mouse" /v "RawMouseThrottleEnabled" /t REG_DWORD /d "1" /f
reg add "HKCU\Control Panel\Mouse" /v "RawMouseThrottleLeeway" /t REG_DWORD /d "0" /f
reg add "HKCU\Control Panel\Mouse" /v "RawMouseThrottleForced" /t REG_DWORD /d "1" /f

