# https://github.com/microsoft/winget-cli/releases/download/v1.1.12653/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle

$repo = "microsoft/winget-cli"
$file = "Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
$releases = "https://api.github.com/repos/$repo/releases"

Write-Host "Getting latest release"
$tag = (Invoke-WebRequest $releases | ConvertFrom-Json)[1].tag_name
$download = "https://github.com/$repo/releases/download/$tag/$file"

Write-Host "Downloading version: $tag"
$name = $file.Split("_")[0]
Invoke-WebRequest $download -Out "$name.msixbundle"
