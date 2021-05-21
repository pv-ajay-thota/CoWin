

$Global:PublicApi = 'https://cdn-api.co-vin.in/api'
function GenerateOtp {
    param($MobileNumber)
    $generateOtp = '/v2/auth/public/generateOTP'
    $uri = $PublicApi + $generateOtp
    $headers = @{
        "accept"       = "application/json"
        "Content-Type" = "application/json"
    }

    $data = @{
        "mobile" = "$MobileNumber"
    } | ConvertTo-Json

    try {
        
        $response = Invoke-WebRequest -Method Post -Uri $uri -Headers $headers -Body $data -UseBasicParsing -ErrorAction Stop 
        $response

    }
    catch {
        Write-Error $_
    }


}

function Convertto-SHA256 {
    Param (
        [Parameter(Mandatory = $true)]
        [string]
        $ClearString
    )

    $hasher = [System.Security.Cryptography.HashAlgorithm]::Create('sha256')
    $hash = $hasher.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($ClearString))

    $hashString = [System.BitConverter]::ToString($hash)
    $hashString.Replace('-', '').ToLower()
}

function validateMobileOTP {
    [cmdletbinding()]
    param( $txnId, $otp )
    $otpsha256 = Convertto-SHA256 -ClearString $otp
    $confirmOTP = '/v2/auth/public/validateMobileOtp'
    
    $uri = $PublicApi + $confirmOTP

    $headers = @{
        "accept"       = "application/json"
        "Content-Type" = "application/json"
    }
    
    $data = @{
        'otp' = $otpsha256
        'txnId' = $txnId

    } | ConvertTo-Json
    
    try {
        
        $response = Invoke-WebRequest -Method Post -Uri $uri -Headers $headers -Body $data -UseBasicParsing -ErrorAction Stop 
        $response

    }
    catch {
        Write-Error $_
    }
} 

function confirmOTP {
    [cmdletbinding()]
    param( [string]$txnId, [string]$otp )
    $otpsha256 = Convertto-SHA256 -ClearString $otp
    $confirmOTP = '/v2/auth/public/ConfirmOtp'
    
    $uri = $PublicApi + $confirmOTP

    $headers = @{
        "accept"       = "application/json"
        "Content-Type" = "application/json"
    }
    
    $data = @{
        'otp' = $otpsha256
        'txnId' = $txnId

    } | ConvertTo-Json
    
    try {
        
        $response = Invoke-WebRequest -Method Post -Uri $uri -Headers $headers -Body $data -UseBasicParsing -ErrorAction Stop 
        $response

    }
    catch {
        Write-Error $_
    }
} 

function Get-States {

    $getStates = '​/v2​/admin​/location​/states'

    $uri = $PublicApi + $getStates

    $headers = @{
        "accept"       = "application/json"
        "Accept-Language" = "en_US"
    }
    $data = @{
        "token" = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25hbWUiOiJjYTk5MmNhNC05Yjg4LTQ2YjYtYTQ4OC1lZTBhZDc1ZmQzYjEiLCJ1c2VyX3R5cGUiOiJCRU5FRklDSUFSWSIsInVzZXJfaWQiOiJjYTk5MmNhNC05Yjg4LTQ2YjYtYTQ4OC1lZTBhZDc1ZmQzYjEiLCJtb2JpbGVfbnVtYmVyIjo5OTcxNzk4MzcxLCJiZW5lZmljaWFyeV9yZWZlcmVuY2VfaWQiOjE5NTgyOTcyODUwMjEwLCJ0eG5JZCI6ImI4MmZhYmQ1LWMzYjMtNDZjNS1iNzMyLTQxMzU2NDZkOWExNSIsImlhdCI6MTYyMDMzMjEzOSwiZXhwIjoxNjIwMzMzMDM5fQ.jNXTFPvu_Ljq4NmpOMwOs2CsTfkRSmaWHj0Br7NBFD0"
    } | ConvertTo-Json

    try {
        
        $response = Invoke-WebRequest -Method Post -Uri $uri -Headers $headers -Body $data -UseBasicParsing -ErrorAction Stop 
        $response

    }
    catch {
        Write-Error $_
    }

}

function Get-VaccineAvailabilityZones {
    param($pincode,$date)
    $headers = @{
        "accept"       = "application/json"
        "Accept-Language" = "en_US"
    }

    $getavailability = "/v2/appointment/sessions/public/calendarByPin?pincode=$pincode&date=$date"

    $uri = $PublicApi + $getavailability

    try {
        
        $response = Invoke-WebRequest -Method Get -Uri $uri -Headers $headers -UseBasicParsing -ErrorAction Stop 
        $response

    }
    catch {
        Write-Error $_
    }
}


