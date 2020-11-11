*** Settings ***
Library    SeleniumLibrary



*** Variables ***
${BROWSER}    chrome
${URL}   https://test.walletory.com/account
${INVALID_MAIL}    nayeem@g
${VALID_MAIL}    nayeem1@gmail.com
${VALID_PASS}     Payza123@
${INVALID_CON_PASS}     Payza@123



*** Keywords ***
Start Browser and Maximize
   open browser    ${URL}     ${BROWSER}
   Maximize Browser Window

Close all
   close browser

