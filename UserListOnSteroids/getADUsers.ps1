$lines = Get-Content databasa.txt | Where {$_ -notmatch '^\s+$'} 
foreach ($line in $lines) {
    $ip = $line.split('|')[0]
    $pass = $line.split('|')[1]
    $password = ConvertTo-SecureString $pass -AsPlainText -Force
    $OmcTestCreds =  New-Object System.Management.Automation.PSCredential ("administrator", $password )
    $session = New-PSSession -ComputerName $ip -Credential $OmcTestCreds
    Copy-Item –Path $pwd\DomainUserSid.bat –Destination 'C:\' –ToSession $session
    $ip | Out-File -Append $pwd\REPORT.txt
    $desktopContent = Invoke-Command -ComputerName $ip -Credential $OmcTestCreds {
"$env:computername.$env:userdnsdomain"
c:\DomainUserSid.bat
}
$desktopContent | Out-File -Append $pwd\REPORT.txt
$desktopContent = Invoke-Command -ComputerName $ip -Credential $OmcTestCreds {remove-item c:\DomainUserSid.bat}


}
.\Reporting.txt
pause