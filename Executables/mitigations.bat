@echo off
SETLOCAL EnableDelayedExpansion
powershell "ForEach($v in (Get-Command -Name \"Set-ProcessMitigation\").Parameters[\"Disable\"].Attributes.ValidValues){Set-ProcessMitigation -SYSTEM -Disable $v.ToString() -ErrorAction SilentlyContinue}" >nul 2>&1
for /f "tokens=3 skip=2" %%a in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MitigationAuditOptions"') do set mitigation_mask=%%a
for /L %%a in (0,1,9) do (
    set "mitigation_mask=!mitigation_mask:%%a=2!"
)
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MitigationOptions" /t REG_BINARY /d "!mitigation_mask!" /f 
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MitigationAuditOptions" /t REG_BINARY /d "!mitigation_mask!" /f 
Reg.exe add "HKEY_LOCAL_MACHINE\Software\Microsoft\FTH" /v Enabled /t REG_DWORD /d 0 /f