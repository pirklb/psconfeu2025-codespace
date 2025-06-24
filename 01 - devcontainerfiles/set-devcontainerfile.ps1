param(
    [string]$SourceFile = '01 - devcontainerfiles\devcontainer.json'
)
## This script replaces the devcontainer.json file in the .devcontainer directory


$source = Join-Path $PWD $SourceFile
$destinationDir = Join-Path $PWD '.devcontainer'
$destination = Join-Path $destinationDir 'devcontainer.json'

# Ensure the source file exists
if (Test-Path $source) {
    # Ensure the destination directory exists
    if (-not (Test-Path $destinationDir)) {
        Write-Host "Creating .devcontainer directory..."
        New-Item -Path $destinationDir -ItemType Directory -Force | Out-Null
    }

    # Copy the file
    Copy-Item -Path $source -Destination $destination -Force
    Write-Host "Replaced devcontainerfile with $SourceFile."
}
else {
    Write-Host "$SourceFile not found in $PWD."
}