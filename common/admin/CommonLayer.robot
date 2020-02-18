*** Settings ***

Documentation     Common keywords for layers
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Library		SeleniumLibrary		# Selenium framework
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Resource    CommonKeywords.robot
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Keywords ***

Add new Layer
    [Documentation]    Add new layer. Click on the Button and select Create
    Wait Until Element Is Enabled    id:theForm:buttonAddCloneLayer_button    timeout=100s    
    Click Button    id:theForm:buttonAddCloneLayer_button
    Wait Until Element Is Enabled    xpath://*[@id='theForm:buttonAddCloneLayer_menu']//span[text()='Create']    timeout=100s    
    Click Element    xpath://*[@id='theForm:buttonAddCloneLayer_menu']//span[text()='Create']
    
Select Layer Datasource    [Arguments]    ${DATASOURCE NAME}
    [Documentation]    Select the layer datasource
    Wait Until Element Is Enabled    xpath://*[@id='dialogForm:wizardProjectLayerDatasource']//span    timeout=100s    
    Click Element    xpath://*[@id='dialogForm:wizardProjectLayerDatasource']//span
    ${XPATH} =    Catenate	SEPARATOR=    //*[@id='dialogForm:wizardProjectLayerDatasource_items']/li[@data-label='    ${DATASOURCE NAME}    ']
    Click Element    xpath:${XPATH}
    
Enter Layer Name    [Arguments]    ${LAYERNAME}
    [Documentation]    Type layer name in the wizard and click next
    Wait Until Element Is Enabled    id:dialogForm:wizardProjectLayerName    timeout=100s    
    Input Text    id:dialogForm:wizardProjectLayerName    ${LAYERNAME}
    Go Next in Layer Wizard
    
Go Next in Layer Wizard
    [Documentation]    Click next in the layer wizard
    Wait Until Element Is Enabled    xpath://*[@id='dialogForm:projectLayerWizardDialog']//span[text()='Next']    timeout=100s    
    Click Element    xpath://*[@id='dialogForm:projectLayerWizardDialog']//span[text()='Next']
    
Bind All Layer Attributes
    [Documentation]    Bind all 
    Wait Until Element Is Enabled    xpath://*[@id='dialogForm:wizardProjectLayerDataBinding']//button[@title='Add All']    timeout=100s    
    Click Button    xpath://*[@id='dialogForm:wizardProjectLayerDataBinding']//button[@title='Add All']
    Go Next in Layer Wizard
    
Enter Geometry Angle
    Go Next in Layer Wizard
    
Select Request Mode    [Arguments]    ${REQUESTMODE}
    [Documentation]    Select the mode to load the layer's elements.
    ...    @param {REQUESTMODE}
    ...    @values: Load by tile, Load by region
    ${XPATH} =    Catenate	SEPARATOR=    //*[@id='dialogForm:wizardProjectLayerRequestMode']//label[text()='    ${REQUESTMODE}    ']
    Click Element    xpath:${XPATH}
    
Click Finish Layer Wizard
    [Documentation]    Click finish in layer wizard
    Wait Until Element Is Enabled    xpath://*[@id='dialogForm:wizardButtons']//span[text()='Finish']    timeout=100s    
    Click Element    xpath://*[@id='dialogForm:wizardButtons']//span[text()='Finish']
    
Go to Layer Details    [Arguments]    ${LAYERNAME}
    [Documentation]    Click layer name in the list to go to Configuration page
    ${XPATH} =    Catenate	SEPARATOR=    //a[text()='    ${LAYERNAME}    ']
    Click Link    xpath:${XPATH}

Go to Layer Permissions Page
    [Documentation]    Go to layer permission page
    Click Sections
    Wait Until Element Is Visible    xpath://span[text()='Permissions']    timeout=100s    
    Click Element    xpath://span[text()='Permissions']

Go to Layer MouseOver Page
    [Documentation]    Go to layer mouse over page
    Click Sections
    Wait Until Element Is Visible    xpath://span[text()='Mouseover']    timeout=100s    
    Click Element    xpath://span[text()='Mouseover']

