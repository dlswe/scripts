# Reads Roon Excelfile, erases files in Roon library as needed
# Author Daniel Lundh (c) 2020
# Erases files with Reason: unable_to_load_image

#$FilePathXML = "c:\Users\dlh\Skipped.xls"
#$FilePathCSV = "c:\Users\dlh\Skipped.csv"
#$Excel = New-Object -ComObject Excel.Application
#$Workbook = $Excel.Workbooks.Open($FilePathXML)
#$Workbook.SaveAs($FilePathCSV, 6)
#$Excel.Quit()

[xml]$ExcelXML = Get-Content -Path .\Skipped.xls

foreach ($Radnummer in (1..100)) {
    if ($ExcelXML.Workbook.Worksheet.Table.Row[$Radnummer].cell.data | Where-Object -f {$_.'#text' -eq "unable_to_load_image"}) {
        $Filename = ("Z:\Roon\" + $ExcelXML.Workbook.Worksheet.Table.Row[$Radnummer].cell.data.'#text'[5]).Replace("/","\")
        Write-Output "Deleting $Filename"
    }
}
