*** Setting ***

Documentation    Tests for stadistics REST API in JMap 7 
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   
Library    REST    http://192.168.0.25:8080    #RESTinstance 1.0.0rc4 Robot Framework test library for (RESTful) JSON APIs
Library    OperatingSystem
Library    Collections
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Resource    ../../common/rest_api/CommonRestApi.robot
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Suite Setup    Open Session    ${USERNAME}    ${PASSWORD}    ${TYPE}    #Open a session before the suite
Suite Teardown    Close session    ${SESSIONID}    #Close the session after the suite
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Variables ***

${USERNAME}    administrator
${PASSWORD}    ${EMPTY}
${TYPE}    DESKTOP    #The session type must be DESKTOP, WEB or MOBILE.
${INVALID_SESSION}    -2    #{"message": "Invalid session id.", "status": "Unauthorized"}
${EMPTY_SESSION}    ${EMPTY}
${PROJECTID}    0     #required field
${CONTEXTID}    1304358391980  #required field
${CONTEXTSID}    [1304358391980    ,    1304358397611    ,    1304358401199]
${LAYERSID}    [7    ,    6    ,    4]
${INVALID_CONTEXTS}    [1304358391980    ,    1304358397611    ,    -2]
${INVALID_LAYERS}    [7    ,    6    ,    -2]
${VAL}    0
${LAYERID}     7   #required field
${INVALID_PROJECT}    -2
${INVALID_LAYER}    -2
${INVALID_CONTEXT}   -2
${TARGETID}    ""
${TARGETTYPE}    ""
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Test Cases ***

Add multiple statistics
    [Documentation]   Add a multiple entry to indicate that a context(s) has been viewed or/and a layer(s) has been viewed or/and a project(s) has been opened  
    ...   Assert with results in Get a filtered list of entities in table JMAP_STATISTICS_CURRENT
    ${BODY}=    Catenate    {"projectId": ${PROJECTID}, "projectOpened": true, "layersViewed": ${LAYERSID}, "contextsViewed": ${CONTEXTSID}}
    Add multiple statistics   ${PROJECTID}   ${BODY}  ${SESSIONID}

Add multiple statistics with invalid session id
    [Documentation]    Trying to add a multiple entry to indicate that a context(s) has been viewed 
    ...    or/and a layer(s) has been viewed or/and a project(s) has been opened
    ...    using an invalid session id    
    ${BODY}=    Catenate    {"projectId": ${PROJECTID}, "projectOpened": true, "layersViewed": ${LAYERSID}, "contextsViewed": ${CONTEXTSID}}
    Add multiple statistics with invalid session id   ${PROJECTID}   ${BODY}  ${INVALID_SESSION}

Add multiple statistics with empty session id
    [Documentation]    Trying to add a multiple entry to indicate that a context(s) has been viewed 
    ...    or/and a layer(s) has been viewed or/and a project(s) has been opened
    ...    using an empty session id    
    ${BODY}=    Catenate    {"projectId": ${PROJECTID}, "projectOpened": true, "layersViewed": ${LAYERSID}, "contextsViewed": ${CONTEXTSID}}
    Add multiple statistics with invalid session id   ${PROJECTID}   ${BODY}  ${EMPTY_SESSION}

Add multiple statistics with invalid project id
    [Documentation]    Trying to add a multiple entry to indicate that a context(s) has been viewed 
    ...    or/and a layer(s) has been viewed or/and a project(s) has been opened
    ...    using an invalid project id    
    ${BODY}=    Catenate    {"projectId": ${PROJECTID}, "projectOpened": true, "layersViewed": ${LAYERSID}, "contextsViewed": ${CONTEXTSID}}
    Add multiple statistics with invalid project id   ${PROJECTID}  ${BODY}  ${SESSIONID}
    
Add multiple statistics with invalid layers id
    [Documentation]    Trying to add a multiple entry to indicate that a context(s) has been viewed 
    ...    or/and a layer(s) has been viewed or/and a project(s) has been opened
    ...    using an invalid data   
    ${BODY}=    Catenate    {"projectId": ${PROJECTID}, "projectOpened": true, "layersViewed": ${INVALID_LAYERS}, "contextsViewed": ${CONTEXTSID}}
    Add multiple statistics with invalid layers id   ${PROJECTID}   ${BODY}  ${SESSIONID}    

Add multiple statistics with invalid contexts id
    [Documentation]    Trying to add a multiple entry to indicate that a context(s) has been viewed 
    ...    or/and a layer(s) has been viewed or/and a project(s) has been opened
    ...    using an invalid data   
    ${BODY}=    Catenate    {"projectId": ${PROJECTID}, "projectOpened": true, "layersViewed": ${LAYERSID}, "contextsViewed": ${INVALID_CONTEXTS}}
    Add multiple statistics with invalid contexts id   ${PROJECTID}   ${BODY}  ${SESSIONID}
