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
${NEWPASSWORD}    NewTest
${USEREMAIL}    test@k2geospatial.com
${USERFULLNAME}    Test Full Name
${JMAPADMIN}    http://192.168.0.25:8080
${SERVERVERSION}    7.0 Istanbul build 117    
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Test Cases ***

Update User Password
    [Documentation]    Endpoint to change user password
    Update User Password
    
Update User Password With Invalid Session Id
    [Documentation]    Endpoint to change user password with invalid session id
    Update User Password With Invalid Session Id
    
Update User Password With Empty Session Id
    [Documentation]    Endpoint to change user password with empty session id
    Update User Password With Empty Session Id
    
Update User Password With Invalid Old Password
    [Documentation]    Endpoint to change user password with invalid old password
    Update User Password With Invalid Old Password
#------------------------------------------------------------------------------------------------------------------------------------------------------
*** Keywords ***

Update User Password
    Put    /services/rest/v2.0/users?sessionId=${SESSIONID}    body={"oldPassword": "${USERPASSWORD}","newPassword": "${NEWPASSWORD}"}
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'The password was changed successfully'    
    
    #    Assertions
    String    $.status    OK
    String    $.message    The password was changed successfully
    Boolean    $.result    ${TRUE}
    
Update User Password With Invalid Session Id
    Put    /services/rest/v2.0/users?sessionId=${INVALIDSESSIONID}    body={"oldPassword": "${USERPASSWORD}","newPassword": "${NEWPASSWORD}"}
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Update User Password With Empty Session Id
    Put    /services/rest/v2.0/users?sessionId=${EMPTY}    body={"oldPassword": "${USERPASSWORD}","newPassword": "${NEWPASSWORD}"}
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Update User Password With Invalid Old Password 
    Put    /services/rest/v2.0/users?sessionId=${SESSIONID}    body={"oldPassword": "${INVALIDPASSWORD}","newPassword": "${NEWPASSWORD}"}
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'Former password param does not match'    
    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    Former password param does not match
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
      
