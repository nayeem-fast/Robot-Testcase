*** Settings ***

Library     SeleniumLibrary




*** Test Cases ***
Contact Process
   click element    xpath=//a[contains(text(),"Contact")]
   sleep    1s
   input text   xpath=//input[@id="recipient-email"]  nayeem@yahoo.com
   input text   xpath=//input[@id="recipient-name"]    Nayeem
   input text   xpath=//textarea[@id="message-text"]   Hello World
   click button    xpath=//button[contains(text(),"Send message")]
   alert should be present     Thanks for the message!!
   Sleep   2s