#----------------------------------------------------------------------------------------------------------------------------------------------------------    

Add entry to indicate a context has been viewed
    [Documentation]   Add an entry to indicate that a context has been viewed
    ...   Assert with results in Get a filtered list of entities in table JMAP_STATISTICS_CURRENT
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "VIEW"}
    Add entry to indicate a context has been viewed   ${PROJECTID}   ${CONTEXTID}  ${SESSIONID}  ${CRITERIA}

Add entry to indicate a context has been viewed with invalid session id
    [Documentation]   Trying to add entry to indicate a context has been viewed using an invalid session id
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "VIEW"}
    Add entry to indicate a context has been viewed with invalid session id  ${PROJECTID}   ${CONTEXTID}  ${INVALID_SESSION}    ${CRITERIA}

Add entry to indicate a context has been viewed with empty session id
    [Documentation]   Trying to add entry to indicate a context has been viewed using an empty session id
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "VIEW"}
    Add entry to indicate a context has been viewed with invalid session id  ${PROJECTID}   ${CONTEXTID}  ${EMPTY_SESSION}    ${CRITERIA}

Add entry to indicate a context has been viewed with invalid project id
    [Documentation]   Trying to add entry to indicate a context has been viewed using an invalid project id
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "VIEW"}
    Add entry to indicate a context has been viewed with invalid project id  ${INVALID_PROJECT}   ${CONTEXTID}  ${SESSIONID}    ${CRITERIA}        

Add entry to indicate a context has been viewed with invalid context id
    [Documentation]   Trying to add entry to indicate a context has been viewed using an invalid context id
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "VIEW"}
    Add entry to indicate a context has been viewed with invalid context id  ${PROJECTID}   ${INVALID_CONTEXT}  ${SESSIONID}    ${CRITERIA}
#-----------------------------------------------------------------------------------------------------------------------------------------------------

Add entry to indicate a layer has been viewed
    [Documentation]   Add an entry to indicate that a layer has been viewed
    ...    Assert with results in Get a filtered list of entities in table JMAP_STATISTICS_CURRENT
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERID}, "targetType": "LAYER", "action": "VIEW"}
    Add entry to indicate a layer has been viewed   ${PROJECTID}   ${LAYERID}  ${SESSIONID}    ${CRITERIA}

Add entry to indicate a layer has been viewed with invalid session id
    [Documentation]   Trying to add entry to indicate a layer has been viewed using an invalid session id
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERID}, "targetType": "LAYER", "action": "VIEW"}
    Add entry to indicate a layer has been viewed with invalid session id  ${PROJECTID}   ${LAYERID}  ${INVALID_SESSION}    ${CRITERIA}

Add entry to indicate a layer has been viewed with empty session id
    [Documentation]   Trying to add entry to indicate a layer has been viewed using an empty session id
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERID}, "targetType": "LAYER", "action": "VIEW"}
    Add entry to indicate a layer has been viewed with invalid session id  ${PROJECTID}   ${LAYERID}  ${EMPTY_SESSION}    ${CRITERIA}

Add entry to indicate a layer has been viewed with invalid project id
    [Documentation]   Trying to add entry to indicate a layer has been viewed using an invalid project id
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERID}, "targetType": "LAYER", "action": "VIEW"}
    Add entry to indicate a layer has been viewed with invalid project id  ${INVALID_PROJECT}   ${LAYERID}  ${SESSIONID}    ${CRITERIA}        

Add entry to indicate a layer has been viewed with invalid layer id
    [Documentation]   Trying to add entry to indicate a layer has been viewed using an invalid layer id
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERID}, "targetType": "LAYER", "action": "VIEW"}
    Add entry to indicate a layer has been viewed with invalid layer id  ${PROJECTID}   ${INVALID_LAYER}  ${SESSIONID}    ${CRITERIA}
#----------------------------------------------------------------------------------------------------------------------------------------------

Add entry to indicate a project has been opened
    [Documentation]   Add an entry to indicate that a project has been opened
    ...    Assert with results in Get a filtered list of entities in table JMAP_STATISTICS_CURRENT
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN"}
    Add entry to indicate a project has been opened   ${PROJECTID}   ${SESSIONID}    ${CRITERIA}

Add entry to indicate a project has been opened with invalid session id
    [Documentation]   Trying to add entry to indicate a project has been opened using an invalid session id
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN"}
    Add entry to indicate a project has been opened with invalid session id  ${PROJECTID}   ${INVALID_SESSION}    ${CRITERIA}

Add entry to indicate a project has been opened with empty session id
    [Documentation]   Trying to add entry to indicate a project has been opened using an empty session id
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN"}
    Add entry to indicate a project has been opened with invalid session id  ${PROJECTID}    ${EMPTY_SESSION}    ${CRITERIA}

