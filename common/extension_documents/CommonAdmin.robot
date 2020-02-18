*** Settings ***

Documentation     Common keywords for JMap Admin Extension Documents
#-------------------------------------------------------------------------------------------------------------------------------------------------
Library		SeleniumLibrary		# Selenium framework
Library    BuiltIn    # Robot Built-In Library
Library    Collections 
#-------------------------------------------------------------------------------------------------------------------------------------------------   
Resource    ../admin/CommonKeywords.robot
#-------------------------------------------------------------------------------------------------------------------------------------------------
*** Variables ***

${ROOT}    C:
${COUNTER}    0
#-------------------------------------------------------------------------------------------------------------------------------------------------
*** Keywords ***

Go to Extensions Page
    Click Element    id:sideBarMenuIconExtensions
    
Go to Deposits List Page
    Click Link    xpath://a[@href='../extensions/jmap.extensions.gnd.server.GndExtension.jsp']
    
Click on Create Button
    Click Element    xpath://span[text()='Create']
    Page Should Contain Element    xpath://*[@id='depositWizardForm:step1']
    
Fill the Identification Step    [Arguments]    ${NAME}    ${DESC}    ${TYPE}    ${OPT}
    Input Text    xpath://input[@name='depositWizardForm:depositDetailName']    ${NAME}
    Input Text    xpath://textarea[contains(@name,'depositWizardForm:depositDetailDescription')]    ${DESC}
    
    Run Keyword If    '${OPT}'=='CREATION'    Select deposit type    ${TYPE}

Select deposit type    [Arguments]    ${TYPE}
    Click Element    id:depositWizardForm:depositDetailType_label
    Run Keyword If    '${TYPE}'=='Blank'    Click Element    xpath://li[@id='depositWizardForm:depositDetailType_0']
    Run Keyword If    '${TYPE}'=='File system'    Click Element    xpath://li[@id='depositWizardForm:depositDetailType_1']
    Run Keyword If    '${TYPE}'=='Hyperlink'    Click Element    xpath://li[@id='depositWizardForm:depositDetailType_2']
    Run Keyword If    '${TYPE}'=='SharePoint'    Click Element    xpath://li[@id='depositWizardForm:depositDetailType_3']
    
Fill File system Step    [Arguments]    ${ISBROWSABLE}    ${ISALLOWSUBDIR}    @{LOCATION}
    Page Should Contain Element    xpath://*[@id='depositWizardForm:step2']
    
    Click Element    xpath://span[text()='Browse...']
    Browse to a Directory    @{LOCATION}
    Set Checkbox Sate    depositWizardForm:jmapFileSystemBrowsable    ${ISBROWSABLE}
    Set Checkbox Sate    depositWizardForm:jmapFileSystemAllowSubDirsCreation    ${ISALLOWSUBDIR}

Fill Sharepoint Step    [Arguments]    ${URL}    ${USERNAME}    ${PASSWORD}    ${ISBROWSABLE}    ${ISALLOWSUBDIR}    ${OPT}
    Page Should Contain Element    xpath://*[@id='depositWizardForm:step2']
    Input Text    xpath://*[@id="depositWizardForm:sharePointUrl"]    ${URL}
    Input Text    xpath://*[@id="depositWizardForm:sharePointUser"]    ${USERNAME}

    Run Keyword If    '${OPT}'=='EDITION'    Click Element    xpath://*[@id="depositWizardForm:sharePointPasswordEditor"]/a
    Input Password    xpath://*[@id="depositWizardForm:sharePointPassword"]    ${PASSWORD}
    
    Set Checkbox Sate    depositWizardForm:sharePointBrowsable    ${ISBROWSABLE}
    Set Checkbox Sate    depositWizardForm:sharePointAllowSubDirsCreation    ${ISALLOWSUBDIR}

Fill Metadata Step    [Arguments]    ${DIRECTION}    @{METADATAS}
    Wait Until Element Is Visible    xpath://*[@id='depositWizardForm:metadataAttribute']    timeout=100
    Page Should Contain Element    xpath://*[@id='depositWizardForm:metadataAttribute']
    Move Elements on Picklist Component    depositWizardForm:metadataAttribute    ${DIRECTION}    @{METADATAS}

