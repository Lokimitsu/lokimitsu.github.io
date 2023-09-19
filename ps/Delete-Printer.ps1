Import-Module PrintManagement

ForEach ($Drucker in Get-Printer) 
{
    Write-Output $Drucker.Name
}