Add entry to indicate a project has been opened with invalid project id
    [Documentation]   Trying to add entry to indicate a project has been opened using an invalid project id
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN"}
    Add entry to indicate a project has been opened with invalid project id  ${INVALID_PROJECT}    ${SESSIONID}    ${CRITERIA}
#------------------------------------------------------------------------------------------------------------------------------------------------------
*** Keywords ***

Add multiple statistics  [Arguments]    ${PROJECTID}   ${BODY}  ${SESSIONID}
    [Documentation]   Statistics entry is created any time a user create or view a context, or/and view a layer or/and open a project
    ...    After assert the server response need to assert against the Database using
    ...   Check statistics records in DB 
    
    ${CRITERIA_PROJECT}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN"}
    ${VAL_PROJECT}=    Check statistics records in DB    ${CRITERIA_PROJECT} 
    
    ${CONTEXTSID}    Create List    1304358391980    1304358397611    1304358401199 
    ${CONTEXT_LIST}    Create List
    ${LAYER_LIST}    Create List       
    ${ELEMENT}    Set Variable    ${3}
    :FOR    ${INDEX}    IN RANGE    0    3
    \    ${CRITERIA_CONTEXT}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTSID[${INDEX}]}, "targetType": "CONTEXT", "action": "VIEW"} 
    \    ${VAL_CONTEXT}=    Check statistics records in DB    ${CRITERIA_CONTEXT}
    \    Append To List    ${CONTEXT_LIST}    ${VAL_CONTEXT}
          
    
    ${LAYERSID}    Create List    7        6        4
    :FOR    ${INDEX}    IN RANGE    0    ${ELEMENT} 
    \    ${CRITERIA_LAYER}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERSID[${INDEX}]}, "targetType": "LAYER", "action": "VIEW"} 
    \    ${VAL_LAYER}=    Check statistics records in DB    ${CRITERIA_LAYER}    
    \     Append To List    ${LAYER_LIST}    ${VAL_LAYER}
    
     
    Post    /services/rest/v2.0/statistics/projects/${PROJECTID}/?sessionId=${SESSIONID}    body=${BODY}    timeout=10
    #    Logs
    Output    Server status response must be 'OK'
    
    Output    Server message response should be 'Statistics successfully added'
    
    Output    Server result response should be 'Statistics in batch added successfully'
    
    #    Assertions
    String    $.status    OK
    String    $.message   Statistics successfully added
    String    $.result    Statistics in batch added successfully
    
    ${RESULT}=    Check statistics records in DB    ${CRITERIA_PROJECT}
    Run Keyword If  "${RESULT}" == "${VAL_PROJECT + 1}"    Output    Project statistics is saved
    
    ${CONTEXT_LIST1}    Create List
   :FOR    ${INDEX}    IN RANGE    0    ${ELEMENT}
    \    ${CRITERIA_CONTEXT}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTSID[${INDEX}]}, "targetType": "CONTEXT", "action": "VIEW"} 
    \    ${VAL_CONTEXT1}=    Check statistics records in DB    ${CRITERIA_CONTEXT}       
    \    Append To List    ${CONTEXT_LIST1}    ${VAL_CONTEXT1}                 
    
     
    ${LAYER_LIST1}    Create List
    :FOR    ${INDEX}    IN RANGE    0    ${ELEMENT} 
    \    ${CRITERIA_LAYER}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERSID[${INDEX}]}, "targetType": "LAYER", "action": "VIEW"} 
    \    ${VAL_LAYER1}=    Check statistics records in DB    ${CRITERIA_LAYER}    
    \   Append To List    ${LAYER_LIST1}    ${VAL_LAYER1}
    
    
    :FOR    ${INDEX}    IN RANGE    0    ${ELEMENT}
    \    List Should Contain Value    ${CONTEXT_LIST1}    ${VAL_CONTEXT + 1}    Contexts statistics are saved
    \    List Should Contain Value    ${LAYER_LIST1}    ${VAL_LAYER + 1}    Layers statistics are saved        

