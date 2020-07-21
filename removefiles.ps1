# Erase extraneous files from a music library
# pwsh replacement for batch file
# Author Daniel Lundh (c) 2020
clear

Write-Host "This will remove radio shows, text-files, nfo-files and playlists"
Write-Host "It takes a while to run depending on the size of the library"
cd Z:\Roon\Datum

# Remove radio shows
Write-Host "Removing radio shows"
Get-ChildItem *-DVBS-* -Recurse | Remove-Item
Get-ChildItem *-SAT-* -Recurse | Remove-Item
Get-ChildItem *-DAB-* -Recurse | Remove-Item
 
cd z:\Roon
Write-Host "Removing TXT-files"
# Ta bort txtfiler
Get-ChildItem *.txt -Recurse | Remove-Item

Write-Host "Removing NFO-files"
# Ta bort NFO-filer
Get-ChildItem *.nfo -Recurse | Remove-Item

Write-Host "Removing playlists"
# Ta bort spellistor
Get-ChildItem *.m3u* -Recurse | Remove-Item

Write-Host "Removing logfiles"
# Ta bort LOG-filer
Get-ChildItem *.log -Recurse | Remove-Item

# Pause and wait for key press
Write-Host "Done. Press the any key to exit."
[void][System.Console]::ReadKey($FALSE)
exit
