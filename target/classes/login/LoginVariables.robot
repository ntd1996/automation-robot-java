*** Variables ***
${USERNAME}			    xpath=id("login_username")
${PASSWORD}			    xpath=id("login_password")
${BUTTON_LOGIN}		    xpath=id("login_submit-btn")
${REQUIRED_USERNAME}    ${USERNAME}/../span/p
${REQUIRED_PASSWORD}    ${PASSWORD}/../span/p
${INVALID_LOGIN}        xpath=id("toast-container")/div/div
