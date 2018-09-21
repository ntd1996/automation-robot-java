*** Settings ***
Library    SeleniumLibrary 
Library    OperatingSystem   
Library    String    
Resource    AddNetworkActions.robot
Resource    ../base/Common.robot

*** Keywords ***
User Cancel Form Add New Network 
    Click Button Cancel Form Add New Network
    
User Choose IPAM Parent
    [Arguments]    ${ELEMENT}
    Click Element In Frame IPAM    ${ELEMENT}  
    
User Go To Form Add Network
     [Arguments]    ${REQUEST_ID}
    Click Button Add Network
    User Enter ID To Text Field Request ID And Click Next    ${REQUEST_ID}
    
User Go To Mulltiple Mode
    [Arguments]    ${INDEX_1}    ${INDEX_2}
    Click Multiple Mode
    Multiple Click Element    ${BUTTON_ADD_MULTI_LINE}    ${INDEX_1}    ${INDEX_2} 
    
User Go To Submit Form In Add Network
    Click Button Next Enter Data 
    
User Submit New Request In Add Network 
    Click Button Next Submit Review
    
User Put Data In Form New Network
    [Arguments]    ${REQUEST_ID}    ${CIDR}    ${NAME}    ${PARENT_IPAM}
    User Go To Form Add Network    ${REQUEST_ID}
    User Input Data To CIDR Name And SubGroup    ${CIDR}    ${NAME}    ${PARENT_IPAM}
    Click Text Field Sub-Group
    
User Must Be See Element Disable
    [Arguments]    ${ELEMENT}
    Disable Element   ${ELEMENT}
    
User Enter ID To Text Field Request ID And Click Next
    [Arguments]    ${REQUEST_ID}
    Input Text To Request ID Text Field    ${REQUEST_ID}  
    Click Button Next Request ID   
    
User Not Enter ID In Text Field Request ID
    Click Button Add Network
    Click Text Field Request ID    
    Click Container
    Message Require ID Must Be Appeared
    Button Next Request ID Should Be Gray Color
    
User Enter Data But Clear Text
    [Arguments]    ${ID_REQUEST}
    ${length}=    Get Length    ${TEXT_FILED_REQUEST_ID}
    Click Button Add Network
    Click Text Field Request ID
    Input Text To Request ID Text Field    ${ID_REQUEST}  
    Clear Text In Text Field Request ID
    Run Keyword If    ${length} == 0    Message Require ID Must Be Appeared 
    Click Button Next Request ID
    
User Input Data To CIDR Name And SubGroup
    [Arguments]    ${CIDR}    ${NAME}    ${ELEMENT}
    Click Element In Frame IPAM      ${ELEMENT}
    Input Text To CIDR Text Field    ${CIDR}
    Input Text To Name Text Field    ${NAME}
   
User Add New Network
    [Arguments]    ${CIDR}    ${NAME}    ${ELEMENT}
    Click Element In Frame IPAM      ${ELEMENT}
    Input Text To CIDR Text Field    ${CIDR}
    Input Text To Name Text Field    ${NAME}
    Click Text Field Sub-Group
    Click Button Next Enter Data  
    Click Button Next Submit Review
    
User Add New Network Level 1
    [Arguments]    ${CIDR}    ${NAME}    ${ELEMENT}
    Click Element In Frame IPAM      ${ELEMENT}
    Input Text To CIDR Text Field    ${CIDR}
    Input Text To Name Text Field    ${NAME}
    Click Button Next Enter Data  
    Click Button Next Submit Review
    
User Not Put Data To Populate Any Required Fields
    [Arguments]    ${ELEMENT}    ${REQUEST_ID}
    User Go To Form Add Network    ${REQUEST_ID}
    Click Text Field CIDR    
    Click Text Field Name
    Message Require CIDR Must Be Appeared
    Click Div Details Network
    Message Require Name Must Be Appeared
    User Must Be See Element Disable    ${ELEMENT}    
    
User Not Enter Data To Populate Any Required Fields
    Radio Button Should Be Disable
    Click Text Field CIDR
    Message Require CIDR Must Be Appeared
    Click Text Field Name
    Message Require Name Must Be Appeared
    Button Next Enter Data Should Be Gray Color
    
User Add CIDR Error1
    [Arguments]    ${INVALID}    ${CONFILCT}    ${OUTSIDE}    ${NAME}
    Click Element In Frame IPAM    ${IPAM}
    Input Text To CIDR Text Field  ${INVALID}
    Message Should Be Appeared     ${MESSAGE_INVALID_CIDR}
    Input Text To Name Text Field  ${NAME}
    Click Text Field Sub-Group
    Input Text To CIDR Text Field  ${CONFILCT}
    Message Should Be Appeared     ${MESSAGE_CONFLICT_CIDR}
    Input Text To CIDR Text Field  ${OUTSIDE}
    Message Should Be Appeared     ${MESSAGE_OUTSIDE_CIDR}  
    
User Add CIDR Invalid
    [Arguments]    ${INVALID}    ${NAME}
    Input Text To CIDR Text Field  ${INVALID}
    Input Text To Name Text Field  ${NAME}
    Click Text Field Sub-Group
    
User Add CIDR Error
    [Arguments]    ${CIDR}    
    Input Text To CIDR Text Field  ${CIDR}
    
User Select Parent Network
     Click Element In Frame IPAM    ${IPAM}
     
User Add New Block
    [Arguments]    ${CIDR}    ${NAME}    ${ELEMENT}
    Click Element In Frame IPAM      ${ELEMENT}
    Input Text To CIDR Text Field    ${CIDR}
    Input Text To Name Text Field    ${NAME}
    Click Text Field Sub-Group   
    
