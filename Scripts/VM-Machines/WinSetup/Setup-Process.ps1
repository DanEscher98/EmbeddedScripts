Download-Winget

$UsrIn = "0"
while ($UsrIn -ne "y" -and $UsrIn -ne "n") {
	$UsrIn = Read-Host "Install the tools? (y/n)"
		if ($UsrIn -eq "y") {
			foreach ($line in Get-Content $PSScriptRoot\Win-Tools.txt) {
				if ($line.Contains("#")) { continue }
				Write-Host $line
					winget install --id $line -e
			}
		}
}

function Download-Winget {
  # https://github.com/microsoft/winget-cli/releases/download/v1.4.10173/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
  
  $repo = "microsoft/winget-cli"
  $file = "Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
  $releases = "https://api.github.com/repos/$repo/releases"
  
  Write-Host "Getting latest release"
  $tag = (Invoke-WebRequest $releases | ConvertFrom-Json)[1].tag_name
  $download = "https://github.com/$repo/releases/download/$tag/$file"
  
  Write-Host "Downloading version: $tag"
  $name = $file.Split("_")[0]
  Invoke-WebRequest $download -Out "$name.msixbundle"
}
