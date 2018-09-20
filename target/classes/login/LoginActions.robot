*** Settings ***
Library    SeleniumLibrary      
Resource    LoginVariables.robot
Resource    ../selfservice/variable/Elements.robot
*** Keywords ***
Login Page Should Be Appeared
    Wait Until Element Is Visible    ${USERNAME}
    Wait Until Element Is Visible    ${PASSWORD}
    Wait Until Element Is Visible    ${BUTTON_LOGIN}
    
Login Page Should Be Not Appeared
    Wait Until Element Is Not Visible    ${USERNAME}
    Wait Until Element Is Not Visible    ${PASSWORD}
    Wait Until Element Is Not Visible    ${BUTTON_LOGIN} 
        
Input Text Into Username Field
    [Arguments]   ${DATA}
    Input Text    ${USERNAME}    ${DATA}
    Sleep    2s    
    
Input Text Into Password Field
    [Arguments]   ${DATA}
    Input Text    ${PASSWORD}    ${DATA}
    Sleep    2s    
    
Get Current Location
    Location Should Be    ${URL}/login
    
Click Button Login
    Click Button    ${BUTTON_LOGIN}
    Sleep    2s    
    
Message Require Username Must Be Appeared
    Wait Until Element Is Visible    ${REQUIRED_USERNAME}  
    
Message Require Password Must Be Appeared
    Wait Until Element Is Visible    ${REQUIRED_PASSWORD} 
      
Message Invalid Username Or Password Must Be Appeared
    Wait Until Element Is Visible    ${INVALID_LOGIN} 
    