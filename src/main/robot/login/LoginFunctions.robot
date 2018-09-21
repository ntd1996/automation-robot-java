*** Settings ***
Library    SeleniumLibrary    
Resource    LoginActions.robot

*** Keywords ***
User Input Text Username And Password
    [Arguments]        ${USERNAME}    ${PASSWORD}
    Input Text Into Username Field    ${USERNAME}
    Input Text Into Password Field    ${PASSWORD}
    
User Login To PCN Portal
    [Arguments]        ${USERNAME}    ${PASSWORD}
    User Input Text Username And Password    ${USERNAME}    ${PASSWORD}  
    Click Button Login
    Sleep    4s  
     