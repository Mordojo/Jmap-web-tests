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
Resource    ../../common/admin/CommonUserGroup.robot
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Suite Setup    Start Up    
Suite Teardown    Suite Down        
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Variables ***

${USERNAME}    administrator
${PASSWORD}    ${EMPTY}
${TYPE}    WEB    #The session type must be DESKTOP, WEB or MOBILE.
${INVALIDSESSIONID}    -3
${INVALIDNAME}    Invalid User Name
${INVALIDPASSWORD}    Invalid User Password
${NAME}    TestUser
${USERPASSWORD}    Test
${USEREMAIL}    test@k2geospatial.com
${USERFULLNAME}    Test Full Name
${JMAPADMIN}    http://192.168.0.25:8080
${SERVERVERSION}    7.0 Jakarta build 023    
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Test Cases ***

Validate Session
    [Documentation]    Endpoint to retreive actual session information
    Validate Session
    
Validate Session With Invalid Session Id
    [Documentation]    Endpoint to retreive actual session information with invalid session id
    Validate Session With Invalid Session Id
    
Validate Session With Empty Session Id
    [Documentation]    Endpoint to retreive actual session information with empty session id
    Validate Session With Empty Session Id
    
Open New REST Session
    [Documentation]    Endpoint to open a new session
    Open New REST Session
    
Open Session With Invalid User Name
    [Documentation]    Endpoint to open a new session with invalid user name
    Open Session With Invalid User Name
    
Open Session With Invalid User Password
    [Documentation]    Endpoint to open a new session with invalid user password
    Open Session With Invalid User Password
    
Close New Session
    [Documentation]    Endpoint to close actual session
    Close New Session
    
Close Session With Invalid Session Id
    [Documentation]    Endpoint to close actual session with invalid session id
    Close Session With Invalid Session Id
    
Close Session With Empty Session Id
    [Documentation]    Endpoint to close actual session with empty session id
    Close Session With Empty Session Id
#------------------------------------------------------------------------------------------------------------------------------------------------------
*** Keywords ***

Validate Session
    ${RESULT}=    Get    /services/rest/v2.0/session?sessionId=${SESSIONID}
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'The result is a session info'    
    
    #    Assertions
    String    $.status    OK
    String    $.message    The result is a session info
    Integer    $.result.sessionId    ${SESSIONID}
    String    $.result.userFullName    ${USERFULLNAME}    
    String    $.result.userEmailAddress    ${USEREMAIL}
    
Validate Session With Invalid Session Id
    ${RESULT}=    Get    /services/rest/v2.0/session?sessionId=${INVALIDSESSIONID}
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Validate Session With Empty Session Id
    ${RESULT}=    Get    /services/rest/v2.0/session?sessionId=${EMPTY}
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Open New REST Session 
    Post    /services/rest/v2.0/session    body={"username": "${NAME}","password": "${USERPASSWORD}","type": "${TYPE}"}
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'The result is a WEB session info'
    ${RESULT}    Integer    $.result.sessionId
    ${NEWSESSIONID}=    Catenate    SEPARATOR=    ${RESULT}[0]    
    #    Assertions
    String    $.status    OK
    String    $.message    The result is a WEB session info
    Integer    $.result.sessionId    ${NEWSESSIONID}
    String    $.result.userFullName    ${USERFULLNAME}    
    String    $.result.userEmailAddress    ${USEREMAIL}
    String    $.result.serverVersion    ${SERVERVERSION}
    Close Session    ${NEWSESSIONID}
    
Open Session With Invalid User Name
    Post    /services/rest/v2.0/session    body={"username": "${INVALIDNAME}","password": "${USERPASSWORD}","type": "${TYPE}"}
    #    Logs
    Output    Server status response must be 'Forbidden access denied'    
    Output    Server message response must be 'Authentication failed for user ${INVALIDNAME}.'
        
    #    Assertions
    String    $.status    Forbidden access denied
    String    $.message    Authentication failed for user ${INVALIDNAME}.
    
Open Session With Invalid User Password
    Post    /services/rest/v2.0/session    body={"username": "${NAME}","password": "${INVALIDPASSWORD}","type": "${TYPE}"}
    #    Logs
    Output    Server status response must be 'Forbidden access denied'    
    Output    Server message response must be 'Authentication failed for user ${NAME}.'
        
    #    Assertions
    String    $.status    Forbidden access denied
    String    $.message    Authentication failed for user ${NAME}.
    
Close New Session
    Post    /services/rest/v2.0/session    body={"username": "${NAME}","password": "${USERPASSWORD}","type": "${TYPE}"}
    
    ${RESULT}    Integer    $.result.sessionId
    ${NEWSESSIONID}=    Catenate    SEPARATOR=    ${RESULT}[0]    
    
    Delete    /services/rest/v2.0/session?sessionId=${NEWSESSIONID}
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'Session has been closed' 
    #    Assertions   
    String    $.message    Session has been closed
    String    $.status    OK
    
Close Session With Invalid Session Id
    Delete    /services/rest/v2.0/session?sessionId=${INVALIDSESSIONID}
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Close Session With Empty Session Id
    Delete    /services/rest/v2.0/session?sessionId=${EMPTY}
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Start Up
    [Documentation]    Precondotion for running the Form Photo endpoints
    Login JMap Admin    administrator    ${EMPTY}    English    ${JMAPADMIN}    0.5
    Go to User Page
    Delete Given User    ${NAME}    
    Create New User    ${NAME}    ${USERPASSWORD}    ${USERFULLNAME}    ${USEREMAIL}    
    Open Session    ${NAME}    ${USERPASSWORD}    ${TYPE}       

Suite Down
    [Documentation]    Close REST API and JMap Admin sessions
    Close session    ${SESSIONID}
    Logout JMap    ${True}
      