Move Elements on Picklist Component    [Arguments]    ${PICKLISTID}    ${DIRECTION}    @{ITEMS}
    :FOR    ${ITEM}    IN    @{ITEMS}
    \    Click Element    xpath://*[@id="${PICKLISTID}"]//li[text()='${ITEM}']
    \    Run Keyword If    '${DIRECTION}'=='TO_RIGHT'
    \    ...    Click Button    xpath://*[@id="${PICKLISTID}"]//button[1]
    \    ...    ELSE    Click Button    xpath://*[@id="${PICKLISTID}"]//button[3]

Finish the Wizard
    Click Element    xpath://span[text()='Finish']
    
# --------------------------------------------------------------------------------------------------------------------------------------------

Browse to a Directory    [Arguments]    @{DIRS}
    Click Element    xpath://a[@class='ui-menuitem-link ui-corner-all ui-icon ui-icon-home']
    Click Element    xpath://a[contains(.,'${ROOT}')]
    
    
    :FOR    ${DIR}    IN    @{DIRS}
    \    Wait Until Page Contains Element    xpath://a[text()='${DIR}']
    \    Click Element    xpath://a[text()='${DIR}']
    Click Element    xpath://*[@id="fileBrowserForm:buttonOk"]/span
    
    ${PATH}=    Catenate    ${ROOT}
    :FOR    ${DIR}    IN    @{DIRS}
    \    ${PATH}=    Catenate    SEPARATOR=${/}    ${PATH}    ${DIR}
    Textfield Value Should Be    xpath://input[@value='${PATH}']    ${PATH}

Deposit Page Should Contain Path    [Arguments]    @{DIRS}
    ${PATH}=    Catenate    ${ROOT}
    :FOR    ${DIR}    IN    @{DIRS}
    \    ${PATH}=    Catenate    SEPARATOR=${/}    ${PATH}    ${DIR}
    
    Page Should Contain    ${PATH}        
    
Page Should Contain the Error Message    [Arguments]    ${MESSAGE}
    Page Should Contain Element    xpath://span[text()='${MESSAGE}']

Click Next
    Click Element    xpath://span[text()='Next']

