*** Settings ***

Documentation     Common keywords for databases
#--------------------------------------------------------------------------------------------------------------
Library		SeleniumLibrary		# Selenium framework
#---------------------------------------------------------------------------------------------------------------
Resource    CommonKeywords.robot
#--------------------------------------------------------------------------------------------------------------
*** Keywords ***

Exist database    [Arguments]    ${NAME}
    [Documentation]    Check database existance in the list by given name
    ${FLAG}    Set Variable    ${False}
    ${TEMP}=    Exist Element in JMap Table Component a    theForm:tableDatabases    ${NAME}
    Return From Keyword If    '${TEMP}'!='${True}'    ${FLAG}
    Return From Keyword If    '${TEMP}'=='${True}'    ${True}

Select Database    [Arguments]    ${NAME}
    [Documentation]    Select database in the list by given name
    Wait Until Element Is Enabled    id:theForm:tableDatabases    timeout=10s    
    Select Element in JMap Table Component    theForm:tableDatabases    ${NAME}
    
Go to Database Config Page    [Arguments]    ${NAME}
    [Documentation]    Click the database name in the list to enter Configuration page
    Wait Until Element Is Enabled    id:theForm:tableDatabases    timeout=10s
    Click Element in JMap Table Component    theForm:tableDatabases    ${NAME}
    
Go to SQL Console    [Arguments]    ${SERVER}
    [Documentation]    Go to SQL Console and pas the focus to the new window
    Click Sections
    Wait Until Element Is Visible    xpath://span[contains(text(),'SQL console')]    timeout=10s    
    Click Element    xpath://span[contains(text(),'SQL console')] 
    Select Window    url:http://${SERVER}/jmapadmin/databases/sql_console.jsf?database=-2                 

Create new database    [Arguments]    ${NAME}    ${DESCRIPTION}
    [Documentation]    Create new database with the given name a description
    Click Create Button
    Input Text    id:databaseWizardForm:wizardDatabaseName    ${NAME}
    Input Text    id:databaseWizardForm:wizardDatabaseDescription    ${DESCRIPTION}
    Click Next Button
    
Select database driver    [Arguments]    ${DRIVER}
    [Documentation]    Select the database driver in the wizard
    Select Element in JMap List Items Component    databaseWizardForm:databaseDriver    ${DRIVER}
    
Enter database host    [Arguments]    ${HOST}    ${SERVER}
    [Documentation]    Type the database host in the wizard
    ${XPATH} =    Catenate    id:databaseWizardForm:wizardDatabase${SERVER}Host    
    Input Text    ${XPATH}    ${HOST}
    
Enter database port    [Arguments]    ${PORT}    ${SERVER}
    [Documentation]    Type the database port in the wizard after clean the input    
    ${XPATH} =    Catenate    id:databaseWizardForm:wizardDatabase${SERVER}Port
    Clean Input    ${XPATH}    ${PORT}
    
Enter database    [Arguments]    ${DATABASE NAME}    ${SERVER}
    [Documentation]    Type the database name in the wizard
    ${XPATH} =    Catenate    id:databaseWizardForm:wizardDatabase${SERVER}Database
    Set Focus To Element    ${XPATH}
    Input Text    ${XPATH}    ${DATABASE NAME}
    
Enter database Username    [Arguments]    ${USERNAME}
    [Documentation]    Type username in the wizard to connect to the database 
    Wait Until Element Is Enabled    id:databaseWizardForm:txtUsername    timeout=10s        
    Input Text    id:databaseWizardForm:txtUsername    ${USERNAME}
    
Enter database Password    [Arguments]    ${PASSWORD}
    [Documentation]    Type password in the wizard to connect to the database
    Wait Until Element Is Enabled    id:databaseWizardForm:txtPassword    timeout=10s    
    Input Text    id:databaseWizardForm:txtPassword    ${PASSWORD} 
    
Select All Record From Table in SQL Console    [Arguments]    ${TABLENAME}
    [Documentation]    Type sql query to select all records from a given table in SQL console and click execute button 
    Wait Until Element Is Enabled    xpath://textarea[@id='textAreaSqlQuery']    timeout=10s    
    Input Text    xpath://textarea[@id='textAreaSqlQuery']    select * from ${TABLENAME}
    Wait Until Element Is Enabled    xpath://button[@id='executeButton']    timeout=10s    
    Click Button    xpath://button[@id='executeButton']                

Delete Given Database    [Arguments]    ${DATABASE_NAME}
    [Documentation]    Check for DB existance and delete the DB is exist
    Go to Databases
    ${TEMP}=    Exist database    ${DATABASE_NAME}
    Run Keyword If    '${TEMP}'=='${True}'    Wait Until Element Is Enabled    id:theForm:tableDatabases    
    Run Keyword If    '${TEMP}'=='${True}'    Select Element in JMap Table Component    theForm:tableDatabases    ${DATABASE_NAME}
    Run Keyword If    '${TEMP}'=='${True}'    Wait Until Element Is Enabled    xpath://button[@id='theForm:cmlDelete']    
    Run Keyword If    '${TEMP}'=='${True}'    Click Element    xpath://button[@id='theForm:cmlDelete']
    Run Keyword If    '${TEMP}'=='${True}'    Wait Until Element Is Enabled    xpath://span[contains(text(),'Yes')]    
    Run Keyword If    '${TEMP}'=='${True}'    Click Element    xpath://span[contains(text(),'Yes')]
    Page Should Not Contain    ${DATABASE_NAME}   