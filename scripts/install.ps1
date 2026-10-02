# PowerShell installation script for Windows (git not required)
$ErrorActionPreference = "Stop"

$repoUrl = "https://github.com/chapp3070/typst-cover-for-B1/archive/refs/heads/main.zip"
$packageName = "typst-cover-for-B1"
$version = "0.1.0"

$targetDir = "$env:APPDATA\typst\packages\local\$packageName\$version"

Write-Host "Installing $packageName v$version to $targetDir..." -ForegroundColor Cyan

$tmpZip = [System.IO.Path]::GetTempFileName() + ".zip"
$tmpExtract = Join-Path ([System.IO.Path]::GetTempPath()) ([System.Guid]::NewGuid().ToString())

try {
    Invoke-WebRequest -Uri $repoUrl -OutFile $tmpZip
    Expand-Archive -Path $tmpZip -DestinationPath $tmpExtract -Force

    if (-not (Test-Path $targetDir)) {
        New-Item -ItemType Directory -Force -Path $targetDir | Out-Null
    } else {
        Remove-Item -Recurse -Force "$targetDir\*" -ErrorAction SilentlyContinue
    }

    $extractedRoot = Join-Path $tmpExtract "typst-cover-for-B1-main"
    Copy-Item -Recurse -Force "$extractedRoot\*" $targetDir

    Write-Host "Successfully installed $packageName v$version!" -ForegroundColor Green
} finally {
    Remove-Item -Force $tmpZip -ErrorAction SilentlyContinue
    Remove-Item -Recurse -Force $tmpExtract -ErrorAction SilentlyContinue
}
