*** Settings ***

Library     SeleniumLibrary
Variables    ../PageObject/Locator.py

*** Variables ***

${email}     nayeem1@gmail.com
${pwd1}      Payza@123
${pwd}       Payza123@

*** Keywords ***

Enter UserName
    [Arguments]     ${username}
    Input Text      ${login_email}      ${username}

Enter Invalid Password
    [Arguments]     ${password}
    Input Text      ${login_password}      ${password}

Enter Password
    [Arguments]     ${password}
    Input Text      ${login_password}      ${password}

Click Signin
    Click element     ${login_btn}

Verify for Invalid
    Sleep  2s
    Wait Until Page Contains    Incorrect email or password. Please try again.
    log to console      Input Invalid Credential Completed.

Verify for Valid
    log to console      Input valid Credential Completed.
