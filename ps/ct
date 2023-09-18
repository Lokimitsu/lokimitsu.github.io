# Stop Teams process 
Get-Process -ProcessName Teams -ErrorAction SilentlyContinue | Stop-Process -Force 
Start-Sleep -Seconds 3
Write-Host "Microsoft Teams process sucessfully stopped" 

# Clear Teams Cache
try {
    Get-ChildItem -Path $env:APPDATA\"Microsoft\Teams\blob_storage" | Remove-Item -Recurse -ErrorAction SilentlyContinue
    Get-ChildItem -Path $env:APPDATA\"Microsoft\Teams\databases" | Remove-Item -Recurse -ErrorAction SilentlyContinue
    Get-ChildItem -Path $env:APPDATA\"Microsoft\Teams\cache" | Remove-Item -Recurse -ErrorAction SilentlyContinue
    Get-ChildItem -Path $env:APPDATA\"Microsoft\Teams\gpucache" | Remove-Item -Recurse -ErrorAction SilentlyContinue
    Get-ChildItem -Path $env:APPDATA\"Microsoft\Teams\Indexeddb" | Remove-Item -Recurse -ErrorAction SilentlyContinue
    Get-ChildItem -Path $env:APPDATA\"Microsoft\Teams\Local Storage" | Remove-Item -Recurse -ErrorAction SilentlyContinue
    Get-ChildItem -Path $env:APPDATA\"Microsoft\Teams\tmp" | Remove-Item -Recurse -ErrorAction SilentlyContinue
    Write-Host "Teams Cache cleaned" 
}
catch {
    Write-Output $_ 
}

# Remove Credentials from Credential Manager
cmdkey /list | ForEach-Object 
{ 
    if ($_ -like "*Target:*" -and $_ -like "*msteams*") {
        cmdkey /del:($_ -replace " ", "" -replace "Target:", "") 
    } 
}

# Remove Microsoft Teams registry keys
try {
    $Regkeypath = "HKCU:\Software\Microsoft\Office\Teams" 
    $value = $null -eq (Get-ItemProperty $Regkeypath).HomeUserUpn
    If ($value -eq $False) { 
        Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Office\Teams" -Name "HomeUserUpn"
        Write-Host "The registry value was sucessfully removed" 
    } 
}
catch {
    Write-Host "The registry value does not exist" 
}

# Get Desktop-config.json
$TeamsFolders = "$env:APPDATA\Microsoft\Teams"
try {
    $SourceDesktopConfigFile = "$TeamsFolders\desktop-config.json"
    $desktopConfig = (Get-Content -Path $SourceDesktopConfigFile | ConvertFrom-Json)
}
catch { 
    Write-Host "Failed to open Desktop-config.json" 
}

# Overwrite the desktop-config.json
Write-Host "Modify desktop-Config.Json"
try {
    $desktopConfig.isLoggedOut = $true
    $desktopConfig.upnWindowUserUpn = ""; #The email used to sign in
    $desktopConfig.userUpn = "";
    $desktopConfig.userOid = "";
    $desktopConfig.userTid = "";
    $desktopConfig.homeTenantId = "";
    $desktopConfig.webAccountId = "";
    $desktopConfig | ConvertTo-Json -Compress | Set-Content -Path $SourceDesktopConfigFile -Force
}
catch { 
    Write-Host "Failed to overwrite desktop-config.json" 
}
Write-Host "Modify desktop-Config.Json - Finished"

# Delete the Cookies file. This is a fix for when the joining as anonymous, and prevents the last used guest name from being reused.
Get-ChildItem "$TeamsFolders\Cookies" | Remove-Item

# Lastly delete the storage.json, this corrects some error that MSTeams otherwise would have when logging in again.
Get-ChildItem "$TeamsFolders\storage.json" | Remove-Item

# Try to remove the Link School/Work account if there was one. It can be created if the first time you sign in, the user all
$LocalPackagesFolder = "$env:LOCALAPPDATA\Packages"
$AADBrokerFolder = Get-ChildItem -Path $LocalPackagesFolder -Recurse -Include "Microsoft.AAD.BrokerPlugin_*";
$AADBrokerFolder = $AADBrokerFolder[0];
Get-ChildItem "$AADBrokerFolder\AC\TokenBroker\Accounts" | Remove-Item -Recurse -Force
