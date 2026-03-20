@echo off
taskkill /f /im StartMenuExperienceHost.exe 
cd %systemdrive%\Windows\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy 
takeown /f "StartMenuExperienceHost.exe" 
icacls "%systemdrive%\Windows\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\StartMenuExperienceHost.exe" /grant Administrators:F 
ren StartMenuExperienceHost.exe StartMenuExperienceHost.old 
sc stop wsearch 
taskkill /f /im searchapp.exe 
taskkill /f /im SearchHost.exe 
cd %systemdrive%\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy 
takeown /f "SearchHost.exe" 
icacls "%systemdrive%\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\SearchHost.exe" /grant Administrators:F 
ren SearchHost.exe SearchHost.old 