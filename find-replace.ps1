# Prompt for the search string and replacement string
$searchString = Read-Host "Enter the string to search for:"
$replacementString = Read-Host "Enter the replacement string:"

# Get all files in the current folder
$files = Get-ChildItem -File

# Iterate through each file
foreach ($file in $files) {
    # Read the content of the file
    $content = Get-Content -Path $file.FullName

    # Check if the search string exists in the content
    if ($content -match $searchString) {
        # Replace the search string with the replacement string
        $newContent = $content -replace $searchString, $replacementString

        # Write the modified content back to the file
        $newContent | Set-Content -Path $file.FullName

        Write-Host "Replaced in file: $($file.Name)"
    }
}