Go to Forms Page
    [Documentation]    Go to layer form page
    Click Sections
    Wait Until Element Is Visible    xpath://span[text()='Forms']    timeout=100s
    Click Element    xpath://span[text()='Forms']

Clicks on Save Permissions
    [Documentation]    Save permissions
    Wait Until Element Is Enabled    xpath://*[@id="topbar"]//span[text()='Save']    timeout=100s    
    Click Element    xpath://*[@id="topbar"]//span[text()='Save']

Create Attribute Form    [Arguments]    ${FORMNAME}
    [Documentation]    Create Attribute form with the given name        
    Wait Until Element Is Enabled    xpath://span[text()='Create']    timeout=100s    
    Click Element    xpath://span[text()='Create']
    Wait Until Element Is Enabled    xpath://input[@id='formPropertiesForm:formName']    timeout=100s    
    Input Text    xpath://input[@id='formPropertiesForm:formName']    ${FORMNAME}
    Wait Until Element Is Enabled    xpath://*[@id="formPropertiesForm:formPropertiesDialog"]//button/span[text()='Save']    timeout=100s    
    Click Element    xpath://*[@id="formPropertiesForm:formPropertiesDialog"]//button/span[text()='Save']

Create Database Photo Form    [Arguments]    ${FORMNAME}    ${DATABASENAME}    ${SQL_QUERY}    ${ID}
    [Documentation]    Create Database form with the given name        
    Wait Until Element Is Enabled    xpath://span[text()='Create']    timeout=100s    
    Click Element    xpath://span[text()='Create']
    Wait Until Element Is Enabled    xpath://table[@id='formPropertiesForm:selectOneRadioFormType']//label[contains(text(),'Database')]    timeout=100s    
    Click Element    xpath://table[@id='formPropertiesForm:selectOneRadioFormType']//label[contains(text(),'Database')]    
    Wait Until Element Is Enabled    xpath://input[@id='formPropertiesForm:formName']    timeout=100s    
    Input Text    xpath://input[@id='formPropertiesForm:formName']    ${FORMNAME}
    Wait Until Element Is Enabled    id:formPropertiesForm:externalDatabasePoolId    timeout=100s    
    Select Element in JMap List Items Component    formPropertiesForm:externalDatabasePoolId    ${DATABASENAME}
    Wait Until Element Is Visible    xpath://textarea[@id='formPropertiesForm:tabViewQueries:externalDatabaseSelectQuery']    timeout=100s    
    Input Text    xpath://textarea[@id='formPropertiesForm:tabViewQueries:externalDatabaseSelectQuery']    ${SQL_QUERY}
    Wait Until Element Is Enabled    xpath://span[contains(text(),'Execute')]    timeout=100s
    Click Element    xpath://span[contains(text(),'Execute')]
    Sleep    30 seconds        
    Wait Until Element Is Enabled    id:formPropertiesForm:tabViewQueries:selectUniqueIdentifier    timeout=100s    
    Select Element in JMap List Items Component with Timeout    formPropertiesForm:tabViewQueries:selectUniqueIdentifier    ${ID}    10    
    Wait Until Element Is Enabled    xpath://*[@id="formPropertiesForm:formPropertiesDialog"]//button/span[text()='Save']    timeout=100s    
    Click Element    xpath://*[@id="formPropertiesForm:formPropertiesDialog"]//button/span[text()='Save']    
                
Delete Attribute Form    [Arguments]    ${FORMNAME}
    [Documentation]    Delete the attribute form by the given name
    Wait Until Element Is Enabled    id:theForm:tabViewForms:tblForms    timeout=100s        
    Select Element in JMap Table Component    theForm:tabViewForms:tblForms    ${FORMNAME}
    Click Delete Button
    Click Confirmation Dialog

