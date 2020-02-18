*** Setting ***

Documentation    Tests for stadistics REST API Admin in JMap 7 
#------------------------------------------------------------------------------------------------------------------------------------------------------------------   
Library    REST    http://192.168.0.25:8080    #RESTinstance 1.0.0rc4 Robot Framework test library for (RESTful) JSON APIs
Library    OperatingSystem
Library    Collections
#------------------------------------------------------------------------------------------------------------------------------------------------------------------
Resource    ../../common/rest_api/CommonRestApi.robot
#------------------------------------------------------------------------------------------------------------------------------------------------------------------
Suite Setup    Open Admin Session    ${USERNAME}    ${PASSWORD}       #Open a session before the suite
Suite Teardown    Close Session    ${ADMINSESSIONID}    #Close the session after the suite
#------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Variables ***

${USERNAME}    administrator
${PASSWORD}    ${EMPTY}
${MONTH}    5
${YEAR}    2019
${INVALID_SESSION}    -2    #{"message": "Invalid session id.", "status": "Unauthorized"}
${EMPTY_SESSION}    ${EMPTY}
${PROJECTID}    0     #required field
${CONTEXTID}    1304358391980  #required field
${VAL}    0
${LAYERID}     7   #required field
${INVALID_PROJECT}    -2
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Test Cases ***

Aggregate Statistics    
    [Documentation]    Process aggregation of entities in current table into monthly and yearly tables
    Aggregate Statistics    ${ADMINSESSIONID} 
       
Aggregate Statistics with Invalid Admin Session Id
    [Documentation]    Process aggregation of entities in current table into monthly and yearly tables using invalid session id
    Aggregate Statistics with Invalid Admin Session Id    ${INVALID_SESSION}
    
Aggregate Statistics with Empty Admin Session Id
    [Documentation]    Process aggregation of entities in current table into monthly and yearly tables using invalid session id
    Aggregate Statistics with Empty Admin Session Id    ${EMPTY_SESSION}    
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Count Statistics in Current with Invalid Admin Session Id
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_CURRENT in admin REST API with invalid session id
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN"}
    Count Statistics in Current with Invalid Admin Session Id    ${INVALID_SESSION}    ${CRITERIA}
    
Count Statistics in Current with Empty Admin Session Id
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_CURRENT in admin REST API with invalid session id
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN"}
    Count Statistics in Current with Empty Admin Session Id    ${EMPTY_SESSION}    ${CRITERIA}
        
Count Project Statistics in Current
    [Documentation]   Get a counter of Projects in table JMAP_STATISTICS_CURRENT in admin REST API
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN"}
    Count Statistics in Current    ${CRITERIA}
    
Count Project Statistics in Current with Invalid Project Id
    [Documentation]   Get a counter of Projects in table JMAP_STATISTICS_CURRENT in admin REST API with invalid project id
    ${CRITERIA}=    Catenate    {"projectId": ${INVALID_PROJECT}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN"}
    Count Project Statistics in Current with Invalid Project Id    ${CRITERIA}
    
Count Project Statistics in Current with Invalid Page Number
    [Documentation]   Get a counter of Projects in table JMAP_STATISTICS_CURRENT in admin REST API with invalid page number
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN", "elementPerPage": 1, "pageNumber": 0}
    Count Project Statistics in Current with Invalid Page Number    ${CRITERIA}
    
Count Project Statistics in Current with Invalid Element Page
    [Documentation]   Get a counter of Projects in table JMAP_STATISTICS_CURRENT in admin REST API with invalid element page
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN", "elementPerPage": 0, "pageNumber": 1}
    Count Project Statistics in Current with Invalid Element Page    ${CRITERIA}    
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Count Statistics in Monthly with Invalid Admin Session Id
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_MONTHLY in admin REST API with invalid session id
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN", "month": ${MONTH}, "year": ${YEAR}}
    Count Statistics in Monthly with Invalid Admin Session Id    ${INVALID_SESSION}    ${CRITERIA}
    
Count Statistics in Monthly with Empty Admin Session Id
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_MONTHLY in admin REST API with invalid session id
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN", "month": ${MONTH}, "year": ${YEAR}}
    Count Statistics in Monthly with Empty Admin Session Id    ${EMPTY_SESSION}    ${CRITERIA}
    
Count Project Statistics in Monthly
    [Documentation]   Get a counter of Projects in table JMAP_STATISTICS_MONTHLY in admin REST API
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN", "month": ${MONTH}, "year": ${YEAR}}
    Count Statistics in Monthly    ${CRITERIA}
    
Count Project Statistics in Monthly with Invalid Project Id
    [Documentation]   Get a counter of Projects in table JMAP_STATISTICS_MONTHLY in admin REST API with invalid project id
    ${CRITERIA}=    Catenate    {"projectId": ${INVALID_PROJECT}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN", "month": ${MONTH}, "year": ${YEAR}}
    Count Project Statistics in Monthly with Invalid Project Id    ${CRITERIA}
    
Count Project Statistics in Monthly with Invalid Page Number
    [Documentation]   Get a counter of Projects in table JMAP_STATISTICS_MONTHLY in admin REST API with invalid page number
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN", "elementPerPage": 1, "pageNumber": 0, "month": ${MONTH}, "year": ${YEAR}}
    Count Project Statistics in Monthly with Invalid Page Number    ${CRITERIA}
    
Count Project Statistics in Monthly with Invalid Element Page
    [Documentation]   Get a counter of Projects in table JMAP_STATISTICS_MONTHLY in admin REST API with invalid element page
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN", "elementPerPage": 0, "pageNumber": 1, "month": ${MONTH}, "year": ${YEAR}}
    Count Project Statistics in Monthly with Invalid Element Page    ${CRITERIA}    
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Count Statistics in Yearly with Invalid Admin Session Id
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_YEARLY in admin REST API with invalid session id
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN", "year": ${YEAR}}
    Count Statistics in Yearly with Invalid Admin Session Id    ${INVALID_SESSION}    ${CRITERIA}
    
Count Statistics in Yearly with Empty Admin Session Id
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_YEARLY in admin REST API with invalid session id
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN", "year": ${YEAR}}
    Count Statistics in Yearly with Empty Admin Session Id    ${EMPTY_SESSION}    ${CRITERIA}
    
Count Project Statistics in Yearly
    [Documentation]   Get a counter of Projects in table JMAP_STATISTICS_YEARLY in admin REST API
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN", "year": ${YEAR}}
    Count Statistics in Yearly    ${CRITERIA}
    
Count Project Statistics in Yearly with Invalid Project Id
    [Documentation]   Get a counter of Projects in table JMAP_STATISTICS_YEARLY in admin REST API with invalid project id
    ${CRITERIA}=    Catenate    {"projectId": ${INVALID_PROJECT}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN", "year": ${YEAR}}
    Count Project Statistics in Yearly with Invalid Project Id    ${CRITERIA}
    
Count Project Statistics in Yearly with Invalid Page Number
    [Documentation]   Get a counter of Projects in table JMAP_STATISTICS_YEARLY in admin REST API with invalid page number
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN", "elementPerPage": 1, "pageNumber": 0, "year": ${YEAR}}
    Count Project Statistics in Yearly with Invalid Page Number    ${CRITERIA}
    
Count Project Statistics in Yearly with Invalid Element Page
    [Documentation]   Get a counter of Projects in table JMAP_STATISTICS_YEARLY in admin REST API with invalid element page
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN", "elementPerPage": 0, "pageNumber": 1, "year": ${YEAR}}
    Count Project Statistics in Yearly with Invalid Element Page    ${CRITERIA} 
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Count Layer Statistics in Current
    [Documentation]   Get a counter of Layers in table JMAP_STATISTICS_CURRENT in admin REST API
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERID}, "targetType": "LAYER", "action": "VIEW"}
    Count Statistics in Current    ${CRITERIA}
    
Count Layer Statistics in Current with Invalid Project Id
    [Documentation]   Get a counter of Layers in table JMAP_STATISTICS_CURRENT in admin REST API with invalid project id
    ${CRITERIA}=    Catenate    {"projectId": ${INVALID_PROJECT}, "targetId": ${LAYERID}, "targetType": "LAYER", "action": "VIEW"}
    Count Layer Statistics in Current with Invalid Project Id    ${CRITERIA}
    
Count Layer Statistics in Current with Invalid Page Number
    [Documentation]   Get a counter of Layers in table JMAP_STATISTICS_CURRENT in admin REST API with invalid page number
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERID}, "targetType": "LAYER", "action": "VIEW", "elementPerPage": 1, "pageNumber": 0}
    Count Layer Statistics in Current with Invalid Page Number    ${CRITERIA}
    
