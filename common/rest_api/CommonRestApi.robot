*** Settings ***
 
Documentation     Tests for REST API in JMap 7.0
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
Library    REST    http://192.168.0.25:8080
#----------------------------------------------------------------------------------------------------------------------------------------------------------    
*** Variables ***

${RESULT}       ${EMPTY}
${ADMINSESSIONID}    ${EMPTY}
${SESSIONID}    ${EMPTY}
${DBHOST}       ${EMPTY}
${DBPORT}       ${EMPTY}
${DBUSERNAME}   ${EMPTY}
${DBPASSWORD}   ${EMPTY}
${DBNAME}       ${EMPTY}
${DBAPIMODULENAME}    ${EMPTY}        
${DBCHARSET}    ${EMPTY}    
${DBCONFIGFILE}    ${EMPTY}
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
*** Keywords ***

Open Session    [Arguments]    ${USERNAME}    ${PASSWORD}    ${TYPE}
    [Documentation]    Open new session for the given username, password and application type
    ...    The session id generated is stored in a global variable called SESSIONID.
    ...    Use ${SESSIONID} wherever you want to access to the variable's value
    Post    /services/rest/v2.0/session    body={"username": "${USERNAME}","password": "${PASSWORD}","type": "${TYPE}"}    allow_redirects=true    headers={"Content-Type":"application/json"}
    String    $.status    OK    #Asserts that the response status was OK
    ${RESULT}    Integer    $.result.sessionId
    ${SESSIONID}=    Catenate    SEPARATOR=    ${RESULT}[0]
    Set Global Variable    ${SESSIONID}

Close Session    [Arguments]    ${SESSION}
    [Documentation]    Close REST API session by given session id
    Delete    /services/rest/v2.0/session?sessionId=${SESSION}    
    String    $.message    Session has been closed
    String    $.status    OK    #Asserts that the response status was OK

Open Admin Session    [Arguments]    ${USERNAME}    ${PASSWORD}   
    [Documentation]    Open new session in admin REST API for the given username, password
    ...    The session id generated is stored in a global variable called ADMINSESSIONID.
    ...    Use ${ADMINSESSIONID} wherever you want to access to the variable's value
    Post    /admin/rest/v1.0/sessions    body={"password": "${PASSWORD}", "userName": "${USERNAME}"}    allow_redirects=true    headers={"Content-Type":"application/json"}
    String    $.status    OK    #Asserts that the response status was OK
    ${RESULT}    Integer    $.result.sessionId
    ${ADMINSESSIONID}=    Catenate    SEPARATOR=    ${RESULT}[0]
    Set Global Variable    ${ADMINSESSIONID}

Get Counter Statistics in Current    [Arguments]    ${CRITERIA_PROJECT}
    [Documentation]   Get a counter of statistics in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z", "year": 0}  
    
    ${RESULT}=    Post    /admin/rest/v1.0/statistics/current/count    body=${CRITERIA_PROJECT}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
    
    ${COUNT}    Set Variable    ${RESULT['body']}
    ${COUNT}    Set Variable    ${COUNT['result']}             
        
    ${COUNT}    Catenate    ${COUNT}       
        
    [RETURN]    ${COUNT}
    
Get Counter Statistics in Monthly    [Arguments]    ${CRITERIA_PROJECT}
    [Documentation]   Get a counter of statistics in table JMAP_STATISTICS_MONTHLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z", "year": 0}  
    
    ${RESULT}=    Post    /admin/rest/v1.0/statistics/monthly/count    body=${CRITERIA_PROJECT}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
    
    ${COUNT}    Set Variable    ${RESULT['body']}
    ${COUNT}    Set Variable    ${COUNT['result']}             
   
    ${FILTER}=    Post    /admin/rest/v1.0/statistics/monthly/filter    body=${CRITERIA_PROJECT}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
    ${STATS}    Set Variable    0
    :FOR    ${INDEX}    IN RANGE    0    ${COUNT}  
    \    ${VAL}    Set Variable    ${FILTER['body']}
    \    ${VAL}    Set Variable    ${VAL['result']}
    \    ${VAL}    Set Variable    ${VAL[${INDEX}]['count']}
    \    ${STATS}    Evaluate   ${STATS}+${VAL}                
        
    ${STATS}    Catenate    ${STATS}    
    [RETURN]    ${STATS}

Get Counter Statistics in Yearly    [Arguments]    ${CRITERIA_PROJECT}
    [Documentation]   Get a counter of statistics in table JMAP_STATISTICS_YEARLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z", "year": 0}  
    
    ${RESULT}=    Post    /admin/rest/v1.0/statistics/yearly/count    body=${CRITERIA_PROJECT}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
    
    ${COUNT}    Set Variable    ${RESULT['body']}
    ${COUNT}    Set Variable    ${COUNT['result']}             
  
    ${FILTER}=    Post    /admin/rest/v1.0/statistics/yearly/filter    body=${CRITERIA_PROJECT}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
    ${STATS}    Set Variable    0
    :FOR    ${INDEX}    IN RANGE    0    ${COUNT}  
    \    ${VAL}    Set Variable    ${FILTER['body']}
    \    ${VAL}    Set Variable    ${VAL['result']}
    \    ${VAL}    Set Variable    ${VAL[${INDEX}]['count']}
    \    ${STATS}    Evaluate   ${STATS}+${VAL}                
        
    ${STATS}    Catenate    ${STATS}    
    [RETURN]    ${STATS} 

Get Layer Element Count    [Arguments]    ${PROJECTID}    ${LAYERID}    
    ${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements?sessionId=${SESSIONID}    timeout=10    
    
    ${RESULT_JSON}    Set Variable    ${RESULT['body']}
    ${RESULT_JSON}    Set Variable    ${RESULT_JSON['result']}
    ${RESULT_JSON}    Set Variable    ${RESULT_JSON['features']}
    ${ELEMENT_COUNT}    Get Length    ${RESULT_JSON}
    [RETURN]    ${ELEMENT_COUNT}
    
Get Multiple Attribute Form Descriptors    [Arguments]    ${PROJECTID}    ${LAYERID}
    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'Result is an array of 2 form(s) data'
    #    Assertions
    String    $.status    OK
    String    $.message    Result is an array of 2 form(s) data
    
    ${FORMID}    Integer    $.result[0].id
    ${FORMID}    Catenate    ${FORMID}[0]
    [RETURN]    ${FORMID}  
    
Get Multiple Database Form Descriptors    [Arguments]    ${PROJECTID}    ${LAYERID}
    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'Result is an array of 2 form(s) data'
    #    Assertions
    String    $.status    OK
    String    $.message    Result is an array of 2 form(s) data
    
    ${FORMID}    Integer    $.result[1].id
    ${FORMID}    Catenate    ${FORMID}[0]
    [RETURN]    ${FORMID} 
    
 
