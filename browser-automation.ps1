# browser automation using selenium

# Import-Module Selenium 
#USER INPUTS
$MobileNumber = '9971798371'

# Predefined variables
# $CoWinSite = "https://www.cowin.gov.in/"
$CowinLoginURL = "https://selfregistration.cowin.gov.in/"


$Chrome = Start-SeChrome -StartURL $CowinLoginURL -WebDriverDirectory .\chromedriver_win32\ -Quiet

$Global:Chrome = $Chrome

function EnterMobileNumber {
    [cmdletbinding()]
    param($MobileNumber)
    $id = "mat-input-0"
    $ele = $Global:Chrome.FindElementById($id)
    $ele.Click()
    $ele.SendKeys($MobileNumber)
    $getOtpBtnclsNM = 'covid-button-desktop'
    $Global:Chrome.FindElementsByClassName($getOtpBtnclsNM).click()
}

function EnterOTP {
    [cmdletbinding()]
    param($otp)

    $ele = $Global:Chrome.FindElementByCssSelector('#mat-input-1')
    $ele.click()
    $ele.sendkeys($otp)
    $veryfyOtpbtn = '#main-content > app-login > ion-content > div > ion-grid > ion-row > ion-col > ion-grid > ion-row > ion-col > ion-grid > form > ion-row > ion-col:nth-child(3) > div > ion-button'
    $ele = $Global:Chrome.FindElementsByCssSelector($veryfyOtpbtn)
    $ele.click()

}

EnterMobileNumber $MobileNumber
# $ele.sendkeys([OpenQA.Selenium.Keys]::Enter)

$otp = Read-Host Enter OTP Received

EnterOTP $otp