Count Layer Statistics in Current with Invalid Element Page
    [Documentation]   Get a counter of Layers in table JMAP_STATISTICS_CURRENT in admin REST API with invalid element page
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERID}, "targetType": "LAYER", "action": "VIEW", "elementPerPage": 0, "pageNumber": 1}
    Count Layer Statistics in Current with Invalid Element Page    ${CRITERIA}    
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Count Layer Statistics in Monthly
    [Documentation]   Get a counter of Layers in table JMAP_STATISTICS_MONTHLY in admin REST API
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERID}, "targetType": "LAYER", "action": "VIEW", "month": ${MONTH}, "year": ${YEAR}}
    Count Statistics in Monthly    ${CRITERIA}
    
Count Layer Statistics in Monthly with Invalid Project Id
    [Documentation]   Get a counter of Layers in table JMAP_STATISTICS_MONTHLY in admin REST API with invalid project id
    ${CRITERIA}=    Catenate    {"projectId": ${INVALID_PROJECT}, "targetId": ${LAYERID}, "targetType": "LAYER", "action": "VIEW", "month": ${MONTH}, "year": ${YEAR}}
    Count Layer Statistics in Monthly with Invalid Project Id    ${CRITERIA}
    
Count Layer Statistics in Monthly with Invalid Page Number
    [Documentation]   Get a counter of Layers in table JMAP_STATISTICS_MONTHLY in admin REST API with invalid page number
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERID}, "targetType": "LAYER", "action": "VIEW", "elementPerPage": 1, "pageNumber": 0, "month": ${MONTH}, "year": ${YEAR}}
    Count Layer Statistics in Monthly with Invalid Page Number    ${CRITERIA}
    
Count Layer Statistics in Monthly with Invalid Element Page
    [Documentation]   Get a counter of Layers in table JMAP_STATISTICS_MONTHLY in admin REST API with invalid element page
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERID}, "targetType": "LAYER", "action": "VIEW", "elementPerPage": 0, "pageNumber": 1, "month": ${MONTH}, "year": ${YEAR}}
    Count Layer Statistics in Monthly with Invalid Element Page    ${CRITERIA}    
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Count Layer Statistics in Yearly
    [Documentation]   Get a counter of Layers in table JMAP_STATISTICS_YEARLY in admin REST API
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERID}, "targetType": "LAYER", "action": "VIEW", "year": ${YEAR}}
    Count Statistics in Yearly    ${CRITERIA}
    
Count Layer Statistics in Yearly with Invalid Project Id
    [Documentation]   Get a counter of Layers in table JMAP_STATISTICS_YEARLY in admin REST API with invalid project id
    ${CRITERIA}=    Catenate    {"projectId": ${INVALID_PROJECT}, "targetId": ${LAYERID}, "targetType": "LAYER", "action": "VIEW", "year": ${YEAR}}
    Count Layer Statistics in Yearly with Invalid Project Id    ${CRITERIA}
    
Count Layer Statistics in Yearly with Invalid Page Number
    [Documentation]   Get a counter of Layers in table JMAP_STATISTICS_YEARLY in admin REST API with invalid page number
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERID}, "targetType": "LAYER", "action": "VIEW", "elementPerPage": 1, "pageNumber": 0, "year": ${YEAR}}
    Count Layer Statistics in Yearly with Invalid Page Number    ${CRITERIA}
    
Count Layer Statistics in Yearly with Invalid Element Page
    [Documentation]   Get a counter of Layers in table JMAP_STATISTICS_YEARLY in admin REST API with invalid element page
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERID}, "targetType": "LAYER", "action": "VIEW", "elementPerPage": 0, "pageNumber": 1, "year": ${YEAR}}
    Count Layer Statistics in Yearly with Invalid Element Page    ${CRITERIA}    
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Count Context View Statistics in Current
    [Documentation]   Get a counter of Contexts Views in table JMAP_STATISTICS_CURRENT in admin REST API
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "VIEW"}
    Count Statistics in Current    ${CRITERIA}
    
Count Context View Statistics in Current with Invalid Project Id
    [Documentation]   Get a counter of Contexts Views in table JMAP_STATISTICS_CURRENT in admin REST API with invalid project id
    ${CRITERIA}=    Catenate    {"projectId": ${INVALID_PROJECT}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "VIEW"}
    Count Context Statistics in Current with Invalid Project Id    ${CRITERIA}
    
Count Context View Statistics in Current with Invalid Page Number
    [Documentation]   Get a counter of Contexts Views in table JMAP_STATISTICS_CURRENT in admin REST API with invalid page number
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "VIEW", "elementPerPage": 1, "pageNumber": 0}
    Count Context Statistics in Current with Invalid Page Number    ${CRITERIA}
    
Count Context View Statistics in Current with Invalid Element Page
    [Documentation]   Get a counter of Contexts Views in table JMAP_STATISTICS_CURRENT in admin REST API with invalid element page
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "VIEW", "elementPerPage": 0, "pageNumber": 1}
    Count Context Statistics in Current with Invalid Element Page    ${CRITERIA}    
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Count Context Create Statistics in Current
    [Documentation]   Get a counter of Contexts Creations in table JMAP_STATISTICS_CURRENT in admin REST API
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "CREATE"}
    Count Statistics in Current    ${CRITERIA}
    
Count Context Create Statistics in Current with Invalid Project Id
    [Documentation]   Get a counter of Contexts Creations in table JMAP_STATISTICS_CURRENT in admin REST API with invalid project id
    ${CRITERIA}=    Catenate    {"projectId": ${INVALID_PROJECT}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "CREATE"}
    Count Context Statistics in Current with Invalid Project Id    ${CRITERIA}
    