Add multiple statistics with invalid session id    [Arguments]    ${PROJECTID}   ${BODY}  ${SESSIONID}
    [Documentation]   Try to add statistics entry any time a user create or view a context, 
    ...    or/and view a layer or/and open a project using invalid session id
    ...    After assert the server response need to assert against the Database using
    ...    Check statistics records in DB 
    
    ${CRITERIA_PROJECT}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN"}
    ${VAL_PROJECT}=    Check statistics records in DB    ${CRITERIA_PROJECT} 
    
    ${CONTEXTSID}    Create List    1304358391980    1304358397611    1304358401199 
    ${CONTEXT_LIST}    Create List
    ${LAYER_LIST}    Create List       
    ${ELEMENT}    Set Variable    ${3}
    :FOR    ${INDEX}    IN RANGE    0    3
    \    ${CRITERIA_CONTEXT}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTSID[${INDEX}]}, "targetType": "CONTEXT", "action": "VIEW"} 
    \    ${VAL_CONTEXT}=    Check statistics records in DB    ${CRITERIA_CONTEXT}
    \    Append To List    ${CONTEXT_LIST}    ${VAL_CONTEXT}
          
    
    ${LAYERSID}    Create List    7        6        4
    :FOR    ${INDEX}    IN RANGE    0    ${ELEMENT} 
    \    ${CRITERIA_LAYER}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERSID[${INDEX}]}, "targetType": "LAYER", "action": "VIEW"} 
    \    ${VAL_LAYER}=    Check statistics records in DB    ${CRITERIA_LAYER}    
    \     Append To List    ${LAYER_LIST}    ${VAL_LAYER}
    
     
    Post    /services/rest/v2.0/statistics/projects/${PROJECTID}/?sessionId=${SESSIONID}    body=${BODY}    timeout=10
    #    Logs
    Output    Server status response must be 'Unauthorized'
    
    Output    Server message response should be 'Invalid session id.'
       
    #    Assertions
    String    $.status    Unauthorized
    String    $.message   Invalid session id.
    
    ${RESULT}=    Check statistics records in DB    ${CRITERIA_PROJECT}
    Run Keyword If  "${RESULT}" == "${VAL_PROJECT}"    Output    Unauthorized to save Project statistics
    
    ${CONTEXT_LIST1}    Create List
   :FOR    ${INDEX}    IN RANGE    0    ${ELEMENT}
    \    ${CRITERIA_CONTEXT}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTSID[${INDEX}]}, "targetType": "CONTEXT", "action": "VIEW"} 
    \    ${VAL_CONTEXT1}=    Check statistics records in DB    ${CRITERIA_CONTEXT}       
    \    Append To List    ${CONTEXT_LIST1}    ${VAL_CONTEXT1}                 
    
     
    ${LAYER_LIST1}    Create List
    :FOR    ${INDEX}    IN RANGE    0    ${ELEMENT} 
    \    ${CRITERIA_LAYER}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERSID[${INDEX}]}, "targetType": "LAYER", "action": "VIEW"} 
    \    ${VAL_LAYER1}=    Check statistics records in DB    ${CRITERIA_LAYER}    
    \   Append To List    ${LAYER_LIST1}    ${VAL_LAYER1}
    
    
    :FOR    ${INDEX}    IN RANGE    0    ${ELEMENT}
    \    Lists Should Be Equal    ${CONTEXT_LIST}    ${CONTEXT_LIST1}    Unauthorized to save Contexts statistics
    \    Lists Should Be Equal    ${LAYER_LIST1}    ${LAYER_LIST}    Unauthorized to save Layers statistics        

