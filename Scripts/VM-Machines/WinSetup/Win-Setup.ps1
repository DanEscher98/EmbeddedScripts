$wintools = @(
	'#Microsoft.VC++2013Redist-x86'
	'Microsoft.PowerShell',
	'Microsoft.WindowsTerminal',
	'JanDeDobbeleer.OhMyPosh',
	'Git.Git',
	'gerardog.gsudo',
	'Neovim.Neovim',
	'Python.Python.3'
)

$hosttools = @(
	'#Oracle.VirtualBox',
	'#Hashicorp.Vagrant'
	'#Axosoft.GitKraken',
	'Microsoft.VisualStudioCode'
)

function Setup-Python {
	if (Get-Command py.exe -errorAction SilentlyContinue) {
		py.exe -m ensurepip --upgrade
		py.exe -m pip install --upgrade pip
		py.exe -m pip install poetry
	} else {
		Write-Warning "'py.exe' does not exist. Can't do setup."
	}
}

function Setup-Profile {
	# Fill a default PowerShell profile
	New-Item -Path $PROFILE -Type File -Force
	'Import-Module oh-my-posh
#Set-PoshPrompt -Theme alien
Set-PSReadlineOption -EditMode Vi
#$env:PATH = $env:PATH + ";C:\Program Files\Oracle\VirtualBox"
Get-Date | Write-Host' >> $PROFILE
}

function Setup-WSL {
  if (-Not (Get-ComputerInfo -property "HyperVRequirementVirtualizationFirmwareEnabled").HyperVRequirementVirtualizationFirmwareEnabled)) {
    Write-Warning "Virtualization firmware is not enabled."
  }
  Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -NoRestart
  wsl --install -d ubuntu
}

function Install-Winget {
	$repo = "microsoft/winget-cli"
	$file = "Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
	$releases = "https://api.github.com/repos/$repo/releases"

	Write-Host "Getting latest release"
	$tag = (Invoke-WebRequest $releases -UseBasicParsing | ConvertFrom-Json)[1].tag_name
	$download = "https://github.com/$repo/releases/download/$tag/$file"

	Write-Host "Downloading version: $tag"
	$name = $file.Split("_")[0]
	Invoke-WebRequest $download -Out "$name.msixbundle" -UseBasicParsing
	& "$(Get-Location)\$name.msixbundle"

  if (-Not Get-Command winget.exe -errorAction SilentlyContinue) {
  	Write-Warning "There was an error on 'winget' installation."
    exit 1
  }
}


$UsrIn = "0"

Install-Winget
winget source update
while ($UsrIn -ne "y" -and $UsrIn -ne "n") {
	$UsrIn = Read-Host "Install the tools? (y/n)"
	if ($UsrIn -eq "y") {
		foreach ($tool in $wintools) {
			if ($tool.Contains("#")) { continue }
			Write-Host $tool
			winget install --id $tool -e
		}
		if ((Get-CimInstance Win32_ComputerSystem).model -ne "VirtualBox") {
			Write-Host "Installing host tools ..."
			foreach ($tool in $hosttools) {
				if ($tool.Contains("#")) { continue }
				Write-Host $tool
				winget install --id $tool
			}
		}
	}
}

Setup-Profile
Setup-Python
Setup-WSL
