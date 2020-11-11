*** Settings ***
Library    SeleniumLibrary
Resource    Resource.robot


*** Test Cases ***
Test Signup Process

   [Setup]   Start Browser and Maximize
   [Teardown]   Close all
   Cancel Button
   Without Any input
   Invalid Email
   Check confirm password
   Without checking button
   Valid Signup Process

*** Keywords ***
Cancel Button
    Click Element    xpath=//a[@id="kt_login_signup"]
    Wait Until Page Contains     Enter your details to create an account.
    Sleep  2s
    Click Element    xpath=//button[@id="kt_login_signup_cancel"]
    Sleep  2s
    Wait Until Page Contains     Sign in to Walletory
    log to console      Cancel Button Completed.

Without Any input
    Click Element    xpath=//a[@id="kt_login_signup"]
    Wait Until Page Contains     Enter your details to create an account.
    Click Element    xpath=//button[@id="kt_login_signup_submit"]
    Sleep     2s
    element should contain  xpath=//div[@id="reg-email-error"]   This field is required.
    element should contain  xpath=//div[@id="reg-password-error"]   This field is required.
    element should contain  xpath=//div[@id="reg-password_confirmation-error"]   This field is required.
    element should contain  xpath=//div[@id="terms-error"]   This field is required.
    log to console      Without Any input Completed.
Invalid Email
    input text          xpath=//input[@id="reg-email"]      ${INVALID_MAIL}
    input text          xpath=//input[@id="reg-password"]     ${VALID_PASS}
    input text          xpath=//input[@id="reg-password_confirmation"]      ${VALID_PASS}
    Click Element     xpath=//*[@id="reg-terms"]/span
    Click Element    xpath=//button[@id="kt_login_signup_submit"]
    element should contain  xpath=//div[contains(text(), "Please enter a valid Email.")]    Please enter a valid Email.
    log to console      Invalid Email Completed.
Check confirm password
    Clear Element Text      xpath=//input[@id="reg-email"]
    Clear Element Text      xpath=//input[@id="reg-password"]
    Clear Element Text      xpath=//input[@id="reg-password_confirmation"]
    input text          xpath=//input[@id="reg-email"]      ${VALID_MAIL}
    input text          xpath=//input[@id="reg-password"]     ${VALID_PASS}
    input text          xpath=//input[@id="reg-password_confirmation"]      ${INVALID_CON_PASS}
    Click Element    xpath=//button[@id="kt_login_signup_submit"]
    Sleep  2s
    Wait Until Page Contains     The password confirmation does not match.
    log to console      Check confirm password Completed.
Without checking button
    sleep  2s
    Clear Element Text      xpath=//input[@id="reg-email"]
    Clear Element Text      xpath=//input[@id="reg-password"]
    Clear Element Text      xpath=//input[@id="reg-password_confirmation"]
    input text          xpath=//input[@id="reg-email"]      ${VALID_MAIL}
    input text          xpath=//input[@id="reg-password"]     ${VALID_PASS}
    input text          xpath=//input[@id="reg-password_confirmation"]      ${VALID_PASS}
    Click Element     xpath=//*[@id="reg-terms"]/span
    Click Element    xpath=//button[@id="kt_login_signup_submit"]
    element should contain  xpath=//div[@id="terms-error"]   This field is required.
    log to console      Without checking button Completed.
Valid Signup Process
    sleep  2s
    Click Element     xpath=//*[@id="reg-terms"]/span
    sleep  2s
    Click Element    xpath=//button[@id="kt_login_signup_submit"]
    Wait Until Page Contains     Thank you. To complete your registration. Now you can login with you credential.
    log to console      Valid Signup Process Completed.