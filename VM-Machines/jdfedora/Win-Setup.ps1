$wintools = @(
	'Microsoft.PowerShell',
	'Microsoft.WindowsTerminal',
	'JanDeDobbeleer.OhMyPosh',
	'Oracle.VirtualBox',
	'Hashicorp.Vagrant'
	'Git.Git',
	'Axosoft.GitKraken',
	'gerardog.gsudo',
	'#Microsoft.VisualStudioCode'
)

function Install-Winget {
	$repo = "microsoft/winget-cli"
	$file = "Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
	$releases = "https://api.github.com/repos/$repo/releases"

	Write-Host "Getting latest release"
	$tag = (Invoke-WebRequest $releases | ConvertFrom-Json)[1].tag_name
	$download = "https://github.com/$repo/releases/download/$tag/$file"

	Write-Host "Downloading version: $tag"
	$name = $file.Split("_")[0]
	Invoke-WebRequest $download -Out "$name.msixbundle"
	& "$(Get-Location)\$name.msixbundle"
}

Install-Winget
$UsrIn = "0"
if (Get-Command winget -errorAction SilentlyContinue) {
	winget source update
	while ($UsrIn -ne "y" -and $UsrIn -ne "n") {
		$UsrIn = Read-Host "Install the tools? (y/n)"
		if ($UsrIn -eq "y") {
			foreach ($tool in $wintools) {
				if ($tool.Contains("#")) { continue }
				Write-Host $tool
				winget install --id $tool -e
			}
		}
	}
	# Fill a default PowerShell profile
	New-Item -Path $PROFILE -Type File -Force
	'#Import-Module oh-my-posh
#Set-PoshPrompt -Theme alien
Set-PSReadlineOption -EditMode Vi
$env:PATH = $env:PATH + ";C:\Program Files\Oracle\VirtualBox"
Get-Date | Write-Host' >> $PROFILE
} else {
	Write-Host "winget doesn't exist. There was an error on installation."
}
