@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

for %%a in (
  AxInstSV
  BcastDVRUserService_389fd
  Beep
  BluetoothUserService
  BthAvctpSvc
  bthserv
  CDPUserSvc
  CscService
  DiagTrack
  dmwappushservice
  DoSvc
  Fax
  FrameServer
  FrameServerMonitor
  GpuEnergyDrv
  icssvc
  lfsvc
  lltdsvc
  MapsBroker
  NetBT
  NetTcpPortSharing
  PrintNotify
  PrintWorkflowUserSv
  QWAVE
  RemoteAccess
  ScDeviceEnum
  SensorDataService
  SensorService
  SensrSvc
  SharedAccess
  ShellHWDetection
  Spooler
  SSDPSRV
  stisvc
  SysMain
  tzautoupdates
  UevAgentService
  upnphost
  UserDataSvc
  WerSvc
  WiaRpc
  wisvc
) do (
  Reg add "HKLM\SYSTEM\CurrentControlSet\Services\%%a" /v "Start" /t REG_DWORD /d "4" /f
) 
