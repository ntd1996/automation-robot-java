*** Settings ***
Library    SeleniumLibrary  
Resource    ../variable/Elements.robot  
Resource    ../../login/LoginFunctions.robot

*** Keywords ***
User Go To Self Service Page
    Click Element    ${SELF_SERVICE}
    Sleep    3s
    
User Go To Home Page
    Click Element    ${BUTTON_HOME}
    Sleep    4s    
    
Logout
    Click Element    ${LOGOUT}
    
Access To PCN Website
    Click Element    ${FOOTER}
    
User Back To Home Page
    Click Element    ${BUTTON_HOME}
    Sleep    5s
    
User Go To PCN Portal Resource With PCN URL
    [Arguments]        ${USERNAME}    ${PASSWORD}
    Open Browser    ${URL}        ${BROWSER}      

    Maximize Browser Window
    User Login To PCN Portal     ${USERNAME}    ${PASSWORD}
    Maximize Browser Window 
    
User Go To Self Service In PCN Portal Resource With PCN URL
    [Arguments]        ${USERNAME}    ${PASSWORD}
    Open Browser    ${URL}        ${BROWSER}
    Maximize Browser Window
    User Login To PCN Portal     ${USERNAME}    ${PASSWORD}
    User Go To Self Service Page
    Maximize Browser Window
    
User Must Be See Message
    [Arguments]    ${MESSAGE_LOCATOR}
    Wait Until Element Is Visible    ${MESSAGE_LOCATOR}