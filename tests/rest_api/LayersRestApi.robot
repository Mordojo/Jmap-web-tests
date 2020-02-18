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
${LAYERNAME}    Cities
${PROJECTID}    0
${INVALIDPROJECTID}    -3
${LAYERID}    7
${INVALIDLAYERID}    -3


#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Test Cases ***

Get Layer List
    [Documentation]    Endpoint to retreive information of all layers in a project
    Get Layer List
    
Get Layer List With Invalid Session Id
    [Documentation]    Endpoint to retreive information of all layers in a project with invalid session id
    Get Layer List With Invalid Session Id
    
Get Layer List With Empty Session Id
    [Documentation]    Endpoint to retreive information of all layers in a project with empty session id
    Get Layer List With Empty Session Id
    
Get Layer List With Invalid Project Id
    [Documentation]    Endpoint to retreive information of all layers in a project with invalid project id
    Get Layer List With Invalid Project Id
    
Get Layer
    [Documentation]    Endpoint to retreive all information about the given layer
    Get Layer
    
Get Layer With Invalid Session Id
    [Documentation]    Endpoint to retreive all information about the given layer with invalid session id
    Get Layer With Invalid Session Id
    
Get Layer With Empty Session Id
    [Documentation]    Endpoint to retreive all information about the given layer with empty session id
    Get Layer With Empty Session Id
    
Get Layer With Invalid Project Id
    [Documentation]    Endpoint to retreive all information about the given layer with invalid project id
    Get Layer With Invalid Project Id
    
Get Layer With Invalid Layer Id
    [Documentation]    Endpoint to retreive all information about the given layer with invalid layer id
    Get Layer With Invalid Layer Id
#------------------------------------------------------------------------------------------------------------------------------------------------------
*** Keywords ***

Get Layer List
    ${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'The result is a project layers list'    
    ${RESULT}    Set Variable    ${RESULT['body']}
    ${RESULT}    Set Variable    ${RESULT['result']}
    ${RESULT}    Set Variable    ${RESULT['layers']}
    ${LENGTH}    Get Length    ${RESULT}
    #    Assertions
    String    $.status    OK
    String    $.message    The result is a project layers list
    Should Be Equal As Integers    ${LENGTH}    7        
Get Layer List With Invalid Session Id
    ${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers?sessionId=${INVALIDSESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Get Layer List With Empty Session Id
    ${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers?sessionId=${EMPTY}    timeout=10
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Get Layer List With Invalid Project Id
    ${RESULT}=    Get    /services/rest/v2.0/projects/${INVALIDPROJECTID}/layers?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested project (id = ${INVALIDPROJECTID}) does not exist.'     
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested project (id \=\ ${INVALIDPROJECTID}) does not exist. 

Get Layer
    ${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'The result is a project layer'
        
    #    Assertions
    String    $.status    OK
    String    $.message    The result is a project layer
    Integer    $.result.id    ${LAYERID}
    String    $.result.name    ${LAYERNAME}
    String    $.result.geometryType    POINT    
    
Get Layer With Invalid Session Id
    ${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}?sessionId=${INVALIDSESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Get Layer With Empty Session Id
    ${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}?sessionId=${EMPTY}    timeout=10
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Get Layer With Invalid Project Id
    ${RESULT}=    Get    /services/rest/v2.0/projects/${INVALIDPROJECTID}/layers/${LAYERID}?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested project (id = ${INVALIDPROJECTID}) does not exist.'     
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested project (id \=\ ${INVALIDPROJECTID}) does not exist.
    
Get Layer With Invalid Layer Id
    ${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${INVALIDLAYERID}?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested layer (id = ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}.'    
    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested layer (id \=\ ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}.
    
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Start Up
    [Documentation]    Precondotion for running the Form Photo endpoints
    Open Session    ${USERNAME}    ${PASSWORD}    ${TYPE}
       

Suite Down
    [Documentation]    Close REST API and JMap Admin sessions
    Close session    ${SESSIONID}
      
