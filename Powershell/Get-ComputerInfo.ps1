<#
.SYNOPSIS
Name: Get-PCInfo.ps1
The purpose of this script is to retrieve basic information of a PC.

.DESCRIPTION
This is a simple script to retrieve basic information of domain joined computers.
It will gather hardware specifications and Operating System and present them on the screen.

.RELATED LINKS
Home

.PARAMETER Computer
This is the only parameter that is needed to provide the name of the computer either
in as computer name or DNS name.

.NOTES
Updated: 08-02-2018   Testing the connection before the information gathering.

Release Date: 05-02-2018

Author: Stephanos Constantinou

.EXAMPLE
Run the Get-PCInfo script to retrieve the information.

Get-PCInfo.ps1 -Computer test-pc
#>

function HumanReadableByteSize ($size) {
	switch ($size) {
		{$_ -gt 1TB} {($size / 1TB).ToString("n2") + " TB";break}
		{$_ -gt 1GB} {($size / 1GB).ToString("n2") + " GB";break}
		{$_ -gt 1MB} {($size / 1MB).ToString("n2") + " MB";break}
		{$_ -gt 1KB} {($size / 1KB).ToString("n2") + " KB";break}
		default {"$size B"}
	}
}

Param( [string]$Computer )

	$Connection = Test-Connection $Computer -Count 1 -Quiet

	if ($Connection -eq "True") {

		$ComputerHW = Get-CimInstance -ClassName Win32_ComputerSystem -ComputerName $Computer |
			select Manufacturer,Model | FT -AutoSize

			$ComputerCPU = Get-CimInstance win32_processor -ComputerName $Computer |
			select DeviceID,Name | FT -AutoSize

			$ComputerRam_Total = Get-CimInstance Win32_PhysicalMemoryArray -ComputerName $Computer |
			select MemoryDevices,MaxCapacity | FT -AutoSize

			$ComputerRAM = Get-CimInstance Win32_PhysicalMemory -ComputerName $Computer |
			select DeviceLocator,Manufacturer,PartNumber,Capacity,Speed | FT -AutoSize

			$ComputerDisks = Get-CimInstance -Class Win32_LogicalDisk -Filter "DriveType=3" -ComputerName $Computer |
			select DeviceID,VolumeName,Size,FreeSpace | FT -AutoSize

			$ComputerOS = (Get-CimInstance Win32_OperatingSystem -ComputerName $Computer).Version

			switch -Wildcard ($ComputerOS) {
				"6.1.7600" {$OS = "Windows 7"; break}
				"6.1.7601" {$OS = "Windows 7 SP1"; break}
				"6.2.9200" {$OS = "Windows 8"; break}
				"6.3.9600" {$OS = "Windows 8.1"; break}
				"10.0.*" {$OS = "Windows 10"; break}
				default {$OS = "Unknown Operating System"; break}
			}

		Write-Host "Computer Name: $Computer"
			Write-Host "Operating System: $OS"
			Write-Output $ComputerHW
			Write-Output $ComputerCPU
			Write-Output $ComputerRam_Total
			Write-Output $ComputerRAM
			Write-Output $ComputerDisks
	} else {
		Write-Host -ForegroundColor Red @"
Computer is not reachable or does not exists.
"@
	}
