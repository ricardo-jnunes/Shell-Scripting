$WarningPreference = "SilentlyContinue"

Set-Variable -Name resp

foreach($line in Get-Content .\urls_to_test.txt) {

    if($line -match $regex){
        if($line.StartsWith("https")){
			#$req = Invoke-WebRequest -uri $line
			#Write-output "$($line) Status Code -- $($req.StatusCode)"
			try {
				$req = [System.Net.WebRequest]::Create($line)
				$resp = $req.GetResponse()
				if ($resp.ResponseUri.OriginalString –eq $line) {
					 Write-Host "[ $($resp.StatusCode) ] $($line)" -ForegroundColor DarkGreen
				 } else {
					 Write-Host "[ $($resp.StatusCode) ] $($line) ---> $($resp.ResponseUri)" -ForegroundColor DarkGreen
				 }
			}catch [System.Net.WebException]{
				Write-Host "[ NOK ] $($line) -- $(($_.Exception.Message))" -ForegroundColor Red
			}finallY{
				$resp.Close();
			}
		}
    }
 }