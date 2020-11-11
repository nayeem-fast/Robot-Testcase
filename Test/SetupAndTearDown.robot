*** Settings ***

Library     SeleniumLibrary

Suite Setup     Initialize
Suite Teardown      CloseDown


*** Keywords ***
Initialize
    Open Browser    https://www.demoblaze.com       Chrome
CloseDown
    Close Browser


Login Process
   click element    xpath=//a[@id="login2"]
   sleep    1s
   input text   xpath=//input[@id="loginusername"]      nayeem@f.com
   input text   xpath=//input[@id="loginpassword"]      Payza123@
   click button    xpath=//button[contains(text(),"Log in")]
   Wait Until Page Contains     Welcome nayeem@f.com
   element should contain  xpath=//a[contains(text(), "Welcome nayeem@f.com")]    Welcome nayeem@f.com
   Sleep   2s

Contact Process
   click element    xpath=//a[contains(text(),"Contact")]
   sleep    1s
   input text   xpath=//input[@id="recipient-email"]  nayeem@yahoo.com
   input text   xpath=//input[@id="recipient-name"]    Nayeem
   input text   xpath=//textarea[@id="message-text"]   Hello World
   click button    xpath=//button[contains(text(),"Send message")]
   alert should be present     Thanks for the message!!
   Sleep   2s

*** Test Cases ***
Project
    Login Process
    Contact Process