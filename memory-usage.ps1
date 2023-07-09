$memory = Get-Process |
    Select-Object Name, @{Name="Memory (MB)"; Expression={$_.WorkingSet/1MB}} |
    Sort-Object -Descending "Memory (MB)"

Write-Host "Memory Usage:"
Write-Host "--------------"

foreach ($process in $memory) {
    $name = $process.Name
    $memoryUsage = $process."Memory (MB)"
    Write-Host "$name: $memoryUsage MB"
}
