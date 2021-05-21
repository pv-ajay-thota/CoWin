Import-Module .\CoWin.psm1




$response = GenerateOtp -MobileNumber 9971798371
$jsonRes = $response.Content | ConvertFrom-Json
$txnId = $jsonRes.txnId
$OTP = Read-Host "please enter the OTP received on your Mobile Phone"
$token = confirmOTP -txnId $txnId -otp $otp




$pincode = 524201

$date = Get-Date -Format "dd-MM-yyyy"

$availabilityZonesResponse = Get-VaccineAvailabilityZones -pincode $pincode -date $date

$availabilityZones = $availabilityZonesResponse.Content | ConvertFrom-Json

$availabilityZones.centers

$availabilityZonesResponse.Content 

# [Reflection.Assembly]::LoadWithPartialName("System.Management.Automation")