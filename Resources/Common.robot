*** Settings ***
Library    SeleniumLibrary



*** Variables ***
${BROWSER}    chrome
${URL}   https://test.walletory.com/account



*** Keywords ***
Start Browser and Maximize
   open browser    ${URL}     ${BROWSER}
   Maximize Browser Window

Close all
   close browser

