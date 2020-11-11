*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${BROWSER}      firefox
${URL}      https://www.gmail.com/
${USERNAME}     nayeem811995@gmail.com
${PASSWORD}     01712192765


*** Test Cases ***
Login And Send email

   open browser     ${URL}      ${BROWSER}
   input text   xpath=//input[@id="identifierId"]      ${USERNAME}
   click button    xpath=//span[contains(text(),"Next")]
   Wait Until Page Contains     xpath=//input[@name="password"]

   input text   xpath=//input[@name="password"]      ${PASSWORD}
   click button    xpath=//span[contains(text(),"Next")]

   Wait Until Page Contains     xpath=//a[contains(text(),"Inbox")]

   click button     xpath= //div[@class="T-I T-I-KE L3"]
   Click Element    xpath=//div[contains(text(),"Recipients")]
   input text   xpath=//textarea[@name="to"]    nayeem@fastsolutioninc.com
   input text   xpath=//input[@name="subjectbox"]       Test
   input text   xpath=//div[@class="Ar Au"]         Hello

   click button    xpath=//div[@class="T-I J-J5-Ji aoO v7 T-I-atl L3"]

