# Workflow

- Show build number
    > Get-WmiObject -Class win32_OperatingSystem \
    > | Select Version,BuildNumber

- Enable wsl
    > Enable-WindowsOptionalFeature -Online -FeatureName \
    > VirtualMachinePlatform
    >
    > Enable-WindowsOptionalFeature -Online -FeatureName \
    > Microsoft-Windows-Subsystem-Linux
    >
    > wsl --list --online
    > wsl --install -d Ubuntu-20.04

- Install `wsltty`
- Install chocolatey
- [Add startup commands to `CMD`](https://stackoverflow.com/a/65822936)