Add multiple statistics with invalid project id    [Arguments]    ${PROJECTID}   ${BODY}  ${SESSIONID}
    [Documentation]   Try to add statistics entry any time a user create or view a context, 
    ...    or/and view a layer or/and open a project using empty session id
    ...    After assert the server response need to assert against the Database using
    ...    Check statistics records in DB 
    
    ${CRITERIA_PROJECT}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN"}
    ${VAL_PROJECT}=    Check statistics records in DB    ${CRITERIA_PROJECT} 
    
    ${CONTEXTSID}    Create List    1304358391980    1304358397611    1304358401199 
    ${CONTEXT_LIST}    Create List
    ${LAYER_LIST}    Create List       
    ${ELEMENT}    Set Variable    ${3}
    :FOR    ${INDEX}    IN RANGE    0    3
    \    ${CRITERIA_CONTEXT}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTSID[${INDEX}]}, "targetType": "CONTEXT", "action": "VIEW"} 
    \    ${VAL_CONTEXT}=    Check statistics records in DB    ${CRITERIA_CONTEXT}
    \    Append To List    ${CONTEXT_LIST}    ${VAL_CONTEXT}
         
    
    ${LAYERSID}    Create List    7        6        4
    :FOR    ${INDEX}    IN RANGE    0    ${ELEMENT} 
    \    ${CRITERIA_LAYER}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERSID[${INDEX}]}, "targetType": "LAYER", "action": "VIEW"} 
    \    ${VAL_LAYER}=    Check statistics records in DB    ${CRITERIA_LAYER}    
    \     Append To List    ${LAYER_LIST}    ${VAL_LAYER}
    
     
    Post    /services/rest/v2.0/statistics/projects/${INVALID_PROJECT}/?sessionId=${SESSIONID}    body=${BODY}    timeout=10
    #    Logs
    Output    Server status response must be 'Bad Request'
    
    Output    Server message response must be 'The requested project (id = ${INVALID_PROJECT}) does not exist.'
       
    #    Assertions
    String    $.status    Bad Request
    String    $.message   The requested project (id \=\ ${INVALID_PROJECT}) does not exist.
    
    ${RESULT}=    Check statistics records in DB    ${CRITERIA_PROJECT}
    Run Keyword If  "${RESULT}" == "${VAL_PROJECT}"    Output    Unauthorized to save Project statistics
    
    ${CONTEXT_LIST1}    Create List
   :FOR    ${INDEX}    IN RANGE    0    ${ELEMENT}
    \    ${CRITERIA_CONTEXT}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTSID[${INDEX}]}, "targetType": "CONTEXT", "action": "VIEW"} 
    \    ${VAL_CONTEXT1}=    Check statistics records in DB    ${CRITERIA_CONTEXT}       
    \    Append To List    ${CONTEXT_LIST1}    ${VAL_CONTEXT1}                 
    
     
    ${LAYER_LIST1}    Create List
    :FOR    ${INDEX}    IN RANGE    0    ${ELEMENT} 
    \    ${CRITERIA_LAYER}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERSID[${INDEX}]}, "targetType": "LAYER", "action": "VIEW"} 
    \    ${VAL_LAYER1}=    Check statistics records in DB    ${CRITERIA_LAYER}    
    \   Append To List    ${LAYER_LIST1}    ${VAL_LAYER1}
    
    
    :FOR    ${INDEX}    IN RANGE    0    ${ELEMENT}
    \    Lists Should Be Equal    ${CONTEXT_LIST}    ${CONTEXT_LIST1}    Unauthorized to save Contexts statistics
    \    Lists Should Be Equal    ${LAYER_LIST1}    ${LAYER_LIST}    Unauthorized to save Layers statistics        

Add multiple statistics with invalid layers id    [Arguments]    ${PROJECTID}   ${BODY}  ${SESSIONID}
    [Documentation]   Try to add statistics entry any time a user create or view a context, 
    ...    or/and view a layer or/and open a project using empty session id
    ...    After assert the server response need to assert against the Database using
    ...    Check statistics records in DB 
    
    ${CRITERIA_PROJECT}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN"}
    ${VAL_PROJECT}=    Check statistics records in DB    ${CRITERIA_PROJECT} 
    
    ${CONTEXTSID}    Create List    1304358391980    1304358397611    1304358401199 
    ${CONTEXT_LIST}    Create List
    ${LAYER_LIST}    Create List       
    ${ELEMENT}    Set Variable    ${3}
    :FOR    ${INDEX}    IN RANGE    0    3
    \    ${CRITERIA_CONTEXT}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTSID[${INDEX}]}, "targetType": "CONTEXT", "action": "VIEW"} 
    \    ${VAL_CONTEXT}=    Check statistics records in DB    ${CRITERIA_CONTEXT}
    \    Append To List    ${CONTEXT_LIST}    ${VAL_CONTEXT}
          
    
    ${LAYERSID}    Create List    7        6        4
    :FOR    ${INDEX}    IN RANGE    0    ${ELEMENT} 
    \    ${CRITERIA_LAYER}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERSID[${INDEX}]}, "targetType": "LAYER", "action": "VIEW"} 
    \    ${VAL_LAYER}=    Check statistics records in DB    ${CRITERIA_LAYER}    
    \     Append To List    ${LAYER_LIST}    ${VAL_LAYER}
    
     
    Post    /services/rest/v2.0/statistics/projects/${PROJECTID}/?sessionId=${SESSIONID}    body=${BODY}    timeout=10
    #    Logs
    Output    Server status response must be 'Bad Request'
   
    Output    Server message response must be 'Layer with id=${INVALID_LAYER} doesn't exist'
        
    #    Assertions
    String    $.status    Bad Request
    String    $.message   Layer with id\=${INVALID_LAYER}\ doesn't exist
    
    ${RESULT}=    Check statistics records in DB    ${CRITERIA_PROJECT}
    Run Keyword If  "${RESULT}" == "${VAL_PROJECT}"    Output    Unauthorized to save Project statistics
    
    ${CONTEXT_LIST1}    Create List
   :FOR    ${INDEX}    IN RANGE    0    ${ELEMENT}
    \    ${CRITERIA_CONTEXT}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTSID[${INDEX}]}, "targetType": "CONTEXT", "action": "VIEW"} 
    \    ${VAL_CONTEXT1}=    Check statistics records in DB    ${CRITERIA_CONTEXT}       
    \    Append To List    ${CONTEXT_LIST1}    ${VAL_CONTEXT1}                 
    
     
    ${LAYER_LIST1}    Create List
    :FOR    ${INDEX}    IN RANGE    0    ${ELEMENT} 
    \    ${CRITERIA_LAYER}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERSID[${INDEX}]}, "targetType": "LAYER", "action": "VIEW"} 
    \    ${VAL_LAYER1}=    Check statistics records in DB    ${CRITERIA_LAYER}    
    \   Append To List    ${LAYER_LIST1}    ${VAL_LAYER1}
    
    
    :FOR    ${INDEX}    IN RANGE    0    ${ELEMENT}
    \    Lists Should Be Equal    ${CONTEXT_LIST}    ${CONTEXT_LIST1}    Unauthorized to save Contexts statistics
    \    Lists Should Be Equal    ${LAYER_LIST1}    ${LAYER_LIST}    Unauthorized to save Layers statistics        
    
