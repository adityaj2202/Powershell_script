# Check if files exist in the current directory based on the passed file names
foreach ($fileName in $args) {
    if (Test-Path -Path ".\$fileName") {
        Write-Host "$fileName exists in the current directory."
    }
    else {
        Write-Host "$fileName does not exist in the current directory."
    }
}
