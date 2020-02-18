*** Settings ***

Documentation     Tests extension Documents 7.2 in JMap Admin 7.0
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Library		SeleniumLibrary		# Selenium framework
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Resource    ../../../../../../../common/CommonLogin.robot
Resource    ../../../../../../../common/admin/CommonKeywords.robot
Resource    ../../../../../../../common/admin/CommonProject.robot
Resource    ../../../../../../../common/admin/CommonLayer.robot
Resource    ../../../../../../../common/admin/CommonDatabase.robot
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
Suite Setup    Login JMap Admin    administrator    ${EMPTY}    English    ${LOGIN URL}    ${DELAY}
Test Teardown    Run Keyword If Test Failed    Reload Page
Suite Teardown		Logout JMap    ${True}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Variables ***

${DELAY}    0.5
${LOGIN URL}      http://192.168.0.25:8080/jmapadmin/login.jsf
${DBNAME}    PostgresPhoto
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Test Cases ***

Create an Attribute Form with JMap Photo Component
    [Documentation]    Test Case to create Attribute Form with JMap Photo Component from JMap
    Create an Attribute Form with JMap Photo Component
    
Create an Attribute Form with External Database Photo Component    
    [Documentation]    Test Case to create Attribute Form with JMap Photo Component from External Database    
    Create an Attribute Form with External Database Photo Component    ${DBNAME}

Create an Attribute Form with Empty External Database Photo Component    
    [Documentation]    Test Case to create Attribute Form with JMap Photo Component with Empty External Database    
    Create an Attribute Form with Empty External Database Photo Component
    
Create an Attribute Form with Empty External Database Table Photo Component    
    [Documentation]    Test Case to create Attribute Form with JMap Photo Component with Empty External Database Table   
    Create an Attribute Form with Empty External Database Table Photo Component    ${DBNAME}

Create an Attribute Form with Empty External Database id Photo Component    
    [Documentation]    Test Case to create Attribute Form with JMap Photo Component with Empty External Database Photo id   
    Create an Attribute Form with Empty External Database id Photo Component    ${DBNAME}    

Create an Attribute Form with Empty External Database ElementId Photo Component    
    [Documentation]    Test Case to create Attribute Form with JMap Photo Component with Empty External Database Element Id   
    Create an Attribute Form with Empty External Database ElementId Photo Component    ${DBNAME}    

Create an Attribute Form with Empty External Database FileName Photo Component    
    [Documentation]    Test Case to create Attribute Form with JMap Photo Component with Empty External Database File Name   
    Create an Attribute Form with Empty External Database FileName Photo Component    ${DBNAME}

Create an Attribute Form with Empty External Database PhotoData Photo Component    
    [Documentation]    Test Case to create Attribute Form with JMap Photo Component with Empty External Database Photo Data   
    Create an Attribute Form with Empty External Database PhotoData Photo Component    ${DBNAME}

Create an Attribute Form with External Disk Photo Component
    [Documentation]    Test Case to create Attribute Form with JMap Photo Component from External Database and Disk Save   
    Create an Attribute Form with External Disk Photo Component    ${DBNAME}

Create Attribute Form with Empty Name
    [Documentation]    Test Case to create Attribute Form with Empty Name
    Create Attribute Form with Empty Name
    
Create Attribute Form with Duplicated Name
    [Documentation]    Test Case to create Attribute Form with Empty Name
    Create Attribute Form with Duplicated Name
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Keywords ***

Create an Attribute Form with JMap Photo Component
    [Documentation]    This test case was created to work with 'Forms Photo' end points. Go to project layer and check for permissions for admin user and add them  if they are missing
    ...    Go to Form page and delete the old one and create a new one with JMap Storage photo component and save
    Go to Projects
    Open Project    The World
    Go to Layers Page
    Go to Layer Details    Cities
    Go to Layer Permissions Page
    Wait Until Element Is Enabled    id:theForm:tabViewPermissionsOwners:tblPrincipals    timeout=100s    
    ${EXISTUSER}=    Exist Element in JMap Table Component td    theForm:tabViewPermissionsOwners:tblPrincipals    administrator
    Run Keyword If    '${EXISTUSER}'!='${True}'    Add Permissions to a User    administrator    Add elements    Modify attribute values    Modify elements    Delete elements        
    Run Keyword If    '${EXISTUSER}'!='${True}'    Clicks on Save Permissions
    Go to Forms Page
    Wait Until Element Is Enabled    id:theForm:tabViewForms:tblForms    timeout=100s    
    ${EXISTFORM}=    Exist Element in JMap Table Component a    theForm:tabViewForms:tblForms   Attribute Form    
    Run Keyword If    '${EXISTFORM}'=='${True}'    Delete Attribute Form    Attribute Form 
    Create Attribute Form    Attribute Form
    Add Component for an Attribute    Photo form    PHOTO    0    0    ${False}    ${True}    JMap    Database    ${True}    PostgresDB    public.phototable    id    objectid    filename    photo    title    comment    C:\    
    Save Form Layout
    Page Should Contain    Attribute Form
    Go to Projects
    
