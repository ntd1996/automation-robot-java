*** Variables ***
${URL}                          http://dev01-ci01.pcn.lab:8001
${FOOTER}                       xpath=//a[contains(@href, 'https://www.pcn-inc.com')] 
${BROWSER}                      Chrome       
${BUTTON_HOME}                  xpath=id("main-menu-container")/ul/li[contains(text(),"Home")]    
${SELF_SERVICE}                 xpath=id("main-menu-container")/ul/li[contains(text(),"Self-Service")] 
${CONFIGURATION}                ${LOGOUT}/button[contains(class(), "top-button")]
${LOGOUT}                       xpath=id("top-bar_logout-btn")
