*** Settings ***
Library    SeleniumLibrary  
Library    OperatingSystem 
Library    Collections  
Library    String 
Library    BuiltIn 
         
*** Variables ***
${USERNAME_TEST}    pthethanh@tma.com.vn
${PASSWORD_TEST}    pass123
# CASE1: USER PUTS INCORRECT USERNAME
${USERNAME_TEST_1}    INVALDUSERNAME
# CASE2: USER PUTS INCORRECT PASSWORD
${PASSWORD_TEST_1}    INVALIDPASSWORD
${BROWSER}            Firefox    
${DOWNLOAD_PATH}    ${CURDIR}
${CHROME_OPTIONS}    {"args":[],"extensions":[], "prefs": {"download.prompt_for_download":false,"download.default_directory":"${DOWNLOAD_PATH}"}}
${FIREFOX_OPTIONS}    {"preferences": {"browser.helperApps.neverAsk.saveToDisk": "text/csv","browser.helperApps.alwaysAsk.force":false,"browser.download.useDownloadDir":true,"browser.download.folderList":2,"browser.download.dir":"${DOWNLOAD_PATH}"}}


