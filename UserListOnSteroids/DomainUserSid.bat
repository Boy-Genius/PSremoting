@echo off
set pwd=%cd%

net session >nul 2>&1
if %errorLevel% == 0 (
    WMIC useraccount get name,sid
) else (
    powershell.exe Start-Process %pwd%\DomainUserSid.bat -Verb runAs
)


