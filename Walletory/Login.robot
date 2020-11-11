*** Settings ***
Library    SeleniumLibrary
Resource    Resource.robot


*** Test Cases ***
Test Login Process

   [Setup]   Start Browser and Maximize
   [Teardown]   Close all
   Input Invalid Credential
   Input Valid Credential

*** Keywords ***
Input Invalid Credential
    input text      xpath=//input[@id="login-email"]    ${VALID_MAIL}
    input text      xpath=//input[@id="login-pass"]    ${INVALID_CON_PASS}
    click element      xpath=//button[@id="kt_login_signin_submit"]
    log to console      Input Invalid Credential Completed.
Input Valid Credential
    Clear Element Text      xpath=//input[@id="login-email"]
    Clear Element Text      xpath=//input[@id="login-pass"]
    input text      xpath=//input[@id="login-email"]    ${VALID_MAIL}
    input text      xpath=//input[@id="login-pass"]    ${VALID_PASS}
    click element      xpath=//button[@id="kt_login_signin_submit"]
    sleep   10s
    Handle alert    dismiss
    log to console      Input valid Credential Completed.
