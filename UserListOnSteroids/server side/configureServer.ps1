Enable-PSRemoting
Winrm quickconfig
netsh advfirewall firewall add rule name="Windows Remote Management (HTTP-In)" dir=in action=allow service=any enable=yes profile=any localport=5985 protocol=tcp
Set-Service WinRM -StartupType Automatic