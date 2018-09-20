*** Variables ***
${BUTTON_ADD_NETWORK}        xpath=id("add-network-action-button")
${BUTTON_HELP_ADD_NETWORK}   xpath=id("add-network-help-button")
${BUTTON_LOVE_ADD_NETWORK}   xpath=id("add-network-love-button")
${DESCRIPTION_ADD_NETWORK}   xpath=id("add-network-box")/div[contains(@class, "item-description flex-box flex-align-center")]
${ADD_NET_WORK_SUB_GROUP_TEST}        xpath=//core-select/div/ul/li
${IPAM}                               css=input[name="tableSelection"]
${IPAM_TEST_PERMISSION}               xpath=(//input[@name='tableSelection'])[10]
${BUTTON_CANCEL_REQUEST}        xpath=id("request-detail-cancel-button")
${TEXT_FILED_REQUEST_ID}        xpath=id("request-details_change-id")
${BUTTON_NEXT_REQUEST}          xpath=id("request-detail-next-button")
${MESSGAE_REQUIRE_ID}           ${TEXT_FILED_REQUEST_ID}/../span/p
${CONTAINER_REQUEST}            xpath=id("request-detail")
${CONTAINER_ENTER_DATA}         xpath=id("enter-data")
${BUTTON_CANCEL_ENTER_DATA}     xpath=id("enter-data-cancel-button")
${BUTTON_BACK_ENTER_DATA}       xpath=id("enter-data-back-button")
${BUTTON_NEXT_ENTER_DATA}       xpath=id("enter-data-next-button")
${TEXT_FIELD_CIDR}              xpath=//enter-data[@id='add-network-wizard_enter-data-container']/div/core-tabs/core-tab/div/div/div/input
${TEXT_FIELD_NAME}              xpath=//enter-data[@id='add-network-wizard_enter-data-container']/div/core-tabs/core-tab/div/div/div[2]/input
${TEXT_FIELD_SUBGROUP}          xpath=//enter-data[@id='add-network-wizard_enter-data-container']/div/core-tabs/core-tab/div/div/div[3]/core-select/div/div/input
${BUTTON_SUBMIT_REVIEW}         xpath=id("review-submit-submit-button")
${BUTTON_BACK_REVIEW}           xpath=id("review-submit-back-button")
${BUTTON_CANCEL_REVIEW}         xpath=id("review-submit-cancel-button")
${MESSAGE_REQUIRE_CIDR}         xpath=//enter-data[@id='add-network-wizard_enter-data-container']/div/core-tabs/core-tab/div/div/div/span/p
${MESSAGE_REQUIRE_NAME}         xpath=//enter-data[@id='add-network-wizard_enter-data-container']/div/core-tabs/core-tab/div/div/div[2]/span/p
${MESSAGE_INVALID_CIDR}         xpath=//enter-data[@id='add-network-wizard_enter-data-container']/div/core-tabs/core-tab/div/div/div/span/p[contains(text(), "CIDR is invalid")]
${MESSAGE_CONFLICT_CIDR}        xpath=//enter-data[@id='add-network-wizard_enter-data-container']/div/core-tabs/core-tab/div/div/div/span/p[contains(text(), "CIDR Conflict")]
${MESSAGE_OUTSIDE_CIDR}         xpath=//enter-data[@id='add-network-wizard_enter-data-container']/div/core-tabs/core-tab/div/div/div/span/p[contains(text(), "CIDR is outside current address space")]
${DIV_NETWORK_DETAIL}           xpath=//enter-data[@id='add-network-wizard_enter-data-container']/div/core-tabs/div
${SINGLE_MODE}                  xpath=//div[@id='enter-data']/div/core-tab-select/div/div/span[contains(text(), "Single")]
${MULTIPLE_MODE}                xpath=//div[@id='enter-data']/div/core-tab-select/div/div/span[contains(text(), "Multiple")]
${BUTTON_ADD_MULTI_LINE}        css=button.icon-button.background-green   
${MESSAGE_REQUIRE_PERMISSION}   xpath=//span/p[contains(text(), "You don't have write access on this Network")]
${TABLE}                        xpath=//*core-table-list[contains(@auto-tag, "existing-children-of-selected-network-container")]/div/div/table
${TEXT_FIELD_6}                 xpath=(//input[@type='text'])[6]
${TEXT_FIELD_7}                 xpath=(//input[@type='text'])[7]
${TEXT_FIELD_8}                 xpath=(//input[@type='text'])[8]
${TEXT_FIELD_9}                 xpath=(//input[@type='text'])[9]
${TEXT_FIELD_10}                xpath=(//input[@type='text'])[10]
${TEXT_FIELD_11}                xpath=(//input[@type='text'])[11]