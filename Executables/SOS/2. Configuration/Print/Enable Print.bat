@echo off
for %%z in (
    Spooler
    PrintNotify
    Fax
    PrintWorkflowUserSvc
) do (
PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\%%z" /v "Start" /t REG_DWORD /d "2" /f 
) >nul 2>&1
echo Please Restart Your Computer to Apply
pause