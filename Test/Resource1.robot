*** Settings ***
Library    SeleniumLibrary
Resource    Resource1.robot


*** Variables ***
${BROWSER}    chrome
${URL}   https://www.demoblaze.com



*** Keywords ***
Start Browser and Maximize
   open browser    ${URL}     ${BROWSER}
   Maximize Browser Window

Close all
   close browser