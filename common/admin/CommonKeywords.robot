*** Settings ***
Documentation     Common keywords for JMap Admin
#---------------------------------------------------------------------------------------------------------------------------------
Library    SeleniumLibrary		# Selenium framework
Library    TestlinkAPILibrary    
Library    OperatingSystem
Library    Collections    
Library    Reserved
Library    String
Library    DateTime 
Library    REST  
#-----------------------------------------------------------------------------------------------------------------------------
Resource    ../jmapWeb/CommonWeb.robot
#----------------------------------------------------------------------------------------------------------------------------------
*** Variables ***
${RESOLUTION_X}    1920
${RESOLUTION_Y}    1080
${BROWSER}        Chrome    #headlesschrome
${HEADLESS}    ${False}    #--normal    #--headless
${ALIAS}    JMap   
${TL_URL}    http://192.168.0.42/testlink2/lib/api/xmlrpc/v1/xmlrpc.php
${DEV_KEY}    5d5a0fc4f1196272ed91c601df2c71bd
@{issuesPrefix}    TFIFT    JMNG
${projectNum}    6
${testPlan}    Full Test
${JiraUser}    mboussad@k2geospatial.com
${JiraToken}    qhQqnQQBHNyP9aAemb6b4901
${TYPE}    WEB
${tc_start}    ${EMPTY}
${useTL}    true
#-----------------------------------------------------------------------------------------------------------------------------------
*** Keywords ***

