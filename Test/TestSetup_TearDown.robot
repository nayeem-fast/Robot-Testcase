*** Settings ***
Library    SeleniumLibrary
Resource    Resource1.robot

*** Test Cases ***
Login Process

   [Setup]   Start Browser and Maximize
   [Teardown]   Close all
   click element    xpath=//a[@id="login2"]
   sleep    1s
   input text   xpath=//input[@id="loginusername"]      nayeem@f.com
   input text   xpath=//input[@id="loginpassword"]      Payza123@
   click button    xpath=//button[contains(text(),"Log in")]
   Wait Until Page Contains     Welcome nayeem@f.com
   element should contain  xpath=//a[contains(text(), "Welcome nayeem@f.com")]    Welcome nayeem@f.com
   Sleep   2s