*** Settings ***

Library     SeleniumLibrary
Resource    ../Resources/SignupKeyword.robot
Resource    ../Resources/Common.robot


*** Test Cases ***

Signup Invalid Process
   [Documentation]    This Test Case uses input inValid email
   [Setup]   Start Browser and Maximize
   [Teardown]   Close all
    Signup1 link
    Enter Email      ${email2}
    Enter Password1      ${pwd1}
    Enter Confirm Password      ${pwd1}
    Click Checkbox
    Click Signup Btn
    Verify error

Signup Valid Process
   [Documentation]    This Test Case uses input Valid data
   [Setup]   Start Browser and Maximize
   [Teardown]   Close all
   Signup1 link
   Enter Email      ${email1}
   Enter Password1      ${pwd1}
   Enter Confirm Password      ${pwd1}
   Click Checkbox
   Click Signup Btn
   Verify Valid