Create an Attribute Form with External Database Photo Component    [Arguments]    ${DBNAME}
    [Documentation]    This test case was created to work with 'Forms Photo' end points. Check for Database existance and create one if not exist
    ...    Go to project layer and check for permissions for admin user and add them  if they are missing
    ...    Go to Form page and delete the old one and create a new one with External DB Storage photo component and save
    Go to Databases
    ${EXISTDB}=    Exist database    ${DBNAME}
    Run Keyword If    '${EXISTDB}'!='${True}'    Create new database    ${DBNAME}    ${DBNAME} Description
    Run Keyword If    '${EXISTDB}'!='${True}'    Select database driver    PostgreSQL
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database host    192.168.0.65    PostgreSQL
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database port    5436    PostgreSQL
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database    postgis    PostgreSQL
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database Username    postgres
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database Password    postgres
    Run Keyword If    '${EXISTDB}'!='${True}'    Click Next Button
    Run Keyword If    '${EXISTDB}'!='${True}'    Click Finish Button
    Page Should Contain    ${DBNAME}
    Go to Projects
    Open Project    The World
    Go to Layers Page
    Go to Layer Details    Cities
    Go to Layer Permissions Page
    Wait Until Element Is Enabled    id:theForm:tabViewPermissionsOwners:tblPrincipals    timeout=100s    
    ${EXISTUSER}=    Exist Element in JMap Table Component td    theForm:tabViewPermissionsOwners:tblPrincipals    administrator
    Run Keyword If    '${EXISTUSER}'!='${True}'    Add Permissions to a User    administrator    Add elements    Modify attribute values    Modify elements    Delete elements        
    Run Keyword If    '${EXISTUSER}'!='${True}'    Clicks on Save Permissions
    Go to Forms Page
    Wait Until Element Is Enabled    id:theForm:tabViewForms:tblForms    timeout=100s    
    ${EXISTFORM}=    Exist Element in JMap Table Component a    theForm:tabViewForms:tblForms    Attribute Form    
    Run Keyword If    '${EXISTFORM}'=='${True}'    Delete Attribute Form    Attribute Form       
    Create Attribute Form    Attribute Form
    Add Component for an Attribute    External Photo form    EXTERNALPHOTO    0    0    ${False}    ${True}    External    Database    ${True}    ${DBNAME}    public.phototable    id    objectid    filename    photo    title    comment    C:\        
    Save Form Layout
    Page Should Contain    Attribute Form
    Go to Projects

Create an Attribute Form with Empty External Database Photo Component
    [Documentation]    This test case was created to work with 'Forms Photo' end points. 
    ...    Go to project layer and check for permissions for admin user and add them  if they are missing
    ...    Go to Form page and delete the old one and create a new one with empty External DB Storage photo component and save. 
    ...    Validate the error message and cancel    
    Go to Projects
    Open Project    The World
    Go to Layers Page
    Go to Layer Details    Cities
    Go to Forms Page
    Wait Until Element Is Enabled    id:theForm:tabViewForms:tblForms    timeout=100s    
    ${EXISTFORM}=    Exist Element in JMap Table Component a    theForm:tabViewForms:tblForms    Attribute Form    
    Run Keyword If    '${EXISTFORM}'=='${True}'    Delete Attribute Form    Attribute Form       
    Create Attribute Form    Attribute Form
    Add Component for an Attribute    External Photo form    EMPTYEXTERNALPHOTODB    0    0    ${False}    ${True}    External    Database    ${True}    ${EMPTY}    public.phototable    id    objectid    filename    photo    title    comment    C:\        
    Page Should Contain    Required value
    Wait Until Element Is Enabled    xpath://button[@id='formBuilderForm:cancelFieldPropertiesButton']//span[text()='Cancel']    timeout=100s    
    Click Element    xpath://button[@id='formBuilderForm:cancelFieldPropertiesButton']//span[text()='Cancel']
    Wait Until Element Is Enabled    xpath://button[@id='formBuilderForm:cancelFormButton']//span[text()='Cancel']    timeout=100s    
    Click Element    xpath://button[@id='formBuilderForm:cancelFormButton']//span[text()='Cancel']    
    Go to Projects

