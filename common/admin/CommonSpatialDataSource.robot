*** Settings ***

Documentation     Common keywords for databases
#--------------------------------------------------------------------------------------------------------------
Library		SeleniumLibrary		# Selenium framework
#---------------------------------------------------------------------------------------------------------------
Resource    CommonKeywords.robot
#--------------------------------------------------------------------------------------------------------------
*** Keywords ***

Exist Data Source    [Arguments]    ${NAME}
    [Documentation]    Check data source existance in the list by given name
    ${FLAG}    Set Variable    ${False}
    ${TEMP}=    Exist Element in JMap Table Component a    theForm:tblDataSource    ${NAME}
    Return From Keyword If    '${TEMP}'!='${True}'    ${FLAG}
    Return From Keyword If    '${TEMP}'=='${True}'    ${True}

Select Data Sources    [Arguments]    ${LIST_NAME}
    [Documentation]    Select data source in the list by given name
    Wait Until Element Is Enabled    id:theForm:tblDataSource    timeout=1000s
    Wait Until Page Contains Element    id:theForm:tblDataSource    timeout=1000s
    ${LENGTH}=    Get Length    ${LIST_NAME}
    
    :FOR    ${INDEX}    IN RANGE    0    ${LENGTH}
    \    Wait Until Element Is Enabled    id:theForm:tblDataSource:columnName:filter    timeout=1000s
    \    Wait Until Element Is Enabled    id:theForm:tblDataSource    timeout=1000s
    \    Wait Until Page Contains Element    id:theForm:tblDataSource    timeout=1000s   
    \    Input Text    xpath://input[@id='theForm:tblDataSource:columnName:filter']    ${LIST_NAME[${INDEX}]}
    \    Wait Until Element Is Enabled    id:theForm:tblDataSource    timeout=1000s
    \    Wait Until Page Contains Element    id:theForm:tblDataSource    timeout=1000s    
    \    Select Element in JMap Table Component    theForm:tblDataSource    ${LIST_NAME[${INDEX}]}
    \    Wait Until Element Is Enabled    id:theForm:tblDataSource:columnName:filter    timeout=1000s
    \    Clear Element Text    xpath://input[@id='theForm:tblDataSource:columnName:filter']
    \    Press Keys    xpath://input[@id='theForm:tblDataSource:columnName:filter']    RETURN
                       
Select Data Source    [Arguments]    ${LIST_NAME}
    [Documentation]    Select data source in the list by given name
    Wait Until Element Is Enabled    id:theForm:tblDataSource    timeout=1000s
    Wait Until Page Contains Element    id:theForm:tblDataSource    timeout=1000s    
    Wait Until Element Is Enabled    id:theForm:tblDataSource:columnName:filter    timeout=1000s
    Wait Until Element Is Enabled    id:theForm:tblDataSource    timeout=1000s
    Wait Until Page Contains Element    id:theForm:tblDataSource    timeout=1000s   
    Input Text    xpath://input[@id='theForm:tblDataSource:columnName:filter']    ${LIST_NAME}
    Wait Until Element Is Enabled    id:theForm:tblDataSource    timeout=1000s
    Wait Until Page Contains Element    id:theForm:tblDataSource    timeout=1000s    
    Select Element in JMap Table Component    theForm:tblDataSource    ${LIST_NAME}
    Wait Until Element Is Enabled    id:theForm:tblDataSource:columnName:filter    timeout=1000s
    Clear Element Text    xpath://input[@id='theForm:tblDataSource:columnName:filter']
    Press Keys    xpath://input[@id='theForm:tblDataSource:columnName:filter']    RETURN    
    
Go to Data Source Config Page    [Arguments]    ${NAME}
    [Documentation]    Click the data source name in the list to enter Configuration page
    Wait Until Element Is Enabled    id:theForm:tblDataSource    timeout=10s
    Click Element in JMap Table Component    theForm:tblDataSource    ${NAME}
    
Create New Data Source   [Arguments]    ${NAME}    ${DESCRIPTION}    ${TYPE}
    [Documentation]    Create new data source with the given name and description
    Click Create Button
    Wait Until Element Is Enabled    id:dialogForm:wizardDatasourceName    timeout=10s
    Input Text    id:dialogForm:wizardDatasourceName    ${NAME}
    Wait Until Element Is Enabled    id:dialogForm:wizardDatasourceDescription    timeout=10s
    Input Text    id:dialogForm:wizardDatasourceDescription    ${DESCRIPTION}
    Wait Until Element Is Enabled    id:dialogForm:selectOneDatasourceType    timeout=10s
    Select Element in JMap List Items Component    dialogForm:selectOneDatasourceType    ${TYPE}
    Click Next Button
    
Update One SDS    [Arguments]    ${NAME}
    [Documentation]    Select the SDS provided and click on update button. Confirm the dialog to update the SDS
    Select Data Source    ${NAME}
    Wait Until Element Is Enabled    xpath://button[@id='theForm:cmlUpdate']    timeout=10s
    Click Update Button
    Wait Until Element Is Enabled    xpath://button[@id='theForm:genericConfirmYes']//span[contains(text(),'Yes')]    timeout=10s
    Click Element    xpath://button[@id='theForm:genericConfirmYes']//span[contains(text(),'Yes')]        
    
Delete Given Data Source    [Arguments]    ${DATA_SOURCE_NAME}
    [Documentation]    Check for SDS existance and delete the SDS if exist
    Go to Spatial Datasources
    ${TEMP}=    Exist Data Source    ${DATA_SOURCE_NAME}
    Run Keyword If    '${TEMP}'=='${True}'    Wait Until Element Is Enabled    theForm:tblDataSource    
    Run Keyword If    '${TEMP}'=='${True}'    Select Element in JMap Table Component    theForm:tblDataSource    ${DATA_SOURCE_NAME}
    Run Keyword If    '${TEMP}'=='${True}'    Wait Until Element Is Enabled    xpath://button[@id='theForm:cmlDelete']    
    Run Keyword If    '${TEMP}'=='${True}'    Click Element    xpath://button[@id='theForm:cmlDelete']
    Run Keyword If    '${TEMP}'=='${True}'    Wait Until Element Is Enabled    xpath://span[contains(text(),'Yes')]    
    Run Keyword If    '${TEMP}'=='${True}'    Click Element    xpath://span[contains(text(),'Yes')]
    Page Should Not Contain    ${DATA_SOURCE_NAME}  