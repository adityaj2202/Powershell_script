# Check if the folder path argument is provided
if ($args.Count -lt 1) {
    Write-Host "Please provide the folder path as an argument."
    Exit
}

# Get the folder path from the first argument
$folderPath = $args[0]

# Check if the folder exists
if (-not (Test-Path $folderPath -PathType Container)) {
    Write-Host "Folder not found: $folderPath"
    Exit
}

# Get the list of files in the folder
$files = Get-ChildItem -Path $folderPath

# Display the names of the files
foreach ($file in $files) {
    Write-Host $file.Name
}