Create an Attribute Form with Empty External Database Table Photo Component    [Arguments]    ${DBNAME}
    [Documentation]    This test case was created to work with 'Forms Photo' end points. 
    ...    Go to project layer and check for permissions for admin user and add them  if they are missing
    ...    Go to Form page and delete the old one and create a new one with External DB Storage photo component with empty table and save. 
    ...    Validate the error message and cancel         
    Go to Databases
    ${EXISTDB}=    Exist database    ${DBNAME}
    Run Keyword If    '${EXISTDB}'!='${True}'    Create new database    ${DBNAME}    ${DBNAME} Description
    Run Keyword If    '${EXISTDB}'!='${True}'    Select database driver    PostgreSQL
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database host    192.168.0.65    PostgreSQL
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database port    5436    PostgreSQL
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database    postgis    PostgreSQL
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database Username    postgres
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database Password    postgres
    Run Keyword If    '${EXISTDB}'!='${True}'    Click Next Button
    Run Keyword If    '${EXISTDB}'!='${True}'    Click Finish Button
    Page Should Contain    ${DBNAME}
    Go to Projects
    Open Project    The World
    Go to Layers Page
    Go to Layer Details    Cities
    Go to Forms Page
    Wait Until Element Is Enabled    id:theForm:tabViewForms:tblForms    timeout=100s    
    ${EXISTFORM}=    Exist Element in JMap Table Component a    theForm:tabViewForms:tblForms    Attribute Form    
    Run Keyword If    '${EXISTFORM}'=='${True}'    Delete Attribute Form    Attribute Form       
    Create Attribute Form    Attribute Form
    Add Component for an Attribute    External Photo form    EMPTYEXTERNALPHOTOTABLE    0    0    ${False}    ${True}    External    Database    ${True}    ${DBNAME}    ${EMPTY}    id    objectid    filename    photo    title    comment    C:\        
    Wait Until Element Is Visible    xpath://span[@class='ui-message-error-detail']    timeout=100s    
    Page Should Contain    Required value
    Wait Until Element Is Enabled    xpath://button[@id='formBuilderForm:cancelFieldPropertiesButton']//span[text()='Cancel']    timeout=100s    
    Click Element    xpath://button[@id='formBuilderForm:cancelFieldPropertiesButton']//span[text()='Cancel']
    Wait Until Element Is Enabled    xpath://button[@id='formBuilderForm:cancelFormButton']//span[text()='Cancel']    timeout=100s    
    Click Element    xpath://button[@id='formBuilderForm:cancelFormButton']//span[text()='Cancel']
    Go to Projects

Create an Attribute Form with Empty External Database id Photo Component    [Arguments]    ${DBNAME}
      [Documentation]    This test case was created to work with 'Forms Photo' end points. 
    ...    Go to project layer and check for permissions for admin user and add them  if they are missing
    ...    Go to Form page and delete the old one and create a new one with External DB Storage photo component with empty database id and save. 
    ...    Validate the error message and cancel        
    Go to Databases
    ${EXISTDB}=    Exist database    ${DBNAME}
    Run Keyword If    '${EXISTDB}'!='${True}'    Create new database    ${DBNAME}    ${DBNAME} Description
    Run Keyword If    '${EXISTDB}'!='${True}'    Select database driver    PostgreSQL
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database host    192.168.0.65    PostgreSQL
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database port    5436    PostgreSQL
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database    postgis    PostgreSQL
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database Username    postgres
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database Password    postgres
    Run Keyword If    '${EXISTDB}'!='${True}'    Click Next Button
    Run Keyword If    '${EXISTDB}'!='${True}'    Click Finish Button
    Page Should Contain    ${DBNAME}
    Go to Projects
    Open Project    The World
    Go to Layers Page
    Go to Layer Details    Cities
    Go to Forms Page
    Wait Until Element Is Enabled    id:theForm:tabViewForms:tblForms    timeout=100s    
    ${EXISTFORM}=    Exist Element in JMap Table Component a    theForm:tabViewForms:tblForms    Attribute Form    
    Run Keyword If    '${EXISTFORM}'=='${True}'    Delete Attribute Form    Attribute Form       
    Create Attribute Form    Attribute Form
    Add Component for an Attribute    External Photo form    EXTERNALPHOTO    0    0    ${False}    ${True}    External    Database    ${True}    ${DBNAME}    public.phototable    ${EMPTY}    objectid    filename    photo    title    comment    C:\        
    Wait Until Element Is Visible    xpath://span[@class='ui-message-error-detail']    timeout=100s    
    Page Should Contain    Required value
    Wait Until Element Is Enabled    xpath://button[@id='formBuilderForm:cancelFieldPropertiesButton']//span[text()='Cancel']    timeout=200s    
    Click Element    xpath://button[@id='formBuilderForm:cancelFieldPropertiesButton']//span[text()='Cancel']
    Wait Until Element Is Enabled    xpath://button[@id='formBuilderForm:cancelFormButton']//span[text()='Cancel']    timeout=200s    
    Click Element    xpath://button[@id='formBuilderForm:cancelFormButton']//span[text()='Cancel']
    Go to Projects