Count Context Create Statistics in Current with Invalid Page Number
    [Documentation]   Get a counter of Contexts Creations in table JMAP_STATISTICS_CURRENT in admin REST API with invalid page number
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "CREATE", "elementPerPage": 1, "pageNumber": 0}
    Count Context Statistics in Current with Invalid Page Number    ${CRITERIA}
    
Count Context Create Statistics in Current with Invalid Element Page
    [Documentation]   Get a counter of Contexts Creations in table JMAP_STATISTICS_CURRENT in admin REST API with invalid element page
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "CREATE", "elementPerPage": 0, "pageNumber": 1}
    Count Context Statistics in Current with Invalid Element Page    ${CRITERIA}    
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Count Context View Statistics in Monthly
    [Documentation]   Get a counter of Contexts Views in table JMAP_STATISTICS_MONTHLY in admin REST API
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "VIEW", "month": ${MONTH}, "year": ${YEAR}}
    Count Statistics in Monthly    ${CRITERIA}
    
Count Context View Statistics in Monthly with Invalid Project Id
    [Documentation]   Get a counter of Contexts Views in table JMAP_STATISTICS_MONTHLY in admin REST API with invalid project id
    ${CRITERIA}=    Catenate    {"projectId": ${INVALID_PROJECT}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "VIEW", "month": ${MONTH}, "year": ${YEAR}}
    Count Context Statistics in Monthly with Invalid Project Id    ${CRITERIA}
    
Count Context View Statistics in Monthly with Invalid Page Number
    [Documentation]   Get a counter of Contexts Views in table JMAP_STATISTICS_MONTHLY in admin REST API with invalid page number
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "VIEW", "elementPerPage": 1, "pageNumber": 0, "month": ${MONTH}, "year": ${YEAR}}
    Count Context Statistics in Monthly with Invalid Page Number    ${CRITERIA}
    
Count Context View Statistics in Monthly with Invalid Element Page
    [Documentation]   Get a counter of Contexts Views in table JMAP_STATISTICS_MONTHLY in admin REST API with element page
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "VIEW", "elementPerPage": 0, "pageNumber": 1, "month": ${MONTH}, "year": ${YEAR}}
    Count Context Statistics in Monthly with Invalid Element Page    ${CRITERIA}    
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Count Context Create Statistics in Monthly
    [Documentation]   Get a counter of Contexts Creations in table JMAP_STATISTICS_MONTHLY in admin REST API
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "CREATE", "month": ${MONTH}, "year": ${YEAR}}
    Count Statistics in Monthly    ${CRITERIA}
    
Count Context Create Statistics in Monthly with Invalid Project Id
    [Documentation]   Get a counter of Contexts Creations in table JMAP_STATISTICS_MONTHLY in admin REST API with invalid project id
    ${CRITERIA}=    Catenate    {"projectId": ${INVALID_PROJECT}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "CREATE"}
    Count Context Statistics in Monthly with Invalid Project Id    ${CRITERIA}
    
Count Context Create Statistics in Monthly with Invalid Page Number
    [Documentation]   Get a counter of Contexts Creations in table JMAP_STATISTICS_MONTHLY in admin REST API with invalid page number
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "CREATE", "elementPerPage": 1, "pageNumber": 0}
    Count Context Statistics in Monthly with Invalid Page Number    ${CRITERIA}
    
Count Context Create Statistics in Monthly with Invalid Element Page
    [Documentation]   Get a counter of Contexts Creations in table JMAP_STATISTICS_MONTHLY in admin REST API with invalid element page
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "CREATE", "elementPerPage": 0, "pageNumber": 1}
    Count Context Statistics in Monthly with Invalid Element Page    ${CRITERIA}    
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Count Context View Statistics in Yearly
    [Documentation]   Get a counter of Contexts Views in table JMAP_STATISTICS_YEARLY in admin REST API
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "VIEW", "year": ${YEAR}}
    Count Statistics in Yearly    ${CRITERIA}
    
Count Context View Statistics in Yearly with Invalid Project Id
    [Documentation]   Get a counter of Contexts Views in table JMAP_STATISTICS_YEARLY in admin REST API with invalid project id
    ${CRITERIA}=    Catenate    {"projectId": ${INVALID_PROJECT}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "VIEW", "year": ${YEAR}}
    Count Context Statistics in Yearly with Invalid Project Id    ${CRITERIA}
    
Count Context View Statistics in Yearly with Invalid Page Number
    [Documentation]   Get a counter of Contexts Views in table JMAP_STATISTICS_YEARLY in admin REST API with invalid page number
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "VIEW", "elementPerPage": 1, "pageNumber": 0, "year": ${YEAR}}
    Count Context Statistics in Yearly with Invalid Page Number    ${CRITERIA}
    
Count Context View Statistics in Yearly with Invalid Element Page
    [Documentation]   Get a counter of Contexts Views in table JMAP_STATISTICS_YEARLY in admin REST API with invalid element page
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "VIEW", "elementPerPage": 0, "pageNumber": 1, "year": ${YEAR}}
    Count Context Statistics in Yearly with Invalid Element Page    ${CRITERIA}    
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Count Context Create Statistics in Yearly
    [Documentation]   Get a counter of Contexts Creations in table JMAP_STATISTICS_YEARLY in admin REST API
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "CREATE", "year": ${YEAR}}
    Count Statistics in Yearly    ${CRITERIA}
    
Count Context Create Statistics in Yearly with Invalid Project Id
    [Documentation]   Get a counter of Contexts Creations in table JMAP_STATISTICS_YEARLY in admin REST API with invalid project id
    ${CRITERIA}=    Catenate    {"projectId": ${INVALID_PROJECT}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "CREATE"}
    Count Context Statistics in Yearly with Invalid Project Id    ${CRITERIA}
    
Count Context Create Statistics in Yearly with Invalid Page Number
    [Documentation]   Get a counter of Contexts Creations in table JMAP_STATISTICS_YEARLY in admin REST API with invalid page number
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "CREATE", "elementPerPage": 1, "pageNumber": 0}
    Count Context Statistics in Yearly with Invalid Page Number    ${CRITERIA}
    
Count Context Create Statistics in Yearly with Invalid Element Page
    [Documentation]   Get a counter of Contexts Creations in table JMAP_STATISTICS_YEARLY in admin REST API with invalid element page
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "CREATE", "elementPerPage": 0, "pageNumber": 1}
    Count Context Statistics in Yearly with Invalid Element Page    ${CRITERIA}
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get Statistics in Current with Invalid Admin Session Id
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_CURRENT in admin REST API with invalid session id
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN"}
    Get Statistics in Current with Invalid Admin Session Id    ${INVALID_SESSION}    ${CRITERIA}
    
Get Statistics in Current with Empty Admin Session Id
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_CURRENT in admin REST API with invalid session id
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN"}
    Get Statistics in Current with Empty Admin Session Id    ${EMPTY_SESSION}    ${CRITERIA}

Get Project Statistics in Current
    [Documentation]   Get a list of Projects in table JMAP_STATISTICS_CURRENT in admin REST API
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN"}
    Get Statistics in Current    ${CRITERIA}

