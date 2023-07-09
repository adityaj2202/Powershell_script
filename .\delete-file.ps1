# Check if the file name argument is provided
if ($args.Count -lt 1) {
    Write-Host "Please provide the file name as an argument."
    Exit
}

# Get the file name from the first argument
$fileName = $args[0]

# Specify the file path to delete
$filePath = Join-Path -Path $PWD.Path -ChildPath $fileName

# Check if the file exists
if (Test-Path $filePath -PathType Leaf) {
    # Delete the file
    Remove-Item $filePath
    Write-Host "File '$fileName' deleted successfully."
}
else {
    Write-Host "File '$fileName' not found."
}