Create an Attribute Form with Empty External Database ElementId Photo Component    [Arguments]    ${DBNAME}
      [Documentation]    This test case was created to work with 'Forms Photo' end points. 
    ...    Go to project layer and check for permissions for admin user and add them  if they are missing
    ...    Go to Form page and delete the old one and create a new one with External DB Storage photo component with empty element id and save. 
    ...    Validate the error message and cancel        
    Go to Databases
    ${EXISTDB}=    Exist database    ${DBNAME}
    Run Keyword If    '${EXISTDB}'!='${True}'    Create new database    ${DBNAME}    ${DBNAME} Description
    Run Keyword If    '${EXISTDB}'!='${True}'    Select database driver    PostgreSQL
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database host    192.168.0.65    PostgreSQL
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database port    5436    PostgreSQL
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database    postgis    PostgreSQL
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database Username    postgres
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database Password    postgres
    Run Keyword If    '${EXISTDB}'!='${True}'    Click Next Button
    Run Keyword If    '${EXISTDB}'!='${True}'    Click Finish Button
    Page Should Contain    ${DBNAME}
    Go to Projects
    Open Project    The World
    Go to Layers Page
    Go to Layer Details    Cities
    Go to Forms Page
    Wait Until Element Is Enabled    id:theForm:tabViewForms:tblForms    timeout=100s    
    ${EXISTFORM}=    Exist Element in JMap Table Component a    theForm:tabViewForms:tblForms    Attribute Form    
    Run Keyword If    '${EXISTFORM}'=='${True}'    Delete Attribute Form    Attribute Form       
    Create Attribute Form    Attribute Form
    Add Component for an Attribute    External Photo form    EXTERNALPHOTO    0    0    ${False}    ${True}    External    Database    ${True}    ${DBNAME}    public.phototable    id    ${EMPTY}    filename    photo    title    comment    C:\        
    Wait Until Element Is Visible    xpath://span[@class='ui-message-error-detail']    timeout=100s    
    Page Should Contain    Required value
    Wait Until Element Is Enabled    xpath://button[@id='formBuilderForm:cancelFieldPropertiesButton']//span[text()='Cancel']    timeout=100s    
    Click Element    xpath://button[@id='formBuilderForm:cancelFieldPropertiesButton']//span[text()='Cancel']
    Wait Until Element Is Enabled    xpath://button[@id='formBuilderForm:cancelFormButton']//span[text()='Cancel']    timeout=100s    
    Click Element    xpath://button[@id='formBuilderForm:cancelFormButton']//span[text()='Cancel']
    Go to Projects

