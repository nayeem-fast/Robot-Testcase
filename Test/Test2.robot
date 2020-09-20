*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${PASS}    jG06X@XdmlOR
${URL}   https://dash.cloudflare.com/login
${USERNAME}    gdevycar@gothill.com


*** Test Cases ***
Test support funtionality
   open browser    ${URL}     ${BROWSER}
   Maximize Browser Window
   input text    xpath=//input[@name="email"]   ${USERNAME}
   input text    xpath=//input[@data-testid="login-input-password"]    ${PASS}
   click element    xpath=//button[@data-testid="login-submit-button"]
   Enter Search Text
   Close Browser


*** Keywords ***
Enter Search Text

    click element  xpath=//button[@data-testid="dropdown-support-selector"]
    click element   xpath:/html/body/div[2]/div[2]/div/header/div[2]/div[2]/div/ul/li[1]/a/span
    input text    xpath=//input[@id="query"]    DNS
    press keys   xpath=//input[@id="query"]  ENTER
    sleep   10s


