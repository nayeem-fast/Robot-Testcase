*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${PASS}    jG06X@XdmlOR
${URL}   https://dash.cloudflare.com/login
${USERNAME}    gdevycar@gothill.com


*** Test Cases ***
Test search funtionality
   open browser    ${URL}     ${BROWSER}
   Maximize Browser Window
   input text    xpath=//input[@name="email"]   ${USERNAME}
   input text    xpath=//input[@data-testid="login-input-password"]    ${PASS}
   click element    xpath=//button[@data-testid="login-submit-button"]
   Enter Search Text
   close browser

*** Keywords ***
Enter Search Text
    wait until page contains element    xpath=//input[@data-testid="account-zone-selector-search"]  5s
    input text  xpath=//input[@data-testid="account-zone-selector-search"]  fiction
    element should contain  xpath=//div[contains(text(), "fictioncandle.guru")]    fictioncandle.guru