Add Component for an Attribute    [Arguments]    ${ATTRIBUTE}    ${COMPONENT}    ${ROW}    ${COL}    ${REQUIRED}    ${READONLY}    ${STORAGE}    ${PERSISTENCE}    ${DELWITHELEMENTS}    ${DB}    ${TABLE}    ${PHOTOID}    ${ELEMENTID}    ${FILENAME}    ${PHOTODATA}    ${PHOTOTITLE}    ${PHOTOCOMMENT}    ${FOLDERPATH}
    [Documentation]    Slots configuration.  e.g. //*[@id="formBuilderForm:field_drop_0_0"]
    ...    [0 0] [0 1] [0 2] ....
    ...    [1 0] [1 1] [1 2]
    ...    ...
    Run Keyword If    '${COMPONENT}'=='INPUT_TEXT'    Drag And Drop    xpath://*[@id="formBuilderForm:imgFormField_TYPE_INPUT_TEXT"]    xpath://*[@id="formBuilderForm:field_drop_${ROW}_${COL}"]
    Run Keyword If    '${COMPONENT}'=='SELECT_ONE'    Drag And Drop    xpath://*[@id="formBuilderForm:imgFormField_TYPE_SELECT_ONE"]    xpath://*[@id="formBuilderForm:field_drop_${ROW}_${COL}"]
    Run Keyword If    '${COMPONENT}'=='SELECT_BOOLEAN'    Drag And Drop    xpath://*[@id="formBuilderForm:imgFormField_TYPE_SELECT_BOOLEAN"]    xpath://*[@id="formBuilderForm:field_drop_${ROW}_${COL}"]
    Run Keyword If    '${COMPONENT}'=='SELECT_MANY'    Drag And Drop    xpath://*[@id="formBuilderForm:imgFormField_TYPE_SELECT_MANY"]    xpath://*[@id="formBuilderForm:field_drop_${ROW}_${COL}"]
    Run Keyword If    '${COMPONENT}'=='INPUT_DATE'    Drag And Drop    xpath://*[@id="formBuilderForm:imgFormField_TYPE_INPUT_DATE"]    xpath://*[@id="formBuilderForm:field_drop_${ROW}_${COL}"]
    Run Keyword If    '${COMPONENT}'=='TREE'    Drag And Drop    xpath://*[@id="formBuilderForm:imgFormField_TYPE_TREE"]    xpath://*[@id="formBuilderForm:field_drop_${ROW}_${COL}"]
    Run Keyword If    '${COMPONENT}'=='INPUT_RANGE'    Drag And Drop    xpath://*[@id="formBuilderForm:imgFormField_TYPE_INPUT_RANGE"]    xpath://*[@id="formBuilderForm:field_drop_${ROW}_${COL}"]
    Wait Until Element Is Enabled    xpath://*[@id="formBuilderForm:imgFormField_TYPE_DOCUMENT"]    timeout=100s
    Wait Until Page Contains Element    xpath://*[@id="formBuilderForm:imgFormField_TYPE_DOCUMENT"]    timeout=100s        
    Run Keyword If    '${COMPONENT}'=='PHOTO'    Drag And Drop    xpath://*[@id="formBuilderForm:imgFormField_TYPE_DOCUMENT"]    xpath://*[@id="formBuilderForm:field_drop_${ROW}_${COL}"]
    Run Keyword If    '${COMPONENT}'=='EXTERNALPHOTO'    Drag And Drop    xpath://*[@id="formBuilderForm:imgFormField_TYPE_DOCUMENT"]    xpath://*[@id="formBuilderForm:field_drop_${ROW}_${COL}"]
    Run Keyword If    '${COMPONENT}'=='EMPTYEXTERNALPHOTODB'    Drag And Drop    xpath://*[@id="formBuilderForm:imgFormField_TYPE_DOCUMENT"]    xpath://*[@id="formBuilderForm:field_drop_${ROW}_${COL}"]
    Run Keyword If    '${COMPONENT}'=='EMPTYEXTERNALPHOTOTABLE'    Drag And Drop    xpath://*[@id="formBuilderForm:imgFormField_TYPE_DOCUMENT"]    xpath://*[@id="formBuilderForm:field_drop_${ROW}_${COL}"]
    Run Keyword If    '${COMPONENT}'=='DATABASEFORMEXTERNALPHOTO'    Drag And Drop    xpath://*[@id="formBuilderForm:imgFormField_TYPE_DOCUMENT"]    xpath://*[@id="formBuilderForm:field_drop_${ROW}_${COL}"]
    
    Wait Until Element Is Enabled    xpath://*[@id="formBuilderForm:field_drop_${ROW}_${COL}"]//a[@aria-label='Edit properties']    timeout=100s
    Click Element    xpath://*[@id="formBuilderForm:field_drop_${ROW}_${COL}"]//a[@aria-label='Edit properties']    #//*[@id="formBuilderForm:field_drop_${ROW}_${COL}"]//a[@aria-label='Delete field']

    Run Keyword If    '${COMPONENT}'=='INPUT_TEXT'    Configure Input Text Component    ${ATTRIBUTE}    ${REQUIRED}    ${READONLY}    ${ATTRIBUTE}
    Run Keyword If    '${COMPONENT}'=='SELECT_ONE'    Configure Select One Component    ${ATTRIBUTE}    ${REQUIRED}    ${READONLY}    ${ATTRIBUTE}
    Run Keyword If    '${COMPONENT}'=='SELECT_BOOLEAN'    Configure Select Boolean Component    ${ATTRIBUTE}    ${READONLY}    ${ATTRIBUTE}    1    0
    Run Keyword If    '${COMPONENT}'=='SELECT_MANY'    Configure Select Many Component    ${ATTRIBUTE}    ${REQUIRED}    ${READONLY}    ${ATTRIBUTE}
    Run Keyword If    '${COMPONENT}'=='INPUT_DATE'    Configure Input Date Component    ${ATTRIBUTE}    ${REQUIRED}    ${READONLY}    ${ATTRIBUTE}
    Run Keyword If    '${COMPONENT}'=='TREE'    Configure Tree Component    ${ATTRIBUTE}    ${REQUIRED}    ${READONLY}    ${ATTRIBUTE}
    Run Keyword If    '${COMPONENT}'=='INPUT_RANGE'    Configure Input Range Component    ${ATTRIBUTE}    ${REQUIRED}    ${READONLY}    ${ATTRIBUTE}
    Run Keyword If    '${COMPONENT}'=='PHOTO'    Configure Photo Component    ${ATTRIBUTE}    ${STORAGE}    ${DELWITHELEMENTS}        
    Run Keyword If    '${COMPONENT}'=='EXTERNALPHOTO'    Configure External Photo Component    ${ATTRIBUTE}    ${STORAGE}    ${PERSISTENCE}    ${DELWITHELEMENTS}    ${DB}    ${TABLE}    ${PHOTOID}    ${ELEMENTID}    ${FILENAME}    ${PHOTODATA}    ${PHOTOTITLE}    ${PHOTOCOMMENT}    ${FOLDERPATH}
    Run Keyword If    '${COMPONENT}'=='EMPTYEXTERNALPHOTODB'    Configure External Photo Component With Empty Database     ${ATTRIBUTE}    ${STORAGE}    ${PERSISTENCE}    ${DELWITHELEMENTS}    ${DB}    ${TABLE}    ${PHOTOID}    ${ELEMENTID}    ${FILENAME}    ${PHOTODATA}    ${PHOTOTITLE}    ${PHOTOCOMMENT}    ${FOLDERPATH}
    Run Keyword If    '${COMPONENT}'=='EMPTYEXTERNALPHOTOTABLE'    Configure External Photo Component With Empty Table     ${ATTRIBUTE}    ${STORAGE}    ${PERSISTENCE}    ${DELWITHELEMENTS}    ${DB}    ${TABLE}    ${PHOTOID}    ${ELEMENTID}    ${FILENAME}    ${PHOTODATA}    ${PHOTOTITLE}    ${PHOTOCOMMENT}    ${FOLDERPATH}
    Run Keyword If    '${COMPONENT}'=='DATABASEFORMEXTERNALPHOTO'    Configure External Photo Component for Database Form    ${ATTRIBUTE}    ${PERSISTENCE}    ${DELWITHELEMENTS}    ${DB}    ${TABLE}    ${PHOTOID}    ${ELEMENTID}    ${FILENAME}    ${PHOTODATA}    ${PHOTOTITLE}    ${PHOTOCOMMENT}    ${FOLDERPATH}
    
    