User Click Multiple Button Add New Line
    User Enter ID To Text Field Request ID And Click Next    ${ID}
    Multiple Click Element    ${BUTTON_ADD_MULTI_LINE}    1    3
    
User Back To Add Network Page And Check New Request Success
    [Arguments]    ${DATA_CHECK}
    Click Button Add Network
    User Enter ID To Text Field Request ID And Click Next    ${ID}
    Click Element In Frame IPAM    ${IPAM}
    Sleep    7s    
    Page Should Contain   ${DATA_CHECK}    
    
User Back To Add Network Page And Check New Request Failed
    [Arguments]    ${DATA}
    Click Button Add Network
    User Enter ID To Text Field Request ID And Click Next    ${ID}
    Click Element In Frame IPAM    ${IPAM}
    Sleep    7s    
    Page Should Not Contain    ${DATA}     
        
User Navigate To Multiple Mode
    Click Element    ${MULTIPLE_MODE}
    Multiple Click Element    ${BUTTON_ADD_MULTI_LINE}    1   3
    Sleep    3s  
    
User Check Request Sucess In Table
    [Arguments]    ${DATA}
    Page Should Contain    ${DATA}
    
User Check Request Failed In Table
    [Arguments]    ${DATA}
    Page Should Not Contain   ${DATA}      
        
User Input Text To Text Field Multiple Mode
    [Arguments]    ${CIDR_INVALID}    ${NAME_ADDNETWORK}    ${SUB_GROUP_ADDNETWORK}    ${CIDR_INVALID_2}    ${NAME_ADDNETWORK_2}    ${SUB_GROUP_ADDNETWORK_2}
    Input Text    ${TEXT_FIELD_6}    ${CIDR_INVALID}
    Input Text    ${TEXT_FIELD_7}    ${NAME_ADDNETWORK}
    Input Text    ${TEXT_FIELD_8}    ${SUB_GROUP_ADDNETWORK}
    Input Text    ${TEXT_FIELD_9}    ${CIDR_INVALID_2}
    Input Text    ${TEXT_FIELD_10}    ${NAME_ADDNETWORK_2}
    Input Text    ${TEXT_FIELD_11}    ${SUB_GROUP_ADDNETWORK_2}
    
User Submit Request
    [Arguments]    ${CIDR_INVALID}    ${NAME_ADDNETWORK}    ${SUB_GROUP_ADDNETWORK}    ${CIDR_INVALID_2}    ${NAME_ADDNETWORK_2}    ${SUB_GROUP_ADDNETWORK_2}
    User Input Text To Text Field Multiple Mode    ${CIDR_INVALID}    ${NAME_ADDNETWORK}    ${SUB_GROUP_ADDNETWORK}    ${CIDR_INVALID_2}    ${NAME_ADDNETWORK_2}    ${SUB_GROUP_ADDNETWORK_2}
    Enable Element    ${BUTTON_NEXT_ENTER_DATA}
    Click Button Next Enter Data
    Click Button Next Submit Review   
    
User Not Enter Data To Require Field In Multiple Mode
    User Input Text To Text Field Multiple Mode    ${CIDR_TS_12_1}     ${NAME_ADDNETWORK_TS_12_1}      ${SUB_GROUP_TS_12_1}    ${CIDR_TS_12_2}     ${NAME_ADDNETWORK_TS_12_2}      ${SUB_GROUP_TS_12_2}
    ${LENGTH_TEXT_FIELD6}=    Get Value    ${TEXT_FIELD_6}  
    ${LENGTH_TEXT_FIELD7}=    Get Value    ${TEXT_FIELD_7}
    ${LENGTH_TEXT_FIELD9}=    Get Value    ${TEXT_FIELD_9}
    ${LENGTH_TEXT_FIELD10}=    Get Value    ${TEXT_FIELD_10}
    ${length1}    Get Length    ${LENGTH_TEXT_FIELD6}
    ${length2}    Get Length    ${LENGTH_TEXT_FIELD7}
    ${length3}    Get Length    ${LENGTH_TEXT_FIELD9}
    ${length4}    Get Length    ${LENGTH_TEXT_FIELD10}
    Run Keyword If    ${length1}==0    Disable Element    ${BUTTON_NEXT_ENTER_DATA}
    ...    else
    ...    Enable Element    ${BUTTON_NEXT_ENTER_DATA}
    Run Keyword If    ${length2}==0    Disable Element    ${BUTTON_NEXT_ENTER_DATA}
    ...    else
    ...    Enable Element    ${BUTTON_NEXT_ENTER_DATA}
    Run Keyword If    ${length3}==0    Disable Element    ${BUTTON_NEXT_ENTER_DATA}
    ...    else
    ...    Enable Element    ${BUTTON_NEXT_ENTER_DATA}
    Run Keyword If    ${length4}==0    Disable Element    ${BUTTON_NEXT_ENTER_DATA}
    ...    else
    ...    Enable Element    ${BUTTON_NEXT_ENTER_DATA}
    
User Cancel Request Form
    Click Button Cancel In Request Form  
    
User Go To Home Page Download CSV
    [Arguments]    ${EXPECT_STATUS}
    User Go To Home Page    
    Get Result From File CSV    ${EXPECT_STATUS}
    
User Check New Request In Table Sub-Network
    User Go To Self Service Page
    Click Button Add Network
    User Enter ID To Text Field Request ID And Click Next    ${ID}
    Click Element In Frame IPAM    ${IPAM}
    


    