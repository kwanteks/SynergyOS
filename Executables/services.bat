@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

for %%a in (
  AxInstSV
  tzautoupdates
  bthserv
  BthAvctpSvc
  BluetoothUserService
  BcastDVRUserService_389fd
  DoSvc
  NaturalAuthentication
  MapsBroker
  DiagTrack
  lfsvc
  dmwappushservice
  SharedAccess
  lltdsvc
  CDPUserSvc
  NetTcpPortSharing
  CscService
  QWAVE
  RemoteAccess
  SensorDataService 
  SensrSvc
  SensorService
  ShellHWDetection
  ScDeviceEnum
  SSDPSRV
  WiaRpc
  upnphost
  UserDataSvc
  UevAgentService
  Fax
  FrameServer
  FrameServerMonitor
  stisvc
  WerSvc
  WpnService
  WpnUserService
  Spooler
  PrintWorkflowUserSv
  PrintNotify
  wisvc
  icssvc
  GpuEnergyDrv    
) do (
  Reg add "HKLM\SYSTEM\CurrentControlSet\Services\%%a" /v "Start" /t REG_DWORD /d "4" /f
) 