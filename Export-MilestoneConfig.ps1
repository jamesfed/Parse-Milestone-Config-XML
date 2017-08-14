[xml]$data = Get-Content "C:\ProgramData\Milestone\Milestone Surveillance\configuration.xml"

$data.config.Devices.ChildNodes | Export-Csv C:\temp\devices.csv -NoTypeInformation

$cameras = foreach($device in $data.config.Devices.ChildNodes){
    $device.Cameras.ChildNodes
    $device.Cameras.ChildNodes | Add-Member -MemberType NoteProperty -Name 'Parent Device' -Value $device.DisplayName
}

$cameras | Export-Csv C:\temp\cameras.csv -NoTypeInformation