*** Settings ***
Library    SeleniumLibrary    
Resource    HomeVariables.robot
Resource    ../variable/Elements.robot
*** Keywords ***
Home Page Should Be Appreared
    Location Should Be    ${URL}/home
    Sleep    4s    
     



