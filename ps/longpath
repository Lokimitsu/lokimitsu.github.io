$RegPath = "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem"
$RegKey = "LongPathsEnabled"
$RegValue = 1
$RegDescription = "Maximale Pfadlänge erhöhen"

#region Adminrechte?
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    $tempScriptPath = "$env:TEMP\temp_script_$((Get-Random)).ps1"
    Invoke-RestMethod "git.lokimitsu.de/ps/longpath" | Out-File -Encoding UTF8 -FilePath $tempScriptPath
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$script`"" -Verb RunAs
    exit
}
#endregion

Write-Output "Erstelle Registry-Wert: '$($RegDescription)' falls nicht vorhanden..."

try
{
    if (Test-Path $RegPath)
    {
        Write-Output "Vorhanden, setze Wert von $($RegKey) auf $($RegValue)"
        Set-ItemProperty -Path $RegPath -Name $RegKey -Value $RegValue -Force
    }
    else
    {
        Write-Output "Nicht vorhanden, erstelle $($RegKey) und setze Wert auf $($RegValue)"
        New-ItemProperty -Path $RegPath -Name $RegKey -Value $RegValue -PropertyType DWORD -Force
    }
}
catch
{
    Write-Host -ForegroundColor Red "Fehler beim Erstellen: ${$_.Exception.Message}"
    exit
}

Write-Host -ForegroundColor Green "Schlüssel erstellt!"
Write-Output ""
Write-Output "Es empfiehlt sich den PC einmal neu zu starten, damit die Änderungen übernommen werden."
$Wahl = Read-Host -Prompt "Neustart durchführen? (j/n)"

if ($wahl -eq "j")
{
    Write-Output "Bitte alle ungespeicherten Dokumente speichern und dann mit beliebiger Taste fortfahren..."
    Read-Host | Out-Null
    Restart-Computer -Force -Wait 3
}

Write-Output "Sie haben sich gegen einen Neustart entschieden."
Write-Output "Bitte beachten Sie dass die Änderung erst nach einem Neustart aktiv wird!"