Cancel the Wizard
    Click Element    xpath:(//span[contains(.,'Cancel')])[6]

Go to Deposit Page    [Arguments]    ${DEPOSITNAME}
    ${DEPOSITID}    Catenate    theForm:tblDeposit
    Click Element in JMap Table Component    ${DEPOSITID}    ${DEPOSITNAME}
    
Select the Deposit    [Arguments]    ${DEPOSITNAME}
    ${DEPOSITID}    Catenate    theForm:tblDeposit
    Select Element in JMap Table Component    ${DEPOSITID}    ${DEPOSITNAME}
    
Click on Edit
    Click Element    xpath://span[text()='Edit']
    
Click on Synchronize
    Click Element    xpath://span[text()='Synchronize']
    Click Element    xpath://button/span[text()='Update']
    Reload Page

Last Synchronization Time Should Be Now
    ${yyyy}    ${mm}    ${dd}    ${hour}    ${min}=    Get Time    year, month, day, hour, min
    ${Date}    Catenate    SEPARATOR=-    ${yyyy}    ${mm}    ${dd}
    ${Time}    Catenate    SEPARATOR=:    ${hour}    ${min}
    ${Datetime}    Catenate    ${Date}    ${Time}
    Page Should Contain    ${Datetime}

Go to Datasource configuration page
    Click Sections
    Click Element    xpath://*[@id="theForm:sectionsButton_menu"]/ul/li[1]

Add a New Datasource Configuration    [Arguments]    ${DATASOURCENAME}    ${ATTRIBUTENAME}
    Click Element    xpath://span[@class='ui-button-icon-left ui-icon ui-c fa fa-plus']
    
    Select Element in JMap List Items Component    addIdentfierForm:identifierDataSource    ${DATASOURCENAME}
    Select Element in JMap List Items Component    addIdentfierForm:identifierAttributeName    ${ATTRIBUTENAME}
    
    Click Element    xpath://span[text()='Add']    

Cancel Datasource Configuration Dialog
    Click Element    xpath://*[@id="addIdentfierForm:addIdentfierDialog"]//span[text()='Cancel']

Cancel Datasource configuration page
    Click Element    xpath://*[@id="datasourceAttributeIdentfiersForm:datasourceAttributeIdentfiersDialog"]//span[text()='Cancel']

Save Datasource configuration
    Click Element    xpath://*[@id="datasourceAttributeIdentfiersForm:datasourceAttributeIdentfiersDialog"]//span[text()='Save']
    
Delete a Configured Datasource    [Arguments]    ${DATASOURCE}
    ${DATASOURCETABLEID}    Catenate    datasourceAttributeIdentfiersForm:dataTableDatasourceAttributeIdentfiers
    ${Row}    Get the Row Number of a Element in JMap Table Component    ${DATASOURCETABLEID}    ${DATASOURCE}
    Click Button    xpath://*[@id="${DATASOURCETABLEID}"]//tbody/tr[${Row}]/td[3]/button

Get the Row Number of a Element in JMap Table Component    [Arguments]    ${TABLEID}    ${ELEMENTNAME}
    ${COUNT}    Get Element Count    xpath://*[@id="${TABLEID}"]//tr
    :FOR    ${INDEX}    IN RANGE    1    ${COUNT}
    \    ${TEXT}    Get Text    xpath://*[@id="${TABLEID}"]//tbody/tr[${INDEX}]/td[1]
    \    Exit For Loop If    '${TEXT}'=='${ELEMENTNAME}'
    
    [Return]    ${INDEX}

Page Should Not Have    [Arguments]    ${DATASOURCE}
    [Documentation]    Keyword to manage the elements on Datasource configuration table
    ${DATASOURCETABLEID}    Catenate    datasourceAttributeIdentfiersForm:dataTableDatasourceAttributeIdentfiers
    ${RESULT}=    Exist Element in JMap Table Component    ${DATASOURCETABLEID}    ${DATASOURCE}
    Should Be Equal     ${RESULT}     ${False}
    
Exist Element in JMap Table Component    [Arguments]    ${TABLEID}    ${ELEMENTNAME}
    [Documentation]    Keyword to manage the elements on Datasource configuration table
    ${COUNT}    Get Element Count    xpath://*[@id="${TABLEID}"]//tr
    :FOR    ${INDEX}    IN RANGE    1    ${COUNT}
    \    ${TEXT}    Get Text    xpath://*[@id="${TABLEID}"]//tbody/tr[${INDEX}]/td[1]
    \    ${VALUE}=    Set Variable If    '${TEXT}'=='${ELEMENTNAME}'    ${True}    ${False}
    \    Exit For Loop If    '${TEXT}'=='${ELEMENTNAME}'
    [Return]    ${VALUE}

Go to Permissions Page
    Click Element    xpath://span[text()='Permissions']

Go to Metadata Structure Page
    ${COUNTER}=    Evaluate    10
    Set Global Variable    ${COUNTER}
    Click Element    xpath://*[@id="theForm:sectionsButton_menu"]/ul/li[1]/a/span

Go to Metadata Form Page
    Click Element    xpath://*[@id="theForm:sectionsButton_menu"]/ul/li[2]/a/span

Go to Search Form Page
    Click Element    xpath://*[@id="theForm:sectionsButton_menu"]/ul/li[3]/a/span

Click on Delete
    Click Element    xpath://span[text()='Delete']

Confirm Delete Action
    Click Button    xpath://*[@id="btnDeleteConfirm"]    

Click on Yes
    Click Element    xpath://*[@id="confirmationDialogForm:DlgConfirmation"]//span[text()='Yes']
    
Confirm the Deletion
    Click Button    theForm:genericConfirmYes
    
Remove the Selected User
    Click Button    theForm:tabViewPermissionsOwners:tblPrincipals:cmlDelete
    Click Element    xpath://span[text()='Yes']

Click on Save
    Click Element    xpath://span[text()='Save']

Save Metadata Structure
    ${COUNTER}=    Evaluate    0
    Click Element    xpath://*[@id="metadataStructureForm:metadataStructureDialog"]//button/span[text()='Save']

Cancel Metadata Structure
    Click Element    xpath://*[@id="metadataStructureForm:metadataStructureDialog"]//span[text()='Cancel']    

Get JMap Table Component Element Count ++    [Arguments]    ${TABLEID}
    ${COUNT}    Get Element Count    xpath://*[@id="${TABLEID}"]//tbody/tr
    ${COUNT}    Evaluate    ${COUNT} + 1
    [Return]    ${COUNT}

Get JMap Table Component Element Count --    [Arguments]    ${TABLEID}
    ${COUNT}    Get Element Count    xpath://*[@id="${TABLEID}"]//tbody/tr
    ${COUNT}    Evaluate    ${COUNT} - 1
    [Return]    ${COUNT}
    
Select User on Permissions Page    [Arguments]    ${USER}
    Select Element in JMap Table Component Td    theForm:tabViewPermissionsOwners:tblPrincipals    ${USER}

Select Metadata Type by Xpath    [Arguments]    ${POS}    ${VALUE}
    [Documentation]    Keyword that simulate the user selection of an element in JMap list component
    ...    Receive as arguments the xpath of the DIV component that contain the list ('li') and the value of the element to be selected
    ...    This keyword is useful to when the id of the DIV is autogenerated. e.g.
    ...    //*[@id="metadataStructureForm:dataTableUserAttributes"]//tbody/tr[1]/td[2]/div
    ${DOWNARROWPATH}=    Catenate    SEPARATOR=    //*[@id="metadataStructureForm:dataTableUserAttributes"]//tbody/tr[    ${POS}    ]/td[2]/div/div[3]/span
    Click Element		xpath:${DOWNARROWPATH}
    
    ${INDEX}=    Evaluate    '${COUNTER}'        #${POS} + 9
    ${COUNTER}=    Evaluate    ${COUNTER} + 1
    Set Global Variable    ${COUNTER}
    
    Run Keyword If    '${VALUE}'=='${EMPTY}'    Click Element    xpath://*[@id="metadataStructureForm"]/following-sibling::div[${INDEX}]//li[1]
    ...    ELSE    Click Element    xpath://*[@id="metadataStructureForm"]/following-sibling::div[${INDEX}]//li[@data-label='${VALUE}']

Add Metadata    [Arguments]    ${NAME}    ${SQLTYPE}    ${INDEXED}
    ${MESSAGE}    Get Text    xpath://*[@id="metadataStructureForm:dataTableUserAttributes"]//tbody/tr/td
    ${INDEX}=    Run Keyword If    '${MESSAGE}'=='No records found.'    Get JMap Table Component Element Count --    metadataStructureForm:dataTableUserAttributes
    ...    ELSE    Get JMap Table Component Element Count    metadataStructureForm:dataTableUserAttributes
    
    Click Button    xpath://*[@id="metadataStructureForm:dataTableUserAttributes_head"]//button    # Adding a new row
    Input Text    xpath://*[@id="metadataStructureForm:dataTableUserAttributes:${INDEX}:fieldName"]    ${NAME}
    
    ${POS}=    Evaluate    ${INDEX} + 1
    
    Select Metadata Type by Xpath    ${POS}    ${SQLTYPE}
    Set Checkbox Sate by Xpath    //*[@id="metadataStructureForm:dataTableUserAttributes"]//tbody/tr[${POS}]/td[3]/div    ${INDEXED}

Get Element Row in Metadata Table Component    [Arguments]    ${TABLEID}    ${ELEMENTNAME}
    ${COUNT}    Get Element Count    xpath://*[@id="${TABLEID}"]//tbody/tr
    ${COUNT}=    Evaluate    ${COUNT} + 1
    
    :FOR    ${INDEX}    IN RANGE    1    ${COUNT}
    \    ${TEXT}    Get Text    xpath://*[@id="${TABLEID}"]//tbody/tr[${INDEX}]/td[1]//input
    \    Exit For Loop If    '${TEXT}'=='${ELEMENTNAME}'
    [Return]    ${INDEX}

Page Should Contain Metadata    [Arguments]    ${METADATA}
    Element Should Be Visible    xpath://input[@value='${METADATA}']

Page Not Should Contain Metadata    [Arguments]    ${METADATA}
    Page Should Not Contain Element    xpath://input[@value='${METADATA}']

Delete Metadata    [Arguments]    ${NAME}
    ${INDEX}=    Get Element Row in Metadata Table Component    metadataStructureForm:dataTableUserAttributes    ${NAME}
    Click Button    xpath://*[@id="metadataStructureForm:dataTableUserAttributes"]//tbody/tr[${INDEX}]/td[4]/button

Set Configuration Layout    [Arguments]    ${COLUMNS}    ${ROWS}
    Wait Until Element Is Visible    xpath://*[@id="formBuilderForm:bottomLeftAddRowColumn"]    
    :FOR    ${I}    IN RANGE    1    ${COLUMNS}
    \    Add Column at the Right in Form Layout
    Wait Until Element Is Visible    xpath://*[@id="formBuilderForm:bottomLeftAddRowColumn"]    
    :FOR    ${J}    IN RANGE    1    ${ROWS}
    \    Add Row at the Bottom in Form Layout

Add Metadata Component for an Attribute    [Arguments]    ${ATTRIBUTE}    ${COMPONENT}    ${ROW}    ${COL}    ${REQUIRED}    ${READONLY}
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
    
    Click Element    xpath://*[@id="formBuilderForm:field_drop_${ROW}_${COL}"]//a[@aria-label='Edit properties']    #//*[@id="formBuilderForm:field_drop_${ROW}_${COL}"]//a[@aria-label='Delete field']

    Run Keyword If    '${COMPONENT}'=='INPUT_TEXT'    Configure Input Text Component    ${ATTRIBUTE}    ${REQUIRED}    ${READONLY}    ${ATTRIBUTE}
    Run Keyword If    '${COMPONENT}'=='SELECT_ONE'    Configure Select One Component    ${ATTRIBUTE}    ${REQUIRED}    ${READONLY}    ${ATTRIBUTE}
    Run Keyword If    '${COMPONENT}'=='SELECT_BOOLEAN'    Configure Select Boolean Component    ${ATTRIBUTE}    ${READONLY}    ${ATTRIBUTE}    1    0
    Run Keyword If    '${COMPONENT}'=='SELECT_MANY'    Configure Select Many Component    ${ATTRIBUTE}    ${REQUIRED}    ${READONLY}    ${ATTRIBUTE}
    Run Keyword If    '${COMPONENT}'=='INPUT_DATE'    Configure Input Date Component    ${ATTRIBUTE}    ${REQUIRED}    ${READONLY}    ${ATTRIBUTE}
    Run Keyword If    '${COMPONENT}'=='TREE'    Configure Tree Component    ${ATTRIBUTE}    ${REQUIRED}    ${READONLY}    ${ATTRIBUTE}
    Run Keyword If    '${COMPONENT}'=='INPUT_RANGE'    Configure Input Range Component    ${ATTRIBUTE}    ${REQUIRED}    ${READONLY}    ${ATTRIBUTE}

Save Metadata Form Layout
    Click Button    xpath://*[@id="formBuilderForm:affirmativeFormButton"]

Cancel Metadata Form Layout
    Click Button    xpath://*[@id="formBuilderForm:cancelFormButton"]

Create a New Search Form    [Arguments]    ${FORMNAME}
    Click Button    xpath://*[@id="theForm:cmlNew"]
    Input Text    xpath://*[@id="editSearchFormForm:editingFormName"]    ${FORMNAME}
    Create Search Form Layout

Delete Search Form
    Click Button    xpath://*[@id="theForm:cmlDeleteConfirm"]
    Wait Until Element Is Visible    xpath://*[@id="theForm:genericConfirmYes"]    
    Click Button    xpath://*[@id="theForm:genericConfirmYes"]

Edit Search Form    [Arguments]    ${FORMNAME}    ${NEWFORMNAME}
    Click Element in JMap Table Component    theForm:tblDepotForms    ${FORMNAME}
    Input Text    xpath://*[@id="editSearchFormForm:editingFormName"]    ${NEWFORMNAME}
    Create Search Form Layout

Select Search Form    [Arguments]    ${FORMNAME}
    Select Element in JMap Table Component    theForm:tblDepotForms    ${FORMNAME}

Cancel Search Form Creation
    Click Button    xpath://*[@id="editSearchFormForm:editSearchFormDialog"]//button[1]

Create Search Form Layout
    Click Button    xpath://*[@id="editSearchFormForm:editSearchFormDialog"]//button[2]    