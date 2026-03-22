param (
	[switch]$Chrome,
	[switch]$Brave,
	[switch]$Firefox
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


# startisback
#Invoke-WebRequest "https://www.startallback.com/download.php" -OutFile "$env:TEMP\\startallback.exe"
#Start-Process "$env:TEMP\\startallback.exe" -ArgumentList "/silent /allusers" -Wait



# 7zip
Invoke-WebRequest "https://www.7-zip.org/a/7z2201-x64.exe" -OutFile "$env:TEMP\\7zip.exe"
Start-Process "$env:TEMP\\7zip.exe" -ArgumentList "/S" -Wait

# vcredist
Invoke-WebRequest "https://aka.ms/vs/17/release/vc_redist.x64.exe" -OutFile "$env:TEMP\\vcredist.exe"
Start-Process "$env:TEMP\\vcredist.exe" -ArgumentList "/quiet /norestart" -Waits

