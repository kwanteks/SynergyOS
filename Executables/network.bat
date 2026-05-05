@echo off
SETLOCAL EnableDelayedExpansion
netsh int ip reset >nul 2>&1
netsh interface ipv4 reset >nul 2>&1
netsh interface ipv6 reset >nul 2>&1
netsh interface tcp reset >nul 2>&1
netsh winsock reset >nul 2>&1
netsh winsock reset catalog >nul 2>&1
ipconfig /release >nul 2>&1
ipconfig /renew >nul 2>&1
ipconfig /flushdns >nul 2>&1

:: disable nagle's algorithm
for /f "tokens=*" %%i in ('powershell -NoProfile -Command "(Get-CimInstance -ClassName Win32_NetworkAdapter | Select-Object -ExpandProperty GUID | Where-Object { $_ -like '*{*' })"') do (
  Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TcpAckFrequency" /t REG_DWORD /d "1" /f
  Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TcpDelAckTicks" /t REG_DWORD /d "0" /f
) 
powershell "Disable-NetAdapterBinding -name "*" -componentid ms_lldp, ms_lltdio, ms_implat, ms_tcpip6, ms_rspndr, ms_server, ms_msclient" 
powershell Set-NetOffloadGlobalSetting -ReceiveSegmentCoalescing Disabled
powershell Set-NetOffloadGlobalSetting -PacketCoalescingFilter Disabled
for /f %%a in ('Reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}" /v "*SpeedDuplex" /s ^| findstr "HKEY"') do (
    Reg add %%a /v "AutoDisableGigabit" /t Reg_SZ /d "0" /f >> log.txt
    Reg add %%a /v "AutoPowerSaveMode" /t Reg_SZ /d "0" /f >> log.txt
    Reg add %%a /v "AdvancedEEE" /t Reg_SZ /d "0" /f >> log.txt
    Reg add %%a /v "AutoPowerSaveModeEnabled" /t Reg_SZ /d "0" /f >> log.txt
    Reg add %%a /v "*EEE" /t Reg_SZ /d "0" /f >> log.txt
    Reg add %%a /v "EnableGreenEthernet" /t Reg_SZ /d "0" /f >> log.txt
    Reg add %%a /v "EnablePME" /t Reg_SZ /d "0" /f >> log.txt
    Reg add %%a /v "GigaLite" /t Reg_SZ /d "0" /f >> log.txt
    Reg add %%a /v "*JumboPacket" /t Reg_SZ /d "0" /f >> log.txt  
    Reg add %%a /v "*LsoV2IPv4" /t Reg_SZ /d "0" /f >> log.txt
    Reg add %%a /v "*LsoV2IPv6" /t Reg_SZ /d "0" /f >> log.txt
    Reg add %%a /v "PowerSavingMode" /t Reg_SZ /d "0" /f >> log.txt  
    Reg add %%a /v "PowerDownPll" /t Reg_SZ /d "0" /f >> log.txt 
    Reg add %%a /v "*PMARPOffload" /t Reg_SZ /d "0" /f >> log.txt
    Reg add %%a /v "ULPMode" /t Reg_SZ /d "0" /f >> log.txt
    Reg add %%a /v "*WakeOnMagicPacket" /t Reg_SZ /d "0" /f >> log.txt
    Reg add %%a /v "*WakeOnPattern" /t Reg_SZ /d "0" /f >> log.txt
    Reg add %%a /v "PnPCapabilities" /t REG_DWORD /d "24" /f >> log.txt
)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters" /v "DefaultPnPCapabilities" /t REG_DWORD /d "24" /f
netsh int tcp set global timestamps=disabled