Get Project Statistics in Current with Invalid Project Id
    [Documentation]   Get a list of Projects in table JMAP_STATISTICS_CURRENT in admin REST API with invalid project id
    ${CRITERIA}=    Catenate    {"projectId": ${INVALID_PROJECT}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN"}
    Get Project Statistics in Current with Invalid Project Id    ${CRITERIA}
    
Get Project Statistics in Current with Invalid Page Number
    [Documentation]   Get a list of Projects in table JMAP_STATISTICS_CURRENT in admin REST API with invalid page number
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN", "elementPerPage": 1, "pageNumber": 0}
    Get Project Statistics in Current with Invalid Page Number    ${CRITERIA}
    
Get Project Statistics in Current with Invalid Element Page
    [Documentation]   Get a list of Projects in table JMAP_STATISTICS_CURRENT in admin REST API with invalid element page
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN", "elementPerPage": 0, "pageNumber": 1}
    Get Project Statistics in Current with Invalid Element Page    ${CRITERIA}    
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get Statistics in Monthly with Invalid Admin Session Id
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_MONTHLY in admin REST API with invalid session id
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN"}
    Get Statistics in Monthly with Invalid Admin Session Id    ${INVALID_SESSION}    ${CRITERIA}
    
Get Statistics in Monthly with Empty Admin Session Id
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_MONTHLY in admin REST API with invalid session id
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN"}
    Get Statistics in Monthly with Empty Admin Session Id    ${EMPTY_SESSION}    ${CRITERIA}

Get Project Statistics in Monthly
    [Documentation]   Get a list of Projects in table JMAP_STATISTICS_MONTHLY in admin REST API
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN", "month": ${MONTH}, "year": ${YEAR}}
    Get Statistics in Monthly    ${CRITERIA}

Get Project Statistics in Monthly with Invalid Project Id
    [Documentation]   Get a list of Projects in table JMAP_STATISTICS_MONTHLY in admin REST API with invalid project id
    ${CRITERIA}=    Catenate    {"projectId": ${INVALID_PROJECT}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN", "month": ${MONTH}, "year": ${YEAR}}
    Get Project Statistics in Monthly with Invalid Project Id    ${CRITERIA}
    
Get Project Statistics in Monthly with Invalid Page Number
    [Documentation]   Get a list of Projects in table JMAP_STATISTICS_MONTHLY in admin REST API with invalid page number
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN", "elementPerPage": 1, "pageNumber": 0, "month": ${MONTH}, "year": ${YEAR}}
    Get Project Statistics in Monthly with Invalid Page Number    ${CRITERIA}
    
Get Project Statistics in Monthly with Invalid Element Page
    [Documentation]   Get a list of Projects in table JMAP_STATISTICS_MONTHLY in admin REST API with invalid element page
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN", "elementPerPage": 0, "pageNumber": 1, "month": ${MONTH}, "year": ${YEAR}}
    Get Project Statistics in Monthly with Invalid Element Page    ${CRITERIA}    
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get Statistics in Yearly with Invalid Admin Session Id
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_YEARLY in admin REST API with invalid session id
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN"}
    Get Statistics in Yearly with Invalid Admin Session Id    ${INVALID_SESSION}    ${CRITERIA}
    
Get Statistics in Yearly with Empty Admin Session Id
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_YEARLY in admin REST API with invalid session id
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN"}
    Get Statistics in Yearly with Empty Admin Session Id    ${EMPTY_SESSION}    ${CRITERIA}

Get Project Statistics in Yearly
    [Documentation]   Get a list of Projects in table JMAP_STATISTICS_YEARLY in admin REST API
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN", "year": ${YEAR}}
    Get Statistics in Yearly    ${CRITERIA}
    
Get Project Statistics in Yearly with Invalid Project Id
    [Documentation]   Get a list of Projects in table JMAP_STATISTICS_YEARLY in admin REST API with invalid project id
    ${CRITERIA}=    Catenate    {"projectId": ${INVALID_PROJECT}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN", "year": ${YEAR}}
    Get Project Statistics in Yearly with Invalid Project Id    ${CRITERIA}
    
Get Project Statistics in Yearly with Invalid Page Number
    [Documentation]   Get a list of Projects in table JMAP_STATISTICS_YEARLY in admin REST API with invalid page number
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN", "elementPerPage": 1, "pageNumber": 0, "year": ${YEAR}}
    Get Project Statistics in Yearly with Invalid Page Number    ${CRITERIA}
    
Get Project Statistics in Yearly with Invalid Element Page
    [Documentation]   Get a list of Projects in table JMAP_STATISTICS_YEARLY in admin REST API with invalid element page
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN", "elementPerPage": 0, "pageNumber": 1, "year": ${YEAR}}
    Get Project Statistics in Yearly with Invalid Element Page    ${CRITERIA}    
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get Layer Statistics in Current
    [Documentation]   Get a list of Layers in table JMAP_STATISTICS_CURRENT in admin REST API
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERID}, "targetType": "LAYER", "action": "VIEW"}
    Get Statistics in Current    ${CRITERIA}

Get Layer Statistics in Current with Invalid Project Id
    [Documentation]   Get a list of Layers in table JMAP_STATISTICS_CURRENT in admin REST API with invalid project id
    ${CRITERIA}=    Catenate    {"projectId": ${INVALID_PROJECT}, "targetId": ${LAYERID}, "targetType": "LAYER", "action": "VIEW"}
    Get Layer Statistics in Current with Invalid Project Id    ${CRITERIA}
    
Get Layer Statistics in Current with Invalid Page Number
    [Documentation]   Get a list of Layers in table JMAP_STATISTICS_CURRENT in admin REST API with invalid page number
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERID}, "targetType": "LAYER", "action": "VIEW", "elementPerPage": 1, "pageNumber": 0}
    Get Layer Statistics in Current with Invalid Page Number    ${CRITERIA}
    
Get Layer Statistics in Current with Invalid Element Page
    [Documentation]   Get a list of Layers in table JMAP_STATISTICS_CURRENT in admin REST API with invalid element page
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERID}, "targetType": "LAYER", "action": "VIEW", "elementPerPage": 0, "pageNumber": 1}
    Get Layer Statistics in Current with Invalid Element Page    ${CRITERIA}    
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get Layer Statistics in Monthly
    [Documentation]   Get a list of Layers in table JMAP_STATISTICS_MONTHLY in admin REST API
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERID}, "targetType": "LAYER", "action": "VIEW", "month": ${MONTH}, "year": ${YEAR}}
    Get Statistics in Monthly    ${CRITERIA}

Get Layer Statistics in Monthly with Invalid Project Id
    [Documentation]   Get a list of Layers in table JMAP_STATISTICS_MONTHLY in admin REST API with invalid project id
    ${CRITERIA}=    Catenate    {"projectId": ${INVALID_PROJECT}, "targetId": ${LAYERID}, "targetType": "LAYER", "action": "VIEW", "month": ${MONTH}, "year": ${YEAR}}
    Get Layer Statistics in Monthly with Invalid Project Id    ${CRITERIA}
    