Add multiple statistics with invalid contexts id    [Arguments]    ${PROJECTID}   ${BODY}  ${SESSIONID}
    [Documentation]   Try to add statistics entry any time a user create or view a context, 
    ...    or/and view a layer or/and open a project using empty session id
    ...    After assert the server response need to assert against the Database using
    ...    Check statistics records in DB 
    
    ${CRITERIA_PROJECT}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN"}
    ${VAL_PROJECT}=    Check statistics records in DB    ${CRITERIA_PROJECT} 
    
    ${CONTEXTSID}    Create List    1304358391980    1304358397611    1304358401199 
    ${CONTEXT_LIST}    Create List
    ${LAYER_LIST}    Create List       
    ${ELEMENT}    Set Variable    ${3}
    :FOR    ${INDEX}    IN RANGE    0    3
    \    ${CRITERIA_CONTEXT}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTSID[${INDEX}]}, "targetType": "CONTEXT", "action": "VIEW"} 
    \    ${VAL_CONTEXT}=    Check statistics records in DB    ${CRITERIA_CONTEXT}
    \    Append To List    ${CONTEXT_LIST}    ${VAL_CONTEXT}
         
    
    ${LAYERSID}    Create List    7        6        4
    :FOR    ${INDEX}    IN RANGE    0    ${ELEMENT} 
    \    ${CRITERIA_LAYER}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERSID[${INDEX}]}, "targetType": "LAYER", "action": "VIEW"} 
    \    ${VAL_LAYER}=    Check statistics records in DB    ${CRITERIA_LAYER}    
    \     Append To List    ${LAYER_LIST}    ${VAL_LAYER}
    
     
    Post    /services/rest/v2.0/statistics/projects/${PROJECTID}/?sessionId=${SESSIONID}    body=${BODY}    timeout=10
    #    Logs
    Output    Server status response must be 'Bad Request'
    
    Output    Server message response must be 'Context with id=${INVALID_CONTEXT} doesn't exist'
       
    #    Assertions
    String    $.status    Bad Request
    String    $.message   Context with id\=${INVALID_CONTEXT}\ doesn't exist
    
    ${RESULT}=    Check statistics records in DB    ${CRITERIA_PROJECT}
    Run Keyword If  "${RESULT}" == "${VAL_PROJECT}"    Output    Unauthorized to save Project statistics
    
    ${CONTEXT_LIST1}    Create List
   :FOR    ${INDEX}    IN RANGE    0    ${ELEMENT}
    \    ${CRITERIA_CONTEXT}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTSID[${INDEX}]}, "targetType": "CONTEXT", "action": "VIEW"} 
    \    ${VAL_CONTEXT1}=    Check statistics records in DB    ${CRITERIA_CONTEXT}       
    \    Append To List    ${CONTEXT_LIST1}    ${VAL_CONTEXT1}                 
    
     
    ${LAYER_LIST1}    Create List
    :FOR    ${INDEX}    IN RANGE    0    ${ELEMENT} 
    \    ${CRITERIA_LAYER}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERSID[${INDEX}]}, "targetType": "LAYER", "action": "VIEW"} 
    \    ${VAL_LAYER1}=    Check statistics records in DB    ${CRITERIA_LAYER}    
    \   Append To List    ${LAYER_LIST1}    ${VAL_LAYER1}
    
    
    :FOR    ${INDEX}    IN RANGE    0    ${ELEMENT}
    \    Lists Should Be Equal    ${CONTEXT_LIST}    ${CONTEXT_LIST1}    Unauthorized to save Contexts statistics
    \    Lists Should Be Equal    ${LAYER_LIST1}    ${LAYER_LIST}    Unauthorized to save Layers statistics        
        