Create an Attribute Form with Empty External Database FileName Photo Component    [Arguments]    ${DBNAME}
      [Documentation]    This test case was created to work with 'Forms Photo' end points. 
    ...    Go to project layer and check for permissions for admin user and add them  if they are missing
    ...    Go to Form page and delete the old one and create a new one with External DB Storage photo component with empty file name and save. 
    ...    Validate the error message and cancel        
    Go to Databases
    ${EXISTDB}=    Exist database    ${DBNAME}
    Run Keyword If    '${EXISTDB}'!='${True}'    Create new database    ${DBNAME}    ${DBNAME} Description
    Run Keyword If    '${EXISTDB}'!='${True}'    Select database driver    PostgreSQL
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database host    192.168.0.65    PostgreSQL
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database port    5436    PostgreSQL
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database    postgis    PostgreSQL
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database Username    postgres
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database Password    postgres
    Run Keyword If    '${EXISTDB}'!='${True}'    Click Next Button
    Run Keyword If    '${EXISTDB}'!='${True}'    Click Finish Button
    Page Should Contain    ${DBNAME}
    Go to Projects
    Open Project    The World
    Go to Layers Page
    Go to Layer Details    Cities
    Go to Forms Page
    Wait Until Element Is Enabled    id:theForm:tabViewForms:tblForms    timeout=100s    
    ${EXISTFORM}=    Exist Element in JMap Table Component a    theForm:tabViewForms:tblForms    Attribute Form    
    Run Keyword If    '${EXISTFORM}'=='${True}'    Delete Attribute Form    Attribute Form       
    Create Attribute Form    Attribute Form
    Add Component for an Attribute    External Photo form    EXTERNALPHOTO    0    0    ${False}    ${True}    External    Database    ${True}    ${DBNAME}    public.phototable    id    objectid    ${EMPTY}    photo    title    comment    C:\        
    Wait Until Element Is Visible    xpath://span[@class='ui-message-error-detail']    timeout=100s    
    Page Should Contain    Required value
    Wait Until Element Is Enabled    xpath://button[@id='formBuilderForm:cancelFieldPropertiesButton']//span[text()='Cancel']    timeout=100s    
    Click Element    xpath://button[@id='formBuilderForm:cancelFieldPropertiesButton']//span[text()='Cancel']
    Wait Until Element Is Enabled    xpath://button[@id='formBuilderForm:cancelFormButton']//span[text()='Cancel']    timeout=100s    
    Click Element    xpath://button[@id='formBuilderForm:cancelFormButton']//span[text()='Cancel']
    Go to Projects

Create an Attribute Form with Empty External Database PhotoData Photo Component    [Arguments]    ${DBNAME}
      [Documentation]    This test case was created to work with 'Forms Photo' end points. 
    ...    Go to project layer and check for permissions for admin user and add them  if they are missing
    ...    Go to Form page and delete the old one and create a new one with External DB Storage photo component with empty data and save. 
    ...    Validate the error message and cancel        
    Go to Databases
    ${EXISTDB}=    Exist database    ${DBNAME}
    Run Keyword If    '${EXISTDB}'!='${True}'    Create new database    ${DBNAME}    ${DBNAME} Description
    Run Keyword If    '${EXISTDB}'!='${True}'    Select database driver    PostgreSQL
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database host    192.168.0.65    PostgreSQL
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database port    5436    PostgreSQL
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database    postgis    PostgreSQL
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database Username    postgres
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database Password    postgres
    Run Keyword If    '${EXISTDB}'!='${True}'    Click Next Button
    Run Keyword If    '${EXISTDB}'!='${True}'    Click Finish Button
    Page Should Contain    ${DBNAME}
    Go to Projects
    Open Project    The World
    Go to Layers Page
    Go to Layer Details    Cities
    Go to Forms Page
    Wait Until Element Is Enabled    id:theForm:tabViewForms:tblForms    timeout=100s    
    ${EXISTFORM}=    Exist Element in JMap Table Component a    theForm:tabViewForms:tblForms    Attribute Form    
    Run Keyword If    '${EXISTFORM}'=='${True}'    Delete Attribute Form    Attribute Form       
    Create Attribute Form    Attribute Form
    Add Component for an Attribute    External Photo form    EXTERNALPHOTO    0    0    ${False}    ${True}    External    Database    ${True}    ${DBNAME}    public.phototable    id    objectid    filename    ${EMPTY}    title    comment    C:\        
    Wait Until Element Is Visible    xpath://span[@class='ui-message-error-detail']    timeout=100s    
    Page Should Contain    Required value
    Wait Until Element Is Enabled    xpath://button[@id='formBuilderForm:cancelFieldPropertiesButton']//span[text()='Cancel']    timeout=100s    
    Click Element    xpath://button[@id='formBuilderForm:cancelFieldPropertiesButton']//span[text()='Cancel']
    Wait Until Element Is Enabled    xpath://button[@id='formBuilderForm:cancelFormButton']//span[text()='Cancel']    timeout=100s    
    Click Element    xpath://button[@id='formBuilderForm:cancelFormButton']//span[text()='Cancel']
    Go to Projects
  
