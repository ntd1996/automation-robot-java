*** Settings ***
Library    SeleniumLibrary    
Library    OperatingSystem  
Library    Collections    
Library    String   
Library    BuiltIn    
Resource    AddNetworkVariables.robot
Resource    ../../home/HomeVariables.robot

*** Keywords ***
Module Add Net Work Should Be Appeared
    Wait Until Element Is Visible    ${DESCRIPTION_ADD_NETWORK}  
    Wait Until Element Is Visible    ${BUTTON_ADD_NETWORK}
    Wait Until Element Is Visible    ${BUTTON_HELP_ADD_NETWORK}
    Wait Until Element Is Visible    ${BUTTON_LOVE_ADD_NETWORK}
    Element Text Should Be           ${DESCRIPTION_ADD_NETWORK}    "Add one or more Networks (Subnet Containers)"    
    
Click Button Add Network
    Click Button    ${BUTTON_ADD_NETWORK}
    Sleep    1s
    
Click Button Cancel In Request Form
    Click Button    ${BUTTON_CANCEL_REQUEST}
    Sleep    2s
    
Click Button Cancel Form Add New Network
    Click Button    ${BUTTON_CANCEL_ENTER_DATA}
    Sleep    2s        
    
Click Button Help In Module Add Network
    Click Button    ${BUTTON_HELP_ADD_NETWORK}
    Sleep    2s
    
Click Button Love In Module Add Network
    Click Button    ${BUTTON_LOVE_ADD_NETWORK}
    Sleep    2s
    
Clear Text In Text Field Request ID
    Clear Element Text    ${TEXT_FILED_REQUEST_ID}
    Sleep    2s    
    
Message Require ID Must Be Appeared
    Wait Until Element Is Visible    ${MESSGAE_REQUIRE_ID}
    
Click Text Field Request ID
    Click Button    ${TEXT_FILED_REQUEST_ID}  
    Sleep    2s      
    
Input Text To Request ID Text Field
    [Arguments]    ${ID}
    Input Text    ${TEXT_FILED_REQUEST_ID}    ${ID}
    Sleep    2s   
     
Click Container
    Click Element    ${CONTAINER_REQUEST}
    Sleep    2s
Click Multiple Mode 
    Click Element  ${MULTIPLE_MODE}
    Sleep    2s    
Click Element In Frame IPAM
    [Arguments]    ${ELEMENT}
    Click Element    ${ELEMENT}
    Sleep    7s   
    
Input Text To CIDR Text Field
    [Arguments]    ${CIDR}
    Input Text    ${TEXT_FIELD_CIDR}    ${CIDR}
    Sleep    3s  
    
Input Text To Name Text Field
    [Arguments]    ${NAME}
    Input Text    ${TEXT_FIELD_NAME}    ${NAME}
    Sleep    3s
    
Input Text To Sub Group Text Field
    [Arguments]    ${SUB_GROUP}
    Input Text    ${TEXT_FIELD_NAME}    ${SUB_GROUP}
    Sleep    3s 
    
Message Require CIDR Must Be Appeared
    Wait Until Element Is Visible    ${MESSAGE_REQUIRE_CIDR}
    
Message Require Name Must Be Appeared
    Wait Until Element Is Visible    ${MESSAGE_REQUIRE_NAME}
    
Multiple Click Element
    [Arguments]    ${LOCATOR_ELEMENT}    ${RANGE1}    ${RANGE2}
    :FOR    ${index}    IN RANGE    ${RANGE1}    ${RANGE2}
    \    Click Element    ${LOCATOR_ELEMENT}
    Sleep    3s
    
Radio Button Should Be Disable
    Element Should Be Disabled    ${IPAM}
    Sleep    1s    
    
Radio Button Should Be Enable
    Element Should Be Enabled    ${IPAM}
    Sleep    1s
    
Click Text Field CIDR
    Click Element    ${TEXT_FIELD_CIDR}
    Click Div Details Network
    
Click Text Field Name
    Click Element    ${TEXT_FIELD_NAME}
    Click Div Details Network
    
