START /wait /d C:\vagrant 1-Chocolatey_Install.bat
START /wait /d C:\vagrant Manual_Client_Provision2.bat
PowerShell.exe -NoProfile -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""C:\vagrant\Manual_Client_Provision2.ps1""' -Verb RunAs}""


