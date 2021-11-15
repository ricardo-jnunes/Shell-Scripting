$WarningPreference = "SilentlyContinue"

Set-Variable -Name serverToTest
Set-Variable -Name result

foreach($line in Get-Content .\servers_to_test.txt) {
    if($line -match $regex){

        $serverToTest = $line.Split(" ")
        $result = Test-NetConnection -ComputerName $serverToTest[0] -Port $serverToTest[1] -InformationLevel Quiet

        if ( $result ){
            Write-Host "Conexão OK " $serverToTest[0] $serverToTest[1]  -ForegroundColor DarkGreen   
        }else{
            Write-Host "Conexão NOK " $serverToTest[0] $serverToTest[1]  -ForegroundColor Red
        }

    }
 }