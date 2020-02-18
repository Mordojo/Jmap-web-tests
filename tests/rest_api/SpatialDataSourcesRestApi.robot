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
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Suite Setup    Start Up    
Suite Teardown    Suite Down        
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Variables ***

${USERNAME}    administrator
${PASSWORD}    ${EMPTY}
${TYPE}    WEB    #The session type must be DESKTOP, WEB or MOBILE.
${INVALIDSESSIONID}    -3
${PROJECTNAME}    The World
${DATASOURCENAME}    World Cities    
${JMAPADMIN}    http://192.168.0.25:8080
${DATASOURCEID}    0
${DATASOURCE_ELEMENTS_COUNT}    0
${INVALIDDATASOURCEID}    -3
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Test Cases ***

Get Data Source
    [Documentation]    Endpoint to retreive information about given datasource
    Get Data Source

Get Data Source With Invalid Session Id
    [Documentation]    Endpoint to retreive information about given datasource with invalid session id
    Get Data Source With Invalid Session Id
    
Get Data Source With Empty Session Id
    [Documentation]    Endpoint to retreive information about given datasource with empty session id
    Get Data Source With Empty Session Id
    
Get Data Source With Invalid Data Source Id
    [Documentation]    Endpoint to retreive information about given datasource with invalid data source id
    Get Data Source With Invalid Data Source Id
    
Update Data Source
    [Documentation]    Endpoint to update a datasource by given datasource id
    Update Data Source
    
Update Data Source With Invalid Session Id
    [Documentation]    Endpoint to update a datasource by given datasource id with invalid session id
    Update Data Source
    
Update Data Source With Empty Session Id 
    [Documentation]    Endpoint to update a datasource by given datasource id with empty session id
    Update Data Source With Empty Session Id
    
Update Data Source With Invalid Data Source Id
    [Documentation]    Endpoint to update a datasource by given datasource id with invalid data source id
    Update Data Source With Invalid Data Source Id
#------------------------------------------------------------------------------------------------------------------------------------------------------
*** Keywords ***

Get Data Source
    ${RESULT}=    Get    /services/rest/v2.0/datasources/${DATASOURCEID}?sessionId=${SESSIONID}
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'The result is a spatial DataSource Info'    
      
    #    Assertions
    String    $.status    OK
    String    $.message    The result is a spatial DataSource Info
    String    $.result.name    ${DATASOURCENAME}
    Integer    $.result.id    ${DATASOURCEID}
    String    $.result.status    status.ready
    #String    $.resul.projection.epsg    EPSG:4326
    #Integer    $.elementsCount    ${DATASOURCE_ELEMENTS_COUNT}
    
Get Data Source With Invalid Session Id
    ${RESULT}=    Get    /services/rest/v2.0/datasources/${DATASOURCEID}?sessionId=${INVALIDSESSIONID}
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id. 
    
Get Data Source With Empty Session Id
    ${RESULT}=    Get    /services/rest/v2.0/datasources/${DATASOURCEID}?sessionId=${EMPTY}
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Get Data Source With Invalid Data Source Id
    ${RESULT}=    Get    /services/rest/v2.0/datasources/${INVALIDDATASOURCEID}?sessionId=${SESSIONID}
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'spatial data ${INVALIDDATASOURCEID} does not exist !'    
    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    spatial data ${INVALIDDATASOURCEID} does not exist \!\ 
    
Update Data Source
    ${RESULT}=    Put    /services/rest/v2.0/datasources/${DATASOURCEID}?sessionId=${SESSIONID}
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'The result is a message'    
    
    #    Assertions
    String    $.status    OK
    String    $.message    The result is a message
    String    $.result.message    updating spatial data \: ${DATASOURCEID} \... 
    
Update Data Source With Invalid Session Id
    ${RESULT}=    Put    /services/rest/v2.0/datasources/${DATASOURCEID}?sessionId=${INVALIDSESSIONID}
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Update Data Source With Empty Session Id
    ${RESULT}=    Put    /services/rest/v2.0/datasources/${DATASOURCEID}?sessionId=${EMPTY}
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Update Data Source With Invalid Data Source Id
    ${RESULT}=    Put    /services/rest/v2.0/datasources/${INVALIDDATASOURCEID}?sessionId=${SESSIONID}
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'spatial data ${INVALIDDATASOURCEID} does not exist !'    
    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    spatial data ${INVALIDDATASOURCEID} does not exist \!           
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Start Up
    [Documentation]    Precondotion for running the Form Photo endpoints
    Login JMap Admin    administrator    ${EMPTY}    English    ${JMAPADMIN}    0.5
    Go to Spatial Datasources    
    ${DATASOURCEID}=    Get Element Info in JMap Table Component    theForm:tblDataSource    ${DATASOURCENAME}    SpatialDataSource    Id
    ${DATASOURCE_ELEMENTS_COUNT}=	Get Element Info in JMap Table Component    theForm:tblDataSource    ${DATASOURCENAME}    SpatialDataSource    Elements   
    Set Global Variable    ${DATASOURCEID}
    Set Global Variable    ${DATASOURCE_ELEMENTS_COUNT}                
    Open Session    ${USERNAME}    ${PASSWORD}    ${TYPE}
       

Suite Down
    [Documentation]    Close REST API and JMap Admin sessions
    Close session    ${SESSIONID}
    Logout JMap    ${True}
      
