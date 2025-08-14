# Alle shell:-Befehle mit Zielpfad anzeigen
$keys = @(
    'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders',
    'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders'
)

$result = foreach ($key in $keys)
{
    if (Test-Path $key)
    {
        Get-ItemProperty $key | ForEach-Object 
        {
            $_.PSObject.Properties | Where-Object
            {
                $_.Name -ne 'PSPath'
                -and $_.Name -ne 'PSParentPath'
                -and $_.Name -ne 'PSChildName'
                -and $_.Name -ne 'PSDrive'
                -and $_.Name -ne 'PSProvider' 
            }
            | Sort-Object Name | ForEach-Object
            {
                [PSCustomObject]
                @{
                    Shell_Command = "shell:$($_.Name)"
                    Target        = $_.Value
                }
            }
        }
    }
}

$result | Format-Table -AutoSize