Add entry to indicate a context has been viewed   [Arguments]    ${PROJECTID}   ${CONTEXTID}  ${SESSIONID}  ${CRITERIA}
    [Documentation]   Statistics entry is created any time a user create or view a context
    ...   After assert the server response need to assert against the Database using
    ...   Check statistics records in DB 
      
    ${VAL}=    Check statistics records in DB    ${CRITERIA}
    
    Post    /services/rest/v2.0/statistics/projects/${PROJECTID}/contexts/${CONTEXTID}/view?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'OK'
    
    Output    Server message response should be 'Statistics successfully added'
    
    Output    Server result response should be 'View context entry added successfully'
    
    #    Assertions
    String    $.status    OK
    String    $.message   Statistics successfully added
    String    $.result    View context entry added successfully
    
    Check statistics records in DB    ${CRITERIA}  
    Integer    $.result    ${VAL + 1}   
        
    
Add entry to indicate a context has been viewed with invalid session id  [Arguments]    ${PROJECTID}   ${CONTEXTID}  ${SESSIONID}    ${CRITERIA}
    [Documentation]   Trying to add entry to indicate a context has been viewed using an invalid session id
    ...    The REST API should return an "Unauthorized" message
    
    ${VAL}=    Check statistics records in DB    ${CRITERIA}
    Post    /services/rest/v2.0/statistics/projects/${PROJECTID}/contexts/${CONTEXTID}/view?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Unauthorized'
    
    Output    Server message response must be 'Invalid session id.'
       
    #    Assertions
    String    $.status    Unauthorized
    String    $.message   Invalid session id. 
    Check statistics records in DB    ${CRITERIA}  
    Integer    $.result    ${VAL}  
    
Add entry to indicate a context has been viewed with invalid project id  [Arguments]    ${PROJECTID}   ${CONTEXTID}  ${SESSIONID}    ${CRITERIA}
    [Documentation]   Trying to add entry to indicate a context has been viewed using an invalid project id
    ...    The REST API should return an "Unauthorized" message
    
    ${VAL}=    Check statistics records in DB    ${CRITERIA}
    Post    /services/rest/v2.0/statistics/projects/${PROJECTID}/contexts/${CONTEXTID}/view?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Bad Request'
    
    Output    Server message response must be 'The requested project (id = ${INVALID_PROJECT}) does not exist.'
        
    #    Assertions
    String    $.status    Bad Request
    String    $.message   The requested project (id \=\ ${INVALID_PROJECT}) does not exist.
    
    Check statistics records in DB    ${CRITERIA}  
    Integer    $.result    ${VAL} 
    
Add entry to indicate a context has been viewed with invalid context id  [Arguments]    ${PROJECTID}   ${CONTEXTID}  ${SESSIONID}    ${CRITERIA}
    [Documentation]   Trying to add entry to indicate a context has been viewed using an invalid context id
    ...    The REST API should return an "Unauthorized" message
    
    ${VAL}=    Check statistics records in DB    ${CRITERIA}    
    Post    /services/rest/v2.0/statistics/projects/${PROJECTID}/contexts/${CONTEXTID}/view?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Bad Request'
    
    Output    Server message response must be 'Context with id=${INVALID_CONTEXT} doesn't exist'
        
    #    Assertions
    String    $.status    Bad Request
    String    $.message   Context with id\=${INVALID_CONTEXT}\ doesn't exist
    
    Check statistics records in DB    ${CRITERIA}  
    Integer    $.result    ${VAL}  

Add entry to indicate a layer has been viewed   [Arguments]    ${PROJECTID}   ${LAYERID}  ${SESSIONID}    ${CRITERIA}
    [Documentation]   Statistics entry is created any time a user view a layer
    ...   After assert the server response need to assert against the Database using
    ...   Check statistics records in DB 
    
    ${VAL}=    Check statistics records in DB    ${CRITERIA}
    
    Post    /services/rest/v2.0/statistics/projects/${PROJECTID}/layers/${LAYERID}/view?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'OK'
    
    Output    Server message response should be 'Statistics successfully added'
    
    Output    Server result response should be 'View layer entry added successfully'
    
    #    Assertions
    String    $.status    OK
    String    $.message   Statistics successfully added
    String    $.result     View layer entry added successfully
    
    Check statistics records in DB    ${CRITERIA}  
    Integer    $.result    ${VAL + 1} 
    
Add entry to indicate a layer has been viewed with invalid session id  [Arguments]    ${PROJECTID}   ${LAYERID}  ${SESSIONID}    ${CRITERIA}
    [Documentation]   Trying to add entry to indicate a layer has been viewed using an invalid session id
    ...    The REST API should return an "Unauthorized" message
    
    ${VAL}=    Check statistics records in DB    ${CRITERIA}
    
    Post    /services/rest/v2.0/statistics/projects/${PROJECTID}/layers/${LAYERID}/view?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Unauthorized'
    
    Output    Server message response must be 'Invalid session id.'
        
    #    Assertions
    String    $.status    Unauthorized
    String    $.message   Invalid session id.
    
    Check statistics records in DB    ${CRITERIA}  
    Integer    $.result    ${VAL}   
    
