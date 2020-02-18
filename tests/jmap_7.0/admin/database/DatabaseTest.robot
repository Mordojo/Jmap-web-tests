*** Settings ***

Documentation     Tests database creation in JMap Admin 7.0
#-------------------------------------------------------------------------------------------------------------------------------------------
Library		SeleniumLibrary		# Selenium framework
#-------------------------------------------------------------------------------------------------------------------------------------------
Resource    ../../../../common/CommonLogin.robot
Resource    ../../../../common/admin/CommonDatabase.robot
#-------------------------------------------------------------------------------------------------------------------------------------------
Suite Setup    Login JMap Admin    administrator    ${EMPTY}    English    ${LOGIN URL}    ${DELAY}
Suite Teardown		Close Browser
#-------------------------------------------------------------------------------------------------------------------------------------------
*** Variables ***

${DELAY}    0.8
${LOGIN URL}      http://192.168.0.25:8080/jmapadmin/login.jsf
${SERVER}    192.168.0.25:8080
${MySQL_DB_NAME}    MySQL DB
${PostgresSQL_DB_NAME}    Postgres DB    
#-------------------------------------------------------------------------------------------------------------------------------------------    
*** Test Cases ***

Create MySQL Database    
    [Documentation]		Test creation of MySQL database. Check in the list if the DB exist, if not create the DB. If exist just validate 
	Create MySQL Database    ${MySQL_DB_NAME}    
	
Create Postgres Database
    [Documentation]		Test creation of Postgres database
	Create Postgres Database    ${PostgresSQL_DB_NAME}
	
Create database with duplicated name
    [Documentation]    Test duplicated name validation
    Create database with duplicated name

Check Comment Field in System DB 
    [Documentation]    Test Case for check the updating old db model for photo comments.
    ...    Open System Database Console and check for comment field in JMap_Documents table
    Check Comment Field in System DB
    
Delete Database 
    [Documentation]    Test Case for delete the given database
    Delete Database         
#------------------------------------------------------------------------------------------------------------------------------------------	
*** Keywords ***

Create MySQL Database    [Arguments]    ${MySQL_DB_NAME}    
    Go to Databases        
    ${TEMP}=    Exist database    ${MySQL_DB_NAME}
    Run Keyword If    '${TEMP}'!='${True}'    Create new database    ${MySQL_DB_NAME}    MySQL Description
    Run Keyword If    '${TEMP}'!='${True}'    Select database driver    MySQL    
    Run Keyword If    '${TEMP}'!='${True}'    Enter database host    192.168.5.247    MySQL
    Run Keyword If    '${TEMP}'!='${True}'    Enter database port    3306    MySQL
    Run Keyword If    '${TEMP}'!='${True}'    Enter database    pointspatial    MySQL
    Run Keyword If    '${TEMP}'!='${True}'    Enter database Username    root
    Run Keyword If    '${TEMP}'!='${True}'    Enter database Password    ${EMPTY}
    Run Keyword If    '${TEMP}'!='${True}'    Click Next Button
    Run Keyword If    '${TEMP}'!='${True}'    Click Finish Button    
    Page Should Contain    ${MySQL_DB_NAME}
    
Create Postgres Database    [Arguments]    ${PostgresSQL_DB_NAME}
    Go to Databases
    ${TEMP}=    Exist database    ${PostgresSQL_DB_NAME}
    Run Keyword If    '${TEMP}'!='${True}'    Create new database    ${PostgresSQL_DB_NAME}    Postgres Description
    Run Keyword If    '${TEMP}'!='${True}'    Select database driver    PostgreSQL
    Run Keyword If    '${TEMP}'!='${True}'    Enter database host    192.168.0.65    PostgreSQL
    Run Keyword If    '${TEMP}'!='${True}'    Enter database port    5436    PostgreSQL
    Run Keyword If    '${TEMP}'!='${True}'    Enter database    postgis    PostgreSQL
    Run Keyword If    '${TEMP}'!='${True}'    Enter database Username    postgres
    Run Keyword If    '${TEMP}'!='${True}'    Enter database Password    postgres
    Run Keyword If    '${TEMP}'!='${True}'    Click Next Button
    Run Keyword If    '${TEMP}'!='${True}'    Click Finish Button
    Page Should Contain    ${PostgresSQL_DB_NAME}
    
Create database with duplicated name
    Go to Databases
    Create new database    MySQL DB    ${EMPTY}
    Page Should Contain    Duplicated name   
    
Check Comment Field in System DB
    Go to Databases
    Go to Database Config Page    System
    Go to SQL Console    ${SERVER}
    Select All Record From Table in SQL Console    JMAP_DOCUMENTS
    Page Should Contain    COMMENT 

Delete Database
    Delete Given Database    ${MySQL_DB_NAME}                