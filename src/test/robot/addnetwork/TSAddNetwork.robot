*** Settings ***
Library    SeleniumLibrary       
Resource    ../../../main/robot/selfservice/addnetwork/AddNetworkFunctions.robot
Resource    ../../resources/data/login/LoginData.robot
Resource    ../../../main/robot/selfservice/base/Common.robot
Resource    ../../../main/robot/selfservice/variable/Elements.robot
Resource    ../../resources/data/addnetwork/AddNetworkData.robot
Suite Setup    User Go To PCN Portal Resource With PCN URL    ${USERNAME_TEST}    ${PASSWORD_TEST}
Suite Teardown    Close Browser

Test Setup    User Go To Self Service Page
Test Teardown  User Back To Home Page
Force Tags    TS_Add_Network

*** Test Cases ***
# test case in single mode
User Not Entering An ICCM/Jira Number Should Generate An Error
    [Documentation]    User not enter id to text field request id
    [Tags]    TS_Add_Network_1
    User Not Enter ID In Text Field Request ID
    User Must Be See Element Disable   ${BUTTON_NEXT_REQUEST}
    User Cancel Request Form
       
User Attempting To Create Block Of Any Size Where A Netowrk Or Block Currently Exists Should Not Be Possible
    [Documentation]    user attempting to create a block of any size where a network or block currently exists (whether the new block is either smaller, equal, or larger) should not be possible
    [Tags]    TS_Add_Network_2
    User Put Data In Form New Network    ${ID}    ${CIDR_SMALLER}    ${NAME_ADDNETWORK_TS_2}    ${IPAM}
    User Must Be See Message    ${MESSAGE_CONFLICT_CIDR}
    User Must Be See Element Disable    ${BUTTON_NEXT_ENTER_DATA}
    User Cancel Form Add New Network 
      
User Selecting A Block For Which A User Does Not Have Write Access Should Generate An Error
    [Documentation]    portal require user must have permission for this request
    [Tags]    TS_Add_Network_3
    User Put Data In Form New Network    ${ID}    ${CIDR_NOT_HAVE_PERMISSION}    ${NAME_ADDNETWORK_TS_3}    ${IPAM_TEST_PERMISSION}
    User Must Be See Message    ${MESSAGE_REQUIRE_PERMISSION}
    User Must Be See Element Disable    ${BUTTON_NEXT_ENTER_DATA}
    User Cancel Form Add New Network 
    
User Failing To Populate Any Require Fields Should Generate An Error
    [Documentation]    user not enter data in form add network
    [Tags]    TS_Add_Network_4
    User Not Put Data To Populate Any Required Fields    ${BUTTON_NEXT_ENTER_DATA}    ${ID}
    User Must Be See Message    ${MESSAGE_REQUIRE_CIDR}
    User Cancel Form Add New Network 
    
User Add Invalid CIDR Should Generate An Error
    [Documentation]    user add cidr invalid with select parent
    [Tags]    TS_Add_Network_5
    User Go To Form Add Network    ${ID}
    User Select Parent Network
    User Add CIDR Invalid    ${CIDR_INVALID}    ${NAME_ADDNETWORK_TS_5}
    User Must Be See Message    ${MESSAGE_INVALID_CIDR}
    User Must Be See Element Disable   ${BUTTON_NEXT_ENTER_DATA}
    User Cancel Form Add New Network 
    
User Add Outside CIDR Should Generate An Error
    [Documentation]    user add cidr outside in network
    [Tags]    TS_Add_Network_6
    User Go To Form Add Network    ${ID}
    User Select Parent Network
    User Add CIDR Invalid    ${CIDR_OUTSIDE}    ${NAME_ADDNETWORK_TS_6}
    User Must Be See Message    ${MESSAGE_OUTSIDE_CIDR}
    User Must Be See Element Disable   ${BUTTON_NEXT_ENTER_DATA}
    User Cancel Form Add New Network 
    
User Submitting A Valid Request Should Result In Appropriate Block Creation With Appropriate Tags Or Created Tags
    [Documentation]    user create correct block and submit successfully
    [Tags]    TS_Add_Network_7
    User Go To Form Add Network    ${ID}
    User Add New Network    ${CIDR}    ${NAME_ADDNETWORK_TS_7}    ${IPAM}
    User Go To Home Page Download CSV
    User Go To Self Service Page
    User Go To Form Add Network    ${ID}
    User Choose IPAM Parent    ${IPAM}
    User Check Request Sucess In Table    ${CIDR}
    User Cancel Form Add New Network 
    