Get Layer Statistics in Monthly with Invalid Page Number
    [Documentation]   Get a list of Layers in table JMAP_STATISTICS_MONTHLY in admin REST API with invalid page number
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERID}, "targetType": "LAYER", "action": "VIEW", "elementPerPage": 1, "pageNumber": 0, "month": ${MONTH}, "year": ${YEAR}}
    Get Layer Statistics in Monthly with Invalid Page Number    ${CRITERIA}
    
Get Layer Statistics in Monthly with Invalid Element Page
    [Documentation]   Get a list of Layers in table JMAP_STATISTICS_MONTHLY in admin REST API with invalid element page
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERID}, "targetType": "LAYER", "action": "VIEW", "elementPerPage": 0, "pageNumber": 1, "month": ${MONTH}, "year": ${YEAR}}
    Get Layer Statistics in Monthly with Invalid Element Page    ${CRITERIA}
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get Layer Statistics in Yearly
    [Documentation]   Get a list of Layers in table JMAP_STATISTICS_YEARLY in admin REST API
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERID}, "targetType": "LAYER", "action": "VIEW", "year": ${YEAR}}
    Get Statistics in Yearly    ${CRITERIA}

Get Layer Statistics in Yearly with Invalid Project Id
    [Documentation]   Get a list of Layers in table JMAP_STATISTICS_YEARLY in admin REST API with invalid project id
    ${CRITERIA}=    Catenate    {"projectId": ${INVALID_PROJECT}, "targetId": ${LAYERID}, "targetType": "LAYER", "action": "VIEW", "year": ${YEAR}}
    Get Layer Statistics in Yearly with Invalid Project Id    ${CRITERIA}
    
Get Layer Statistics in Yearly with Invalid Page Number
    [Documentation]   Get a list of Layers in table JMAP_STATISTICS_YEARLY in admin REST API with invalid page number
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERID}, "targetType": "LAYER", "action": "VIEW", "elementPerPage": 1, "pageNumber": 0, "year": ${YEAR}}
    Get Layer Statistics in Yearly with Invalid Page Number    ${CRITERIA}
    
Get Layer Statistics in Yearly with Invalid Element Page
    [Documentation]   Get a list of Layers in table JMAP_STATISTICS_YEARLY in admin REST API with invalid element page
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERID}, "targetType": "LAYER", "action": "VIEW", "elementPerPage": 0, "pageNumber": 1, "year": ${YEAR}}
    Get Layer Statistics in Yearly with Invalid Element Page    ${CRITERIA}
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get Context View Statistics in Current
    [Documentation]   Get a list of Contexts Views in table JMAP_STATISTICS_CURRENT in admin REST API
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "VIEW"}
    Get Statistics in Current    ${CRITERIA}
    
Get Context View Statistics in Current with Invalid Project Id
    [Documentation]   Get a list of Contexts Views in table JMAP_STATISTICS_CURRENT in admin REST API with invalid project id
    ${CRITERIA}=    Catenate    {"projectId": ${INVALID_PROJECT}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "VIEW"}
    Get Context Statistics in Current with Invalid Project Id    ${CRITERIA}
    
Get Context View Statistics in Current with Invalid Page Number
    [Documentation]   Get a list of Contexts Views in table JMAP_STATISTICS_CURRENT in admin REST API with invalid page number
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "VIEW", "elementPerPage": 1, "pageNumber": 0}
    Get Context Statistics in Current with Invalid Page Number    ${CRITERIA}
    
Get Context View Statistics in Current with Invalid Element Page
    [Documentation]   Get a list of Contexts Views in table JMAP_STATISTICS_CURRENT in admin REST API with invalid element page
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "VIEW", "elementPerPage": 0, "pageNumber": 1}
    Get Context Statistics in Current with Invalid Element Page    ${CRITERIA}    
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get Context Create Statistics in Current
    [Documentation]   Get a list of Contexts Creations in table JMAP_STATISTICS_CURRENT in admin REST API
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "CREATE"}
    Get Statistics in Current    ${CRITERIA}
    
Get Context Create Statistics in Current with Invalid Project Id
    [Documentation]   Get a list of Contexts Creations in table JMAP_STATISTICS_CURRENT in admin REST API with invalid project id
    ${CRITERIA}=    Catenate    {"projectId": ${INVALID_PROJECT}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "CREATE"}
    Get Context Statistics in Current with Invalid Project Id    ${CRITERIA}
    
Get Context Create Statistics in Current with Invalid Page Number
    [Documentation]   Get a list of Contexts Creations in table JMAP_STATISTICS_CURRENT in admin REST API with invalid page number
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "CREATE", "elementPerPage": 1, "pageNumber": 0}
    Get Context Statistics in Current with Invalid Page Number    ${CRITERIA}
    
Get Context Create Statistics in Current with Invalid Element Page
    [Documentation]   Get a list of Contexts Creations in table JMAP_STATISTICS_CURRENT in admin REST API with invalid element page
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "CREATE", "elementPerPage": 0, "pageNumber": 1}
    Get Context Statistics in Current with Invalid Element Page    ${CRITERIA}    
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get Context View Statistics in Monthly
    [Documentation]   Get a list of Contexts Views in table JMAP_STATISTICS_MONTHLY in admin REST API
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "VIEW", "month": ${MONTH}, "year": ${YEAR}}
    Get Statistics in Monthly    ${CRITERIA}
    
Get Context View Statistics in Monthly with Invalid Project Id
    [Documentation]   Get a list of Contexts Views in table JMAP_STATISTICS_MONTHLY in admin REST API with invalid project id
    ${CRITERIA}=    Catenate    {"projectId": ${INVALID_PROJECT}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "VIEW", "month": ${MONTH}, "year": ${YEAR}}
    Get Context Statistics in Monthly with Invalid Project Id    ${CRITERIA}
    
Get Context View Statistics in Monthly with Invalid Page Number
    [Documentation]   Get a list of Contexts Views in table JMAP_STATISTICS_MONTHLY in admin REST API with invalid page number
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "VIEW", "elementPerPage": 1, "pageNumber": 0, "month": ${MONTH}, "year": ${YEAR}}
    Get Context Statistics in Monthly with Invalid Page Number    ${CRITERIA}
    
Get Context View Statistics in Monthly with Invalid Element Page
    [Documentation]   Get a list of Contexts Views in table JMAP_STATISTICS_MONTHLY in admin REST API with element page
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "VIEW", "elementPerPage": 0, "pageNumber": 1, "month": ${MONTH}, "year": ${YEAR}}
    Get Context Statistics in Monthly with Invalid Element Page    ${CRITERIA}    
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get Context Create Statistics in Monthly
    [Documentation]   Get a list of Contexts Creations in table JMAP_STATISTICS_MONTHLY in admin REST API
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "CREATE", "month": ${MONTH}, "year": ${YEAR}}
    Get Statistics in Monthly    ${CRITERIA}
    
