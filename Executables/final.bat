@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

:: clear pinned taskbar shortcuts
del /f /q "%AppData%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar*"


:: remove onedrive from file explorer sidebar
Reg.exe add "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /v System.IsPinnedToNameSpaceTree /t REG_DWORD /d 0 /f

:: remove oned and msedge shortcut from startup
Reg.exe delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "OneDrive" /f
for /f "tokens=1" %%a in ('Reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" ^| findstr /i "MicrosoftEdgeAutoLaunch"') do (
  Reg.exe delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "%%a" /f
)

:: write cache policy
for /f "tokens=*" %%i in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum\SCSI" ^| findstr "HKEY"') do (
    for /f "tokens=*" %%a in ('reg query "%%i" ^| findstr "HKEY"') do (
        reg.exe add "%%a\Device Parameters\Disk" /v CacheIsPowerProtected /t REG_DWORD /d 1 /f
        reg.exe add "%%a\Device Parameters\Disk" /v UserWriteCacheSetting /t REG_DWORD /d 1 /f
    )
)


:: clear taskband registry
Reg.exe delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /f 

powershell -ExecutionPolicy bypass "Disable-MMAgent -MemoryCompression" 

:: configfure boot settings
bcdedit /deletevalue useplatformclock
bcdedit /deletevalue useplatformtick
bcdedit /set disabledynamictic yes
bcdedit /set bootmenupolicy Legacy

:: disable DMA remapping
for /f %%i in ('Reg.exe query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services" /s /f DmaRemappingCompatible ^| find /i "Services\" ') do (
	Reg.exe add "%%i" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f
)

:: configure mmcss
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "10" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Latency Sensitive" /t REG_SZ /d "True" /f

Reg.exe add "HKCU\Control Panel\Desktop" /v AutoEndTasks /t REG_SZ /d 1 /f
Reg.exe add "HKCU\Control Panel\Desktop" /v HungAppTimeout /t REG_SZ /d 1500 /f
Reg.exe add "HKCU\Control Panel\Desktop" /v WaitToKillTimeout /t REG_SZ /d 2500 /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control" /v WaitToKillServiceTimeout /t REG_SZ /d 2500 /f


:: disab;e game bar
Reg.exe add "HKCU\SOFTWARE\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\GameBar" /v "GamePanelStartupTipIndex" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\GameBar" /v "ShowStartupPanel" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\GameBar" /v "UseNexusForGameBarEnabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v "value" /t REG_DWORD /d "0" /f 



for /f "tokens=*" %%i in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum\SCSI" ^| findstr "HKEY"') do (
    for /f "tokens=*" %%a in ('reg query "%%i" ^| findstr "HKEY"') do (
        Reg.exe add "%%a\Device Parameters\Disk" /v CacheIsPowerProtected /t REG_DWORD /d 1 /f
        Reg.exe add "%%a\Device Parameters\Disk" /v UserWriteCacheSetting /t REG_DWORD /d 1 /f
    )
)


:: disable NVME and SATA DMA remapping
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\storahci\Parameters" /v DmaRemappingCompatible /t REG_DWORD /d 0 /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v DmaRemappingCompatible /t REG_DWORD /d 0 /f


:: configure NTFS settings
fsutil behavior set disableLastAccess 1 >NUL 2>nul
fsutil behavior set disable8dot3 1 >NUL 2>nul

setx POWERSHELL_TELEMETRY_OPTOUT 1

 
:: disable gamebarpresencewriter and other apps
takeown /f "%WinDir%\System32\GameBarPresenceWriter.exe" /a  
icacls "%WinDir%\System32\GameBarPresenceWriter.exe" /grant Administrators:(F) 
ren "%WinDir%\System32\GameBarPresenceWriter.exe" "GameBarPresenceWriter32131dada.exe"
takeown /f "%WinDir%\System32\mobsync.exe" /a  
icacls "%WinDir%\System32\mobsync.exe" /grant Administrators:(F) 
ren "%WinDir%\System32\mobsync.exe" "mobsyncw31312dadaw.exe"


:: Get the version number from the `ver` command
for /f "tokens=3 delims=[]. " %%a in ('ver') do set version=%%a

:: Check if the version is greater than or equal to 10.0.22000 (which is the version for Windows 11)
if %version% geq 22000 (
    set w11=true
) else (
    set w11=false
)
if not defined w11 (
	bcdedit /set description "SOS" >NUL 2>nul
  Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" /v "Model"  /t REG_SZ /d "SOS 10" /f >NUL 2>nul
  Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "RegisteredOrganization" /t REG_SZ /d "SOS 10" /f >NUL 2>nul
) else (
	bcdedit /set description "SOS" >NUL 2>nul
  Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" /v "Model"  /t REG_SZ /d "SOS 11" /f >NUL 2>nul
  Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "RegisteredOrganization" /t REG_SZ /d "SOS 11" /f >NUL 2>nul
)

:: add new batch file to context menu
Reg.exe add "HKEY_LOCAL_MACHINE\Software\Classes\.bat\ShellNew" /v "ItemName" /t REG_EXPAND_SZ /d "@C:\Windows\System32\acppage.dll,-6002" /f 
Reg.exe add "HKEY_LOCAL_MACHINE\Software\Classes\.bat\ShellNew" /v "NullFile" /t REG_SZ /d "" /f 

:: add  new reg file to context menu
Reg.exe add "HKEY_LOCAL_MACHINE\Software\Classes\.reg\ShellNew" /v "ItemName" /t REG_EXPAND_SZ /d "@C:\Windows\regedit.exe,-309" /f 
Reg.exe add "HKEY_LOCAL_MACHINE\Software\Classes\.reg\ShellNew" /v "NullFile" /t REG_SZ /d "" /f 



