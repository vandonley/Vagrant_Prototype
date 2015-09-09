vagrant up vista
vagrant halt vista
vagrant up win7
vagrant halt win7
vagrant up win8
vagrant halt win8
vagrant up win81
vagrant halt win81
vagrant up --no-provision win10
vagrant halt win10
@ECHO OFF
echo.
echo.
echo Provisioning is currently not
echo working for Windows 10 guests.
echo.
echo Run the "Manual_Client_Provision.bat"
echo in the vagrant folder inside the client
echo as an Administrator if needed.
echo.
PAUSE