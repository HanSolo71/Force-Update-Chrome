$ChromeUpdate = @()
$ChromeUpdatePackage = @()
$EdgeUpdate = @()
$EdgeUpdatePackage = @()
$ChromeProcess = @()
$EdgeProcess = @()

#Find chrome update scheduled task
$ChromeUpdate = Get-ScheduledTask -TaskName "Google*" | Select -Property Taskname -ExpandProperty Taskname
$EdgeUpdate = Get-ScheduledTask -TaskName "*edgeupdate*" | Select -Property Taskname -ExpandProperty Taskname


#Update all chrome packages, stop chrome, restart chrome
Foreach ($ChromeUpdatePackage in $ChromeUpdate)
{
#Check if chrome is running
$ChromeProcess = Get-Process "chrome"
#Running chrome update scheduled tasks
$ChromeUpdatePackage
Start-ScheduledTask -Taskname $ChromeUpdatePackage
#Check if chrome is running, if so kill it and restart
if ($ChromeProcess)
{
Stop-Process -Name "Chrome"
Start-Process chrome.exe
Write-Host "Chrome was running"
}
Else 
{
Write-Host "Chrome was not running"
}
}


#Update all edge packages, stop edge, restart edge
Foreach ($EdgeUpdatePackage in $EdgeUpdate)
{
$EdgeProcess = Get-Process "msedge"
$EdgeUpdatePackage
#Check if chrome is running, if so kill it and restart
if ($EdgeProcess)
{
Stop-Process -Name "msedge"
Start-Process msedge.exe
Write-Host "Edge was running"
}
Else 
{
Write-Host "Edge was not running"
}
}
