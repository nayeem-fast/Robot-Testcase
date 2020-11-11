*** Settings ***

Library     SeleniumLibrary
Variables    ../PageObject/Locator.py

*** Variables ***

${email1}        nayeem902@gmail.com
${pwd1}      Payza123@
${email2}        nayeem5.com
*** Keywords ***

Signup1 link
    sleep  2s
    Click element     ${signup_link}

Enter Email
    [Arguments]     ${username1}
    Input Text      ${signup_email}      ${username1}

Enter Password1
    [Arguments]     ${password1}
    Input Text      ${signup_password}      ${password1}

Enter Confirm Password
    [Arguments]     ${con_password}
    Input Text      ${signup_confirm}      ${con_password}

Click Checkbox
    Click element     ${checkbox}

Click Signup Btn
    Click element     ${signup_btn}

Verify error
    element should contain  xpath=//div[@id="reg-email-error"]   Please enter a valid Email.
    log to console      Invalid Email Completed.

Verify Valid
    Wait Until Page Contains     Thank you. To complete your registration. Now you can login with you credential.
    log to console      Input valid info Completed.
