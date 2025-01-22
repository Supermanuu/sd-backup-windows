param (
    [Parameter(Position=0,mandatory=$true)]
    [string] $OutputFile
)

$DiskDrives = Get-WmiObject Win32_diskdrive | Select-Object DeviceID,BytesPerSector,Index,Caption,InterfaceType,Size,TotalSectors,SerialNumber | Out-GridView -OutputMode Multiple -Title 'Select Source Drive(s)'

$Bash = "C:\Users\ManuelPascuall\AppData\Local\Programs\Git\bin\bash.exe"

$DiskDrives | ForEach-Object {
    # $BashArgs = '-c', ("export MSYS_NO_PATHCONV=1; dd if='{0}' bs={1} | gzip > '{2}'" -f $_.DeviceID.replace('\','\\'), $_.BytesPerSector, $OutputFile)
    $BashArgs = '-c', ("export MSYS_NO_PATHCONV=1; dd if='{0}' bs={1} | gzip > '{2}'" -f $_.DeviceID.replace('\','\\'), '1M', $OutputFile)
    Write-Output "Executing $Bash $BashArgs"
    & $Bash $BashArgs
}
