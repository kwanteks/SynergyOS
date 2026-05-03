param (
	[switch]$Chrome,
	[switch]$Brave,
	[switch]$Firefox,
	[switch]$Helium
)


if ($Brave) {
curl.exe -LSs "https://laptop-updates.brave.com/latest/winx64" -o "$env:TEMP\\brave.exe"
Start-Process -FilePath "$env:TEMP\\brave.exe" -ArgumentList '/silent /install' -WindowStyle Hidden -Wait
}

if ($Chrome) {
curl.exe -LSs "https://dl.google.com/dl/chrome/install/googlechromestandaloneenterprise64.msi" -o "$env:TEMP\\chrome.msi"
Start-Process -FilePath "$env:TEMP\\chrome.msi" -ArgumentList '/qn' -WindowStyle Hidden -Wait
}

if ($Firefox) {
curl.exe -LSs "https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=en-US" -o "$env:TEMP\\firefox.exe"
Start-Process -FilePath "$env:TEMP\\firefox.exe" -ArgumentList '/S /ALLUSERS=1' -WindowStyle Hidden -Wait
}

if ($Helium) {
	curl.exe -LSs "https://github.com/imputnet/helium-windows/releases/download/0.11.7.1/helium_0.11.7.1_x64-installer.exe" -o "$env:TEMP\\helium_0.11.7.1_x64-installer.exe"
	Start-Process -FilePath "$env:TEMP\\helium_0.11.7.1_x64-installer.exe" -ArgumentList '/S' -WindowStyle Hidden -Wait
}

if(Librewolf) {
	curl.exe -LSs "https://dl.librewolf.net/librewolf/150.0.1-1/librewolf-150.0.1-1-windows-x86_64-setup.exe" -o "$env:TEMP\\librewolf-150.0.1-1-windows-x86_64-setup.exe"
	Start-Process -FilePath "$env:TEMP\\librewolf-150.0.1-1-windows-x86_64-setup.exe" -ArgumentList '/S' -WindowStyle Hidden -Wait
}



# startisback
#Invoke-WebRequest "https://www.startallback.com/download.php" -OutFile "$env:TEMP\\startallback.exe"
#Start-Process "$env:TEMP\\startallback.exe" -ArgumentList "/silent /allusers" -Wait



# 7zip
Invoke-WebRequest "https://www.7-zip.org/a/7z2201-x64.exe" -OutFile "$env:TEMP\\7zip.exe"
Start-Process "$env:TEMP\\7zip.exe" -ArgumentList "/S" -Wait

# vcredist
Invoke-WebRequest "https://aka.ms/vs/17/release/vc_redist.x64.exe" -OutFile "$env:TEMP\\vcredist.exe"
Start-Process "$env:TEMP\\vcredist.exe" -ArgumentList "/quiet /norestart" -Wait

