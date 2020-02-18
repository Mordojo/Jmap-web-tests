*** Setting ***

Documentation    Tests for Elements Form REST API in JMap 7 
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------       
Library    SeleniumLibrary    
Library    REST    http://192.168.0.25:8080    # http://nightlybuild.jmaponline.net:8080RESTinstance 1.0.0rc4 Robot Framework test library for (RESTful) JSON APIs
Library    OperatingSystem
Library    Collections       
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Resource    ../../common/rest_api/CommonRestApi.robot
Resource    ../../common/CommonLogin.robot
Resource    ../../common/admin/CommonKeywords.robot
Resource    ../../common/admin/CommonProject.robot
Resource    ../../common/admin/CommonLayer.robot
Resource    ../../common/admin/CommonDeployment.robot

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Suite Setup    Start Up    
Suite Teardown    Suite Down        
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Variables ***

${USERNAME}    administrator
${PASSWORD}    ${EMPTY}
${TYPE}    WEB    #The session type must be DESKTOP, WEB or MOBILE.
${INVALIDSESSIONID}    -3
${INVALID_APP_NAME}    Not_Valid
${APP_NAME}    ApplicationEndpoint
${PROJECTNAME}    The World
${PROTOCOL}    http    
${HOST}    192.168.0.25    
${PORT}    8080    
${PATH}    /ApplicationEndpoint
${JMAPADMIN}    http://192.168.0.25:8080

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Test Cases ***

Reload the Application
    [Documentation]    Endpoint to reload an application by the given name
    Reload the Application
    
Reload the Application With Invalid Session Id
    [Documentation]    Endpoint to reload an application by the given name with invalid session id
    Reload the Application With Invalid Session Id
    
Reload the Application With Empty Session Id
    [Documentation]    Endpoint to reload an application by the given name with empty session id
    Reload the Application With Empty Session Id
    
Reload the Application With Invalid Application Name
    [Documentation]    Endpoint to reload an application by the given name with invalid application name
    Reload the Application With Invalid Application Name
#------------------------------------------------------------------------------------------------------------------------------------------------------
*** Keywords ***

Reload the Application
    ${RESULT}=    Put    /services/rest/v2.0/apps/${APP_NAME}/reload?sessionId=${SESSIONID}    timeout=100
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'The deployment has been reloaded'    
    
    #    Assertions
    String    $.status    OK
    String    $.message    The deployment has been reloaded
    Boolean    $.result.success    true

Reload the Application With Invalid Session Id
    ${RESULT}=    Put    /services/rest/v2.0/apps/${APP_NAME}/reload?sessionId=${INVALIDSESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Reload the Application With Empty Session Id
    ${RESULT}=    Put    /services/rest/v2.0/apps/${APP_NAME}/reload?sessionId=${EMPTY}    timeout=10
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Reload the Application With Invalid Application Name
    ${RESULT}=    Put    /services/rest/v2.0/apps/${INVALID_APP_NAME}/reload?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'Deployment not found : ${INVALID_APP_NAME}'    
    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    Deployment not found \:\ ${INVALID_APP_NAME}
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Start Up
    [Documentation]    Precondotion for running the Form Photo endpoints
    Login JMap Admin    administrator    ${PASSWORD}    English    ${JMAPADMIN}    0.5
    Go to Deployments
    ${TEMP}=    Exist Deployment    ${APP_NAME}
    Run Keyword If    '${TEMP}'!='${True}'
    ...    Create Web Deployment    ${APP_NAME}    ${PROTOCOL}    ${HOST}    ${PORT}    ${PATH}    ${PROJECT_NAME}
    
    Open Session    ${USERNAME}    ${PASSWORD}    ${TYPE}
       

Suite Down
    [Documentation]    Close REST API and JMap Admin sessions
    Close session    ${SESSIONID}
    Logout JMap    ${True}
    