Go to Server Page
    [Documentation]    Go to JMap Server page (http://.../jmapadmin/jmapserver/jmapserver_status.jsf)
    Wait Until Element Is Enabled    id:sideBarMenuIconStatus    timeout=100s
    Click Element    id:sideBarMenuIconStatus 
    
Go to User Page
    [Documentation]    Go to User page (http://.../jmapadmin/jmapserver/user_management.jsf)
    Go to Server Page
    Click Sections
    Wait Until Element Is Enabled    xpath://span[contains(text(),'Users / Groups')]    timeout=100s
    Click Element    xpath://span[contains(text(),'Users / Groups')]
    Wait Until Element Is Enabled    xpath://a[contains(text(),'Users')]    
    Click Element    xpath://a[contains(text(),'Users')]    
    
Go to Group Page
    [Documentation]    Go to Group page (http://.../jmapadmin/jmapserver/group_management.jsf)
    Go to Server Page
    Click Sections
    Wait Until Element Is Enabled    xpath://span[contains(text(),'Users / Groups')]    timeout=100s
    Click Element    xpath://span[contains(text(),'Users / Groups')]
    Wait Until Element Is Enabled    xpath://a[contains(text(),'Groups')]    
    Click Element    xpath://a[contains(text(),'Groups')]   
    
Go to Databases
    [Documentation]    Go to Database page (http://.../jmapadmin/databases/databases.jsf)
    Wait Until Element Is Enabled    id:sideBarMenuIconDatabases    timeout=100s
    Click Element    id:sideBarMenuIconDatabases
    
Go to Projects
    [Documentation]    Go to Project page (http://.../jmapadmin/projects/projects.jsf)
    Wait Until Element Is Enabled    id:sideBarMenuIconProjects    timeout=100s
    Click Element    id:sideBarMenuIconProjects
    
Go to Remote Connections
    [Documentation]    Go to Remote Connection page (http://.../jmapadmin/remoteconnections/remoteconnections.jsf)
    Wait Until Element Is Enabled    id:sideBarMenuIconRemoteConnections    timeout=100s
    Click Element    id:sideBarMenuIconRemoteConnections
    
Go to Spatial Datasources
    [Documentation]    Go to Spatial Datasources page (http://.../jmapadmin/spatialdatasources/spatialdatasources.jsf)
    Wait Until Element Is Enabled    id:sideBarMenuIconSpatialDataSources    timeout=100s
    Click Element    id:sideBarMenuIconSpatialDataSources
    
Go to Deployments
    [Documentation]    Go to Deployment page (http://.../jmapadmin/applicationsdeployment/applications.jsf)
    Wait Until Element Is Enabled    id:sideBarMenuIconDeployments    timeout=100s
    Click Element    id:sideBarMenuIconDeployments
    
Click Sections
    [Documentation]    Click Sections menu in all pages
    Wait Until Element Is Enabled    id:theForm:sectionsButton_button    timeout=100s
    Click Button    id:theForm:sectionsButton_button

Click Create Button
    [Documentation]    Click Create button in all pages
    Wait Until Element Is Enabled    xpath://span[contains(text(),'Create')]    timeout=100s
    Click Element    xpath://span[contains(text(),'Create')]

Click Edit Button
    [Documentation]    Click Edit button in all pages
    Wait Until Element Is Enabled    xpath://span[contains(text(),'Edit')]    timeout=100s
    Click Element    xpath://span[contains(text(),'Edit')]
    
Click Update Button
    [Documentation]    Click Update button in all pages
    Wait Until Element Is Enabled    xpath://button[@id='theForm:cmlUpdate']//span[contains(text(),'Update')]    timeout=100s
    Click Element    xpath://button[@id='theForm:cmlUpdate']//span[contains(text(),'Update')]

Click Delete Button
    [Documentation]    Click Delete button in all pages
    Wait Until Element Is Enabled    xpath://button//span[contains(text(),'Delete')]    timeout=100s
    Click Element    xpath://button//span[contains(text(),'Delete')]

Click Confirmation Dialog
    [Documentation]    Click Yes button in the confirmation dialog for some JMap operations
    Wait Until Element Is Enabled    xpath://button[@id='theForm:genericConfirmYes']//span[contains(text(),'Yes')]    timeout=100s
    Click Element    xpath://button[@id='theForm:genericConfirmYes']//span[contains(text(),'Yes')]    

Click Save Button
    [Documentation]    Click Save button in some configuration pages
    Wait Until Element Is Enabled    xpath://button[@id='theForm:cmlSave']//span[contains(text(),'Save')]    timeout=100s
    Click Element    xpath://button[@id='theForm:cmlSave']//span[contains(text(),'Save')] 
    
Click Next Button
    [Documentation]    Click Next button in wizard pages
    Wait Until Element Is Enabled    xpath://span[contains(text(),'Next')]    timeout=100s
    Click Element    xpath://span[contains(text(),'Next')]
    
Click Finish Button
    [Documentation]    Click Finish button in wizard pages
    Wait Until Element Is Enabled    xpath://span[contains(text(),'Finish')]    timeout=100s    
    Click Element    xpath://span[contains(text(),'Finish')] 

Click on Cancel
    [Documentation]    Click Cancel button in wizard pages
    Wait Until Element Is Enabled    xpath://span[text()='Cancel']    timeout=100s
    Click Element    xpath://span[text()='Cancel']
    
Clean Input    [Arguments]    ${LOCATOR}    ${TEXT}
    [Documentation]   Special text input that need to be cleaned first
    
    FOR    ${INDEX}    IN RANGE    0    5
    \    Wait Until Element Is Enabled    ${LOCATOR}    
    \    Set Focus To Element    ${LOCATOR}
    \    Press Keys    ${LOCATOR}    BACK_SPACE    
    Input Text    ${LOCATOR}    ${TEXT}  
	        
   
# -----------------------------------------------------------------------------------------------------------------------------

Select Element in JMap List Items Component    [Arguments]    ${LISTID}    ${VALUE}
    [Documentation]    Keyword that simulate the user selection of an element in JMap list component
    ...    Receive as arguments the id of the DIV component that contain the list ('li') and the value of the element to be selected    
    ${DOWNARROWPATH}=    Catenate    SEPARATOR=    //div[@id='${LISTID}']/div[3]/span
    Wait Until Element Is Enabled    xpath:${DOWNARROWPATH}    timeout=100s       
    Click Element		xpath:${DOWNARROWPATH}
    
    ${XPATH} =    Catenate	SEPARATOR=    //*[@id='${LISTID}_items']/li[@data-label='    ${VALUE}    ']
    
    Run Keyword If    '${VALUE}'!='${EMPTY}'    Wait Until Element Is Visible    xpath://*[@id='${LISTID}_items']/li[1]    timeout=100s
    Run Keyword If    '${VALUE}'=='${EMPTY}'    Click Element    xpath://*[@id='${LISTID}_items']/li[1]
    ...    ELSE    Click Element    xpath:${XPATH}

Select Element in JMap List Items Component with Timeout    [Arguments]    ${LISTID}    ${VALUE}    ${TIMEOUT}
    [Documentation]    Keyword that simulate the user selection of an element in JMap list component
    ...    Receive as arguments the id of the DIV component that contain the list ('li') and the value of the element to be selected    
    ${DOWNARROWPATH}=    Catenate    SEPARATOR=    //div[@id='${LISTID}']/div[3]/span
    Wait Until Element Is Enabled    xpath:${DOWNARROWPATH}    timeout=${TIMEOUT}       
    Click Element		xpath:${DOWNARROWPATH}
    
    ${XPATH} =    Catenate	SEPARATOR=    //*[@id='${LISTID}_items']/li[@data-label='    ${VALUE}    ']
    
    Run Keyword If    '${VALUE}'!='${EMPTY}'    Wait Until Element Is Visible    xpath://*[@id='${LISTID}_items']/li[1]    timeout=${TIMEOUT}
    Run Keyword If    '${VALUE}'=='${EMPTY}'    Click Element    xpath://*[@id='${LISTID}_items']/li[1]
    ...    ELSE    Click Element    xpath:${XPATH}


Select Element in JMap List Items Component with Types    [Arguments]    ${LISTID}    ${VALUE}
    [Documentation]    Keyword that simulate the user selection of an element in JMap list component with a table inside it
    ...    The table is there cause of the SQL type of the elements
    ...    Receive as arguments the id of the DIV component that contain down arrow and the value of the element to be selected    
    ${DOWNARROWPATH}=    Catenate    SEPARATOR=    //div[@id='${LISTID}']/div[3]/span
    Click Element		xpath:${DOWNARROWPATH}
    
    Run Keyword If    '${VALUE}'=='${EMPTY}'    Click Element    xpath://*[@id="formBuilderForm:currentFieldAttribute_0"]
       
    Run Keyword If    '${VALUE}'!='${EMPTY}'    Wait Until Element Is Visible    xpath://tr[@data-label='${VALUE}']    timeout=100s
    Run Keyword If    '${VALUE}'!='${EMPTY}'    Click Element    xpath://tr[@data-label='${VALUE}']

Click Element in JMap Table Component    [Arguments]    ${TABLEID}    ${ELEMENTNAME}
    [Documentation]    The clickeable elements on tables always appears at the second column
    ...    TABLEID: Id of the 'div' which is the father of the 'table', 'thead' and 'tbody' components
    # To use a loop we need the ammount of elements plus 1, so counting the checkbox elements is perfect
    ${COUNT}    SeleniumLibrary.Get Element Count    xpath://span[@class='ui-chkbox-icon ui-icon ui-icon-blank ui-c']
    :FOR    ${INDEX}    IN RANGE    1    ${COUNT}
    \    ${TEXT}    Get Text    xpath://*[@id="${TABLEID}"]//tbody/tr[${INDEX}]/td[2]/a
    \    Exit For Loop If    '${TEXT}'=='${ELEMENTNAME}'
    
    Click Element    xpath://*[@id="${TABLEID}"]//tbody/tr[${INDEX}]/td[2]/a[text()='${ELEMENTNAME}']
    
Select Element in JMap Table Component    [Arguments]    ${TABLEID}    ${ELEMENTNAME}
    [Documentation]    The selected box on tables always appears at the first column
    ...    TABLEID: Id of the 'div' which is the father of the 'table', 'thead' and 'tbody' components
    # To use a loop we need the ammount of elements plus 1, so counting the checkbox elements is perfect
    Wait Until Page Contains Element    xpath://*[@id="${TABLEID}"]    timeout=1000s
    ${COUNT}    SeleniumLibrary.Get Element Count    xpath://*[@id="${TABLEID}"]//tbody/tr
    ${COUNT}=    Evaluate    ${COUNT} + 1
    
    :FOR    ${INDEX}    IN RANGE    1    ${COUNT}
    \    Wait Until Element Is Enabled    xpath://*[@id="${TABLEID}"]//tbody/tr[${INDEX}]/td[2]/a    timeout=1000s
    \    Wait Until Page Contains Element    xpath://*[@id="${TABLEID}"]    timeout=1000s    
    \    ${TEXT}    Get Text    xpath://*[@id="${TABLEID}"]//tbody/tr[${INDEX}]/td[2]/a
    \    Run Keyword If    '${TEXT}'=='${ELEMENTNAME}'    Exit For Loop
    Wait Until Element Is Enabled    id:${TABLEID}    timeout=1000s
    Wait Until Page Contains Element    xpath://*[@id="${TABLEID}"]    timeout=1000s
    Wait Until Element Is Enabled    xpath://*[@id="${TABLEID}"]//tbody/tr[${INDEX}]/td[1]/div    timeout=1000s       
    Click Element    xpath://*[@id="${TABLEID}"]//tbody/tr[${INDEX}]/td[1]/div

Get Element Info in JMap Table Component    [Arguments]    ${TABLEID}    ${ELEMENTNAME}    ${JMAPPAGE}    ${COLUMNNAME}
    [Documentation]    The selected box on tables always appears at the first column
    ...    TABLEID: Id of the 'div' which is the father of the 'table', 'thead' and 'tbody' components
    ...    ELEMENTNAME: the searching criteria by elment name 
    ...    COLUMNAME:    name of the column to search
    ...    JMAPPAGE: is the page in JMap that has a table component to list elements. Ex (Database, RemoteConnection, SpatialDataSource, Project, Deployment). This is used
    ...    in the filter action before run the method. The filter avoid long time searching in table with lot of elements, because of the refresh action in 
    ...    JMap page cause to loose the element in the DOM. That's why we also use the wait until element is enable keyword multiple time
    # To use a loop we need the ammount of elements plus 1, so counting the checkbox elements is perfect
    Reload Page
    Filter Element By Name In JMap Table    ${JMAPPAGE}    ${ELEMENTNAME}
    Wait Until Element Is Enabled    id:${TABLEID}
    ${COUNT}    SeleniumLibrary.Get Element Count    xpath://*[@id="${TABLEID}"]//tbody/tr    # get the count of rows in the table to know the count of element in the table and use it for the search loop
    ${COUNT}=    Evaluate    ${COUNT} + 1    # increase the count to 1 for the loop purpose
    Wait Until Element Is Enabled    id:${TABLEID}    
    :FOR    ${INDEX}    IN RANGE    1    ${COUNT}    # look for the row index of the element we are searching in the table
    \    ${TEXT}    Get Text    xpath://*[@id="${TABLEID}"]//tbody/tr[${INDEX}]/td[2]/a
    \    Run Keyword If    '${TEXT}'=='${ELEMENTNAME}'    Exit For Loop
    
    Wait Until Element Is Enabled    id:${TABLEID}
    ${COLUMNCOUNT}    SeleniumLibrary.Get Element Count    xpath://*[@id="${TABLEID}"]//thead/tr/th    # get the count of columns in the table and use it for the search loop
    ${COLUMNCOUNT}=    Evaluate    ${COLUMNCOUNT} + 1    # increase the count to 1 for the loop purpose    
    Wait Until Element Is Enabled    id:${TABLEID}
    :FOR    ${I}    IN RANGE    1    ${COLUMNCOUNT}    # look for the column index of the column we are searching in the table    
    \    Wait Until Element Is Enabled    id:${TABLEID}
    \    ${TEXT}    Get Text    xpath://*[@id="${TABLEID}"]//thead/tr/th[${I}]//span
    \    Run Keyword If    '${TEXT}'=='${COLUMNNAME}'    Exit For Loop
    Wait Until Element Is Enabled    id:${TABLEID}
    ${ELEMENT_CELL_INFO}=    Get Text     xpath://*[@id="${TABLEID}"]//tbody/tr[${INDEX}]/td[${I}]    # Get the text of the cell in the table using the row index for the element we want and the column index of the column we want
    [Return]    ${ELEMENT_CELL_INFO}
    
Filter Element By Name In JMap Table    [Arguments]    ${JMAPPAGE}    ${ELEMENTNAME}
    [Documentation]    Keyword to filter the list in JMap Table. Type the given element name in the filter of given JMap page
    ...    JMAPPAGE should be (Database, RemoteConnection, SpatialDataSource, Project, Deployment). Project page has different filter component
    ${FILTERCOMPONENT}    Set Variable    ${EMPTY}    
    ${FILTERCOMPONENT}=    Set Variable if    "${JMAPPAGE}"=="Database"    theForm:tableDatabases:columnName:filter    ${FILTERCOMPONENT}
    ${FILTERCOMPONENT}=    Set Variable if    "${JMAPPAGE}"=="RemoteConnection"    theForm:tableRemoteConnections:columnName:filter    ${FILTERCOMPONENT}
    ${FILTERCOMPONENT}=    Set Variable if    "${JMAPPAGE}"=="SpatialDataSource"    theForm:tblDataSource:columnName:filter    ${FILTERCOMPONENT}
    ${FILTERCOMPONENT}=    Set Variable if    "${JMAPPAGE}"=="Deployment"    theForm:tblApplications:columnName:filter    ${FILTERCOMPONENT}
          
    Wait Until Element Is Enabled    ${FILTERCOMPONENT}
    Input Text    ${FILTERCOMPONENT}    ${ELEMENTNAME}    

Get JMap Table Component Element Count    [Arguments]    ${TABLEID}
    [Documentation]    Get the count of elements in a table. Receive the id of the table and return count number
    ${COUNT}    SeleniumLibrary.Get Element Count    xpath://*[@id="${TABLEID}"]//tbody/tr
    [Return]    ${COUNT}

Select Element in JMap Table Component Span    [Arguments]    ${TABLEID}    ${ELEMENTNAME}
    [Documentation]    The selected box on tables always appears at the first column
    ...    TABLEID: Id of the 'div' which is the father of the 'table', 'thead' and 'tbody' components
    ${COUNT}    SeleniumLibrary.Get Element Count    xpath://*[@id="${TABLEID}"]//tbody/tr
    ${COUNT}=    Evaluate    ${COUNT} + 1
    
    :FOR    ${INDEX}    IN RANGE    1    ${COUNT}
    \    ${TEXT}    Get Text    xpath://*[@id="${TABLEID}"]//tbody/tr[${INDEX}]/td[2]/span
    \    Run Keyword If    '${TEXT}'=='${ELEMENTNAME}'    Exit For Loop
    
    Click Element    xpath://*[@id="${TABLEID}"]//tbody/tr[${INDEX}]/td[1]/div

Select Element in JMap Table Component Td   [Arguments]    ${TABLEID}    ${ELEMENTNAME}
    [Documentation]    The selected box on tables always appears at the first column
    ...    TABLEID: Id of the 'div' which is the father of the 'table', 'thead' and 'tbody' components
    # To use a loop we need the ammount of elements plus 1, so counting the checkbox elements is perfect
    ${COUNT}    SeleniumLibrary.Get Element Count    xpath://*[@id="${TABLEID}"]//tbody/tr
    ${COUNT}=    Evaluate    ${COUNT} + 1
    
    :FOR    ${INDEX}    IN RANGE    1    ${COUNT}
    \    ${TEXT}    Get Text    xpath://*[@id="${TABLEID}"]//tbody/tr[${INDEX}]/td[2]
    \    Run Keyword If    '${TEXT}'=='${ELEMENTNAME}'    Exit For Loop
    
    Click Element    xpath://*[@id="${TABLEID}"]//tbody/tr[${INDEX}]/td[1]/div

Exist Element in JMap Table Component td    [Arguments]    ${TABLEID}    ${ELEMENTNAME}
    [Documentation]    Keyword to manage the elements on Datasource configuration table
    ${COUNT}    SeleniumLibrary.Get Element Count    xpath://*[@id="${TABLEID}"]//tr
    :FOR    ${INDEX}    IN RANGE    1    ${COUNT}
    \    ${TEXT}    Get Text    xpath://*[@id="${TABLEID}"]//tbody/tr[${INDEX}]/td[2]
    \    ${VALUE}=    Set Variable If    '${TEXT}'=='${ELEMENTNAME}'    ${True}    ${False}
    \    Exit For Loop If    '${TEXT}'=='${ELEMENTNAME}'
    [Return]    ${VALUE}

Exist Element in JMap Table Component Span    [Arguments]    ${TABLEID}    ${ELEMENTNAME}
    [Documentation]    Search in a table that contains span components for the given element name. Return the value if exist
    ${COUNT}    SeleniumLibrary.Get Element Count    xpath://*[@id="${TABLEID}"]//tbody/tr
    ${COUNT}=    Evaluate    ${COUNT} + 1
    
    :FOR    ${INDEX}    IN RANGE    1    ${COUNT}
    \    ${TEXT}    Get Text    xpath://*[@id="${TABLEID}"]//tbody/tr[${INDEX}]/td[2]/span
    \    ${VALUE}=    Set Variable If    '${TEXT}'=='${ELEMENTNAME}'    ${True}    ${False}
    \    Exit For Loop If    '${TEXT}'=='${ELEMENTNAME}'
    [Return]    ${VALUE}
    
Exist Element in JMap Table Component a    [Arguments]    ${TABLEID}    ${ELEMENTNAME}
    [Documentation]    Search in a table that contains a components for the given element name. Return the True if exist, False if not
    ${TEXT}    Get Text    xpath://div[@id='${TABLEID}']//tr//td[1]   
    Return From Keyword If   '${TEXT}'=='( Empty )'    
       ${COUNT}    SeleniumLibrary.Get Element Count    xpath://*[@id="${TABLEID}"]//tbody/tr
       ${COUNT}=    Evaluate    ${COUNT} + 1
    
    :FOR    ${INDEX}    IN RANGE    1    ${COUNT}
    \    ${TEXT}    Get Text    xpath://*[@id="${TABLEID}"]//tbody/tr[${INDEX}]/td[2]/a
    \    ${VALUE}=    Set Variable If    '${TEXT}'=='${ELEMENTNAME}'    ${True}    ${False}
    \    Exit For Loop If    '${TEXT}'=='${ELEMENTNAME}'
    [Return]    ${VALUE}

Set Checkbox Sate    [Arguments]    ${CHECKBOXID}    ${STATUS}
    [Documentation]    Check if checkbox with given ID is different of given status. Receive the Id of the div that owns the component
    ...    and the status to be changed
    ${CLASS}    SeleniumLibrary.Get Element Attribute    xpath://*[@id="${CHECKBOXID}"]/div[2]/span    class
    Run Keyword If    '${STATUS}'=='${True}' and '${CLASS}' == 'ui-chkbox-icon ui-icon ui-icon-blank ui-c'
    ...    Click Element    xpath://*[@id="${CHECKBOXID}"]/div[2]/span
    Run Keyword If    '${STATUS}'=='${False}' and '${CLASS}' == 'ui-chkbox-icon ui-icon ui-icon-check ui-c'
    ...    Click Element    xpath://*[@id="${CHECKBOXID}"]/div[2]/span

Set Checkbox Sate by Xpath    [Arguments]    ${BY}    ${STATUS}
    [Documentation]    Check if checkbox with given xpath is different of given status. Receive the xpath of the div that owns the component
    ...    and the status to be changed
    ${CLASS}    SeleniumLibrary.Get Element Attribute    xpath:${BY}/div[2]/span    class
    Run Keyword If    '${STATUS}'=='${True}' and '${CLASS}' == 'ui-chkbox-icon ui-icon ui-icon-blank ui-c'
    ...    Click Element    xpath:${BY}/div[2]/span
    Run Keyword If    '${STATUS}'=='${False}' and '${CLASS}' == 'ui-chkbox-icon ui-icon ui-icon-check ui-c'
    ...    Click Element    xpath:${BY}/div[2]/span

Add Row at the Bottom in Form Layout
    [Documentation]    Add a row at the button of the Form Layout
    Click Element    xpath://*[@id="formBuilderForm:bottomLeftAddRowColumn"]    
    Click Element    xpath://div[@id='formBuilderForm:menuAddEditDeleteSection']//following-sibling::div[4]//span[text()='Row']

Add Column at the Right in Form Layout
    [Documentation]    Add a column at the button of the Form Layout
    Click Element    xpath://*[@id="formBuilderForm:topRightAddRowColumn"]    
    Click Element    xpath://div[@id='formBuilderForm:menuAddEditDeleteSection']//following-sibling::div[3]//span[text()='Column']

Configure Input Text Component    [Arguments]    ${ATTRIBUTE}    ${REQUIRED}    ${READONLY}    ${PREFIX}
    Select Element in JMap List Items Component with Types    formBuilderForm:currentFieldAttribute    ${ATTRIBUTE}
    
    ${REQCLASS}    SeleniumLibrary.Get Element Attribute    xpath://*[@id="formBuilderForm:currentFieldRequired"]/div[2]    class
    Run Keyword If    '${REQCLASS}'!='ui-chkbox-box ui-widget ui-corner-all ui-state-default ui-state-disabled'
    ...    Set Checkbox Sate    formBuilderForm:currentFieldRequired    ${REQUIRED}
    
    ${REACLASS}    SeleniumLibrary.Get Element Attribute    xpath://*[@id="formBuilderForm:currentFieldReadOnly"]/div[2]    class
    Run Keyword If    '${REACLASS}'!='ui-chkbox-box ui-widget ui-corner-all ui-state-default ui-state-disabled'
    ...    Set Checkbox Sate    formBuilderForm:currentFieldReadOnly    ${READONLY}
    
    Input Text    xpath://*[@id="formBuilderForm:currentFieldLabelPrefix"]    ${PREFIX}
    Wait Until Element Is Enabled    xpath://*[@id="formBuilderForm:saveFieldPropertiesButton"]    timeout=100s
    Click Button    xpath://*[@id="formBuilderForm:saveFieldPropertiesButton"]

Configure Select One Component    [Arguments]    ${ATTRIBUTE}    ${REQUIRED}    ${READONLY}    ${PREFIX}
    Select Element in JMap List Items Component with Types    formBuilderForm:currentFieldAttribute    ${ATTRIBUTE}
    
    ${REQCLASS}    SeleniumLibrary.Get Element Attribute    xpath://*[@id="formBuilderForm:currentFieldRequired"]/div[2]    class
    Run Keyword If    '${REQCLASS}'!='ui-chkbox-box ui-widget ui-corner-all ui-state-default ui-state-disabled'
    ...    Set Checkbox Sate    formBuilderForm:currentFieldRequired    ${REQUIRED}
    
    ${REACLASS}    SeleniumLibrary.Get Element Attribute    xpath://*[@id="formBuilderForm:currentFieldReadOnly"]/div[2]    class
    Run Keyword If    '${REACLASS}'!='ui-chkbox-box ui-widget ui-corner-all ui-state-default ui-state-disabled'
    ...    Set Checkbox Sate    formBuilderForm:currentFieldReadOnly    ${READONLY}
    
    Input Text    xpath://*[@id="formBuilderForm:currentFieldLabelPrefix"]    ${PREFIX}
    Wait Until Element Is Enabled    xpath://*[@id="formBuilderForm:saveFieldPropertiesButton"]    timeout=100s
    #TODO    Complete the choices
    Click Button    xpath://*[@id="formBuilderForm:saveFieldPropertiesButton"]
    
Configure Select Boolean Component    [Arguments]    ${ATTRIBUTE}    ${READONLY}    ${PREFIX}    ${CHECKED}    ${UNCHECKED}
    Select Element in JMap List Items Component with Types    formBuilderForm:currentFieldAttribute    ${ATTRIBUTE}
    
    ${REACLASS}    SeleniumLibrary.Get Element Attribute    xpath://*[@id="formBuilderForm:currentFieldReadOnly"]/div[2]    class
    Run Keyword If    '${REACLASS}'!='ui-chkbox-box ui-widget ui-corner-all ui-state-default ui-state-disabled'
    ...    Set Checkbox Sate    formBuilderForm:currentFieldReadOnly    ${READONLY}
    
    Input Text    xpath://*[@id="formBuilderForm:currentFieldLabelPrefix"]    ${PREFIX}
    Input Text    xpath://*[@id="formBuilderForm:currentFieldCheckedValue"]    ${CHECKED}
    Input Text    xpath://*[@id="formBuilderForm:currentFieldUncheckedValue"]    ${UNCHECKED}
    Wait Until Element Is Enabled    xpath://*[@id="formBuilderForm:saveFieldPropertiesButton"]    timeout=100s
    Click Button    xpath://*[@id="formBuilderForm:saveFieldPropertiesButton"]
    
Configure Select Many Component    [Arguments]    ${ATTRIBUTE}    ${REQUIRED}    ${READONLY}    ${PREFIX}
    Select Element in JMap List Items Component with Types    formBuilderForm:currentFieldAttribute    ${ATTRIBUTE}
    
    ${REQCLASS}    SeleniumLibrary.Get Element Attribute    xpath://*[@id="formBuilderForm:currentFieldRequired"]/div[2]    class
    Run Keyword If    '${REQCLASS}'!='ui-chkbox-box ui-widget ui-corner-all ui-state-default ui-state-disabled'
    ...    Set Checkbox Sate    formBuilderForm:currentFieldRequired    ${REQUIRED}
    
    ${REACLASS}    SeleniumLibrary.Get Element Attribute    xpath://*[@id="formBuilderForm:currentFieldReadOnly"]/div[2]    class
    Run Keyword If    '${REACLASS}'!='ui-chkbox-box ui-widget ui-corner-all ui-state-default ui-state-disabled'
    ...    Set Checkbox Sate    formBuilderForm:currentFieldReadOnly    ${READONLY}
    
    Input Text    xpath://*[@id="formBuilderForm:currentFieldLabelPrefix"]    ${PREFIX}
    Wait Until Element Is Enabled    xpath://*[@id="formBuilderForm:saveFieldPropertiesButton"]    timeout=100s
    #TODO    Complete the choices
    Click Button    xpath://*[@id="formBuilderForm:saveFieldPropertiesButton"]
    
Configure Input Date Component    [Arguments]    ${ATTRIBUTE}    ${REQUIRED}    ${READONLY}    ${PREFIX}
    Select Element in JMap List Items Component with Types    formBuilderForm:currentFieldAttribute    ${ATTRIBUTE}
    
    ${REQCLASS}    SeleniumLibrary.Get Element Attribute    xpath://*[@id="formBuilderForm:currentFieldRequired"]/div[2]    class
    Run Keyword If    '${REQCLASS}'!='ui-chkbox-box ui-widget ui-corner-all ui-state-default ui-state-disabled'
    ...    Set Checkbox Sate    formBuilderForm:currentFieldRequired    ${REQUIRED}
    
    ${REACLASS}    SeleniumLibrary.Get Element Attribute    xpath://*[@id="formBuilderForm:currentFieldReadOnly"]/div[2]    class
    Run Keyword If    '${REACLASS}'!='ui-chkbox-box ui-widget ui-corner-all ui-state-default ui-state-disabled'
    ...    Set Checkbox Sate    formBuilderForm:currentFieldReadOnly    ${READONLY}
    
    Input Text    xpath://*[@id="formBuilderForm:currentFieldLabelPrefix"]    ${PREFIX}
    Wait Until Element Is Enabled    xpath://*[@id="formBuilderForm:saveFieldPropertiesButton"]    timeout=100s
    Click Button    xpath://*[@id="formBuilderForm:saveFieldPropertiesButton"]
    
Configure Tree Component    [Arguments]    ${ATTRIBUTE}    ${REQUIRED}    ${READONLY}    ${PREFIX}
    Select Element in JMap List Items Component with Types    formBuilderForm:currentFieldAttribute    ${ATTRIBUTE}
    
    ${REQCLASS}    SeleniumLibrary.Get Element Attribute    xpath://*[@id="formBuilderForm:currentFieldRequired"]/div[2]    class
    Run Keyword If    '${REQCLASS}'!='ui-chkbox-box ui-widget ui-corner-all ui-state-default ui-state-disabled'
    ...    Set Checkbox Sate    formBuilderForm:currentFieldRequired    ${REQUIRED}
    
    ${REACLASS}    SeleniumLibrary.Get Element Attribute    xpath://*[@id="formBuilderForm:currentFieldReadOnly"]/div[2]    class
    Run Keyword If    '${REACLASS}'!='ui-chkbox-box ui-widget ui-corner-all ui-state-default ui-state-disabled'
    ...    Set Checkbox Sate    formBuilderForm:currentFieldReadOnly    ${READONLY}
    
    Input Text    xpath://*[@id="formBuilderForm:currentFieldLabelPrefix"]    ${PREFIX}
    Wait Until Element Is Enabled    xpath://*[@id="formBuilderForm:saveFieldPropertiesButton"]    timeout=100s
    #TODO    Complete the choices
    Click Button    xpath://*[@id="formBuilderForm:saveFieldPropertiesButton"]

Configure Input Range Component    [Arguments]    ${ATTRIBUTE}    ${REQUIRED}    ${READONLY}    ${PREFIX}
    Select Element in JMap List Items Component with Types    formBuilderForm:currentFieldAttribute    ${ATTRIBUTE}
    
    ${REQCLASS}    SeleniumLibrary.Get Element Attribute    xpath://*[@id="formBuilderForm:currentFieldRequired"]/div[2]    class
    Run Keyword If    '${REQCLASS}'!='ui-chkbox-box ui-widget ui-corner-all ui-state-default ui-state-disabled'
    ...    Set Checkbox Sate    formBuilderForm:currentFieldRequired    ${REQUIRED}
    
    ${REACLASS}    SeleniumLibrary.Get Element Attribute    xpath://*[@id="formBuilderForm:currentFieldReadOnly"]/div[2]    class
    Run Keyword If    '${REACLASS}'!='ui-chkbox-box ui-widget ui-corner-all ui-state-default ui-state-disabled'
    ...    Set Checkbox Sate    formBuilderForm:currentFieldReadOnly    ${READONLY}
    
    Input Text    xpath://*[@id="formBuilderForm:currentFieldLabelPrefix"]    ${PREFIX}
    Wait Until Element Is Enabled    xpath://*[@id="formBuilderForm:saveFieldPropertiesButton"]    timeout=100s
    Click Button    xpath://*[@id="formBuilderForm:saveFieldPropertiesButton"]

Configure Photo Component    [Arguments]    ${LABELTEXT}    ${STORAGE}    ${DELWITHELEMENTS}
    [Documentation]    Configure Photo Component with JMap Storage        #Try to convert the last attribute to a list, to use it to configure external database photos
    Wait Until Element Is Enabled    xpath://input[@id='formBuilderForm:currentFieldLabelText']    timeout=100s    
    Input Text    xpath://input[@id='formBuilderForm:currentFieldLabelText']    ${LABELTEXT}
    Wait Until Element Is Enabled    xpath://label[text()='${STORAGE}']    timeout=100s    
    Click Element    xpath://label[text()='${STORAGE}']    
    Set Checkbox Sate    formBuilderForm:documentPhotoDeleteWithElement    ${DELWITHELEMENTS}
    Wait Until Element Is Enabled    xpath://*[@id="formBuilderForm:saveFieldPropertiesButton"]    timeout=100s
    Click Element    xpath://*[@id="formBuilderForm:saveFieldPropertiesButton"]
    Sleep    2 
    
Configure External Photo Component    [Arguments]    ${LABELTEXT}    ${STORAGE}    ${PERSISTENCE}    ${DELWITHELEMENTS}    ${DB}    ${TABLE}    ${PHOTOID}    ${ELEMENTID}    ${FILENAME}    ${PHOTODATA}    ${PHOTOTITLE}    ${PHOTOCOMMENT}    ${FOLDERPATH}    #Try to convert the last attribute to a list, to use it to configure external database photos
    [Documentation]    Configure Photo Component with External Database. If is External Database it fill the options 
    ...    of Database name, Table name, Id, objectid, Photo, Title, Comment. If is external database and disk persistence
    ...    it fill the options of Database name, Table name, Id, objectid,Title, Comment, file path. 
    Wait Until Element Is Enabled    xpath://input[@id='formBuilderForm:currentFieldLabelText']    timeout=100s        
    Input Text    xpath://input[@id='formBuilderForm:currentFieldLabelText']    ${LABELTEXT}
    Wait Until Element Is Enabled    xpath://label[text()='${STORAGE}']    timeout=100s    
    Click Element    xpath://label[text()='${STORAGE}']    
    Run Keyword If    '${PERSISTENCE}'!='Database'    Click Element    xpath://label[text()='${PERSISTENCE}']
    Wait Until Element Is Enabled    id:formBuilderForm:documentPhotoStorageDatabase    timeout=100s    
    Select Element in JMap List Items Component with Timeout    formBuilderForm:documentPhotoStorageDatabase    ${DB}    100
    Sleep    20    reason="Wait for DB latency to load"
    Wait Until Element Is Enabled    id:formBuilderForm:documentSelectTableName    timeout=100s    
    Select Element in JMap List Items Component with Timeout    formBuilderForm:documentSelectTableName    ${TABLE}    100
    Wait Until Element Is Enabled    id:formBuilderForm:documentSelectFieldDocumentId    timeout=100s
    Select Element in JMap List Items Component with Timeout    formBuilderForm:documentSelectFieldDocumentId    ${PHOTOID}    100
    Wait Until Element Is Enabled    id:formBuilderForm:documentSelectFieldObjectId    timeout=100s
    Select Element in JMap List Items Component with Timeout    formBuilderForm:documentSelectFieldObjectId    ${ELEMENTID}    100
    Wait Until Element Is Enabled    id:formBuilderForm:documentSelectFieldFileName    timeout=100s
    Select Element in JMap List Items Component with Timeout    formBuilderForm:documentSelectFieldFileName    ${FILENAME}    100
    Run Keyword If    '${PERSISTENCE}'=='Database'    Wait Until Element Is Enabled    id:formBuilderForm:documentSelectFieldImageData
    Run Keyword If    '${PERSISTENCE}'=='Database'    Select Element in JMap List Items Component    formBuilderForm:documentSelectFieldImageData    ${PHOTODATA}
    Wait Until Element Is Enabled    id:formBuilderForm:documentSelectFieldTitle    timeout=100s
    Select Element in JMap List Items Component    formBuilderForm:documentSelectFieldTitle    ${PHOTOTITLE}
    Wait Until Element Is Enabled    id:formBuilderForm:documentSelectFieldComment    timeout=100s
    Select Element in JMap List Items Component    formBuilderForm:documentSelectFieldComment    ${PHOTOCOMMENT}
    Wait Until Element Is Enabled    id:formBuilderForm:documentPhotoDeleteWithElement    timeout=100s
    Set Checkbox Sate    formBuilderForm:documentPhotoDeleteWithElement    ${DELWITHELEMENTS}
    Run Keyword If    '${PERSISTENCE}'=='Disk'    Input Text    xpath://input[@id='formBuilderForm:documentImageDataPath']    ${FOLDERPATH}    
    Wait Until Element Is Enabled    xpath://*[@id="formBuilderForm:saveFieldPropertiesButton"]    timeout=100s
    Click Element    xpath://*[@id="formBuilderForm:saveFieldPropertiesButton"]
    Sleep    2    
    
Configure External Photo Component for Database Form    [Arguments]    ${LABELTEXT}    ${PERSISTENCE}    ${DELWITHELEMENTS}    ${DB}    ${TABLE}    ${PHOTOID}    ${ELEMENTID}    ${FILENAME}    ${PHOTODATA}    ${PHOTOTITLE}    ${PHOTOCOMMENT}    ${FOLDERPATH}    #Try to convert the last attribute to a list, to use it to configure external database photos
    [Documentation]    Configure Photo Component with External Database. If is External Database it fill the options 
    ...    of Database name, Table name, Id, objectid, Photo, Title, Comment. If is external database and disk persistence
    ...    it fill the options of Database name, Table name, Id, objectid,Title, Comment, file path. 
    Wait Until Element Is Enabled    xpath://input[@id='formBuilderForm:currentFieldLabelText']    timeout=100s        
    Input Text    xpath://input[@id='formBuilderForm:currentFieldLabelText']    ${LABELTEXT}
    Run Keyword If    '${PERSISTENCE}'!='Database'    Click Element    xpath://table[@id="formBuilderForm:documentPhotoPersistenceType"]//label[text()='Database']
    Wait Until Element Is Enabled    id:formBuilderForm:documentPhotoStorageDatabase    timeout=100s    
    Select Element in JMap List Items Component with Timeout    formBuilderForm:documentPhotoStorageDatabase    ${DB}    100
    Sleep    10    reason="Wait for DB latency to load"
    Wait Until Element Is Enabled    id:formBuilderForm:documentSelectTableName    timeout=100s    
    Select Element in JMap List Items Component with Timeout    formBuilderForm:documentSelectTableName    ${TABLE}    100
    Sleep    10    reason="Wait for DB latency to load"
    Wait Until Element Is Enabled    id:formBuilderForm:documentSelectFieldDocumentId    timeout=100s
    Select Element in JMap List Items Component with Timeout    formBuilderForm:documentSelectFieldDocumentId    ${PHOTOID}    100
    Sleep    10    reason="Wait for DB latency to load"
    Wait Until Element Is Enabled    id:formBuilderForm:documentSelectFieldObjectId    timeout=100s
    Select Element in JMap List Items Component with Timeout    formBuilderForm:documentSelectFieldObjectId    ${ELEMENTID}    100
    Sleep    10    reason="Wait for DB latency to load"
    Wait Until Element Is Enabled    id:formBuilderForm:documentSelectFieldFileName    timeout=100s
    Select Element in JMap List Items Component    formBuilderForm:documentSelectFieldFileName    ${FILENAME}
    Run Keyword If    '${PERSISTENCE}'=='Database'    Wait Until Element Is Enabled    id:formBuilderForm:documentSelectFieldImageData
    Run Keyword If    '${PERSISTENCE}'=='Database'    Select Element in JMap List Items Component    formBuilderForm:documentSelectFieldImageData    ${PHOTODATA}
    Wait Until Element Is Enabled    id:formBuilderForm:documentSelectFieldTitle    timeout=100s
    Select Element in JMap List Items Component    formBuilderForm:documentSelectFieldTitle    ${PHOTOTITLE}
    Wait Until Element Is Enabled    id:formBuilderForm:documentSelectFieldComment    timeout=100s
    Select Element in JMap List Items Component    formBuilderForm:documentSelectFieldComment    ${PHOTOCOMMENT}
    Wait Until Element Is Enabled    id:formBuilderForm:documentPhotoDeleteWithElement    timeout=100s
    Set Checkbox Sate    formBuilderForm:documentPhotoDeleteWithElement    ${DELWITHELEMENTS}
    Run Keyword If    '${PERSISTENCE}'=='Disk'    Input Text    xpath://input[@id='formBuilderForm:documentImageDataPath']    ${FOLDERPATH}    
    Wait Until Element Is Enabled    xpath://*[@id="formBuilderForm:saveFieldPropertiesButton"]    timeout=100s
    Click Element    xpath://*[@id="formBuilderForm:saveFieldPropertiesButton"]
    Sleep    2 

Configure External Photo Component With Empty Database    [Arguments]    ${LABELTEXT}    ${STORAGE}    ${PERSISTENCE}    ${DELWITHELEMENTS}    ${DB}    ${TABLE}    ${PHOTOID}    ${ELEMENTID}    ${FILENAME}    ${PHOTODATA}    ${PHOTOTITLE}    ${PHOTOCOMMENT}    ${FOLDERPATH}    #Try to convert the last attribute to a list, to use it to configure external database photos
    [Documentation]    Configure Photo Component with External Database with empty database    
    Wait Until Element Is Enabled    xpath://input[@id='formBuilderForm:currentFieldLabelText']    timeout=100s    
    Input Text    xpath://input[@id='formBuilderForm:currentFieldLabelText']    ${LABELTEXT}
    Wait Until Element Is Enabled    xpath://label[text()='${STORAGE}']    timeout=100s    
    Click Element    xpath://label[text()='${STORAGE}']
    Run Keyword If    '${PERSISTENCE}'!='Database'    Click Element    xpath://label[text()='${PERSISTENCE}']
    Select Element in JMap List Items Component with Timeout    formBuilderForm:documentPhotoStorageDatabase    ${DB}    100
    Wait Until Element Is Enabled    id:formBuilderForm:documentPhotoDeleteWithElement    timeout=100s
    Set Checkbox Sate    formBuilderForm:documentPhotoDeleteWithElement    ${DELWITHELEMENTS}    
    Run Keyword If    '${PERSISTENCE}'=='Disk' and '${DB}'!='${EMPTY}'     Input Text    xpath://input[@id='formBuilderForm:documentImageDataPath']    ${FOLDERPATH}    
    Wait Until Element Is Enabled    xpath://*[@id="formBuilderForm:saveFieldPropertiesButton"]    timeout=100s
    Click Element    xpath://*[@id="formBuilderForm:saveFieldPropertiesButton"]
    Sleep    2 

Configure External Photo Component With Empty Table    [Arguments]    ${LABELTEXT}    ${STORAGE}    ${PERSISTENCE}    ${DELWITHELEMENTS}    ${DB}    ${TABLE}    ${PHOTOID}    ${ELEMENTID}    ${FILENAME}    ${PHOTODATA}    ${PHOTOTITLE}    ${PHOTOCOMMENT}    ${FOLDERPATH}    #Try to convert the last attribute to a list, to use it to configure external database photos
    [Documentation]    Configure Photo Component with External Database with empty table    
    Wait Until Element Is Enabled    xpath://input[@id='formBuilderForm:currentFieldLabelText']    timeout=100s    
    Input Text    xpath://input[@id='formBuilderForm:currentFieldLabelText']    ${LABELTEXT}
    Wait Until Element Is Enabled    xpath://label[text()='${STORAGE}']    timeout=100s    
    Click Element    xpath://label[text()='${STORAGE}']
    Run Keyword If    '${PERSISTENCE}'!='Database'    Click Element    xpath://label[text()='${PERSISTENCE}']
    Select Element in JMap List Items Component with Timeout    formBuilderForm:documentPhotoStorageDatabase    ${DB}    100
    Sleep    20    reason="Wait for DB latency to load"
    Wait Until Element Is Enabled    id:formBuilderForm:documentSelectTableName    timeout=100s
    Select Element in JMap List Items Component with Timeout    formBuilderForm:documentSelectTableName    ${TABLE}    100
    Set Checkbox Sate    formBuilderForm:documentPhotoDeleteWithElement    ${DELWITHELEMENTS}
    Run Keyword If    '${PERSISTENCE}'=='Disk' and '${TABLE}'!='${EMPTY}'     Input Text    xpath://input[@id='formBuilderForm:documentImageDataPath']    ${FOLDERPATH}    
    Wait Until Element Is Enabled    xpath://*[@id="formBuilderForm:saveFieldPropertiesButton"]    timeout=100s    
    Click Element    xpath://*[@id="formBuilderForm:saveFieldPropertiesButton"]
    Sleep    2 

Cancel Component Properties
    Click Element    xpath://*[@id="formBuilderForm:cancelFieldPropertiesButton"]
Add User in Permission page
    [Documentation]    Add user to permission. Click on + button in permissions
    Wait Until Element Is Enabled    xpath://*[@id="theForm:tabViewPermissionsOwners:tblPrincipals:cmlAdd"]    timeout=100s    
    Click Button    xpath://*[@id="theForm:tabViewPermissionsOwners:tblPrincipals:cmlAdd"]

Remove User in Permission page
    [Documentation]    Remove user to permission. Click on - button in permissions
    Wait Until Element Is Enabled    xpath://*[@id='theForm:tabViewPermissionsOwners:tblPrincipals:cmlDelete']    timeout=100s
    Click Button    xpath://*[@id='theForm:tabViewPermissionsOwners:tblPrincipals:cmlDelete']
    
Click on Add
    [Documentation]    Click on Add button
    Wait Until Element Is Enabled    xpath://span[text()='Add']    timeout=100s    
    Click Element    xpath://span[text()='Add']
    
Select Permissions for the Available Users    [Arguments]    ${TABLEID}    ${ELEMENTNAME}
    [Documentation]    Select given permission to the user   
    ${COUNT}    SeleniumLibrary.Get Element Count    xpath://*[@id="${TABLEID}"]//tbody/tr
    ${COUNT}=    Evaluate    ${COUNT} + 1
    
    :FOR    ${INDEX}    IN RANGE    1    ${COUNT}
    \    ${TEXT}    Get Text    xpath://*[@id="${TABLEID}"]//tbody/tr[${INDEX}]/td//span[@class='ui-chkbox-label']
    \    Run Keyword If    '${TEXT}'=='${ELEMENTNAME}'    Exit For Loop
    
    Click Element    xpath://*[@id="${TABLEID}"]//tbody/tr[${INDEX}]/td/a/div/div

Remove All Permissions to User    [Arguments]    ${USER}
    [Documentation]    Remove user in the available permissions and remove permissions
    Wait Until Element Is Visible    theForm:tabViewPermissionsOwners:tblPrincipals    timeout=100s
    Select Element in JMap Table Component Td    theForm:tabViewPermissionsOwners:tblPrincipals    ${USER}
    Remove User in Permission page
    Click Confirmation Dialog
    Click Save Button 
    
Add Permissions to a User    [Arguments]    ${USER}    @{PERMISSIONS}
    [Documentation]    Add given permissions to the given user 
    Add User in Permission page
    Wait Until Element Is Visible    theForm:tabViewPermissionsOwners:tblPrincipalsAvailable    timeout=100s    
    Select Element in JMap Table Component Span    theForm:tabViewPermissionsOwners:tblPrincipalsAvailable    ${USER}
    Click on Add
    :FOR    ${PERMISSION}    IN    @{PERMISSIONS}
    \    Select Permissions for the Available Users    theForm:tabViewPermissionsOwners:panelPermissions    ${PERMISSION}

Add Permissions to a User that was Already Setted    [Arguments]    ${USER}
    [Documentation]    Check if the user is already in the permission page
    Click Button    xpath://*[@id="theForm:tabViewPermissionsOwners:tblPrincipals:cmlAdd"]
    ${RESULT}=    Exist Element in JMap Table Component Span    theForm:tabViewPermissionsOwners:tblPrincipalsAvailable    ${USER}
    Should Be Equal     ${RESULT}     ${False}
    
Save Form Layout
    [Documentation]    Save the form layout
    Wait Until Element Is Enabled    xpath://*[@id="formBuilderForm:affirmativeFormButton"]    timeout=100s    
    Click Button    xpath://*[@id="formBuilderForm:affirmativeFormButton"]

Save Database Form Layout
    [Documentation]    Save the database form layout
    Wait Until Element Is Enabled    xpath://div[@id="formPropertiesForm:formPropertiesDialog"]//span[text()='Save']    timeout=100s   
    Click Element    xpath://button[@name='formBuilderForm:affirmativeFormButton']//span[@class='ui-button-text ui-c'][contains(text(),'Save')] 
    
Exist form    [Arguments]    ${NAME}
    [Documentation]    Check form existance in the list by given name
    ${FLAG}    Set Variable    ${False}
    ${TEMP}=    Exist Element in JMap Table Component a    theForm:tabViewForms:tblForms    ${NAME}
    Return From Keyword If    '${TEMP}'!='${True}'    ${FLAG}
    Return From Keyword If    '${TEMP}'=='${True}'    ${True}  

#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Metrics Keywords
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Setup Metrics
    [Documentation]    This Keyword give the start time when the execution of the test case starts. 
    ${tc_start}    Get Current Date    result_format=epoch
    Set Test Variable    ${tc_start}   ${tc_start}  

End Metrics
    [Documentation]    This Keyword give the end time when the execution of the test case starts. 
    ...    And it account elapsed time for the execution
    ${tc_end}    Get Current Date    result_format=epoch
    ${tc_duration}     Subtract Time From Time    ${tc_end}     ${tc_start}   
    ${tc_duration}    Evaluate    ${tc_duration}/60
    [Return]    ${tc_duration} 

Check Metrics
    [Documentation]    This Keyword used to check the elapsed time, and display it in the console.
    ${duration}    End Metrics
    Set Tags    Time Out
    #Set Test Message    The duration of the TC "${TEST_NAME}" is : ${duration} Min    append=True
    [Return]    ${duration} 
    
    #Console: robot LoginWindowTests.robot && robotmetrics --ignorelib = ['SeleniumLibrary', 'Collections']
    #pybot -A Argument_File.txt
    #Robot -A Argument_File.txt && robotmetrics --report MyReport.html
    
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# REST API Session Keywords
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Open New Session    [Arguments]    ${pUsername}    ${pPassword}    ${pType}
    [Documentation]    Open new session for the given username, password and application type
    ...    The session id generated is stored in a global variable called SESSIONID.
    ...    Use ${SESSIONID} wherever you want to access to the variable's value
    Post    http://${localhost}:${internPort}/services/rest/v2.0/session    body={"username": "${pUsername}","password": "${pPassword}","type": "${pType}"}    allow_redirects=true    headers={"Content-Type":"application/json"}
    Integer    response status    200
    String    $.status    OK    #Asserts that the response status was OK
    ${RESULT}    Object    $.result
    ${RESULT}    Set Variable    ${RESULT[0]}        
    #Output    response 
    [Return]    ${RESULT}   
    
GET Current Session ID    [Arguments]    ${pResult}
    [Documentation]    Get the session ID for the current session
    ${getSessionID}=    Set Variable    ${pResult['sessionId']}
    [Return]    ${getSessionID}
    
GET Current Server Version    [Arguments]    ${pResult}
    [Documentation]    Get the server version (Build) for the current session
    ${getBuild}=    Set Variable    ${pResult['serverVersion']}
    [Return]    ${getBuild}   
           
Close The Current Session    [Arguments]    ${SESSION}
    [Documentation]    Close REST API session by given session id
    Delete    http://${localhost}:${internPort}/services/rest/v2.0/session?sessionId=${SESSION}  
    String    $.message    Session has been closed
    String    $.status    OK    #Asserts that the response status was OK  
       
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#Test Link Keywords
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Close JMap Web
    Close Browser
    ${ElapsedTime}    Check Metrics
    Log    ================================================
    
    log    ${SUITE_NAME}
    @{listeSuiteName}    Split String    ${SUITE_NAME}    .
    ${LengthSuiteName}    Get Length    ${listeSuiteName}
    ${suiteName}    Set Variable    ${listeSuiteName[${LengthSuiteName}-1]}
    @{suiteName}    Split String    ${suiteName}    Tests 
    ${suiteName}    Set Variable    ${suiteName[0]}           
    log    ${suiteName}
    
    Log    ================================================
    log    ${TEST_NAME}
    @{listeTestName}    Split String    ${TEST_NAME}    :
    ${LengthTest}    Get Length    ${listeTestName}
    ${tesCaseName}    Set Variable    ${listeTestName[${LengthTest}-1]}    
    log    ${tesCaseName}
    
    Log    ================================================
    ${BODY}    Open New Session    ${UserName}    ${Password}    ${TYPE}
    ${SESSIONID}    GET Current Session ID    ${BODY}
    ${buildName}    GET Current Server Version    ${BODY} 
    ${buildName}    Set Variable    JMap ${buildName}
    Close The Current Session    ${SESSIONID}
    
    [Teardown]    Run Keyword If    "${useTL}"=="true"    Go To Testlink To Update Test Case    ${projectNum}    ${testPlan}    ${buildName}    ${suiteName}    ${tesCaseName}    ${ElapsedTime}

#===============================================================================================================
    
    Log    ================================================================================    
    
Init Api Class TestLinkAPIClient    [Arguments]    ${URL}    ${API_KEY}
    Log    \n=================== Go To Connect To Testlink ===================    console=yes
    ${tlapi_client}=    Create Api Client    TestlinkAPIClient    server_url=${URL}    devkey=${API_KEY}
    Log To Console    ${tlapi_client}
    Log    -----> Testlink is connected successfully    console=yes
    Log    ================================================================================= 

Go To Testlink To Update Test Case
    [Arguments]    ${projectNum}    ${CurrentTestPlan}    ${CurrentBuildName}    ${suitName}    ${caseName}    ${Elapsed}
    Init Api Class TestLinkAPIClient    ${TL_URL}    ${DEV_KEY}
    @{projects}=    Call Api Method    getProjects
    ${length}=     Get Length    ${projects}
    ${project}    Set Variable    ${projects[${projectNum}]}
    Log    ${project}
    ${projectNAME}    Set Variable    ${project['name']}
    ${projectID}    Set Variable    ${project['id']}
    Log    =================================================================================
    @{testPlans}=    Call Api Method    getTestPlanByName    testprojectname=${projectNAME}    testplanname=${CurrentTestPlan}
    ${length}=     Get Length    ${testPlans}
    ${testPlan}    Set Variable    ${testPlans}[${length-1}]
    Log    ${testPlan}
    ${testPlanNAME}    Set Variable    ${testPlan['name']}
    ${testPlanID}    Set Variable    ${testPlan['id']}
    Log    =================================================================================
    ${latestBuild}=    Call Api Method    getLatestBuildForTestPlan    ${testPlanID}
    ${length}=     Get Length    ${latestBuild}
    ${latestBuildID}    Set Variable    ${latestBuild['id']}
    ${latestBuildNAME}    Set Variable    ${latestBuild['name']}
    
    ${latestBuildNAME}    Run Keyword If        '${latestBuildNAME}' != '${CurrentBuildName}'    
    ...    Set Variable    ${CurrentBuildName}
    ...    ELSE
    ...    Set Variable    ${latestBuildNAME}        
    Log    ${latestBuildNAME}
        
    Log    =================================================================================
    @{testCases}    Call Api Method    getTestCaseIDByName    testcasename=${caseName}    testsuitname=${suitName}    testprojectname=${projectNAME} 
    ${length}=     Get Length    ${testCases}  
    :FOR    ${i}    IN RANGE    ${length}
    \    Log    ${testCases[${i}]}   
    \    ${testCase}    Run Keyword If    '${testCases[${i}]['tsuite_name']}'=='${suitName}'    Set Variable    ${testCases}[${i}] 
    \    Exit For Loop If    '${testCases[${i}]['tsuite_name']}'=='${suitName}'
    Log    ${testCase}
    ${testCaseNAME}    Set Variable    ${testCase['name']}
    ${testCaseID}    Set Variable    ${testCase['id']}
    ${testCaseExternalID}    Set Variable    ${testCase['tc_external_id']}
    Log    =================================================================================
    @{lastExecution}=    Call Api Method    getLastExecutionResult    testplanid=${testPlanID}
                                                               ...    testcaseid=${testCaseID}    
                                                               ...    testCaseexternaid=${testCaseExternalID}    
                                                               #...    buildid=${latestBuildID}    
                                                               #...    buildname=${latestBuildNAME}
    ${Length1}    Get Length    ${lastExecution}
    ${lastExecution}    Set Variable    ${lastExecution[0]}
    Log    ${lastExecution}
    ${lastExecutionID}    Set Variable    ${lastExecution['id']}
   
    Run Keyword If Test Passed    Update Test Case In Testlink With Passed    ${lastExecutionID}    ${lastExecution}    ${testCaseID}    ${testPlanID}    ${latestBuildNAME}    ${Elapsed}   
    Run Keyword If Test Failed    Update Test Case In Testlink With Failed    ${lastExecutionID}    ${lastExecution}    ${testCaseID}    ${testPlanID}    ${latestBuildNAME}    ${Elapsed}

Update Test Case In Testlink With Passed
    [Arguments]    ${lastExecutionID}    ${lastExecution}    ${testCaseID}    ${testPlanID}    ${latestBuildNAME}    ${Elapsed}    
    Run Keyword If    '${lastExecutionID}'=='-1'   
    ...    The First Execution Passed    ${testCaseID}    ${testPlanID}    ${latestBuildNAME}    ${Elapsed}        
    
    Run Keyword If    '${lastExecutionID}'!='-1'
    ...    The Next Execution Passed    ${lastExecution}    ${testCaseID}    ${testPlanID}    ${latestBuildNAME}    ${Elapsed}  

Update Test Case In Testlink With Failed
    [Arguments]    ${lastExecutionID}    ${lastExecution}    ${testCaseID}    ${testPlanID}    ${latestBuildNAME}    ${Elapsed}    
    Run Keyword If    '${lastExecutionID}'=='-1'   
    ...    The First Execution Failed    ${testCaseID}    ${testPlanID}    ${latestBuildNAME}    ${Elapsed}        
    
    Run Keyword If    '${lastExecutionID}'!='-1'
    ...    The Next Execution Failed    ${lastExecution}    ${testCaseID}    ${testPlanID}    ${latestBuildNAME}    ${Elapsed}

The Next Execution Passed
    [Documentation]    Get the attributes of the previous execution and update the test case.
    [Arguments]    ${lastExecution}    ${testCaseID}    ${testPlanID}    ${latestBuildNAME}    ${Elapsed}
    
    ${lastExecutionNotes}    Set Variable    ${lastExecution['notes']}
    ${status}    Set Variable    ${lastExecution['status']}    #f    p    
    ${testerid}    Set Variable    ${lastExecution['tester_id']}
    
    ${lengthIssuesPrefix}    Get Length    ${issuesPrefix}
    @{isIssuesPrefix}    Create List    #This list contains the boolean values    
    :FOR    ${issue}    IN    @{issuesPrefix}
    \    ${isIssue}    Run Keyword And Return Status    Should Contain    ${lastExecutionNotes}    ${issue}
    \    ${isIssue}    Convert To String    ${isIssue}
    \    Append To List    ${isIssuesPrefix}    ${isIssue}
    Log    ${isIssuesPrefix}    #This list contains the boolean values
    
    ${isIssueInList}    Run Keyword And Return Status    List Should Contain Value    ${isIssuesPrefix}    True        
    
    #==========================================
    ${lastExecutionNotes}    Run Keyword If    '${isIssueInList}' == '${True}'
    ...    Get All Ticket Keys Of The Last Execution Notes    ${lastExecutionNotes}    ${issuesPrefix}    ${JiraUser}    ${JiraToken}
    ...    ELSE
    ...    Set Variable    ${EMPTY}
    ${isEmpty}    Run Keyword And Return Status    Should Be Equal    ${lastExecutionNotes}    ${EMPTY}    
    #==========================================            
    
    ${notesFinal}=     Set Variable    AUTOMATED TEST PASSED AND LAST EXECUTION TEST
    ${notesFinal}=     Run Keyword If    
    ...    '${status}'=='p'    Set Variable    ${notesFinal} PASSED
    ...    ELSE
    ...    Set Variable    ${notesFinal} FAILED
    
    ${notesFinal}=    Set Variable If 
    ...    '${isIssueInList}'=='${False}' or '${isEmpty}' == '${True}'    ${notesFinal}       
    ...    '${isIssueInList}'=='${True}' and '${isEmpty}' != '${True}'    ${notesFinal}\nKnown Associated Issues:\n${lastExecutionNotes}
    
             
    Run Keyword If    '${status}'=='p' and '${isEmpty}' == '${True}' or '${status}'=='f' and '${isEmpty}' == '${True}'
    ...    Call Api Method    reportTCResult    ${testCaseID}    ${testPlanID}    ${latestBuildNAME}    p    ${notesFinal}    execduration=${Elapsed}
    ...    ELSE
    ...    Call Api Method    reportTCResult    ${testCaseID}    ${testPlanID}    ${latestBuildNAME}    f   ${notesFinal}    execduration=${Elapsed}

The Next Execution Failed
    [Documentation]    Get the attributes of the previous execution and update the test case.
    [Arguments]    ${lastExecution}    ${testCaseID}    ${testPlanID}    ${latestBuildNAME}    ${Elapsed}
    
    ${lastExecutionNotes}    Set Variable    ${lastExecution['notes']}
    ${status}    Set Variable    ${lastExecution['status']}    #f    p    
    ${testerid}    Set Variable    ${lastExecution['tester_id']}
    
    ${lengthIssuesPrefix}    Get Length    ${issuesPrefix}
    @{isIssuesPrefix}    Create List    #This list contains the boolean values    
    :FOR    ${issue}    IN    @{issuesPrefix}
    \    ${isIssue}    Run Keyword And Return Status    Should Contain    ${lastExecutionNotes}    ${issue}
    \    ${isIssue}    Convert To String    ${isIssue}
    \    Append To List    ${isIssuesPrefix}    ${isIssue}
    Log To Console    ${isIssuesPrefix}    #This list contains the boolean values
    
    ${isIssueInList}    Run Keyword And Return Status    List Should Contain Value    ${isIssuesPrefix}    True
    
    #==========================================
    ${lastExecutionNotes}    Run Keyword If    '${isIssueInList}' == '${True}'
    ...    Get All Ticket Keys Of The Last Execution Notes    ${lastExecutionNotes}    ${issuesPrefix}    ${JiraUser}    ${JiraToken}
    ...    ELSE
    ...    Set Variable    ${EMPTY}
    ${isEmpty}    Run Keyword And Return Status    Should Be Equal    ${lastExecutionNotes}    ${EMPTY} 
    #==========================================
    ${notesFinal}=     Set Variable    AUTOMATED TEST FAILED AND LAST EXECUTION TEST
    ${notesFinal}=     Run Keyword If    
    ...    '${status}'=='p'    Set Variable    ${notesFinal} PASSED
    ...    ELSE
    ...    Set Variable    ${notesFinal} FAILED
    
    ${notesFinal}=    Set Variable If 
    ...    '${isIssueInList}'=='${False}' or '${isEmpty}' == '${True}'    ${notesFinal}       
    ...    '${isIssueInList}'=='${True}' and '${isEmpty}' != '${True}'    ${notesFinal}\nKnown Associated Issues:\n${lastExecutionNotes}
    
    Call Api Method    reportTCResult    ${testCaseID}    ${testPlanID}    ${latestBuildNAME}    f   ${notesFinal}    execduration=${Elapsed}

The First Execution Passed
    [Arguments]    ${testCaseID}    ${testPlanID}    ${latestBuildNAME}    ${Elapsed}
    ${notes}=    Set Variable    THE FIRST EXECUTION OF AUTOMATED TEST PASSED
    ${reportRusult}    Call Api Method    reportTCResult    ${testCaseID}    ${testPlanID}    ${latestBuildNAME}    p    ${notes}    execduration=${Elapsed}   
    
The First Execution Failed
    [Arguments]    ${testCaseID}    ${testPlanID}    ${latestBuildNAME}    ${Elapsed}
    ${notes}=    Set Variable    THE FIRST EXECUTION OF AUTOMATED TEST FAILED
    ${reportRusult}    Call Api Method    reportTCResult    ${testCaseID}    ${testPlanID}    ${latestBuildNAME}    f    ${notes}    execduration=${Elapsed}

Get All Ticket Keys Of The Last Execution Notes
    [Arguments]        ${plastExecutionNotes}    ${pIssuePrefix}    ${pJiraUser}    ${pJiraToken}
    Log    \n=================== Go To Get All Ticket Keys Of The Last Execution Notes ===================    console=yes
    @{allKeys}     Create List
    :FOR    ${prefix}    IN    @{pIssuePrefix}
    \    @{allKeys}    Get The Ticket Keys Of Notes For A Project Into The List     ${plastExecutionNotes}    ${prefix} 	@{allKeys}   
    Log    -----> All Keys Of Notes For A Project Into The List: ${allKeys}    console=yes
    :FOR    ${JiraPrefix}    IN    @{allKeys} 
    \    Run Keyword If    '${JiraPrefix}' != '${EMPTY}'    Set Jira Link    ${JiraPrefix}
       
    @{notesNotClosed}    Create List    
    :FOR    ${Key}    IN    @{allKeys}
    \    @{JiraTicketStatus}    Get Jira Status Of Ticket "${Key}" With Username "${pJiraUser}" And Authentication Token "${pJiraToken}"
    \    Run Keyword If    '${JiraTicketStatus[2]}' != 'Done' and '${JiraTicketStatus[2]}' != 'Closed' and '${JiraTicketStatus[2]}' != 'Fini' and '${JiraTicketStatus[2]}' != 'Fermée'
    \    ...    Append To List    ${notesNotClosed}    ${Key} ${JiraTicketStatus[1]}                      
    Log    -----> Notes not closed: ${notesNotClosed}    console=yes
    
    ${NotesString}=     Set Variable    
    :FOR    ${line}    IN    @{notesNotClosed}
    \    Log     ${line}    console=yes
    \    ${NotesString}    Set Variable    ${NotesString}${line}\n    
    
    [Return]    ${NotesString}
       
Get The Ticket Keys Of Notes For A Project Into The List 
    [Arguments]    ${pThelastExecutionNotes}    ${pIssuePrefix}    @{listTickets} 
    
    @{keyNotes}    Split String    ${pThelastExecutionNotes}    ${pIssuePrefix}-
    Log    ${keyNotes}    console=yes
    ${lengthKeyNotes}    Get Length    ${keyNotes}
    :FOR    ${i}    IN RANGE    ${lengthKeyNotes}
    \    @{TicketList}    Split String    ${keyNotes[${i}]}    ${SPACE}
    \    ${keyNumber}    Set Variable    ${TicketList[0]}
    \    ${isNumber}    Run Keyword And Return Status    Should Be True    ${keyNumber} > 0           
    \    Run Keyword If    '${isNumber}' == '${True}'    Append To List    ${listTickets}    ${pIssuePrefix}-${keyNumber}       
    Log    -----> Tickets: ${listTickets}    console=yes       
    [Return]    @{listTickets}
    
Get Jira Status Of Ticket "${pticketKey}" With Username "${pJiraUser}" And Authentication Token "${pJiraToken}"
    [Documentation]    This keyword is used to get the ticket key with the status from "Jira".
    Log    \n=================== Go To Get Jira Status Of Ticket "${pticketKey}" ===================    console=yes
    ${variable}    Set variable     ${pJiraUser}:${pJiraToken}
    ${variable}=    Evaluate    $variable.encode("utf-8")
    Log To Console    ${variable}  
    ${Base64Token}=     Evaluate 	base64.b64encode($variable) 	modules=base64
    Log To Console    Token : ${Base64Token}
    ${JSONFile}    Get     https://k2geospatial.atlassian.net/rest/api/2/issue/${pticketKey}?fields=status,summary    headers={ "Authorization": "Basic ${Base64Token}", "Content-Type": "application/json" }
    log    \n${JSONFile}    console=yes
    Run Keyword If    '${JSONFile['status']}'=='200'    Log    -----> Jira is connected successfully    console=yes    ELSE    Log    -----> Jira is not connected    console=yes 
    
    ${key}    Set Variable    ${JSONFile['body']['key']}
    ${summary}    Set Variable    ${JSONFile['body']['fields']['summary']}
    ${status}    Set Variable    ${JSONFile['body']['fields']['status']['name']}
    Log To Console    Key : ${key} 
    Log To Console    Summary : ${summary}
    Log To Console    name : ${status}
    @{JiraTicketStatus}    Create List    ${key}    ${summary}    ${status}
    Log    -----> Jira Ticket Status: ${JiraTicketStatus}    console=yes
    [Return]    @{JiraTicketStatus}
    
Set Jira Link
    [Arguments]    ${jira_Id}
    ${prev_level}    Set Log Level    WARN
    Set Test Message     *HTML* <br/><b>Link:</b> <a href='https://k2geospatial.atlassian.net/browse/${jira_Id}'>Jira Issue : ${jira_Id}</a><br/>    append=${true}
    Set Log Level    ${prev_level}