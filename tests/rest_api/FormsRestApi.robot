*** Setting ***

Documentation    Tests for Elements Form REST API in JMap 7 
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------       
Library    SeleniumLibrary    
Library    REST    http://192.168.0.25:8080    #RESTinstance 1.0.0rc4 Robot Framework test library for (RESTful) JSON APIs
Library    OperatingSystem
Library    Collections       
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Resource    ../../common/rest_api/CommonRestApi.robot
Resource    ../../common/CommonLogin.robot
Resource    ../../common/admin/CommonKeywords.robot
Resource    ../../common/admin/CommonProject.robot
Resource    ../../common/admin/CommonLayer.robot
Resource    ../../common/admin/CommonDatabase.robot
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Suite Setup    Start Up    
Suite Teardown    Suite Down        
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Variables ***

${USERNAME}    administrator
${PASSWORD}    ${EMPTY}
${TYPE}    WEB    #The session type must be DESKTOP, WEB or MOBILE.
${INVALIDSESSIONID}    -3
${PROJECTID}    0
${PROJECTNAME}    The World
${INVALIDPROJECTID}    -3
${LAYERID}    7
${LAYERNAME}    Cities
${INVALIDLAYERID}    -3
${JMAPADMIN}    http://192.168.0.25:8080
${DBNAME}    PostgresPhoto
${INVALIDFORM}    -3

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Test Cases ***
Get Multiple Form Descriptors
    [Documentation]    Endpoint to retreive all information of all forms in layer
    Get Multiple Form Descriptors

Get Multiple Form Descriptors With Invalid Session Id
    [Documentation]    Endpoint to retreive all information of all forms in layer using invalid session id
    Get Multiple Form Descriptors With Invalid Session Id

Get Multiple Form Descriptors With Empty Session Id
    [Documentation]    Endpoint to retreive all information of all forms in layer using empty session id
    Get Multiple Form Descriptors With Empty Session Id
    
Get Multiple Form Descriptors With Invalid Project Id
    [Documentation]    Endpoint to retreive all information of all forms in layer using invalid project id
    Get Multiple Form Descriptors With Invalid Project Id
    
Get Multiple Form Descriptors With Invalid Layer Id
    [Documentation]    Endpoint to retreive all information of all forms in layer using invalid layer id
    Get Multiple Form Descriptors With Invalid Layer Id
    
#---------------------------------------------------------------------------------------------------------------------------------------------------

Get a Single Form Descriptor
    [Documentation]    Endpoint to retreive all information of specific forms in layer
    Get a Single Form Descriptor
    
Get a Single Form Descriptor With Invalid Session Id
    [Documentation]    Endpoint to retreive all information of specific forms in layer
    Get a Single Form Descriptor With Invalid Session Id
    
Get a Single Form Descriptor With Empty Session Id
    [Documentation]    Endpoint to retreive all information of specific forms in layer
    Get a Single Form Descriptor With Empty Session Id
    
Get a Single Form Descriptor With Invalid Project Id
    [Documentation]    Endpoint to retreive all information of specific forms in layer
    Get a Single Form Descriptor With Invalid Project Id
    
Get a Single Form Descriptor With Invalid Layer Id
    [Documentation]    Endpoint to retreive all information of specific forms in layer
    Get a Single Form Descriptor With Invalid Layer Id
    
Get a Single Form Descriptor With Invalid Form Id
    [Documentation]    Endpoint to retreive all information of specific forms in layer
    Get a Single Form Descriptor With Invalid Form Id
#------------------------------------------------------------------------------------------------------------------------------------------------------
*** Keywords ***

Get Multiple Form Descriptors
    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'Result is an array of 2 form(s) data'
    #    Assertions
    String    $.status    OK
    String    $.message    Result is an array of 2 form(s) data
    
    ${ATTRIBUTE_FORM_ID}    Integer    $.result[0].id
    ${ATTRIBUTE_FORM_ID}    Catenate    ${ATTRIBUTE_FORM_ID}[0]
    ${ATTRIBUTE_FORM_NAME}    String    $.result[0].name
    ${ATTRIBUTE_FORM_NAME}    Catenate    ${ATTRIBUTE_FORM_NAME}[0]
    ${ATTRIBUTE_FORM_TYPE}    String    $.result[0].type
    ${ATTRIBUTE_FORM_TYPE}    Catenate    ${ATTRIBUTE_FORM_TYPE}[0]
    
    
    String    $.result[0].name    Attribute Form
    String    $.result[0].type    LAYER_ATTRIBUTES_FORM
    String    $.result[1].name    Database Form
    String    $.result[1].type    EXTERNAL_ATTRIBUTES_FORM
    String    $.result[1].idAttributeName    geodata.id    

