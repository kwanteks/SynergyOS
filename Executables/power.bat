@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
for %%i in (
  EnhancedPowerManagementEnabled
  AllowIdleIrpInD3
  EnableSelectiveSuspend 
  DeviceSelectiveSuspended
  SelectiveSuspendEnabled 
  SelectiveSuspendOn 
  EnumerationRetryCount 
  ExtPropDescSemaphore 
  WaitWakeEnabled
  D3ColdSupported 
  WdfDirectedPowerTransitionEnable 
  EnableIdlePowerManagement 
  IdleInWorkingState) do for /f %%a in ('Reg query "HKLM\SYSTEM\CurrentControlSet\Enum" /s /f "%%i"^| findstr "HKEY"') do Reg add "%%a" /v "%%i" /t REG_DWORD /d "0" /f  
powercfg /h off
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EnergyEstimationEnabled" /t REG_DWORD /d "0" /f
powershell -nop -noni -exec bypass -c "Get-WmiObject MSPower_DeviceEnable -Namespace root\wmi | ForEach-Object { $_.enable = $false; $_.psbase.put(); }"
powercfg -import "%WinDir%\sos.pow" 77777777-7777-7777-7777-777777777777
powercfg -setactive 77777777-7777-7777-7777-777777777777
powercfg -delete 381b4222-f694-41f0-9685-ff5bb260df2e
powercfg -delete 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
powercfg -delete a1841308-3541-4fab-bc81-f71556f20b4a

