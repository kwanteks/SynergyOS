@echo off
SETLOCAL ENABLEDELAYEDEXPANSION


:: clear pinned taskbar shortcuts
del /f /q "%AppData%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar*"


:: remove onedrive from file explorer sidebar
Reg add "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /v System.IsPinnedToNameSpaceTree /t REG_DWORD /d 0 /f


:: remove oned and msedge shortcut from startup
Reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "OneDrive" /f
for /f "tokens=1" %%a in ('Reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" ^| findstr /i "MicrosoftEdgeAutoLaunch"') do (
  Reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "%%a" /f
)


:: write cache policy
for /f "tokens=*" %%i in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum\SCSI" ^| findstr "HKEY"') do (
    for /f "tokens=*" %%a in ('reg query "%%i" ^| findstr "HKEY"') do (
        Reg add "%%a\Device Parameters\Disk" /v CacheIsPowerProtected /t REG_DWORD /d 1 /f
        Reg add "%%a\Device Parameters\Disk" /v UserWriteCacheSetting /t REG_DWORD /d 1 /f
    )
)


:: clear taskband registry
Reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /f 

powershell -ExecutionPolicy bypass "Disable-MMAgent -MemoryCompression" 


:: configure boot settings
bcdedit /set description "SynergyOS"
bcdedit /timeout 10
bcdedit /set disabledynamictick yes
bcdedit /set bootmenupolicy Legacy
bcdedit /set {current} nx option
bcdedit /deletevalue useplatformclock
bcdedit /deletevalue useplatformtick

powercfg -h off


:: disable DMA remapping
for /f %%i in ('Reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services" /s /f DmaRemappingCompatible ^| find /i "Services\" ') do (
	Reg add "%%i" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
)

:: configure mmcss
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "10" /f


Reg add "HKCU\Control Panel\Desktop" /v AutoEndTasks /t REG_SZ /d 1 /f
Reg add "HKCU\Control Panel\Desktop" /v HungAppTimeout /t REG_SZ /d 1500 /f
Reg add "HKCU\Control Panel\Desktop" /v WaitToKillTimeout /t REG_SZ /d 2500 /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v WaitToKillServiceTimeout /t REG_SZ /d 2500 /f


:: disable game bar
Reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d "0" /f 
Reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d "0" /f
Reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v "GamePanelStartupTipIndex" /t REG_DWORD /d "3" /f
Reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v "ShowStartupPanel" /t REG_DWORD /d "0" /f 
Reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v "UseNexusForGameBarEnabled" /t REG_DWORD /d "0" /f 
Reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v "value" /t REG_DWORD /d "0" /f 


for /f "tokens=*" %%i in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum\SCSI" ^| findstr "HKEY"') do (
    for /f "tokens=*" %%a in ('reg query "%%i" ^| findstr "HKEY"') do (
        Reg add "%%a\Device Parameters\Disk" /v CacheIsPowerProtected /t REG_DWORD /d 1 /f
        Reg add "%%a\Device Parameters\Disk" /v UserWriteCacheSetting /t REG_DWORD /d 1 /f
    )
)


:: disable NVME and SATA DMA remapping
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\storahci\Parameters" /v DmaRemappingCompatible /t REG_DWORD /d 0 /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v DmaRemappingCompatible /t REG_DWORD /d 0 /f


:: configure NTFS settings
fsutil behavior set disablelastaccess 1 >NUL 2>nul
fsutil behavior set disable8dot3 1 >NUL 2>nul
fsutil behavior set disablecompression 1 >NUL 2>nul
fsutil quota disable C: >NUL 2>nul

setx POWERSHELL_TELEMETRY_OPTOUT 1

Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d 1 /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePageCombining" /t REG_DWORD /d 1 /f

Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "SleepStudyDisabled" /t REG_DWORD /d 1 /f

Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EnergyEstimationEnabled" /t REG_DWORD /d 0 /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HiberbootEnabled" /t REG_DWORD /d 0 /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CoalescingFlushInterval" /t REG_DWORD /d 0 /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d 0 /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MSDisabled" /t REG_DWORD /d 1 /f