# test case in multiple mode
User Attempting To Create Block Of Any Size Where A Netowrk Or Block Currently Exists Should Not Be Possible(Multiple mode)
    [Documentation]    user attempting to create a block of any size where a network or block currently exists (whether the new block is either smaller, equal, or larger) should not be possible
    [Tags]    TS_Add_Network_10
    User Go To Form Add Network    ${ID}
    User Go To Mulltiple Mode        ${LINE_INDEX_1}    ${LINE_INDEX_2}
    User Input Text To Text Field Multiple Mode    ${CIDR_SMALLER}    ${NAME_ADDNETWORK_TS_10_1}    ${SUB_GROUP_MULTIPLE_MODE}    ${CIDR_SMALLER_MULTIPLE_2}    ${NAME_ADDNETWORK_TS_10_2}    ${SUB_GROUP_MULTIPLE_MODE}
    User Go To Submit Form In Add Network
    User Submit New Request In Add Network 
    User Go To Home Page Download CSV
    User Go To Self Service Page
    User Go To Form Add Network    ${ID}
    User Choose IPAM Parent    ${IPAM}
    User Check Request Failed In Table    ${CIDR_SMALLER_MULTIPLE_1}
    User Check Request Failed In Table    ${CIDR_SMALLER_MULTIPLE_2}
    User Cancel Form Add New Network 

User Selecting A Block For Which A User Does Not Have Write Access Should Generate An Error(Multiple mode)
    [Documentation]    portal require user must have permission for this request
    [Tags]    TS_Add_Network_11
    User Go To Form Add Network    ${ID}
    User Go To Mulltiple Mode        ${LINE_INDEX_1}    ${LINE_INDEX_2}
    User Input Text To Text Field Multiple Mode    ${CIDR_NOT_HAVE_PERMISSION}    ${NAME_ADDNETWORK_TS_11_1}    ${SUB_GROUP_MULTIPLE_MODE}    ${CIDR_NOT_HAVE_PERMISSION_2}    ${NAME_ADDNETWORK_TS_11_2}    ${SUB_GROUP_MULTIPLE_MODE}
    User Go To Submit Form In Add Network
    User Submit New Request In Add Network 
    User Go To Home Page Download CSV
    User Go To Self Service Page
    User Go To Form Add Network    ${ID}
    User Choose IPAM Parent    ${IPAM_TEST_PERMISSION}
    User Check Request Failed In Table    ${CIDR_NOT_HAVE_PERMISSION}
    User Check Request Failed In Table    ${CIDR_NOT_HAVE_PERMISSION_2}
    User Cancel Form Add New Network 

User Failing To Populate Any Require Fields Should Generate An Error(Multiple mode)
    [Documentation]    user not enter data in form add network
    [Tags]    TS_Add_Network_12
    User Go To Form Add Network    ${ID}
    User Go To Mulltiple Mode        ${LINE_INDEX_1}    ${LINE_INDEX_2}
    User Not Enter Data To Require Field In Multiple Mode
    User Cancel Form Add New Network
    
User Add Invalid CIDR Should Generate An Error(Multiple mode)
    [Documentation]    user add cidr invalid with select parent
    [Tags]    TS_Add_Network_13
    User Go To Form Add Network    ${ID}
    User Go To Mulltiple Mode        ${LINE_INDEX_1}    ${LINE_INDEX_2}
    User Input Text To Text Field Multiple Mode    ${CIDR_INVALID}    ${NAME_ADDNETWORK_TS_13_1}    ${SUB_GROUP_MULTIPLE_MODE}    ${CIDR_INVALID_2}    ${NAME_ADDNETWORK_TS_13_2}    ${SUB_GROUP_MULTIPLE_MODE}
    User Go To Submit Form In Add Network
    User Submit New Request In Add Network 
    User Go To Home Page Download CSV
    User Go To Self Service Page
    User Go To Form Add Network    ${ID}
    User Choose IPAM Parent    ${IPAM}
    User Check Request Failed In Table    ${CIDR_INVALID}
    User Check Request Failed In Table    ${CIDR_INVALID_2}
    User Cancel Form Add New Network 

User Submitting A Valid Request Should Result In Appropriate Block Creation(Multiple mode)
    [Documentation]    user create correct block and submit successfully
    [Tags]    TS_Add_Network_14
    User Go To Form Add Network    ${ID}
    User Go To Mulltiple Mode        ${LINE_INDEX_1}    ${LINE_INDEX_2}
    User Input Text To Text Field Multiple Mode    ${CIDR_MULTIPLE_1}    ${NAME_ADDNETWORK_TS_14_1}    ${SUB_GROUP_MULTIPLE_MODE}    ${CIDR_MULTIPLE_2}    ${NAME_ADDNETWORK_TS_14_2}    ${SUB_GROUP_MULTIPLE_MODE}
    User Go To Submit Form In Add Network
    User Submit New Request In Add Network 
    User Go To Home Page Download CSV
    User Go To Self Service Page
    User Go To Form Add Network    ${ID}
    User Choose IPAM Parent    ${IPAM}
    User Check Request Sucess In Table    ${CIDR_MULTIPLE_1}
    User Check Request Sucess In Table    ${CIDR_MULTIPLE_2}
    User Cancel Form Add New Network 

    
    
    
    