Create an Attribute Form with External Disk Photo Component    [Arguments]    ${DBNAME}
    [Documentation]    This test case was created to work with 'Forms Photo' end points. Check for Database existance and create one if not exist
    ...    Go to project layer and check for permissions for admin user and add them  if they are missing
    ...    Go to Form page and delete the old one and create a new one with External DB Storage and Disk Persistance photo component and save
    Go to Databases
    ${EXISTDB}=    Exist database    ${DBNAME}
    Run Keyword If    '${EXISTDB}'!='${True}'    Create new database    ${DBNAME}    ${DBNAME} Description
    Run Keyword If    '${EXISTDB}'!='${True}'    Select database driver    PostgreSQL
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database host    192.168.0.65    PostgreSQL
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database port    5436    PostgreSQL
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database    postgis    PostgreSQL
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database Username    postgres
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database Password    postgres
    Run Keyword If    '${EXISTDB}'!='${True}'    Click Next Button
    Run Keyword If    '${EXISTDB}'!='${True}'    Click Finish Button
    Page Should Contain    ${DBNAME}
    Go to Projects
    Open Project    The World
    Go to Layers Page
    Go to Layer Details    Cities
    Go to Layer Permissions Page
    Wait Until Element Is Enabled    id:theForm:tabViewPermissionsOwners:tblPrincipals    timeout=100s    
    ${EXISTUSER}=    Exist Element in JMap Table Component td    theForm:tabViewPermissionsOwners:tblPrincipals    administrator
    Run Keyword If    '${EXISTUSER}'!='${True}'    Add Permissions to a User    administrator    Add elements    Modify attribute values    Modify elements    Delete elements        
    Run Keyword If    '${EXISTUSER}'!='${True}'    Clicks on Save Permissions
    Go to Forms Page
    Wait Until Element Is Enabled    id:theForm:tabViewForms:tblForms    timeout=100s    
    ${EXISTFORM}=    Exist Element in JMap Table Component a    theForm:tabViewForms:tblForms    Attribute Form
    Run Keyword If    '${EXISTFORM}'=='${True}'    Delete Attribute Form    Attribute Form 
    Create Attribute Form    Attribute Form
    Add Component for an Attribute    Disk Photo form    EXTERNALPHOTO    0    0    ${False}    ${True}    External    Disk    ${True}    ${DBNAME}    public.phototable    id    objectid    filename    photo    title    comment    C:\
    Save Form Layout
    Page Should Contain    Attribute Form
    Go to Projects
    
Create Attribute Form with Empty Name
    [Documentation]    This test case was created to work with 'Forms Photo' end points. 
    ...    Go to project layer.  Go to Form page and create a new one with empty name 
    ...    Validate the error message and cancel
    Go to Projects
    Open Project    The World
    Go to Layers Page
    Go to Layer Details    Cities
    Go to Forms Page
    Create Attribute Form    ${EMPTY}
    Wait Until Element Is Visible    xpath://span[@class='ui-message-error-detail']    timeout=100s    
    Page Should Contain    Required value
    Wait Until Element Is Enabled    xpath://div[@id='formPropertiesForm:formPropertiesDialog']//button//span[text()='Cancel']    timeout=100s        
    Click Element    xpath://div[@id='formPropertiesForm:formPropertiesDialog']//button//span[text()='Cancel']    
   
Create Attribute Form with Duplicated Name 
    [Documentation]    This test case was created to work with 'Forms Photo' end points. 
    ...    Go to project layer.  Go to Form page and create a new one with duplicated name 
    ...    Validate the error message and cancel   
    Create an Attribute Form with JMap Photo Component
    Open Project    The World
    Go to Layers Page
    Go to Layer Details    Cities
    Go to Forms Page
    Create Attribute Form    Attribute Form
    Wait Until Element Is Visible    xpath://span[@class='ui-message-error-detail']    timeout=100s    
    Page Should Contain    Duplicated name
    Wait Until Element Is Enabled    xpath://div[@id='formPropertiesForm:formPropertiesDialog']//button//span[text()='Cancel']    timeout=100s        
    Click Element    xpath://div[@id='formPropertiesForm:formPropertiesDialog']//button//span[text()='Cancel']    
    