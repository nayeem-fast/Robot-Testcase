*** Settings ***

Library     SeleniumLibrary
Resource    ../Resources/LoginKeyword.robot
Resource    ../Resources/Common.robot

Library     SeleniumLibrary
Resource    ../Resources/LoginKeyword.robot
Resource    ../Resources/Common.robot

*** Test Cases ***
Test Login inValid Process
   [Documentation]    This Test Case uses input inValid password
   [Setup]   Start Browser and Maximize
   [Teardown]   Close all
    Enter UserName      ${email}
    Enter Invalid Password      ${pwd1}
    Click Signin
    Verify for Invalid

Test Login Valid Process
   [Documentation]    This Test Case uses input Valid data
   [Setup]   Start Browser and Maximize
   [Teardown]   Close all
    Enter UserName      ${email}
    Enter Password      ${pwd}
    Click Signin
    Verify for Valid