Get Context Create Statistics in Monthly with Invalid Project Id
    [Documentation]   Get a list of Contexts Creations in table JMAP_STATISTICS_MONTHLY in admin REST API with invalid project id
    ${CRITERIA}=    Catenate    {"projectId": ${INVALID_PROJECT}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "CREATE"}
    Get Context Statistics in Monthly with Invalid Project Id    ${CRITERIA}
    
Get Context Create Statistics in Monthly with Invalid Page Number
    [Documentation]   Get a list of Contexts Creations in table JMAP_STATISTICS_MONTHLY in admin REST API with invalid page number
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "CREATE", "elementPerPage": 1, "pageNumber": 0}
    Get Context Statistics in Monthly with Invalid Page Number    ${CRITERIA}
    
Get Context Create Statistics in Monthly with Invalid Element Page
    [Documentation]   Get a list of Contexts Creations in table JMAP_STATISTICS_MONTHLY in admin REST API with invalid element page
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "CREATE", "elementPerPage": 0, "pageNumber": 1}
    Get Context Statistics in Monthly with Invalid Element Page    ${CRITERIA}    
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get Context View Statistics in Yearly
    [Documentation]   Get a list of Contexts Views in table JMAP_STATISTICS_YEARLY in admin REST API
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "VIEW", "year": ${YEAR}}
    Get Statistics in Yearly    ${CRITERIA}
    
Get Context View Statistics in Yearly with Invalid Project Id
    [Documentation]   Get a list of Contexts Views in table JMAP_STATISTICS_YEARLY in admin REST API with invalid project id
    ${CRITERIA}=    Catenate    {"projectId": ${INVALID_PROJECT}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "VIEW", "year": ${YEAR}}
    Get Context Statistics in Yearly with Invalid Project Id    ${CRITERIA}
    
Get Context View Statistics in Yearly with Invalid Page Number
    [Documentation]   Get a list of Contexts Views in table JMAP_STATISTICS_YEARLY in admin REST API with invalid page number
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "VIEW", "elementPerPage": 1, "pageNumber": 0, "year": ${YEAR}}
    Get Context Statistics in Yearly with Invalid Page Number    ${CRITERIA}
    
Get Context View Statistics in Yearly with Invalid Element Page
    [Documentation]   Get a list of Contexts Views in table JMAP_STATISTICS_YEARLY in admin REST API with invalid element page
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "VIEW", "elementPerPage": 0, "pageNumber": 1, "year": ${YEAR}}
    Get Context Statistics in Yearly with Invalid Element Page    ${CRITERIA}    
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get Context Create Statistics in Yearly
    [Documentation]   Get a list of Contexts Creations in table JMAP_STATISTICS_YEARLY in admin REST API
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "CREATE", "year": ${YEAR}}
    Get Statistics in Yearly    ${CRITERIA}
    
Get Context Create Statistics in Yearly with Invalid Project Id
    [Documentation]   Get a list of Contexts Creations in table JMAP_STATISTICS_YEARLY in admin REST API with invalid project id
    ${CRITERIA}=    Catenate    {"projectId": ${INVALID_PROJECT}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "CREATE"}
    Get Context Statistics in Yearly with Invalid Project Id    ${CRITERIA}
    
Get Context Create Statistics in Yearly with Invalid Page Number
    [Documentation]   Get a list of Contexts Creations in table JMAP_STATISTICS_YEARLY in admin REST API with invalid page number
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "CREATE", "elementPerPage": 1, "pageNumber": 0}
    Get Context Statistics in Yearly with Invalid Page Number    ${CRITERIA}
    
Get Context Create Statistics in Yearly with Invalid Element Page
    [Documentation]   Get a list of Contexts Creations in table JMAP_STATISTICS_YEARLY in admin REST API with invalid element page
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "CREATE", "elementPerPage": 0, "pageNumber": 1}
    Get Context Statistics in Yearly with Invalid Element Page    ${CRITERIA}    
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get Project Counter Statistics in Monthly
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN"}
    Get Counter Statistics in Monthly    ${CRITERIA} 
    
Get Project Counter Statistics in Yearly
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN"}
    Get Counter Statistics in Yearly    ${CRITERIA}
    
Get Layer Counter Statistics in Monthly
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERID}, "targetType": "LAYER", "action": "VIEW"}
    Get Counter Statistics in Monthly    ${CRITERIA}

Get Layer Counter Statistics in Yearly
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERID}, "targetType": "LAYER", "action": "VIEW"}
    Get Counter Statistics in Yearly    ${CRITERIA}

Get Context View Counter Statistics in Monthly
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "VIEW"}
    Get Counter Statistics in Monthly    ${CRITERIA}
    
Get Context View Counter Statistics in Yearly
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "VIEW"}
    Get Counter Statistics in Yearly    ${CRITERIA}
    
Get Context Creation Counter Statistics in Monthly
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "CREATE"}
    Get Counter Statistics in Monthly    ${CRITERIA}
    
Get Context Creation Counter Statistics in Yearly
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${CONTEXTID}, "targetType": "CONTEXT", "action": "CREATE"}
    Get Counter Statistics in Yearly    ${CRITERIA}     
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Keywords ***

Aggregate Statistics    [Arguments]    ${ADMINSESSIONID}
    [Documentation]    Process aggregation of entities in current table into monthly and yearly tables
    
    ${RESULT}=    Post    /admin/rest/v1.0/statistics/aggregation    headers={"x-auth-token":"${ADMINSESSIONID}"} 
    
    ${VAL}    Set Variable    ${RESULT['body']}
    ${VAL}    Set Variable    ${VAL['result']}
    
    String    $.status    OK
    String    $.message   Aggregation successfully processed
    Boolean    $.result    ${VAL}
    [RETURN]    ${VAL}
    
Aggregate Statistics with Invalid Admin Session Id    [Arguments]    ${ADMINSESSIONID}
    [Documentation]    Process aggregation of entities in current table into monthly and yearly tables
    
    Post    /admin/rest/v1.0/statistics/aggregation    headers={"x-auth-token":"${ADMINSESSIONID}"} 
    
    String    $.status    Forbidden access denied
    String    $.message   Cannot access the resource, access forbidden     
    
Aggregate Statistics with Empty Admin Session Id    [Arguments]    ${ADMINSESSIONID}
    [Documentation]    Process aggregation of entities in current table into monthly and yearly tables
    
    Post    /admin/rest/v1.0/statistics/aggregation    headers={"x-auth-token":"${ADMINSESSIONID}"} 
    
    String    $.status    Unauthorized
    String    $.message   Can not authenticated the user, access denied 
    
Count Statistics in Current with Invalid Admin Session Id    [Arguments]    ${ADMINSESSIONID}    ${CRITERIA}
     [Documentation]   Get a counter of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}
    
    Post    /admin/rest/v1.0/statistics/current/count    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"} 
    
    String    $.status    Forbidden access denied
    String    $.message   Cannot access the resource, access forbidden 

Count Statistics in Current with Empty Admin Session Id    [Arguments]    ${ADMINSESSIONID}    ${CRITERIA}
     [Documentation]   Get a counter of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}
    
    Post    /admin/rest/v1.0/statistics/current/count    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"} 
    
    String    $.status    Unauthorized
    String    $.message   Can not authenticated the user, access denied

