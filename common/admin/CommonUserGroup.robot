*** Settings ***

Documentation     Common keywords for databases
#--------------------------------------------------------------------------------------------------------------
Library		SeleniumLibrary		# Selenium framework
#---------------------------------------------------------------------------------------------------------------
Resource    CommonKeywords.robot
#--------------------------------------------------------------------------------------------------------------
*** Keywords ***

Exist User    [Arguments]    ${NAME}
    [Documentation]    Check user existance in the list by given name
    ${FLAG}    Set Variable    ${False}
    ${TEMP}=    Exist Element in JMap Table Component a    theForm:tabView:tblUsers    ${NAME}
    Return From Keyword If    '${TEMP}'!='${True}'    ${FLAG}
    Return From Keyword If    '${TEMP}'=='${True}'    ${True}

Select User    [Arguments]    ${NAME}
    [Documentation]    Select user in the list by given name
    Wait Until Element Is Enabled    theForm:tabView:tblUsers    timeout=10s    
    Select Element in JMap Table Component    theForm:tabView:tblUsers    ${NAME}
    
Go to User Config Page    [Arguments]    ${NAME}
    [Documentation]    Click the user name in the list to enter Configuration page
    Wait Until Element Is Enabled    theForm:tabView:tblUsers    timeout=10s
    Click Element in JMap Table Component    theForm:tabView:tblUsers    ${NAME}
    
Create New User    [Arguments]    ${NAME}    ${PASSWORD}    ${FULLNAME}    ${EMAIL}
    [Documentation]    Create new user with the given name a description
    Click Create Button
    Input Text    viewEditUserForm:name    ${NAME}
    Input Text    viewEditUserForm:password    ${PASSWORD}
    Input Text    viewEditUserForm:passwordConfirm    ${PASSWORD}
    Input Text    viewEditUserForm:userFullName    ${FULLNAME}
    Input Text    viewEditUserForm:emailInput    ${EMAIL}
    Wait Until Element Is Enabled    xpath://div[@id='viewEditUserForm:viewEditUserDialog']//span[contains(text(),'Save')]    
    Click Element    xpath://div[@id='viewEditUserForm:viewEditUserDialog']//span[contains(text(),'Save')]    
    
Delete Given User    [Arguments]    ${NAME}
    [Documentation]    Check for user existance and delete the user is exist
    ${TEMP}=    Exist User    ${NAME}
    Run Keyword If    '${TEMP}'=='${True}'    Wait Until Element Is Enabled    theForm:tabView:tblUsers    
    Run Keyword If    '${TEMP}'=='${True}'    Select Element in JMap Table Component    theForm:tabView:tblUsers    ${NAME}
    Run Keyword If    '${TEMP}'=='${True}'    Wait Until Element Is Enabled    xpath://button[@id='theForm:cmlDelete']    
    Run Keyword If    '${TEMP}'=='${True}'    Click Element    xpath://button[@id='theForm:cmlDelete']
    Run Keyword If    '${TEMP}'=='${True}'    Wait Until Element Is Enabled    xpath://span[contains(text(),'Yes')]    
    Run Keyword If    '${TEMP}'=='${True}'    Click Element    xpath://span[contains(text(),'Yes')]
    Page Should Not Contain    ${NAME}   