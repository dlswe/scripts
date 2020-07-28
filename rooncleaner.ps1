# Reads Roon Excelfile, erases image files that can't be read by Roon
# Author Daniel Lundh (c) 2020
# Erases files with Reason: unable_to_load_image
# YES, THIS WILL DELETE FILES. USE WITH CAUTION
# usage rooncleaner.ps1 -infile filename
# example:
# rooncleaner.ps1 -infile C:\Users\dlh\Desktop\Skipped.xls

param (
    [Parameter(Mandatory=$true)][string]$infile
)

[xml]$ExcelXML = Get-Content -Path $infile

foreach ($Radnummer in (1..100)) {
    if ($ExcelXML.Workbook.Worksheet.Table.Row[$Radnummer].cell.data | Where-Object -f {$_.'#text' -eq "unable_to_load_image"}) {
        $Filename = ("Z:\Roon\" + $ExcelXML.Workbook.Worksheet.Table.Row[$Radnummer].cell.data.'#text'[5]).Replace("/","\")
        Write-Output "Deleting $Filename"
        Remove-Item $Filename
    }
}