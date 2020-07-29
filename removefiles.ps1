# Erase extraneous files from a music library
# pwsh replacement for batch file
# Author Daniel Lundh (c) 2020
# NOTE: THIS SCRIPT WILL DELETE FILES. USE WITH CAUTION.
clear

Write-Host "This will remove radio shows, text-files, nfo-files and playlists"
Write-Host "It takes a while to run depending on the size of the library"
cd Z:\Roon\Datum

# Remove radio shows
Write-Host "Removing radio shows"
Get-ChildItem -filter *-DVBS-* -Recurse | Remove-Item -Recurse
Get-ChildItem -filter *-SAT-* -Recurse | Remove-Item -Recurse
Get-ChildItem -filter *-DAB-* -Recurse | Remove-Item -Recurse
 
cd z:\Roon
Write-Host "Removing TXT-files"
# Ta bort txtfiler
Get-ChildItem -filter *.txt -Recurse | Remove-Item -Recurse

Write-Host "Removing NFO-files"
# Ta bort NFO-filer
Get-ChildItem -filter *.nfo -Recurse | Remove-Item -Recurse

Write-Host "Removing playlists"
# Ta bort spellistor
Get-ChildItem -filter *.m3u* -Recurse | Remove-Item -Recurse

Write-Host "Removing logfiles"
# Ta bort LOG-filer
Get-ChildItem -filter *.log -Recurse | Remove-Item -Recurse

# Pause and wait for key press
Write-Host "Done. Press the any key to exit."
[void][System.Console]::ReadKey($FALSE)
exit