Count Statistics in Current    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    ${RESULT}=    Post    /admin/rest/v1.0/statistics/current/count    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
    
    ${VAL}    Set Variable    ${RESULT['body']}
    ${VAL}    Set Variable    ${VAL['result']}             
    
    String    $.status    OK
    String    $.message   The result is the count of statistics for the search
    Integer    $.result    ${VAL}
    [RETURN]    ${VAL}

Count Project Statistics in Current with Invalid Project Id    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/current/count    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   projectId \<\=\ -1

Count Project Statistics in Current with Invalid Page Number    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/current/count    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, page number \<\ 1   

Count Project Statistics in Current with Invalid Element Page    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/current/count    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, element per page \<\ 1

Count Statistics in Monthly    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z", "monthly": 0, "year": 0}  
    
    ${RESULT}=    Post    /admin/rest/v1.0/statistics/monthly/count    body=${CRITERIA}    headers={"x-auth-token":"${ADMINSESSIONID}"}
  
    ${VAL}    Set Variable    ${RESULT['body']}
    ${VAL}    Set Variable    ${VAL['result']}             
    
    String    $.status    OK
    String    $.message   The result is the count of statistics for the search
    Integer    $.result    ${VAL}
    [RETURN]    ${VAL}

Count Statistics in Monthly with Invalid Admin Session Id    [Arguments]    ${ADMINSESSIONID}    ${CRITERIA}
     [Documentation]   Get a counter of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}
    
    Post    /admin/rest/v1.0/statistics/monthly/count    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"} 
    
    String    $.status    Forbidden access denied
    String    $.message   Cannot access the resource, access forbidden 

Count Statistics in Monthly with Empty Admin Session Id    [Arguments]    ${ADMINSESSIONID}    ${CRITERIA}
     [Documentation]   Get a counter of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}
    
    Post    /admin/rest/v1.0/statistics/monthly/count    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"} 
    
    String    $.status    Unauthorized
    String    $.message   Can not authenticated the user, access denied

Count Project Statistics in Monthly with Invalid Project Id    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/monthly/count    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   projectId \<\=\ -1

Count Project Statistics in Monthly with Invalid Page Number    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/monthly/count    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, page number \<\ 1   

Count Project Statistics in Monthly with Invalid Element Page    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/monthly/count    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, element per page \<\ 1

Count Statistics in Yearly with Invalid Admin Session Id    [Arguments]    ${ADMINSESSIONID}    ${CRITERIA}
     [Documentation]   Get a counter of entities in table JMAP_STATISTICS_TEARLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}
    
    Post    /admin/rest/v1.0/statistics/yearly/count    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"} 
    
    String    $.status    Forbidden access denied
    String    $.message   Cannot access the resource, access forbidden 

Count Statistics in Yearly with Empty Admin Session Id    [Arguments]    ${ADMINSESSIONID}    ${CRITERIA}
     [Documentation]   Get a counter of entities in table JMAP_STATISTICS_YEARLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}
    
    Post    /admin/rest/v1.0/statistics/yearly/count    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"} 
    
    String    $.status    Unauthorized
    String    $.message   Can not authenticated the user, access denied

Count Statistics in Yearly    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_YEARLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z", "year": 0}  
    
    ${RESULT}=    Post    /admin/rest/v1.0/statistics/yearly/count    body=${CRITERIA}    headers={"x-auth-token":"${ADMINSESSIONID}"}
  
    ${VAL}    Set Variable    ${RESULT['body']}
    ${VAL}    Set Variable    ${VAL['result']}             
    
    String    $.status    OK
    String    $.message   The result is the count of statistics for the search
    Integer    $.result    ${VAL}
    [RETURN]    ${VAL}

Count Project Statistics in Yearly with Invalid Project Id    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_YEARLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/yearly/count    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   projectId \<\=\ -1

Count Project Statistics in Yearly with Invalid Page Number    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_YEARLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/yearly/count    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, page number \<\ 1   

Count Project Statistics in Yearly with Invalid Element Page    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_YEARLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/yearly/count    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, element per page \<\ 1   
    
Count Layer Statistics in Current with Invalid Project Id    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/current/count    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   projectId \<\=\ -1

Count Layer Statistics in Current with Invalid Page Number    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/current/count    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, page number \<\ 1   

Count Layer Statistics in Current with Invalid Element Page    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/current/count    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, element per page \<\ 1  

Count Layer Statistics in Monthly with Invalid Project Id    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_MONTHLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/monthly/count    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   projectId \<\=\ -1

Count Layer Statistics in Monthly with Invalid Page Number    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_MONTHLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/monthly/count    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, page number \<\ 1   

Count Layer Statistics in Monthly with Invalid Element Page    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_MONTHLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/monthly/count    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, element per page \<\ 1

Count Layer Statistics in Yearly with Invalid Project Id    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_YEARLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/yearly/count    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
    
       
    String    $.status    Internal Server Error
    String    $.message   projectId \<\=\ -1

Count Layer Statistics in Yearly with Invalid Page Number    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_YEARLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/yearly/count    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, page number \<\ 1   

Count Layer Statistics in Yearly with Invalid Element Page    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_YEARLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/yearly/count    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, element per page \<\ 1 
    
Count Context Statistics in Current with Invalid Project Id    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/current/count    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   projectId \<\=\ -1

Count Context Statistics in Current with Invalid Page Number    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/current/count    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, page number \<\ 1   

Count Context Statistics in Current with Invalid Element Page    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/current/count    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, element per page \<\ 1  

Count Context Statistics in Monthly with Invalid Project Id    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_MONTHLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/monthly/count    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   projectId \<\=\ -1

Count Context Statistics in Monthly with Invalid Page Number    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_MONTHLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/monthly/count    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, page number \<\ 1   

Count Context Statistics in Monthly with Invalid Element Page    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_MONTHLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/monthly/count    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, element per page \<\ 1 

Count Context Statistics in Yearly with Invalid Project Id    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_YEARLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/yearly/count    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   projectId \<\=\ -1

Count Context Statistics in Yearly with Invalid Page Number    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_YEARLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/yearly/count    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, page number \<\ 1   

Count Context Statistics in Yearly with Invalid Element Page    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a counter of entities in table JMAP_STATISTICS_YEARLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/yearly/count    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, element per page \<\ 1 
    
Get Statistics in Current with Invalid Admin Session Id    [Arguments]    ${ADMINSESSIONID}    ${CRITERIA}
     [Documentation]   Get a list of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}
    
    Post    /admin/rest/v1.0/statistics/current/filter    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"} 
    
    String    $.status    Forbidden access denied
    String    $.message   Cannot access the resource, access forbidden 

Get Statistics in Current with Empty Admin Session Id    [Arguments]    ${ADMINSESSIONID}    ${CRITERIA}
     [Documentation]   Get a list of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}
    
    Post    /admin/rest/v1.0/statistics/current/filter   body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"} 
    
    String    $.status    Unauthorized
    String    $.message   Can not authenticated the user, access denied  
    
Get Project Statistics in Current with Invalid Project Id    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/current/filter    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   projectId \<\=\ -1

Get Project Statistics in Current with Invalid Page Number    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/current/filter    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, page number \<\ 1   