Get Multiple Form Descriptors With Invalid Session Id
    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms?sessionId=${INVALIDSESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'     
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Get Multiple Form Descriptors With Empty Session Id
    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms?sessionId=${EMPTY}    timeout=10
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'     
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Get Multiple Form Descriptors With Invalid Project Id
    Get    /services/rest/v2.0/projects/${INVALIDPROJECTID}/layers/${LAYERID}/forms?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested project (id = ${INVALIDPROJECTID}) does not exist.'     
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested project (id \=\ ${INVALIDPROJECTID}) does not exist.

Get Multiple Form Descriptors With Invalid Layer Id
    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${INVALIDLAYERID}/forms?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested layer (id = ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}.'    
    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested layer (id \=\ ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}.

Get a Single Form Descriptor
    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms?sessionId=${SESSIONID}    timeout=10
    ${ATTRIBUTE_FORM_ID}    Integer    $.result[0].id
    ${ATTRIBUTE_FORM_ID}    Catenate    ${ATTRIBUTE_FORM_ID}[0]
    ${DATABASE_FORM_ID}    Integer    $.result[1].id
    ${DATABASE_FORM_ID}    Catenate    ${DATABASE_FORM_ID}[0]
    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${ATTRIBUTE_FORM_ID}?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'Result is a form data'    
    
    #    Assertions
    String    $.status    OK
    String    $.message    Result is a form data
    String    $.result.name    Attribute Form
    String    $.result.type    LAYER_ATTRIBUTES_FORM
    
    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${DATABASE_FORM_ID}?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'Result is a form data'    
    
    #    Assertions
    String    $.status    OK
    String    $.message    Result is a form data
    String    $.result.name    Database Form
    String    $.result.type    EXTERNAL_ATTRIBUTES_FORM
    String    $.result.idAttributeName    geodata.id
    
Get a Single Form Descriptor With Invalid Session Id
    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms?sessionId=${SESSIONID}    timeout=10
    ${ATTRIBUTE_FORM_ID}    Integer    $.result[0].id
    ${ATTRIBUTE_FORM_ID}    Catenate    ${ATTRIBUTE_FORM_ID}[0]
    
    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${ATTRIBUTE_FORM_ID}?sessionId=${INVALIDSESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'     
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
 
Get a Single Form Descriptor With Empty Session Id
    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms?sessionId=${SESSIONID}    timeout=10
    ${ATTRIBUTE_FORM_ID}    Integer    $.result[0].id
    ${ATTRIBUTE_FORM_ID}    Catenate    ${ATTRIBUTE_FORM_ID}[0]
    
    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${ATTRIBUTE_FORM_ID}?sessionId=${EMPTY}    timeout=10
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'     
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Get a Single Form Descriptor With Invalid Project Id
    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms?sessionId=${SESSIONID}    timeout=10
    ${ATTRIBUTE_FORM_ID}    Integer    $.result[0].id
    ${ATTRIBUTE_FORM_ID}    Catenate    ${ATTRIBUTE_FORM_ID}[0]
    
    Get    /services/rest/v2.0/projects/${INVALIDPROJECTID}/layers/${LAYERID}/forms/${ATTRIBUTE_FORM_ID}?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested project (id = ${INVALIDPROJECTID}) does not exist.'     
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested project (id \=\ ${INVALIDPROJECTID}) does not exist. 
    
Get a Single Form Descriptor With Invalid Layer Id
    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms?sessionId=${SESSIONID}    timeout=10
    ${ATTRIBUTE_FORM_ID}    Integer    $.result[0].id
    ${ATTRIBUTE_FORM_ID}    Catenate    ${ATTRIBUTE_FORM_ID}[0]
    
    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${INVALIDLAYERID}/forms/${ATTRIBUTE_FORM_ID}?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested layer (id = ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}.'    
    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested layer (id \=\ ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}.

Get a Single Form Descriptor With Invalid Form Id
    ${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${INVALIDFORM}?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Not Found'    
    Output    Server message response must be 'No form found with id= ${INVALIDFORM}'    
    
    #    Assertions
    String    $.status    Not Found
    String    $.message    No form found with id\=${INVALIDFORM}
        
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Start Up
    [Documentation]    Precondotion for running the Form Photo endpoints
    Login JMap Admin    administrator    ${EMPTY}    English    ${JMAPADMIN}    0.5
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
    Go to Layer Details    ${LAYERNAME}
    Go to Layer Permissions Page
    Wait Until Element Is Enabled    id:theForm:tabViewPermissionsOwners:tblPrincipals    
    ${EXISTUSER}=    Exist Element in JMap Table Component td    theForm:tabViewPermissionsOwners:tblPrincipals    administrator
    Run Keyword If    '${EXISTUSER}'!='${True}'    Add Permissions to a User    administrator    Add elements    Modify attribute values    Modify elements    Delete elements        
    Run Keyword If    '${EXISTUSER}'!='${True}'    Clicks on Save Permissions
    Go to Forms Page
    ${EXISTFORM}=    Exist Element in JMap Table Component a    theForm:tabViewForms:tblForms   Attribute Form    
    Run Keyword If    '${EXISTFORM}'=='${True}'    Delete Attribute Form    Attribute Form    
    Create Attribute Form    Attribute Form    
    Add Component for an Attribute    Photo Form    PHOTO    0    0    ${False}    ${True}    JMap    Database    ${True}    ${DBNAME}    public.phototable    id    objectid    filename    photo    title    comment    C:\    
    Save Form Layout
    Page Should Contain    Attribute Form
    Wait Until Element Is Enabled    xpath://span[contains(text(),'Settings - Forms')]    
    Click Element    xpath://span[contains(text(),'Settings - Forms')]    
    ${EXISTFORM}=    Exist form   Database Form    
    Run Keyword If    '${EXISTFORM}'=='${True}'    Delete Attribute Form    Database Form
    Create Database Photo Form    Database Form    ${DBNAME}    select * from geodata    geodata.id
    Add Component for an Attribute    External Photo Form    DATABASEFORMEXTERNALPHOTO    0    0    ${False}    ${True}    External    Database    ${True}    ${DBNAME}    public.phototable    id    objectid    filename    photo    title    comment    C:\        
    Save Database Form Layout
    Page Should Contain    Database Form
    Open Session    ${USERNAME}    ${PASSWORD}    ${TYPE}       

Suite Down
    [Documentation]    Close REST API and JMap Admin sessions
    Close session    ${SESSIONID}
    Logout JMap    ${True}
    
