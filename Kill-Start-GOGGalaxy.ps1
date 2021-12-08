# Have problems with starting Good Old Games (GOG) Galaxy?
# This script will kill all GOG services, delete the lock-files and restart the GOG Galaxy client.
# Written by Gaute Holmin 08. december 2021.
# Tested on Windows 11 Pro 21H2

# To be able to run Powershell scripts, make sure you have unrestricted access.
# Run get-executionpolicy to check
# To change policy, run Powershell as administrator and type set-executionpolicy Unrestricted

# This script has to be run by an administrator
# Comment out this if you have disabled UAC
Start-Process Powershell -Verb runAs

# Kill all the GOG services
taskkill /IM "GalaxyCommunication.exe" /F
taskkill /IM "GalaxyClient Helper.exe" /F
taskkill /IM "GOG Galaxy Notifications Renderer.exe" /F
taskkill /IM "GalaxyClient.exe" /F

# Delete the lock-files (you may have to change the installation path)
Remove-Item "C:\ProgramData\GOG.com\Galaxy\lock-files\GalaxyClient.exe-galaxy-client.lock"
Remove-Item "C:\ProgramData\GOG.com\Galaxy\lock-files\GOG Galaxy Notifications Renderer.exe.lock"

# Start GOG Galaxy Client (you may have to change the installation path)
& "C:\Program Files (x86)\GOG Galaxy\GalaxyClient.exe"
