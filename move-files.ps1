# Check if source and destination folder arguments are provided
if ($args.Count -lt 2) {
    Write-Host "Please provide source and destination folder paths as arguments."
    Exit
}

# Get the source and destination folder paths from the arguments
$sourceFolder = $args[0]
$destinationFolder = $args[1]

# Check if the source folder exists
if (-not (Test-Path $sourceFolder -PathType Container)) {
    Write-Host "Source folder not found: $sourceFolder"
    Exit
}

# Check if the destination folder exists, if not, create it
if (-not (Test-Path $destinationFolder -PathType Container)) {
    New-Item -ItemType Directory -Path $destinationFolder | Out-Null
    Write-Host "Destination folder created: $destinationFolder"
}

# Get the list of files to move from the source folder
$files = Get-ChildItem -Path $sourceFolder

# Move each file to the destination folder
foreach ($file in $files) {
    $destinationPath = Join-Path -Path $destinationFolder -ChildPath $file.Name
    Move-Item -Path $file.FullName -Destination $destinationPath
    Write-Host "Moved file: $($file.Name)"
}
