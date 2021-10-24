<=
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
=>

Set-Location C:\Users\Dany98\Desktop

Write-Host "Welcome to PowerShell" -foreground 'Yellow'
oh-my-posh --init --shell pwsh --config ~/.poshthemes/spaceship.omp.json | Invoke-Expression
