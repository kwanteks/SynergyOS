@echo off
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WwanSvc" /v "Start" /t REG_DWORD /d "4" /f >nul
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WlanSvc" /v "Start" /t REG_DWORD /d "4" /f >nul 
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\wcncsvc" /v "Start" /t REG_DWORD /d "4" /f >nul
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\lmhosts" /v "Start" /t REG_DWORD /d "4" /f >nul
pause