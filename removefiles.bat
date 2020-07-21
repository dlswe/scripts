@echo off
REM Run in CMD.EXE
z:
cd \roon

echo This will remove radio shows, text-files, nfo-files and playlists
echo It takes a while to run depending on the size of the library

cd datum
echo Removing radio shows
del *-sat-* /S
del *-dab-* /S
del *-dvbs-* /S

cd \roon
echo Removing TXT-files
del *.txt /S

echo Removing NFO-files
del *.nfo /S

echo Removing playlists
del *.m3u* /S

echo Removing logfiles
del *.log /S

echo Done.
pause