Add entry to indicate a layer has been viewed with invalid project id  [Arguments]    ${PROJECTID}   ${LAYERID}  ${SESSIONID}    ${CRITERIA}
    [Documentation]   Trying to add entry to indicate a layer has been viewed using an invalid project id
    ...    The REST API should return an "Unauthorized" message
    
    ${VAL}=    Check statistics records in DB    ${CRITERIA}
    
    Post    /services/rest/v2.0/statistics/projects/${PROJECTID}/layers/${LAYERID}/view?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Bad Request'
    
    Output    Server message response must be 'The requested project (id = ${INVALID_PROJECT}) does not exist.'
        
    #    Assertions
    String    $.status    Bad Request
    String    $.message   The requested project (id \=\ ${INVALID_PROJECT}) does not exist.
    
    Check statistics records in DB    ${CRITERIA}  
    Integer    $.result    ${VAL} 
    
Add entry to indicate a layer has been viewed with invalid layer id  [Arguments]    ${PROJECTID}   ${LAYERID}  ${SESSIONID}    ${CRITERIA}
    [Documentation]   Trying to add entry to indicate a layer has been viewed using an invalid layer id
    ...    The REST API should return an "Unauthorized" message
    
    ${VAL}=    Check statistics records in DB    ${CRITERIA}
    
    Post    /services/rest/v2.0/statistics/projects/${PROJECTID}/layers/${LAYERID}/view?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Bad Request'
    
    Output    Server message response must be 'Layer with id=${INVALID_LAYER} doesn't exist'
      
    #    Assertions
    String    $.status    Bad Request
    String    $.message   Layer with id\=${INVALID_LAYER}\ doesn't exist
    
    Check statistics records in DB    ${CRITERIA}  
    Integer    $.result    ${VAL}

Add entry to indicate a project has been opened   [Arguments]    ${PROJECTID}   ${SESSIONID}    ${CRITERIA}
    [Documentation]   Statistics entry is created any time a user create or view a context
    ...   After assert the server response need to assert against the Database using
    ...   Check statistics records in DB 
    
    ${VAL}=    Check statistics records in DB    ${CRITERIA}
    
    Post    /services/rest/v2.0/statistics/projects/${PROJECTID}/open?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'OK'
    
    Output    Server message response should be 'Statistics successfully added'
    
    Output    Server result response should be 'Open project statistic entry added successfully'
    
    #    Assertions
    String    $.status    OK
    String    $.message   Statistics successfully added
    String    $.result     Open project statistic entry added successfully
    
    Check statistics records in DB    ${CRITERIA}  
    Integer    $.result    ${VAL + 1}
    
Add entry to indicate a project has been opened with invalid session id  [Arguments]    ${PROJECTID}    ${SESSIONID}    ${CRITERIA}
    [Documentation]   Trying to add entry to indicate a project has been opened using an invalid session id
    ...    The REST API should return an "Unauthorized" message
    
    ${VAL}=    Check statistics records in DB    ${CRITERIA}
    
    Post    /services/rest/v2.0/statistics/projects/${PROJECTID}/open?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Unauthorized'
    
    Output    Server message response must be 'Invalid session id.'
        
    #    Assertions
    String    $.status    Unauthorized
    String    $.message   Invalid session id.
    
    Check statistics records in DB    ${CRITERIA}  
    Integer    $.result    ${VAL}   
    
Add entry to indicate a project has been opened with invalid project id  [Arguments]    ${PROJECTID}    ${SESSIONID}    ${CRITERIA}
    [Documentation]   Trying to add entry to indicate a project has been opened using an invalid project id
    ...    The REST API should return an "Unauthorized" message
    
    ${VAL}=    Check statistics records in DB    ${CRITERIA}
    
    Post    /services/rest/v2.0/statistics/projects/${PROJECTID}/open?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Bad Request'
    
    Output    Server message response must be 'The requested project (id = ${INVALID_PROJECT}) does not exist.'
        
    #    Assertions
    String    $.status    Bad Request
    String    $.message   The requested project (id \=\ ${INVALID_PROJECT}) does not exist.
    
    Check statistics records in DB    ${CRITERIA}  
    Integer    $.result    ${VAL} 

Check statistics records in DB    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a filtered list of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    ${RESULT}=    Post    /admin/rest/v1.0/statistics/current/count    body=${CRITERIA}    headers={"x-auth-token":"${SESSIONID}"}
  
    ${VAL}    Set Variable    ${RESULT['body']}
    ${VAL}    Set Variable    ${VAL['result']}             
    
    String    $.status    OK
    String    $.message   The result is the count of statistics for the search
    Integer    $.result    ${VAL}
    [RETURN]    ${VAL}
             