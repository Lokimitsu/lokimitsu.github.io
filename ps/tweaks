function Ensure-Key {
    param(
        [Parameter(Mandatory=$true)][string]$Path
    )
    if (-not (Test-Path -LiteralPath $Path)) {
        New-Item -Path $Path -Force | Out-Null
    }
}

function Apply-Tweaks {

    Ensure-Key -Path 'HKCU\Control Panel\Desktop'
    Ensure-Key -Path 'HKCU\Control Panel\Desktop'
    New-ItemProperty -LiteralPath 'HKCU\Control Panel\Desktop' -Name 'MenuShowDelay' -Value "1" -PropertyType String -Force | Out-Null
    Ensure-Key -Path 'HKCU\Control Panel\Desktop'
    Ensure-Key -Path 'HKCU\Control Panel\Desktop'
    New-ItemProperty -LiteralPath 'HKCU\Control Panel\Desktop' -Name 'DragHeight' -Value "30" -PropertyType String -Force | Out-Null
    Ensure-Key -Path 'HKCU\Control Panel\Desktop'
    New-ItemProperty -LiteralPath 'HKCU\Control Panel\Desktop' -Name 'DragWidth' -Value "30" -PropertyType String -Force | Out-Null
    Ensure-Key -Path 'HKCU\Control Panel\Desktop'
    Ensure-Key -Path 'HKCU\Control Panel\Desktop'
    New-ItemProperty -LiteralPath 'HKCU\Control Panel\Desktop' -Name 'DragFromMaximize' -Value 0 -PropertyType DWord -Force | Out-Null
    Ensure-Key -Path 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System'
    Ensure-Key -Path 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System'
    New-ItemProperty -LiteralPath 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'VerboseStatus' -Value 1 -PropertyType DWord -Force | Out-Null
    Ensure-Key -Path 'HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize'
    Ensure-Key -Path 'HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize'
    New-ItemProperty -LiteralPath 'HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize' -Name 'StartupDelayInMSec' -Value 1 -PropertyType DWord -Force | Out-Null
    Ensure-Key -Path 'HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize'
    New-ItemProperty -LiteralPath 'HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize' -Name 'WaitForIdleState' -Value 0 -PropertyType DWord -Force | Out-Null
}