Get Project Statistics in Current with Invalid Element Page    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/current/filter    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, element per page \<\ 1
    
Get Statistics in Monthly with Invalid Admin Session Id    [Arguments]    ${ADMINSESSIONID}    ${CRITERIA}
     [Documentation]   Get a list of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}
    
    Post    /admin/rest/v1.0/statistics/monthly/filter    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"} 
    
    String    $.status    Forbidden access denied
    String    $.message   Cannot access the resource, access forbidden 

Get Statistics in Monthly with Empty Admin Session Id    [Arguments]    ${ADMINSESSIONID}    ${CRITERIA}
     [Documentation]   Get a list of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}
    
    Post    /admin/rest/v1.0/statistics/monthly/filter    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"} 
    
    String    $.status    Unauthorized
    String    $.message   Can not authenticated the user, access denied

Get Project Statistics in Monthly with Invalid Project Id    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/monthly/filter    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   projectId \<\=\ -1

Get Project Statistics in Monthly with Invalid Page Number    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/monthly/filter    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, page number \<\ 1   

Get Project Statistics in Monthly with Invalid Element Page    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/monthly/filter    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, element per page \<\ 1
    
Get Statistics in Yearly with Invalid Admin Session Id    [Arguments]    ${ADMINSESSIONID}    ${CRITERIA}
     [Documentation]   Get a list of entities in table JMAP_STATISTICS_TEARLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}
    
    Post    /admin/rest/v1.0/statistics/yearly/filter    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"} 
    
    String    $.status    Forbidden access denied
    String    $.message   Cannot access the resource, access forbidden 

Get Statistics in Yearly with Empty Admin Session Id    [Arguments]    ${ADMINSESSIONID}    ${CRITERIA}
     [Documentation]   Get a list of entities in table JMAP_STATISTICS_YEARLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}
    
    Post    /admin/rest/v1.0/statistics/yearly/filter    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"} 
    
    String    $.status    Unauthorized
    String    $.message   Can not authenticated the user, access denied 
    
Get Project Statistics in Yearly with Invalid Project Id    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_YEARLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/yearly/filter    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   projectId \<\=\ -1

Get Project Statistics in Yearly with Invalid Page Number    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_YEARLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/yearly/filter   body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, page number \<\ 1   

Get Project Statistics in Yearly with Invalid Element Page    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_YEARLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/yearly/filter    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
          
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, element per page \<\ 1   
    
Get Layer Statistics in Current with Invalid Project Id    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/current/filter    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   projectId \<\=\ -1

Get Layer Statistics in Current with Invalid Page Number    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/current/filter    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, page number \<\ 1   

Get Layer Statistics in Current with Invalid Element Page    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/current/filter    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, element per page \<\ 1  

Get Layer Statistics in Monthly with Invalid Project Id    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_MONTHLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/monthly/filter    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   projectId \<\=\ -1

Get Layer Statistics in Monthly with Invalid Page Number    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_MONTHLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/monthly/filter    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, page number \<\ 1   

Get Layer Statistics in Monthly with Invalid Element Page    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_MONTHLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/monthly/filter    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, element per page \<\ 1

Get Layer Statistics in Yearly with Invalid Project Id    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_YEARLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/yearly/filter    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   projectId \<\=\ -1

Get Layer Statistics in Yearly with Invalid Page Number    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_YEARLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/yearly/filter    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, page number \<\ 1   

Get Layer Statistics in Yearly with Invalid Element Page    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_YEARLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/yearly/filter    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, element per page \<\ 1 
    
Get Context Statistics in Current with Invalid Project Id    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/current/filter    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   projectId \<\=\ -1

Get Context Statistics in Current with Invalid Page Number    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/current/filter    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, page number \<\ 1   

Get Context Statistics in Current with Invalid Element Page    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/current/filter    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, element per page \<\ 1  

Get Context Statistics in Monthly with Invalid Project Id    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_MONTHLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/monthly/filter    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   projectId \<\=\ -1

Get Context Statistics in Monthly with Invalid Page Number    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_MONTHLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/monthly/filter    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, page number \<\ 1   

Get Context Statistics in Monthly with Invalid Element Page    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_MONTHLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/monthly/filter    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, element per page \<\ 1 

Get Context Statistics in Yearly with Invalid Project Id    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_YEARLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/yearly/filter    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   projectId \<\=\ -1

Get Context Statistics in Yearly with Invalid Page Number    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_YEARLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/yearly/filter    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, page number \<\ 1   

Get Context Statistics in Yearly with Invalid Element Page    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_YEARLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    Post    /admin/rest/v1.0/statistics/yearly/filter    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
           
    String    $.status    Internal Server Error
    String    $.message   problem with pagination, element per page \<\ 1 
    
Get Statistics in Current    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_CURRENT in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z"}  
    
    ${RESULT}=    Post    /admin/rest/v1.0/statistics/current/filter    body=${CRITERIA}    allow_redirects=true    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"}   
    
    ${VAL}    Set Variable    ${RESULT['body']}
    ${VAL}    Set Variable    ${VAL['result']}             
    ${CONTER}=    Count Statistics in Current    ${CRITERIA}    
       
    String    $.status    OK
    String    $.message   ${CONTER} current statistics found for the search
    
    [RETURN]    ${VAL}
    
Get Statistics in Monthly    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_MONTHLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z", "monthly": 0, "year": 0}  
    
    ${RESULT}=    Post    /admin/rest/v1.0/statistics/monthly/filter    body=${CRITERIA}    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"} 
  
    ${VAL}    Set Variable    ${RESULT['body']}
    ${VAL}    Set Variable    ${VAL['result']}             
    ${CONTER}=    Count Statistics in Monthly    ${CRITERIA}    
        
    String    $.status    OK
    String    $.message    ${CONTER} monthly statistics found for the search
    
    [RETURN]    ${VAL} 
    
Get Statistics in Yearly    [Arguments]    ${CRITERIA} 
    [Documentation]   Get a list of entities in table JMAP_STATISTICS_YEARLY in admin REST API
    ...   @param ${CRITERIA}: A search criteria with the following format
    ...   @values: {"userId": "string", "projectId": 0, "targetId": 0, "targetType": "PROJECT(0), LAYER(1), CONTEXT(2)", "action": "OPEN(0), VIEW(1), CREATE(2)", "elementPerPage": 0, "pageNumber": 0, "dateTimeGreaterOrEqualsTo": "2019-04-09T16:13:24.892Z",  "dateTimeLowerOrEqualsTo": "2019-04-09T16:13:24.892Z", "year": 0}  
    
    ${RESULT}=    Post    /admin/rest/v1.0/statistics/yearly/filter    body=${CRITERIA}    headers={"x-auth-token":"${ADMINSESSIONID}", "Content-Type":"application/json"} 
  
    ${VAL}    Set Variable    ${RESULT['body']}
    ${VAL}    Set Variable    ${VAL['result']}             
    ${CONTER}=    Count Statistics in Yearly    ${CRITERIA}      
    
    String    $.status    OK
    String    $.message   ${CONTER} yearly statistics found for the search
    
    [RETURN]    ${VAL}
    
