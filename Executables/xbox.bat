@echo off
for %%z in (
  XblAuthManager
  XblGameSave
  XboxGipSvc
  XboxNetApiSvc
) do (
  Reg add "HKLM\SYSTEM\CurrentControlSet\Services\%%z" /v "Start" /t REG_DWORD /d 4 /f
)
