*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    firefox
${URL}   https://merchant-web.fast-pay.cash/
${MOBILE}  +9641713731203
${PASS}  Password@1


*** Test Cases ***
Test Merchant panel Project
   open browser    ${URL}     ${BROWSER}
   Maximize Browser Window
   input text   xpath=//input[@name="mobile_number"]       ${MOBILE}
   input text   xpath=//input[@name="password"]      ${PASS}

   click button    xpath=//button[@type="submit"]
   wait until page contains element     xpath=//img[@class="img-circle"]  3s
   click element   xpath=//img[@class="img-circle"]
   click element    xpath=//span[contains(text(),"Logout")]
   close browser