Click Text Field Sub-Group
    Click Element    ${TEXT_FIELD_SUBGROUP}
    Sleep    1s    
    Click Element    ${ADD_NET_WORK_SUB_GROUP_TEST}
    Sleep    2s
    
Click Radio Button Select Parent
    Click Element    ${IPAM}
    Sleep    1s
    
Click Div Details Network
    Click Element    ${DIV_NETWORK_DETAIL}
    Sleep    1s         
Message Should Be Appeared
    [Arguments]    ${MESSAGE_LOCATOR}
    Wait Until Element Is Visible    ${MESSAGE_LOCATOR}
    Sleep    2s     
    
Click Button Next Request ID
    Click Button    ${BUTTON_NEXT_REQUEST}
    Sleep    2s
    
Click Button Next Enter Data
    Click Button    ${BUTTON_NEXT_ENTER_DATA}
    Sleep    2s  
    
Click Button Next Submit Review
    Click Button    ${BUTTON_SUBMIT_REVIEW}  
    Sleep    2s
    
Button Next Request ID Should Be Gray Color
    ${BUTTON_NEXT_ENTER_DATA_COLOR}    Execute Javascript    return document.defaultView.getComputedStyle(document.getElementById("request-detail-next-button"),null)['background-color']  
    Should Be Equal    ${BUTTON_NEXT_ENTER_DATA_COLOR}    rgb(250, 250, 250)
    Sleep    2s    
    
Button Next Enter Data Should Be Gray Color
    ${BUTTON_NEXT_ENTER_DATA_COLOR}    Execute Javascript    return document.defaultView.getComputedStyle(document.getElementById("enter-data-next-button"),null)['background-color']  
    Should Be Equal    ${BUTTON_NEXT_ENTER_DATA_COLOR}    rgb(250, 250, 250) 
    Sleep    2s 
    
Disable Element
    [Arguments]    ${ELEMENT}
    Element Should Be Disabled    ${ELEMENT}
    
Enable Element
    [Arguments]    ${ELEMENT}
    Element Should Be Enabled    ${ELEMENT} 
    
Split to Lines and Remove Header
    [Arguments]    ${FILE_CONTENT}
    @{LINES}=    Split To Lines    ${FILE_CONTENT}
    Remove From List    ${LINES}    0
    [Return]    @{LINES}  
    
Process Data File
    [Arguments]    ${FILE_NAME}
    ${FILE_CONTENT}=   Get File    ${FILE_NAME}
    Log    File Content: ${FILE_CONTENT}
    @{LINES}=    Split to Lines and Remove Header   ${FILE_CONTENT}     
    : FOR    ${DATA}    IN    @{LINES}
    \    Log    ${DATA}
    \    Should Contain Any    ${STATUS_REQUSET}    
    \    @{COLUMNS}=    Split String    ${DATA}    separator=,
    Log    ${COLUMNS}
    [Return]    ${COLUMNS}     
              
Get Result From File CSV
    # %{HOMEDRIVE}%{HOMEPATH}\\Downloads\\
    Click Element    ${DOWNLOAD_CSV_IN_HOMEPAGE}    
    Sleep    5s  
    Log Environment Variables
    Log    %{HOMEDRIVE}  
    Log    %{HOMEPATH}               
    ${FILE}    Wait Until Keyword Succeeds    1 min    2 sec    Download Should Be Done   %{HOMEDRIVE}%{HOMEPATH}\\Downloads\\
    ${STATUS}=   Process Data File    ${FILE}
    Log     ${STATUS}    
    Remove Files    %{HOMEDRIVE}%{HOMEPATH}\\Downloads\\*.csv
    [Return]    ${STATUS}
    
Download Should Be Done
    [Arguments]    ${directory}
    [Documentation]    Verifies that the directory has only one folder and it is not a temp file.
    ...
    ...    Returns path to the file
    ${files}    List Files In Directory    ${directory}
    Should Not Match Regexp    ${files[0]}    (?i).*\\.tmp    Chrome is still downloading a file
    ${file}    Join Path    ${directory}    ${files[0]}
    Log    File was successfully downloaded to ${file}
    [Return]    ${file} 
    