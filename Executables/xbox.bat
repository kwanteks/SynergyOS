@echo off
setLOCAL ENABLEDELAYEDEXPANSION

if "%1"=="disable" set state=disable
if "%1"=="enable" set state=enable


if /i "%state%"=="disable" (
    :: disable xbox services
    for %%z in (
    XblAuthManager
    XblGameSave 
    XboxGipSvc
    XboxNetApiSvc
    DoSvc
) do (
    Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\%%z" /v "Start" /t REG_DWORD /d "4" /f 
)
)

if /i "%state%"=="enable" (
    :: enable xbox services
    for %%z in (
    XblAuthManager
    XblGameSave 
    XboxGipSvc
    XboxNetApiSvc
    DoSvc
) do (
    Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\%%z" /v "Start" /t REG_DWORD /d "2" /f 
)
)