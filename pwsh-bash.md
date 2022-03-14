
- Get disk size:
    > Get-PSDrive
    > lsblk


- Show link target
```powershell
$WScript = New-Object -ComObject WScript.Shell
Get-ChildItem -Path ".\*.lnk" | ForEach-Object {$WScript.CreateShortcut($_.FullName).TargetPath}
```

- Update PATH
> Win + R -> "sysdm.cpl"
> Advanced System Settings -> Environment Variables
> "Edit Path"


## References

- [SSH on WSL](https://www.illuminiastudios.com/dev-diaries/ssh-on-windows-subsystem-for-linux/)
- [WSL on VPN](https://stackoverflow.com/questions/66444822/no-internet-connection-ubuntu-wsl-while-vpn)
- [Mount Devices on WSL](https://www.scivision.dev/mount-usb-drives-windows-subsystem-for-linux/)
