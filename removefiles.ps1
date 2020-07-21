# Erase extraneous files from a music library
# pwsh replacement for batch file
# Author Daniel Lundh (c) 2020
clear

Write-Host "This will remove radio shows, text-files, nfo-files and playlists"
Write-Host "It takes a while to run depending on the size of the library"
cd Z:\Roon\Datum

# Remove radio shows
Write-Host "Removing radio shows"
Get-ChildItem *-DVBS-* -Recurse | foreach { Remove-Item -Path $_.FullName }
Get-ChildItem *-SAT-* -Recurse | foreach { Remove-Item -Path $_.FullName }
Get-ChildItem *-DAB-* -Recurse | foreach { Remove-Item -Path $_.FullName }
 
cd z:\Roon
Write-Host "Removing TXT-files"
# Ta bort txtfiler
Get-ChildItem *.txt -Recurse | foreach { Remove-Item -Path $_.FullName }

Write-Host "Removing NFO-files"
# Ta bort NFO-filer
Get-ChildItem *.nfo -Recurse | foreach { Remove-Item -Path $_.FullName }

Write-Host "Removing playlists"
# Ta bort spellistor
Get-ChildItem *.m3u* -Recurse | foreach { Remove-Item -Path $_.FullName }

Write-Host "Removing logfiles"
# Ta bort LOG-filer
Get-ChildItem *.log -Recurse | foreach { Remove-Item -Path $_.FullName }

# Pause and wait for key press
Write-Host "Done. Press the any key to exit."
[void][System.Console]::ReadKey($FALSE)
exit