:: Disable Mitigations
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d 1 /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d 3 /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d 3 /f

:: Disable VBS
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "Enabled" /t REG_DWORD /d 0 /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d 0 /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\CredentialGuard" /v "Enabled" /t REG_DWORD /d 0 /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\KernelShadowStacks" /v "Enabled" /t REG_DWORD /d 0 /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "RunAsPPL" /t REG_DWORD /d 0 /f

:: Enable Optimizations for Windowed/Borderless Games
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "SwapEffectUpgradeEnable=1;" /f

:: Disable HAGS
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d 1 /f

:: disable gamebarpresencewriter and other apps
takeown /f "%WinDir%\System32\GameBarPresenceWriter.exe" /a  
icacls "%WinDir%\System32\GameBarPresenceWriter.exe" /grant Administrators:(F) 
ren "%WinDir%\System32\GameBarPresenceWriter.exe" "GameBarPresenceWriter32131dada.exe"

takeown /f "%WinDir%\System32\mobsync.exe" /a  
icacls "%WinDir%\System32\mobsync.exe" /grant Administrators:(F) 
ren "%WinDir%\System32\mobsync.exe" "mobsyncold.exe"

:: disable background task logging
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-BackgroundTaskInfrastructure/Diagnostic" /v Enabled /t REG_DWORD /d 0 /f

:: disable search indexing
sc stop wsearch
sc config wsearch start=disabled
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v PreventIndexOnBattery /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Microsoft\Windows Search\Gather\Windows\SystemIndex" /v RespectPowerModes /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Search\Preferences" /v WholeFileSystem /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Search\Preferences" /v SystemFolders /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Search\Preferences" /v EnableNaturalQuerySyntax /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Search\Preferences" /v ArchivedFiles /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Search\PrimaryProperties\UnindexedLocations" /v SearchOnly /t REG_DWORD /d 1 /f


:: Get the version number from the `ver` command
for /f "tokens=3 delims=[]. " %%a in ('ver') do set version=%%a

:: Check if the version is greater than or equal to 10.0.22000 (which is the version for Windows 11)
if %version% geq 22000 (
    set w11=true
) else (
    set w11=false
)
if not defined w11 (
  Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" /v "Model"  /t REG_SZ /d "SOS 10" /f >NUL 2>nul
  Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "RegisteredOrganization" /t REG_SZ /d "SynergyOS 10" /f >NUL 2>nul
) else (
  Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" /v "Model"  /t REG_SZ /d "SOS 11" /f >NUL 2>nul
  Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "RegisteredOrganization" /t REG_SZ /d "SynergyOS 11" /f >NUL 2>nul
)

:: add new batch file to context menu
Reg add "HKEY_LOCAL_MACHINE\Software\Classes\.bat\ShellNew" /v "ItemName" /t REG_EXPAND_SZ /d "@C:\Windows\System32\acppage.dll,-6002" /f 
Reg add "HKEY_LOCAL_MACHINE\Software\Classes\.bat\ShellNew" /v "NullFile" /t REG_SZ /d "" /f 


:: add new reg file to context menu
Reg add "HKEY_LOCAL_MACHINE\Software\Classes\.reg\ShellNew" /v "ItemName" /t REG_EXPAND_SZ /d "@C:\Windows\regedit.exe,-309" /f 
Reg add "HKEY_LOCAL_MACHINE\Software\Classes\.reg\ShellNew" /v "NullFile" /t REG_SZ /d "" /f 

:: register .pow as a file type
Reg add "HKCR\.pow" /v "" /t REG_SZ /d "Power Plan" /f
Reg add "HKCR\.pow" /v "FriendlyTypeName" /t REG_SZ /d "Power Plan" /f
Reg add "HKCR\.pow\DefaultIcon" /v "" /t REG_EXPAND_SZ /d "%SystemRoot%\System32\powercfg.cpl,-202" /f
Reg add "HKCR\.pow\shell\Import\command" /v "" /t REG_SZ /d "powercfg /import \"%1\"" /f
