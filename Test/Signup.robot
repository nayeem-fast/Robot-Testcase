*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${URL}   https://www.demoblaze.com
${USER}  nayeem@jhgjkhdfg48768.com
${PASS}  Payza123@


*** Test Cases ***
Test DemoBlaze Project
   open browser    ${URL}     ${BROWSER}
   Maximize Browser Window
   Signup Process
   Login Process
   Contact Process
   Add to cart and Buy product
   About Us and play video
   close browser


*** Keywords ***
Signup Process
   click element    xpath=//a[@id="signin2"]
   sleep    1s
   input text   xpath=//input[@id="sign-username"]      ${USER}
   input text   xpath=//input[@id="sign-password"]      ${PASS}
   click button    xpath=//button[contains(text(),"Sign up")]
   alert should be present  Sign up successful.
   Sleep   2s
Login Process
   click element    xpath=//a[@id="login2"]
   sleep    1s
   input text   xpath=//input[@id="loginusername"]      nayeem@f.com
   input text   xpath=//input[@id="loginpassword"]      ${PASS}
   click button    xpath=//button[contains(text(),"Log in")]
   Wait Until Page Contains     Welcome nayeem@f.com
   element should contain  xpath=//a[contains(text(), "Welcome nayeem@f.com")]    Welcome nayeem@f.com
   Sleep   2s
Contact Process
   click element    xpath=//a[contains(text(),"Contact")]
   sleep    1s
   input text   xpath=//input[@id="recipient-email"]  nayeem@yahoo.com
   input text   xpath=//input[@id="recipient-name"]    Nayeem
   input text   xpath=//textarea[@id="message-text"]   Hello World
   click button    xpath=//button[contains(text(),"Send message")]
   alert should be present     Thanks for the message!!
   Sleep   2s
Add to cart and Buy product
   wait until page contains element     xpath=//a[contains(text(),"Nokia lumia 1520")]  8s
   click element    xpath=//a[contains(text(),"Nokia lumia 1520")]
   wait until page contains element     xpath=//a[contains(text(),"Add to cart")]  2s
   click element    xpath=//a[contains(text(),"Add to cart")]
   alert should be present     Product added.
   click element    xpath=//a[contains(text(),"Cart")]
   wait until page contains element    xpath=//td[contains(text(),"Nokia lumia 1520")]  2s
   click element    xpath=//button[contains(text(),"Place Order")]
   sleep  1s
   input text    xpath=//input[@id="name"]   Nayeem
   input text     xpath=//input[@id="country"]   Bangladesh
   input text     xpath=//input[@id="city"]   Dhaka
   input text     xpath=//input[@id="card"]   1111111111
   input text     xpath=//input[@id="month"]  January
   input text     xpath=//input[@id="year"]  2020
   click element    xpath=//button[contains(text(),"Purchase")]
    Sleep    1s
   element should contain  xpath=//h2[contains(text(), "Thank you for your purchase!")]    Thank you for your purchase!
   click element    xpath=//button[contains(text(),"OK")]
About Us and play video
    Sleep   2s
    click element    xpath=//a[contains(text(),"About us")]
    Sleep    1s
    click element    xpath=//button[@title="Play Video"]
    Sleep   3s
