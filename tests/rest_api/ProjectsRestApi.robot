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
${INVALIDPROJECTNAME}    Invalid
${ROJECT_PROJECTION}    EPSG:4326
${PROJECTID}    0
${INVALIDPROJECTID}    -3
${JMAPADMIN}    http://192.168.0.25:8080
${PROJECT_COUNT}    0

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Test Cases ***

Get All Projects
    [Documentation]    Endpoint to retreive information about all the projects
    Get All Projects
    
Get All Projects With Invalid Session Id
    [Documentation]    Endpoint to retreive information about all the projects with invalid session id
    Get All Projects With Invalid Session Id
    
Get All Projects With Empty Session Id
    [Documentation]    Endpoint to retreive information about all the projects with empty session Id
    Get All Projects With Empty Session Id
    
Get One Project
    [Documentation]    Endpoint to retreive information about one project by the given id
    Get One Project
    
Get One Project With Invalid Session Id
    [Documentation]    Endpoint to retreive information about one project with invalid session id
    Get One Project With Invalid Session Id

Get One Project With Empty Session Id
    [Documentation]    Endpoint to retreive information about one project with empty session id
    Get One Project With Empty Session Id
    
Get One Project With Invalid Project Id
    [Documentation]    Endpoint to retreive information about one project with invalid project id
    Get One Project With Invalid Project Id
    
Get Projects By Name
    [Documentation]    Endpoint to retreive information about projects by the given name
    Get Projects By Name
    
Get Projects By Name With Invalid Session Id
    [Documentation]    Endpoint to retreive information about projects by the given name with invalid session id
    Get Projects By Name With Invalid Session Id
    
Get Projects By Name With Empty Session Id
    [Documentation]    Endpoint to retreive information about projects by the given name with empty session id
    Get Projects By Name With Empty Session Id
    
Get Projects By Name With Invalid Project Name
    [Documentation]    Endpoint to retreive information about projects by the given name with invalid project name
    Get Projects By Name With Invalid Project Name
#------------------------------------------------------------------------------------------------------------------------------------------------------
*** Keywords ***

Get All Projects
    ${RESULT}=    Get    /services/rest/v2.0/projects?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'The result is a project list'    
    ${RESULT}    Set Variable    ${RESULT['body']}
    ${RESULT}    Set Variable    ${RESULT['result']}
    
    ${LENGTH}    Get Length    ${RESULT}
    #    Assertions
    String    $.status    OK
    String    $.message    The result is a project list
    Should Be Equal As Integers    ${LENGTH}    ${PROJECT_COUNT}
    
Get All Projects With Invalid Session Id
    ${RESULT}=    Get    /services/rest/v2.0/projects?sessionId=${INVALIDSESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Get All Projects With Empty Session Id
    ${RESULT}=    Get    /services/rest/v2.0/projects?sessionId=${EMPTY}    timeout=10
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Get One Project
    ${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'The result is a project data'    
        
    #    Assertions
    String    $.status    OK
    String    $.message    The result is a project data
    String    $.result.name    ${PROJECTNAME}
    String    $.result.projection    ${ROJECT_PROJECTION}
    
Get One Project With Invalid Session Id
    ${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}?sessionId=${INVALIDSESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Get One Project With Empty Session Id
    ${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}?sessionId=${EMPTY}    timeout=10
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id. 
    
Get One Project With Invalid Project Id
    ${RESULT}=    Get    /services/rest/v2.0/projects/${INVALIDPROJECTID}?sessionId=${SESSIONID}    timeout=10
     #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'Bad project id '${INVALIDPROJECTID}' !'     
    #    Assertions
    String    $.status    Bad Request
    String    $.message    Bad project id \'${INVALIDPROJECTID}\' \! 
   
Get Projects By Name
    ${CRITERIA}=    Catenate    {"name":"${PROJECTNAME}"}
    ${RESULT}=    Post    /services/rest/v2.0/projects/filter?sessionId=${SESSIONID}    body=${CRITERIA}    timeout=10
     #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'The result is a project list'    
    
    #    Assertions
    String    $.status    OK
    String    $.message    The result is a project list
    String    $.result[0].name    ${PROJECTNAME}
    String    $.result[0].projection    ${ROJECT_PROJECTION}
    Integer    $.result[0].id    ${PROJECTID}
        
Get Projects By Name With Invalid Session Id
    ${CRITERIA}=    Catenate    {"name":"${PROJECTNAME}"}
    ${RESULT}=    Post    /services/rest/v2.0/projects/filter?sessionId=${INVALIDSESSIONID}    body=${CRITERIA}    timeout=10
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.  
    
Get Projects By Name With Empty Session Id
    ${CRITERIA}=    Catenate    {"name":"${PROJECTNAME}"}
    ${RESULT}=    Post    /services/rest/v2.0/projects/filter?sessionId=${EMPTY}    body=${CRITERIA}    timeout=10
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Get Projects By Name With Invalid Project Name
    ${CRITERIA}=    Catenate    {"name":"${INVALIDPROJECTNAME}"}
    ${RESULT}=    Post    /services/rest/v2.0/projects/filter?sessionId=${SESSIONID}    body=${CRITERIA}    timeout=10
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'The result is a project list'    
    ${RESULT}    Set Variable    ${RESULT['body']}
    ${RESULT}    Set Variable    ${RESULT['result']}     
    ${LENGTH}=    Get Length    ${RESULT}
    #    Assertions
    Should Be Empty    ${RESULT}
    String    $.status    OK
    String    $.message    The result is a project list  
    
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Start Up
    [Documentation]    Precondotion for running the Form Photo endpoints
    Login JMap Admin    administrator    ${EMPTY}    English    ${JMAPADMIN}    0.5
    Go to Projects
    ${PROJECT_COUNT}=    Get JMap Table Component Element Count    theForm:tblProjects
    Set Global Variable    ${PROJECT_COUNT}    
    Open Session    ${USERNAME}    ${PASSWORD}    ${TYPE}
       

Suite Down
    [Documentation]    Close REST API and JMap Admin sessions
    Close session    ${SESSIONID}
    Logout JMap    ${True}
      
