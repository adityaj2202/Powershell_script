$processes = Get-Process |
    Select-Object Name, Id, CPU |
    Sort-Object -Descending CPU

Write-Host "Running Processes and CPU Usage:"
Write-Host "---------------------------------"

foreach ($process in $processes) {
    $name = $process.Name
    $id = $process.Id
    $cpuUsage = "{0:N2}%" -f $process.CPU
    Write-Host "$name (ID: $id) - CPU Usage: $cpuUsage"
}
