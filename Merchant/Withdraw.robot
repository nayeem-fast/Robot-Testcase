*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    firefox
${URL}   https://merchant-web.fast-pay.cash/
${MOBILE}  +9641713731203
${PASS}  Password@1


*** Test Cases ***
Test Withdraw process
   open browser    ${URL}     ${BROWSER}
   Maximize Browser Window
   input text   xpath=//input[@name="mobile_number"]       ${MOBILE}
   input text   xpath=//input[@name="password"]      ${PASS}
   click button    xpath=//button[@type="submit"]
   log to console      Login 

   wait until page contains element     xpath=//h2[contains(text(),"Withdraw Payment")]  3s
   click element    xpath=//h2[contains(text(),"Withdraw Payment")]
   input text   xpath=//input[@name="receiver_mobile_number"]       +9640200200200
   input text   xpath=//input[@name="amount"]       250
   click button     xpath=//button[contains(text(),"Withdraw")]
   sleep    1s
   click button     xpath=//button[contains(text(),"Proceed")]
   sleep    1s
   input text    xpath=//input[@name="pin"]     1234
   click button     xpath=//button[contains(text(),"Execute")]
   element should contain       xpath=//li[contains(text(),"Success! Money Sent Successfully")]     Success! Money Sent Successfully
   click element    xpath=//span[contains(text(),"Dashboard")]
   wait until page contains element     xpath=//img[@class="img-circle"]  3s
   click element   xpath=//img[@class="img-circle"]
   click element    xpath=//span[contains(text(),"Logout")]
   close browser