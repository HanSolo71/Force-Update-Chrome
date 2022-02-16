#Find chrome update scheduled task
$ChromeUpdate = Get-ScheduledTask -TaskName "Google*" | Select -Property Taskname -ExpandProperty Taskname

#Update all chrome packages, stop chrome, restart chrome
Foreach ($ChromeUpdatePackage in $ChromeUpdate)
{
$ChromeUpdatePackage
Start-ScheduledTask -Taskname $ChromeUpdatePackage
Stop-Process -Name "Chrome"
Start-Process chrome.exe
}
