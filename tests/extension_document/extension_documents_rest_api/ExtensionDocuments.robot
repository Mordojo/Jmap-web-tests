*** Settings ***

Documentation    Tests for extention documents REST API in JMap 7
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------
Library    REST    http://192.168.0.59:8080    #RESTinstance 1.0.0rc4 Robot Framework test library for (RESTful) JSON APIs
Library    OperatingSystem
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------
Resource    ../../../common/rest_api/CommonRestApi.robot
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------
Suite Setup    Open Session    ${USERNAME}    ${PASSWORD}    ${TYPE}    #Open a session before the suite
Suite Teardown    Close session    ${SESSIONID}    #Close the session after the suite
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Variable ***

${HYPERLINK_URL}    https://translate.google.com
${INVALID_DOCUMENT}    50    # Invalid document id
${INVALID_DEPOSIT}    58    # Invalid deposit id
${INVALID_FORM}    15    # Invalid form id
${INVALID_PROJECT}    500
${INVALID_LAYER}    800
${USERNAME}    administrator
${PASSWORD}    ${EMPTY}
${TYPE}    DESKTOP    #The session type must be DESKTOP, WEB or MOBILE.
${PROJECTID}    0    
${LAYERID}    4    
${ELEMENTSID}    [ 86, 250, 12 ]
${EMPTY_SELECTION}    []
${ELEMENTID}    12
${DEPOSITID}    1    
${DEPOSIT_EMPTY}    3    
${DEPOSIT_HYPERLINK}    2    
${FORMID}    0    #Search by Location or 
${DOCUMENTID}    4    # Light document for download purposes. A simple text document
${HYPERLINKID}    4
${INVALID_SESSION}    174282409    #{"message": "Invalid session id.", "status": "Unauthorized"}
${EMPTY_SESSION}    ${EMPTY}    #{"message": "Invalid session id.", "status": "Unauthorized"}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Test Cases ***

Get all deposits
    [Documentation]    Get all available deposits (non hyperlink depot) for a given session id
    Get all deposits
    
Get all deposits using an invalid session id
    [Documentation]    Trying to get all desposits using an invalid session id
    ...    The REST API should return an "Unauthorized" message
    Get all deposits using an invalid or empty session id    ${INVALID_SESSION}
    
Get all deposits using an empty session id
    [Documentation]    Trying to get all desposits using an empty session id
    ...    The REST API should return an "Unauthorized" message
    Get all deposits using an invalid or empty session id    ${EMPTY_SESSION}

Get all deposits for a user without permissions
    [Documentation]    Trying to get all deposits with a user without permission should return an empty deposits list
    Get all deposits for a user without permissions    ${True}        
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

Download document by deposit
    [Documentation]    Downlaod a document file for the given document's id and deposit's id
    Download document by deposit    ${DOCUMENTID}    ${DEPOSITID}
    
Download document by deposit with empty session id
    [Documentation]    Downlaod a document file for the given document's id and deposit's id with an empty session id
    Download document by deposit using an invalid or empty session id    ${DOCUMENTID}    ${DEPOSITID}    ${EMPTY_SESSION}    ${True}
    
Download document by deposit with invalid session id
    [Documentation]    Downlaod a document file for the given document's id and deposit's id with an invalid session id
    Download document by deposit using an invalid or empty session id    ${DOCUMENTID}    ${DEPOSITID}    ${INVALID_SESSION}    ${True}
        
Download document by deposit with invalid deposit id
    [Documentation]    Downlaod a document file for the given document's id and deposit's id with an invalid deposit id
    Download document by deposit with invalid deposit    ${DOCUMENTID}    ${INVALID_DEPOSIT}    ${True}
    
Download document by deposit with invalid document id
    [Documentation]    Downlaod a document file for the given document's id and deposit's id with an invalid document id
    Download document by deposit with invalid document    ${INVALID_DOCUMENT}    ${DEPOSITID}    ${True}

Download document by deposit with a user without permissions
    [Documentation]    Try to download a download document by deposit with a user without permissions (anonymous)
    Download document by deposit with a user without permissions    ${True}
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get all forms by depositId
    [Documentation]    Return all configured forms on a deposit
    Get all forms by depositId    ${DEPOSITID}    ${True}

Get all forms with invalid deposit id
    Get all forms with invalid deposit id    ${INVALID_DEPOSIT}    ${True}
    
Get all forms with invalid session id
    Get all forms with invalid or empty session id    ${DEPOSITID}    ${INVALID_SESSION}    ${True}
    
Get all forms with empty session id
    Get all forms with invalid or empty session id    ${DEPOSITID}    ${EMPTY_SESSION}    ${True}
    
Get all forms for a deposit without form
    Get all forms for a deposit without form    ${DEPOSIT_EMPTY}    ${True}

Get all forms for Hyperlink deposit
    Get all forms for Hyperlink deposit    ${DEPOSIT_HYPERLINK}    ${True}

Get all forms by depositId with a user without permissions
    Get all forms by depositId with a user without permissions    ${True}
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
Get search form by id
    [Documentation]    Retrun the form configuration for the given deposit's id and form's id
    Get form by deposit id and form id    ${True}
    
Get search form with invalid deposit id
    Get form by form id with invalid deposit id    ${INVALID_DEPOSIT}    ${FORMID}    ${True}
    
Get search form with invalid form id
    Get form by deposit id with invalid form id    ${DEPOSITID}    ${INVALID_FORM}    ${True}
    
Get search form with invalid session id
    Get form by deposit id and form id with invalid or empty session id    ${DEPOSITID}    ${FORMID}    ${INVALID_SESSION}    ${True}
    
Get search form with empty session id
    Get form by deposit id and form id with invalid or empty session id    ${DEPOSITID}    ${FORMID}    ${EMPTY_SESSION}    ${True}
    
Get search form for hyperlink depot
    Get form by deposit id and form id on hyperlink deposit    ${DEPOSIT_HYPERLINK}    ${FORMID}    ${True}

Get search form by id with a user without permissions
    Get form by deposit id and form id with a user without permissions    ${True}
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------  

Delete Hyperlink with invalid session id
    Delete Hyperlink with invalid or empty session id    ${HYPERLINKID}    ${INVALID_SESSION}    ${True}
    
Delete Hyperlink with empty session id
    Delete Hyperlink with invalid or empty session id    ${HYPERLINKID}    ${EMPTY_SESSION}    ${True}

Delete Hyperlink
    Delete Hyperlink    ${HYPERLINKID}    ${True}

Delete Hyperlink with invalid id
    Delete Hyperlink with invalid id    ${HYPERLINKID}    ${True}

Delete Hyperlink with a user without permissions
    Delete Hyperlink with a user without permissions    ${HYPERLINKID}    ${True}
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get RichPreview Informations for selected element
    Get RichPreview Informations for selected element    ${HYPERLINK_URL}    ${True}

Get RichPreview Informations for selected element with invalid session id
    Get RichPreview Informations for selected element with invalid or empty session id    ${HYPERLINK_URL}    ${INVALID_SESSION}    ${True}

Get RichPreview Informations for selected element with empty session id
    Get RichPreview Informations for selected element with invalid or empty session id    ${HYPERLINK_URL}    ${EMPTY_SESSION}    ${True}
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get a filtered list of a deposit's documents
    [Documentation]    Perform a quick search using the project id, the deposit id and a search creteria as json parameter
    ...    The response is a json with three properties. MESSAGE = $.message, STATUS = $.status and  RESULT = $.result
    ${CRITERIA}=    Catenate    {"searchCriteria":[{"attName":"TITLE","value":"LOTUS","type":"CONTAINS","operatorValue":null}],"isAssociated":true}
    Advanced Search    ${CRITERIA}    DEFAULT    ${True}

Get a filtered list of a deposit's documents only in current extent
    [Documentation]    Perform a quick search using the project id, the deposit id and a search creteria as json parameter
    ...    The response is a json with three properties. MESSAGE = $.message, STATUS = $.status and  RESULT = $.result
    ${CRITERIA}=    Catenate    {"searchCriteria":[],"searchRegion":{"coordX":5.334625605078827,"coordY":-97.8215449293079,"width":272.4609375,"height":162.59765625}}
    Advanced Search    ${CRITERIA}    EXTENT    ${True}

Get a filtered list of a deposit's documents only in current selection
    [Documentation]    Perform a quick search using the project id, the deposit id and a search creteria as json parameter
    ...    The response is a json with three properties. MESSAGE = $.message, STATUS = $.status and  RESULT = $.result
    ${CRITERIA}=    Catenate    {"searchCriteria":[],"elementIdsByLayerId":{"4":[86]}}
    Advanced Search    ${CRITERIA}    SELECTION    ${True}
    
Get a filtered list of a deposit's documents in current extent and current selection
    [Documentation]    Perform a quick search using the project id, the deposit id and a search creteria as json parameter
    ...    The response is a json with three properties. MESSAGE = $.message, STATUS = $.status and  RESULT = $.result
    ${CRITERIA}=    Catenate    {"searchCriteria":[],"searchRegion":{"coordX":12.617926377162632,"coordY":-80.73285154596078,"width":272.4609375,"height":162.59765625},"elementIdsByLayerId":{"4":[86,12]}}
    Advanced Search    ${CRITERIA}    BOTH    ${True}
    
Get a filtered list of a deposit's documents with empty criteria's value
    [Documentation]    Perform a quick search using the project id, the deposit id and an empty search creteria as json parameter
    ${CRITERIA}=    Catenate    {"searchCriteria":[{"attName":"TITLE","value":"${EMPTY}","type":"CONTAINS","operatorValue":null}],"isAssociated":true}
    Advanced Search with empty criteria's value    ${CRITERIA}    ${True}

Get a filtered list of a deposit's documents with invalid session id
    ${CRITERIA}=    Catenate    {"searchCriteria":[{"attName":"TITLE","value":"LOTUS","type":"CONTAINS","operatorValue":null}],"isAssociated":true}
    Advanced Search with invalid or empty session id    ${CRITERIA}    ${INVALID_SESSION}    ${True}
    
Get a filtered list of a deposit's documents with empty session id
    ${CRITERIA}=    Catenate    {"searchCriteria":[{"attName":"TITLE","value":"LOTUS","type":"CONTAINS","operatorValue":null}],"isAssociated":true}
    Advanced Search with invalid or empty session id    ${CRITERIA}    ${EMPTY_SESSION}    ${True}
    
Get a filtered list of a deposit's documents with invalid project id
    ${CRITERIA}=    Catenate    {"searchCriteria":[{"attName":"TITLE","value":"LOTUS","type":"CONTAINS","operatorValue":null}],"isAssociated":true}
    Advanced Search with invalid project id    ${INVALID_PROJECT}    ${CRITERIA}    ${True}
    
Get a filtered list of a deposit's documents with invalid deposit id
    ${CRITERIA}=    Catenate    {"searchCriteria":[{"attName":"TITLE","value":"LOTUS","type":"CONTAINS","operatorValue":null}],"isAssociated":true}
    Advanced Search with invalid deposit id    ${INVALID_DEPOSIT}    ${CRITERIA}    ${True}
    
Get a filtered list of a deposit's documents with a user without permissions
    ${CRITERIA}=    Catenate    {"searchCriteria":[{"attName":"TITLE","value":"LOTUS","type":"CONTAINS","operatorValue":null}],"isAssociated":true}
    Advanced Search with a user without permissions    ${CRITERIA}    ${True}
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get documents and hyperlinks for multiple JMap elements
    [Documentation]    Return all documents that belong to the spatial elements selection
    Get documents and hyperlinks for multiple JMap elements    ${True}

Get documents and hyperlinks for multiple JMap elements with invalid project id
    Get documents and hyperlinks for multiple JMap elements with invalid project id    ${INVALID_PROJECT}    ${True}
    
Get documents and hyperlinks for multiple JMap elements with invalid layer id
    Get documents and hyperlinks for multiple JMap elements with invalid layer id    ${INVALID_LAYER}    ${True}
    
Get documents and hyperlinks for multiple JMap elements with invalid session id
    Get documents and hyperlinks for multiple JMap elements with invalid or empty session id    ${INVALID_SESSION}    ${True}
    
Get documents and hyperlinks for multiple JMap elements with empty session id
    Get documents and hyperlinks for multiple JMap elements with invalid or empty session id    ${EMPTY_SESSION}    ${True}
    
Get documents and hyperlinks for multiple JMap elements with empty selection
    Get documents and hyperlinks for multiple JMap elements with empty selection    ${True}

Get documents and hyperlinks for multiple JMap elements with a user without permissions
    Get documents and hyperlinks for multiple JMap elements with a user without permissions    ${True}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get a filtered list of all deposit's documents
    [Documentation]    Perform a quick search using the project id and a search criteria as json parameter
    ${CRITERIA}=    Catenate    {"searchCriteria":[{"attName":"GENERIC_TEXT","value":"LOTUS","type":"CONTAINS","operatorValue":null}],"isAssociated":true}
    Quick Search    ${CRITERIA}    DEFAULT    ${True}

Get a filtered list of all deposit's documents only in current extent
    [Documentation]    Perform a quick search using the project id and a search creteria as json parameter
    ${CRITERIA}=    Catenate    {"searchCriteria":[{"attName":"GENERIC_TEXT","value":"RLS client ID","type":"CONTAINS","operatorValue":null}],"searchRegion":{"coordX":5.334625605078827,"coordY":-97.8215449293079,"width":272.4609375,"height":162.59765625}}
    Quick Search    ${CRITERIA}    EXTENT    ${True}
    
Get a filtered list of all deposit's documents only in current selection
    [Documentation]    Perform a quick search using the project id and a search creteria as json parameter
    ${CRITERIA}=    Catenate    {"searchCriteria":[{"attName":"GENERIC_TEXT","value":"LOTUS","type":"CONTAINS","operatorValue":null}],"elementIdsByLayerId":{"4":[86]}}
    Quick Search    ${CRITERIA}    SELECTION    ${True}

Get a filtered list of all deposit's documents in current extent and current selection
    [Documentation]    Perform a quick search using the project id and a search creteria as json parameter
    ${CRITERIA}=    Catenate    {"searchCriteria":[{"attName":"GENERIC_TEXT","value":"RLS client ID","type":"CONTAINS","operatorValue":null}],"searchRegion":{"coordX":12.617926377162632,"coordY":-80.73285154596078,"width":272.4609375,"height":162.59765625},"elementIdsByLayerId":{"4":[86,12]}}
    Quick Search    ${CRITERIA}    BOTH    ${True}

Get a filtered list of all deposit's documents with empty criteria's value
    [Documentation]    Perform a quick search using the project id and a search criteria with empty value as json parameter
    ${CRITERIA}=    Catenate    {"searchCriteria":[{"attName":"GENERIC_TEXT","value":"${EMPTY}","type":"CONTAINS","operatorValue":null}],"isAssociated":true}
    Quick Search with empty criteria's value    ${CRITERIA}    ${True}    

Get a filtered list of all deposit's documents with invalid session id
    ${CRITERIA}=    Catenate    {"searchCriteria":[{"attName":"GENERIC_TEXT","value":"LOTUS","type":"CONTAINS","operatorValue":null}],"isAssociated":true}
    Quick Search with invalid or empty session id    ${CRITERIA}    ${INVALID_SESSION}    ${True}
    
Get a filtered list of all deposit's documents with empty session id
    ${CRITERIA}=    Catenate    {"searchCriteria":[{"attName":"GENERIC_TEXT","value":"LOTUS","type":"CONTAINS","operatorValue":null}],"isAssociated":true}
    Quick Search with invalid or empty session id    ${CRITERIA}    ${EMPTY_SESSION}    ${True}
    
Get a filtered list of all deposit's documents with invalid project id
    ${CRITERIA}=    Catenate    {"searchCriteria":[{"attName":"GENERIC_TEXT","value":"LOTUS","type":"CONTAINS","operatorValue":null}],"isAssociated":true}
    Quick Search with invalid project id    ${INVALID_PROJECT}    ${CRITERIA}    ${True}

Get a filtered list of all deposit's documents with a user without permissions
    ${CRITERIA}=    Catenate    {"searchCriteria":[{"attName":"GENERIC_TEXT","value":"LOTUS","type":"CONTAINS","operatorValue":null}],"isAssociated":true}
    Quick search with a user without permissions    ${CRITERIA}    ${True}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
Get Hyperlinks from multiple selection
    [Documentation]    Return all hyperlinks that belong to the spatial elements selection
    Get Hyperlinks from multiple selection    ${True}

Get Hyperlinks from multiple selection with invalid project id
    Get Hyperlinks from multiple selection with invalid project id    ${INVALID_PROJECT}    ${True}

Get Hyperlinks from multiple selection with invalid session id
    Get Hyperlinks from multiple selection with invalid or empty session id    ${INVALID_SESSION}    ${True}
    
Get Hyperlinks from multiple selection with empty session id
    Get Hyperlinks from multiple selection with invalid or empty session id    ${EMPTY_SESSION}    ${True}

Get Hyperlinks from multiple selection with invalid layer id
    Get Hyperlinks from multiple selection with invalid layer id    ${INVALID_LAYER}    ${True}

Get Hyperlinks from multiple selection with a user without permissions
    Get Hyperlinks from multiple selection with a user without permissions    ${True}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get documents and hyperlinks descriptors for a JMap element
    [Documentation]    Return the document's descrptions for the selected spatial element
    Get documents and hyperlinks descriptors for a JMap element    ${True}

Get documents and hyperlinks descriptors for a JMap element with invalid project id
    Get documents and hyperlinks descriptors for a JMap element with invalid project id    ${INVALID_PROJECT}    ${True}
    
Get documents and hyperlinks descriptors for a JMap element with invalid layer id
    Get documents and hyperlinks descriptors for a JMap element with invalid layer id    ${INVALID_LAYER}    ${True}
    
Get documents and hyperlinks descriptors for a JMap element with invalid session id
    Get documents and hyperlinks descriptors for a JMap element with invalid or empty session id    ${INVALID_SESSION}    ${True}
    
Get documents and hyperlinks descriptors for a JMap element with empty session id
    Get documents and hyperlinks descriptors for a JMap element with invalid or empty session id    ${EMPTY_SESSION}    ${True}

Get documents and hyperlinks descriptors for a JMap element with a user without permissions
    Get documents and hyperlinks descriptors for a JMap element with a user without permissions    ${True}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Downlaod document by element
    [Documentation]    Downlaod a document file for the given document's id, element's id, layer's id and project's id
    Download Document by element    ${DOCUMENTID}    ${ELEMENTID}    ${LAYERID}    ${PROJECTID}    ${SESSIONID}

Downlaod document by element with invalid project id
    Downlaod document by element with invalid project id    ${DOCUMENTID}    ${ELEMENTID}    ${LAYERID}    ${INVALID_PROJECT}    ${SESSIONID}    ${True}
    
Downlaod document by element with invalid layer id
    Downlaod document by element with invalid layer id    ${DOCUMENTID}    ${ELEMENTID}    ${INVALID_LAYER}    ${PROJECTID}    ${SESSIONID}    ${True}
    
Downlaod document by element with invalid document id
    Downlaod document by element with invalid document id    ${INVALID_DOCUMENT}    ${ELEMENTID}    ${LAYERID}    ${PROJECTID}    ${SESSIONID}    ${True}
    
Downlaod document by element with invalid session id
    Downlaod document by element with invalid or empty session id    ${INVALID_SESSION}    ${True}
    
Downlaod document by element with empty session id
    Downlaod document by element with invalid or empty session id    ${EMPTY_SESSION}    ${True}

Downlaod document by element with a user without permissions
    Downlaod document by element with a user without permissions    ${True}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get Hyperlinks for selected element
    [Documentation]    Return all hyperlinks that belong to a selected element
    Get Hyperlinks for selected element    ${True}
    
Get Hyperlinks for selected element with invalid project id
    Get Hyperlinks for selected element with invalid project id    ${INVALID_PROJECT}    ${True}
    
Get Hyperlinks for selected element with invalid layer id
    Get Hyperlinks for selected element with invalid layer id    ${INVALID_LAYER}    ${True}
    
Get Hyperlinks for selected element with invalid session id
    Get Hyperlinks for selected element with invalid or empty session id    ${INVALID_SESSION}    ${True}
    
Get Hyperlinks for selected element with empty session id
    Get Hyperlinks for selected element with invalid or empty session id    ${EMPTY_SESSION}    ${True}

Get Hyperlinks for selected element with a user without permissions
    Get Hyperlinks for selected element with a user without permissions    ${True}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   
*** Keywords ***

Get all deposits
    [Documentation]    Test case to get the list of all available deposits without include the Hyperlikns special depot
    Get    /services/rest/v2.0/extensions/documents/deposits?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'OK'
    Output Schema    $.status
    Output    Server message response should be 'The result is a deposits list'
    Output Schema    $.message
    #    Assertions
    String    $.status    OK
    String    $.message    The result is a deposits list
    Integer   $.result[0].id    1
    String    $.result[0].name    JFS
    Output    Server entire response:
    Output Schema    $.result
    
Get all deposits using an invalid or empty session id    [Arguments]    ${SESSION}
    [Documentation]    Keyword to test invalid or empty session id
    Get    /services/rest/v2.0/extensions/documents/deposits?sessionId=${SESSION}    timeout=10
    #    Logs
    Output    Server status response must be 'Unauthorized'
    Output Schema    $.status
    Output    Server message response must be 'Invalid session id.'
    Output Schema    $.message
    #    Assertions
    String    $.status     Unauthorized
    String    $.message    Invalid session id.

Get all deposits for a user without permissions    [Arguments]    ${OUTPUT}
    Close session    ${SESSIONID}
    Open Session    anonymous    ${PASSWORD}    ${TYPE}    
    Get    /services/rest/v2.0/extensions/documents/deposits?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Bad Request'
    Output Schema    $.status
    Output    Server message response should be 'The user does not have permission to perform this action'
    Output Schema    $.message
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The user does not have permission to perform this action
    
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output Schema    $
    
    Close session    ${SESSIONID}
    Open Session    ${USERNAME}    ${PASSWORD}    ${TYPE}
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------     
    
Quick Search    [Arguments]    ${CRITERIA}    ${TYPE}    ${OUTPUT}
    [Documentation]    Common test case to perform a quick search over a project
    ...    @param ${CRITERIA}: A search criteria with the following format
    ...    @values: {"searchCriteria":[{"attName":"GENERIC_TEXT","value":"SOME VALUE","type":"CONTAINS","operatorValue":null}],"isAssociated":true}
    ...    @param ${TYPE}: The type of the search
    ...    @values: DEFAULT, EXTENT, SELECTION, BOTH
    Post    /services/rest/v2.0/extensions/documents/projects/${PROJECTID}/documents/filter?sessionId=${SESSIONID}    body=${CRITERIA}    timeout=10    headers={"Content-Type":"application/json"}
    #    Logs
    Output    Server status response must be 'OK'
    Output Schema    $.status
    Output    Server message response must be 'The result is the document descriptor list for all deposits'
    Output Schema    $.message    
    #    Assertions
    String    $.status    OK    #Asserts that the response status was OK
    String    $.message    The result is the document descriptor list for all deposits
    
    Run Keyword If    '${TYPE}'=='DEFAULT'    String    $.result[0].fileName    LOTUS-ILMFS60_61.PDF
    Run Keyword If    '${TYPE}'=='DEFAULT'    String    $.result[0].documentAssociations[0].elementIds[0]    Greenland
    
    Run Keyword If    '${TYPE}'=='EXTENT'    String    $.result[0].fileName    RLS client ID.txt
    Run Keyword If    '${TYPE}'=='EXTENT'    String    $.result[0].documentAssociations[0].elementIds[0]    Australia
    
    Run Keyword If    '${TYPE}'=='SELECTION'    String    $.result[0].fileName    LOTUS-ILMFS60_61.PDF
    Run Keyword If    '${TYPE}'=='SELECTION'    String    $.result[0].documentAssociations[0].elementIds[0]    Greenland
    
    Run Keyword If    '${TYPE}'=='BOTH'    String    $.result[0].fileName    RLS client ID.txt
    Run Keyword If    '${TYPE}'=='EXTENT'    String    $.result[0].documentAssociations[0].elementIds[0]    Australia
    
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output Schema    $.result

Quick Search with empty criteria's value    [Arguments]    ${CRITERIA}    ${OUTPUT}
    [Documentation]    Perform a quick search with emtpy value search criteria
    ...    @param ${CRITERIA}: A search criteria with the following format
    ...    @values: {"searchCriteria":[{"attName":"GENERIC_TEXT","value":"${EMPTY}","type":"CONTAINS","operatorValue":null}],"isAssociated":true}
    ...    @param ${OUTPUT}: if true the response of the sever will be logged into the console
    ...    @values: True, False
    Post    /services/rest/v2.0/extensions/documents/projects/${PROJECTID}/documents/filter?sessionId=${SESSIONID}    body=${CRITERIA}    timeout=10    headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'Bad Request'
    Output Schema    $.status
    Output    Server message response must be 'Missing search criteria value'
    Output Schema    $.message    
    #    Assertions
    String    $.status    Bad Request
    String    $.message   Missing search criteria value
    
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output        

Quick Search with invalid or empty session id    [Arguments]    ${CRITERIA}    ${SESSION}    ${OUTPUT}
    Post    /services/rest/v2.0/extensions/documents/projects/${PROJECTID}/documents/filter?sessionId=${SESSION}    body=${CRITERIA}    timeout=10    headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'Unauthorized'
    Output Schema    $.status
    Output    Server message response must be 'Invalid session id.'
    Output Schema    $.message
    #    Assertions
    String    $.status    Unauthorized
    String    $.message   Invalid session id.

    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output

Quick Search with invalid project id    [Arguments]    ${PROJECT}    ${CRITERIA}    ${OUTPUT}
    Post    /services/rest/v2.0/extensions/documents/projects/${PROJECT}/documents/filter?sessionId=${SESSIONID}    body=${CRITERIA}    timeout=10    headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'Not Found'
    Output Schema    $.status
    Output    Server message response must be 'The project does not exist'
    Output Schema    $.message
    #    Assertions
    String    $.status    Not Found
    String    $.message   The project does not exist
        
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output    

Quick search with a user without permissions    [Arguments]    ${CRITERIA}    ${OUTPUT}
    Close session    ${SESSIONID}
    Open Session    anonymous    ${PASSWORD}    ${TYPE}
    
    Post    /services/rest/v2.0/extensions/documents/projects/${PROJECTID}/documents/filter?sessionId=${SESSIONID}    body=${CRITERIA}    timeout=10    headers={"Content-Type":"application/json"}
    #    Logs
    Output    Server status response must be 'Bad Request'
    Output Schema    $.status
    Output    Server message response should be 'The user does not have permission to perform this action'
    Output Schema    $.message
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The user does not have permission to perform this action
    
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output
    
    Close session    ${SESSIONID}
    Open Session    ${USERNAME}    ${PASSWORD}    ${TYPE}
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   
        
Advanced Search    [Arguments]    ${CRITERIA}    ${TYPE}    ${OUTPUT}
    [Documentation]    Use the criteria to perform custom search and write custom test cases
    Post    /services/rest/v2.0/extensions/documents/projects/${PROJECTID}/deposits/${DEPOSITID}/documents/filter?sessionId=${SESSIONID}    body=${CRITERIA}    timeout=10    headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'OK'
    Output Schema    $.status
    Output    Server message response must be 'The result is the document descriptor list for a deposit'
    Output Schema    $.message    
    #    Assertions
    String    $.status    OK
    String    $.message   The result is the document descriptor list for a deposit
    
    Run Keyword If    '${TYPE}'=='DEFAULT'    String    $.result[0].fileName    LOTUS-ILMFS60_61.PDF
    Run Keyword If    '${TYPE}'=='DEFAULT'    String    $.result[0].documentAssociations[0].elementIds[0]    Greenland
    
    Run Keyword If    '${TYPE}'=='EXTENT'    String    $.result[0].fileName    RLS client ID.txt
    Run Keyword If    '${TYPE}'=='EXTENT'    String    $.result[0].documentAssociations[0].elementIds[0]    Australia
    
    Run Keyword If    '${TYPE}'=='SELECTION'    String    $.result[0].fileName    LOTUS-ILMFS60_61.PDF
    Run Keyword If    '${TYPE}'=='SELECTION'    String    $.result[0].documentAssociations[0].elementIds[0]    Greenland
    
    Run Keyword If    '${TYPE}'=='BOTH'    String    $.result[0].fileName    RLS client ID.txt
    Run Keyword If    '${TYPE}'=='BOTH'    String    $.result[0].documentAssociations[0].elementIds[0]    Australia
    
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output Schema    $.result       
    
Advanced Search with empty criteria's value    [Arguments]    ${CRITERIA}    ${OUTPUT}
    [Documentation]    Perform a quick search with emtpy value search criteria
    ...    @param ${CRITERIA}: A search criteria with the following format
    ...    @values: {"searchCriteria":[{"attName":"GENERIC_TEXT","value":"","type":"CONTAINS","operatorValue":null}],"isAssociated":true}
    ...    @param ${OUTPUT}: if true the response of the sever will be logged into the console
    ...    @values: True, False
    Post    /services/rest/v2.0/extensions/documents/projects/${PROJECTID}/deposits/${DEPOSITID}/documents/filter?sessionId=${SESSIONID}    body=${CRITERIA}    timeout=10    headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'Bad Request'
    Output Schema    $.status
    Output    Server message response must be 'Missing search criteria value'
    Output Schema    $.message    
    #    Assertions
    String    $.status    Bad Request
    String    $.message   Missing search criteria value
    
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output       

Advanced Search with invalid or empty session id    [Arguments]    ${CRITERIA}    ${SESSION}    ${OUTPUT}
    Post    /services/rest/v2.0/extensions/documents/projects/${PROJECTID}/deposits/${DEPOSITID}/documents/filter?sessionId=${SESSION}    body=${CRITERIA}    timeout=10    headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'Unauthorized'
    Output Schema    $.status
    Output    Server message response must be 'Invalid session id.'
    Output Schema    $.message
    #    Assertions
    String    $.status    Unauthorized
    String    $.message   Invalid session id.

    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output

Advanced Search with invalid project id    [Arguments]    ${PROJECT}    ${CRITERIA}    ${OUTPUT}
    Post    /services/rest/v2.0/extensions/documents/projects/${PROJECT}/deposits/${DEPOSITID}/documents/filter?sessionId=${SESSIONID}    body=${CRITERIA}    timeout=10    headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'Not Found'
    Output Schema    $.status
    Output    Server message response must be 'The project does not exist'
    Output Schema    $.message
    #    Assertions
    String    $.status    Not Found
    String    $.message   The project does not exist
        
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output    
    
Advanced Search with invalid deposit id    [Arguments]    ${DEPOSIT}    ${CRITERIA}    ${OUTPUT}
    Post    /services/rest/v2.0/extensions/documents/projects/${PROJECTID}/deposits/${DEPOSIT}/documents/filter?sessionId=${SESSIONID}    body=${CRITERIA}    timeout=10    headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'Bad Request'
    Output Schema    $.status
    Output    Server message response must be 'The user does not have permission to perform this action'
    Output Schema    $.message
    #    Assertions
    String    $.status    Bad Request
    String    $.message   The user does not have permission to perform this action
        
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output    

Advanced Search with a user without permissions    [Arguments]    ${CRITERIA}    ${OUTPUT}
    Close session    ${SESSIONID}
    Open Session    anonymous    ${PASSWORD}    ${TYPE}
    
    Post    /services/rest/v2.0/extensions/documents/projects/${PROJECTID}/deposits/${DEPOSITID}/documents/filter?sessionId=${SESSIONID}    body=${CRITERIA}    timeout=10    headers={"Content-Type":"application/json"}
    #    Logs
    Output    Server status response must be 'Bad Request'
    Output Schema    $.status
    Output    Server message response should be 'The user does not have permission to perform this action'
    Output Schema    $.message
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The user does not have permission to perform this action
    
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output
    
    Close session    ${SESSIONID}
    Open Session    ${USERNAME}    ${PASSWORD}    ${TYPE}
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        
Get documents and hyperlinks for multiple JMap elements    [Arguments]    ${OUTPUT}
    Post    /services/rest/v2.0/extensions/documents/projects/${PROJECTID}/documents-and-hyperlinks/filter?sessionId=${SESSIONID}    body=[{"layerId": ${LAYERID} ,"elementIds": ${ELEMENTSID}}]    timeout=10   headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'OK'
    Output Schema    $.status
    Output    Server message response must be 'The results are a document descriptor list and an hyperlink descriptor list'
    Output Schema    $.message
    #    Assertions
    String    $.status    OK
    String    $.message   The results are a document descriptor list and an hyperlink descriptor list
    
    Output    Asserting first document and first hyperlink ...
    Array    $.result.documents    minItems=4    maxItems=4
    String    $.result.documents[0].fileName    LOTUS-ILMFS60_61.PDF
    Array    $.result.hyperlinks    minItems=3    maxItems=3
    String    $.result.hyperlinks[0].url    https://translate.google.com/
    Output    Assertions completed...
    
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Genereting JSON response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output Schema     $.result

Get documents and hyperlinks for multiple JMap elements with invalid project id    [Arguments]    ${PROJECT}    ${OUTPUT}
    Post    /services/rest/v2.0/extensions/documents/projects/${PROJECT}/documents-and-hyperlinks/filter?sessionId=${SESSIONID}    body=[{"layerId": ${LAYERID} ,"elementIds": ${ELEMENTSID}}]    timeout=10   headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'Not Found'
    Output Schema    $.status
    Output    Server message response must be 'The project does not exist'
    Output Schema    $.message
    #    Assertions
    String    $.status    Not Found
    String    $.message   The project does not exist
        
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output    
    
Get documents and hyperlinks for multiple JMap elements with invalid layer id    [Arguments]    ${LAYER}    ${OUTPUT}
    Post    /services/rest/v2.0/extensions/documents/projects/${PROJECTID}/documents-and-hyperlinks/filter?sessionId=${SESSIONID}    body=[{"layerId": ${LAYER} ,"elementIds": ${ELEMENTSID}}]    timeout=10   headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'Not Found'
    Output Schema    $.status
    Output    Server message response must be 'The layer with id: ${LAYER} does not exist'
    Output Schema    $.message
    #    Assertions
    String    $.status    Not Found
    String    $.message   The layer with id: ${LAYER} does not exist
        
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output    
    
Get documents and hyperlinks for multiple JMap elements with invalid or empty session id    [Arguments]    ${SESSION}    ${OUTPUT}
    Post    /services/rest/v2.0/extensions/documents/projects/${PROJECTID}/documents-and-hyperlinks/filter?sessionId=${SESSION}    body=[{"layerId": ${LAYERID} ,"elementIds": ${ELEMENTSID}}]    timeout=10   headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'Unauthorized'
    Output Schema    $.status
    Output    Server message response must be 'Invalid session id.'
    Output Schema    $.message
    #    Assertions
    String    $.status    Unauthorized
    String    $.message   Invalid session id.

    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output       
    
Get documents and hyperlinks for multiple JMap elements with empty selection    [Arguments]    ${OUTPUT}
    Post    /services/rest/v2.0/extensions/documents/projects/${PROJECTID}/documents-and-hyperlinks/filter?sessionId=${SESSIONID}    body=[{"layerId": ${LAYERID} ,"elementIds": ${EMPTY_SELECTION}}]    timeout=10   headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'Bad Request'
    Output Schema    $.status
    Output    Server message response must be 'Empty selection'
    Output Schema    $.message
    #    Assertions
    String    $.status    Bad Request
    String    $.message   Empty selection

    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output       

Get documents and hyperlinks for multiple JMap elements with a user without permissions    [Arguments]    ${OUTPUT}
    Close session    ${SESSIONID}
    Open Session    anonymous    ${PASSWORD}    ${TYPE}
    
    Post    /services/rest/v2.0/extensions/documents/projects/${PROJECTID}/documents-and-hyperlinks/filter?sessionId=${SESSIONID}    body=[{"layerId": ${LAYERID} ,"elementIds": ${ELEMENTSID}}]    timeout=10   headers={"Content-Type":"application/json"}
    #    Logs
    Output    Server status response must be 'Bad Request'
    Output Schema    $.status
    Output    Server message response should be 'The user does not have permission to perform this action'
    Output Schema    $.message
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The user does not have permission to perform this action
    
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output
    
    Close session    ${SESSIONID}
    Open Session    ${USERNAME}    ${PASSWORD}    ${TYPE}
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
Get documents and hyperlinks descriptors for a JMap element    [Arguments]    ${OUTPUT}
    Get    /services/rest/v2.0/extensions/documents/projects/${PROJECTID}/layers/${LAYERID}/elements/${ELEMENTID}/documents-and-hyperlinks?sessionId=${SESSIONID}    timeout=10    headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'OK'
    Output Schema    $.status
    Output    Server message response must be 'The results are a document descriptor list and an hyperlink descriptor list'
    Output Schema    $.message
    #    Assertions
    String    $.status    OK
    String    $.message   The results are a document descriptor list and an hyperlink descriptor list
    
    Output    Asserting the results...
    String    $.result.documents[0].fileName    RLS client ID.txt
    #    Asserting the document's associations
    String    $.result.documents[0].documentAssociations[0].elementIds[0]    Australia
    
    String    $.result.hyperlinks[0].url    https://mail.google.com
    Output    Assertions completed...
    
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Genereting JSON response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output Schema     $.result

Get documents and hyperlinks descriptors for a JMap element with invalid project id    [Arguments]    ${PROJECT}    ${OUTPUT}
    Get    /services/rest/v2.0/extensions/documents/projects/${PROJECT}/layers/${LAYERID}/elements/${ELEMENTID}/documents-and-hyperlinks?sessionId=${SESSIONID}    timeout=10    headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'Not Found'
    Output Schema    $.status
    Output    Server message response must be 'The project does not exist'
    Output Schema    $.message
    #    Assertions
    String    $.status    Not Found
    String    $.message   The project does not exist
        
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output

Get documents and hyperlinks descriptors for a JMap element with invalid layer id    [Arguments]    ${LAYER}    ${OUTPUT}
    Get    /services/rest/v2.0/extensions/documents/projects/${PROJECTID}/layers/${LAYER}/elements/${ELEMENTID}/documents-and-hyperlinks?sessionId=${SESSIONID}    timeout=10    headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'Not Found'
    Output Schema    $.status
    Output    Server message response must be 'The layer does not exist'
    Output Schema    $.message
    #    Assertions
    String    $.status    Not Found
    String    $.message   The layer does not exist
        
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output

Get documents and hyperlinks descriptors for a JMap element with invalid or empty session id    [Arguments]    ${SESSION}    ${OUTPUT}
    Get    /services/rest/v2.0/extensions/documents/projects/${PROJECTID}/layers/${LAYERID}/elements/${ELEMENTID}/documents-and-hyperlinks?sessionId=${SESSION}    timeout=10    headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'Unauthorized'
    Output Schema    $.status
    Output    Server message response must be 'Invalid session id.'
    Output Schema    $.message
    #    Assertions
    String    $.status    Unauthorized
    String    $.message   Invalid session id.

    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output

Get documents and hyperlinks descriptors for a JMap element with a user without permissions    [Arguments]    ${OUTPUT}
    Close session    ${SESSIONID}
    Open Session    anonymous    ${PASSWORD}    ${TYPE}
    
    Get    /services/rest/v2.0/extensions/documents/projects/${PROJECTID}/layers/${LAYERID}/elements/${ELEMENTID}/documents-and-hyperlinks?sessionId=${SESSIONID}    timeout=10    headers={"Content-Type":"application/json"}
    #    Logs
    Output    Server status response must be 'Bad Request'
    Output Schema    $.status
    Output    Server message response should be 'The user does not have permission to perform this action'
    Output Schema    $.message
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The user does not have permission to perform this action
    
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output

    Close session    ${SESSIONID}
    Open Session    ${USERNAME}    ${PASSWORD}    ${TYPE}    
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
 
Download document by deposit    [Arguments]    ${DOCUMENT}    ${DEPOSIT}
    Get    /services/rest/v2.0/extensions/documents/deposits/${DEPOSIT}/documents/${DOCUMENT}/?sessionId=${SESSIONID}    timeout=10    headers={"Content-Type":"application/octet-stream"}
    String    $    "Content of the downloaded text document"    #Asserts that the content of the downladed file correct
    Output    Server entire response:
    Output Schema    $
    #The commmented lines allows to create a new file with the downloaded content
    #${BODY}    String    $    # Get the content of the file
    #Create File    D:\\test.txt    ${BODY}[0]    # The content is saved into a new file. Check that the file was created with the content

Download document by deposit using an invalid or empty session id    [Arguments]    ${DOCUMENT}    ${DEPOSIT}    ${SESSION}    ${OUTPUT}
    [Documentation]    Try to download a document invalid or empty session id parameter
    Get    /services/rest/v2.0/extensions/documents/deposits/${DEPOSIT}/documents/${DOCUMENT}/?sessionId=${SESSION}    timeout=10    headers={"Content-Type":"application/octet-stream"}
    #     Logs
    Output    Server status response must be 'Unauthorized'
    Output Schema    $.status
    Output    Server message response must be 'Invalid session id.'
    Output Schema    $.message
    #    Assertions
    String    $.status    Unauthorized
    String    $.message   Invalid session id.

    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output       

Download document by deposit with invalid document    [Arguments]    ${DOCUMENT}    ${DEPOSIT}    ${OUTPUT}
    [Documentation]    Perform a document download action with invalid parameters
    Get    /services/rest/v2.0/extensions/documents/deposits/${DEPOSIT}/documents/${DOCUMENT}/?sessionId=${SESSIONID}    timeout=10    headers={"Content-Type":"application/octet-stream"}
    #     Logs
    Output    Server status response must be 'Not Found'
    Output Schema    $.status
    Output    Server message response must be 'The Document does not exist'
    Output Schema    $.message
    #    Assertions
    String    $.status    Not Found
    String    $.message   The Document does not exist
        
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output
    
Download document by deposit with invalid deposit    [Arguments]    ${DOCUMENT}    ${DEPOSIT}    ${OUTPUT}
    [Documentation]    Perform a document download action with invalid parameters
    Get    /services/rest/v2.0/extensions/documents/deposits/${DEPOSIT}/documents/${DOCUMENT}/?sessionId=${SESSIONID}    timeout=10    headers={"Content-Type":"application/octet-stream"}
    #     Logs
    Output    Server status response must be 'Bad Request'
    Output Schema    $.status
    Output    Server message response must be 'The user does not have permission to perform this action'
    Output Schema    $.message
    #    Assertions
    String    $.status    Bad Request
    String    $.message   The user does not have permission to perform this action
        
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output    

Download document by deposit with a user without permissions    [Arguments]    ${OUTPUT}
    Close session    ${SESSIONID}
    Open Session    anonymous    ${PASSWORD}    ${TYPE}
    
    Get    /services/rest/v2.0/extensions/documents/deposits/${DEPOSITID}/documents/${DOCUMENTID}/?sessionId=${SESSIONID}    timeout=10    headers={"Content-Type":"application/octet-stream"}
    #    Logs
    Output    Server status response must be 'Bad Request'
    Output Schema    $.status
    Output    Server message response should be 'The user does not have permission to perform this action'
    Output Schema    $.message
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The user does not have permission to perform this action
    
    Close session    ${SESSIONID}
    Open Session    ${USERNAME}    ${PASSWORD}    ${TYPE}

    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output Schema
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
       
Download Document by element    [Arguments]    ${DOCUMENT}    ${ELEMENT}    ${LAYER}    ${PROJECT}    ${SESSION}
    Get    /services/rest/v2.0/extensions/documents/projects/${PROJECT}/layers/${LAYER}/elements/${ELEMENT}/documents/${DOCUMENT}?sessionId=${SESSION}    timeout=10    headers={"Content-Type":"application/octet-stream"}
    String    $    "Content of the downloaded text document"    #Asserts that the content of the downladed file correct
    Output    Server entire response:
    Output Schema    $
    #The commmented lines allows to create a new file with the downloaded content
    #${BODY}    String    $    # Get the content of the file
    #Create File    D:\\test.txt    ${BODY}[0]    # The content is saved into a new file. Check that the file was created with the content

Downlaod document by element with invalid project id    [Arguments]    ${DOCUMENT}    ${ELEMENT}    ${LAYER}    ${PROJECT}    ${SESSION}    ${OUTPUT}
    Get    /services/rest/v2.0/extensions/documents/projects/${PROJECT}/layers/${LAYER}/elements/${ELEMENT}/documents/${DOCUMENT}?sessionId=${SESSION}    timeout=10    headers={"Content-Type":"application/octet-stream"}
    #     Logs
    Output    Server status response must be 'Not Found'
    Output Schema    $.status
    Output    Server message response must be 'The project does not exist'
    Output Schema    $.message
    #    Assertions
    String    $.status    Not Found
    String    $.message   The project does not exist
        
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output

Downlaod document by element with invalid layer id    [Arguments]    ${DOCUMENT}    ${ELEMENT}    ${LAYER}    ${PROJECT}    ${SESSION}    ${OUTPUT}
    Get    /services/rest/v2.0/extensions/documents/projects/${PROJECT}/layers/${LAYER}/elements/${ELEMENT}/documents/${DOCUMENT}?sessionId=${SESSION}    timeout=10    headers={"Content-Type":"application/octet-stream"}
    #     Logs
    Output    Server status response must be 'Not Found'
    Output Schema    $.status
    Output    Server message response must be 'The layer does not exist'
    Output Schema    $.message
    #    Assertions
    String    $.status    Not Found
    String    $.message   The layer does not exist
        
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output

Downlaod document by element with invalid document id    [Arguments]    ${DOCUMENT}    ${ELEMENT}    ${LAYER}    ${PROJECT}    ${SESSION}    ${OUTPUT}
    Get    /services/rest/v2.0/extensions/documents/projects/${PROJECT}/layers/${LAYER}/elements/${ELEMENT}/documents/${DOCUMENT}?sessionId=${SESSION}    timeout=10    headers={"Content-Type":"application/octet-stream"}
    #     Logs
    Output    Server status response must be 'Not Found'
    Output Schema    $.status
    Output    Server message response must be 'The Document does not exist'
    Output Schema    $.message
    #    Assertions
    String    $.status    Not Found
    String    $.message   The Document does not exist
        
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output

Downlaod document by element with invalid or empty session id    [Arguments]    ${SESSION}    ${OUTPUT}
    Get    /services/rest/v2.0/extensions/documents/projects/${PROJECTID}/layers/${LAYERID}/elements/${ELEMENTID}/documents/${DOCUMENTID}?sessionId=${SESSION}    timeout=10    headers={"Content-Type":"application/octet-stream"}
    #     Logs
    Output    Server status response must be 'Unauthorized'
    Output Schema    $.status
    Output    Server message response must be 'Invalid session id.'
    Output Schema    $.message
    #    Assertions
    String    $.status    Unauthorized
    String    $.message   Invalid session id.

    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output

Downlaod document by element with a user without permissions    [Arguments]    ${OUTPUT}
    Close session    ${SESSIONID}
    Open Session    anonymous    ${PASSWORD}    ${TYPE}
    
    Get    /services/rest/v2.0/extensions/documents/projects/${PROJECTID}/layers/${LAYERID}/elements/${ELEMENTID}/documents/${DOCUMENTID}?sessionId=${SESSIONID}    timeout=10    headers={"Content-Type":"application/octet-stream"}
    #    Logs
    Output    Server status response must be 'Bad Request'
    Output Schema    $.status
    Output    Server message response should be 'The user does not have permission to perform this action'
    Output Schema    $.message
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The user does not have permission to perform this action
    
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output
    
    Close session    ${SESSIONID}
    Open Session    ${USERNAME}    ${PASSWORD}    ${TYPE}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
 
Get Hyperlinks from multiple selection    [Arguments]    ${OUTPUT}
    Post    /services/rest/v2.0/extensions/documents/projects/${PROJECTID}/hyperlinks/filter?sessionId=${SESSIONID}    body=[{"layerId": ${LAYERID},"elementIds": ${ELEMENTSID}}]    timeout=10    headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'OK'
    Output Schema    $.status
    Output    Server message response must be 'The result is the hyperlink descriptor list for multiple elements selection'
    Output Schema    $.message
    #    Assertions
    String    $.status    OK
    String    $.message   The result is the hyperlink descriptor list for multiple elements selection
    
    Output    Asserting each hyperlink's url...
    Array    $.result    minItems=3    maxItems=3
    String    $.result[0].hyperlinkAssociationDesc.url    https://translate.google.com/
    String    $.result[1].hyperlinkAssociationDesc.url    https://www.google.com/
    String    $.result[2].hyperlinkAssociationDesc.url    https://mail.google.com
    Output    Assertions completed...
    
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Genereting JSON response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output Schema     $.result

Get Hyperlinks from multiple selection with invalid project id    [Arguments]    ${PROJECT}    ${OUTPUT}
    Post    /services/rest/v2.0/extensions/documents/projects/${PROJECT}/hyperlinks/filter?sessionId=${SESSIONID}    body=[{"layerId": ${LAYERID},"elementIds": ${ELEMENTSID}}]    timeout=10    headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'Not Found'
    Output Schema    $.status
    Output    Server message response must be 'The project does not exist'
    Output Schema    $.message
    #    Assertions
    String    $.status    Not Found
    String    $.message   The project does not exist
        
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output

Get Hyperlinks from multiple selection with invalid or empty session id    [Arguments]    ${SESSION}    ${OUTPUT}
    Post    /services/rest/v2.0/extensions/documents/projects/${PROJECTID}/hyperlinks/filter?sessionId=${SESSION}    body=[{"layerId": ${LAYERID},"elementIds": ${ELEMENTSID}}]    timeout=10    headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'Unauthorized'
    Output Schema    $.status
    Output    Server message response must be 'Invalid session id.'
    Output Schema    $.message
    #    Assertions
    String    $.status    Unauthorized
    String    $.message   Invalid session id.

    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output

Get Hyperlinks from multiple selection with invalid layer id    [Arguments]    ${LAYER}    ${OUTPUT}
    Post    /services/rest/v2.0/extensions/documents/projects/${PROJECTID}/hyperlinks/filter?sessionId=${SESSIONID}    body=[{"layerId": ${LAYER},"elementIds": ${ELEMENTSID}}]    timeout=10    headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'Not Found'
    Output Schema    $.status
    Output    Server message response must be 'The layer with id: ${LAYER} does not exist'
    Output Schema    $.message
    #    Assertions
    String    $.status    Not Found
    String    $.message   The layer with id: ${LAYER} does not exist
        
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output

Get Hyperlinks from multiple selection with a user without permissions    [Arguments]    ${OUTPUT}
    Close session    ${SESSIONID}
    Open Session    anonymous    ${PASSWORD}    ${TYPE}
    
    Post    /services/rest/v2.0/extensions/documents/projects/${PROJECTID}/hyperlinks/filter?sessionId=${SESSIONID}    body=[{"layerId": ${LAYERID},"elementIds": ${ELEMENTSID}}]    timeout=10    headers={"Content-Type":"application/json"}
    #    Logs
    Output    Server status response must be 'Bad Request'
    Output Schema    $.status
    Output    Server message response should be 'The user does not have permission to perform this action'
    Output Schema    $.message
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The user does not have permission to perform this action
    
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output

    Close session    ${SESSIONID}
    Open Session    ${USERNAME}    ${PASSWORD}    ${TYPE}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
Get Hyperlinks for selected element    [Arguments]    ${OUTPUT}
    Get    /services/rest/v2.0/extensions/documents/projects/${PROJECTID}/layers/${LAYERID}/elements/${ELEMENTID}/hyperlinks?sessionId=${SESSIONID}    timeout=10    headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'OK'
    Output Schema    $.status
    Output    Server message response must be 'The result is the hyperlink descriptor list'
    Output Schema    $.message
    #    Assertions
    String    $.status    OK
    String    $.message   The result is the hyperlink descriptor list
    
    Output    Asserting the results...
    String    $.result[0].url    https://mail.google.com
    Output    Assertions completed...
    
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Genereting JSON response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output Schema     $.result

Get Hyperlinks for selected element with invalid project id    [Arguments]    ${PROJECT}    ${OUTPUT}
    Get    /services/rest/v2.0/extensions/documents/projects/${PROJECT}/layers/${LAYERID}/elements/${ELEMENTID}/hyperlinks?sessionId=${SESSIONID}    timeout=10    headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'Not Found'
    Output Schema    $.status
    Output    Server message response must be 'The project does not exist'
    Output Schema    $.message
    #    Assertions
    String    $.status    Not Found
    String    $.message   The project does not exist
        
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output

Get Hyperlinks for selected element with invalid layer id    [Arguments]    ${LAYER}    ${OUTPUT}
    Get    /services/rest/v2.0/extensions/documents/projects/${PROJECTID}/layers/${LAYER}/elements/${ELEMENTID}/hyperlinks?sessionId=${SESSIONID}    timeout=10    headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'Not Found'
    Output Schema    $.status
    Output    Server message response must be 'The layer does not exist'
    Output Schema    $.message
    #    Assertions
    String    $.status    Not Found
    String    $.message   The layer does not exist
        
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output

Get Hyperlinks for selected element with invalid or empty session id    [Arguments]    ${SESSION}    ${OUTPUT}
    Get    /services/rest/v2.0/extensions/documents/projects/${PROJECTID}/layers/${LAYERID}/elements/${ELEMENTID}/hyperlinks?sessionId=${SESSION}    timeout=10    headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'Unauthorized'
    Output Schema    $.status
    Output    Server message response must be 'Invalid session id.'
    Output Schema    $.message
    #    Assertions
    String    $.status    Unauthorized
    String    $.message   Invalid session id.

    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output

Get Hyperlinks for selected element with a user without permissions    [Arguments]    ${OUTPUT}
    Close session    ${SESSIONID}
    Open Session    anonymous    ${PASSWORD}    ${TYPE}
    
    Get    /services/rest/v2.0/extensions/documents/projects/${PROJECTID}/layers/${LAYERID}/elements/${ELEMENTID}/hyperlinks?sessionId=${SESSIONID}    timeout=10    headers={"Content-Type":"application/json"}
	#    Logs
    Output    Server status response must be 'Bad Request'
    Output Schema    $.status
    Output    Server message response should be 'The user does not have permission to perform this action'
    Output Schema    $.message
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The user does not have permission to perform this action
    
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output
    
    Close session    ${SESSIONID}
    Open Session    ${USERNAME}    ${PASSWORD}    ${TYPE}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
Delete Hyperlink    [Arguments]    ${HYPERLINK}    ${OUTPUT}
    Delete    /services/rest/v2.0/extensions/documents/hyperlinks/${HYPERLINK}?sessionId=${SESSIONID}    timeout=10
    #     Logs
    Output    Server status response must be 'OK'
    Output Schema    $.status
    Output    Server message response must be 'The hyperlink was deleted successfully'
    Output Schema    $.message
    #    Assertions
    String    $.status    OK    #Asserts that the response status was OK
    String    $.message    The hyperlink was deleted successfully
    
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output    

Delete Hyperlink with invalid id    [Arguments]    ${HYPERLINK}    ${OUTPUT}
    [Documentation]    This Automated test must be executed after "Delete Hyperlink". The mentioned method will delete an existing hyperlink.
    ...    This test case will try to delete the previously deleted and should throw an error message
    Delete    /services/rest/v2.0/extensions/documents/hyperlinks/${HYPERLINK}?sessionId=${SESSIONID}    timeout=10
    #     Logs
    Output    Server status response must be 'Not Found'
    Output Schema    $.status
    Output    Server message response must be 'The hyperlink does not exist'
    Output Schema    $.message
    #    Assertions
    String    $.status    Not Found
    String    $.message   The hyperlink does not exist
    
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output

Delete Hyperlink with invalid or empty session id    [Arguments]    ${HYPERLINK}    ${SESSION}    ${OUTPUT}
    Delete    /services/rest/v2.0/extensions/documents/hyperlinks/${HYPERLINK}?sessionId=${SESSION}    timeout=10
    #     Logs
    Output    Server status response must be 'Unauthorized'
    Output Schema    $.status
    Output    Server message response must be 'Invalid session id.'
    Output Schema    $.message
    #    Assertions
    String    $.status    Unauthorized
    String    $.message   Invalid session id.

    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output

Delete Hyperlink with a user without permissions    [Arguments]    ${HYPERLINK}    ${OUTPUT}
    Close session    ${SESSIONID}
    Open Session    anonymous    ${PASSWORD}    ${TYPE}
    
    Delete    /services/rest/v2.0/extensions/documents/hyperlinks/${HYPERLINK}?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Bad Request'
    Output Schema    $.status
    Output    Server message response should be 'The user does not have permission to perform this action'
    Output Schema    $.message
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The user does not have permission to perform this action
    
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output Schema
    
    Close session    ${SESSIONID}
    Open Session    ${USERNAME}    ${PASSWORD}    ${TYPE}
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
Get all forms by depositId    [Arguments]    ${DEPOSITID}    ${OUTPUT}
    Get    /services/rest/v2.0/extensions/documents/deposits/${DEPOSITID}/forms?sessionId=${SESSIONID}    timeout=10    headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'OK'
    Output Schema    $.status
    Output    Server message response must be 'The result is a form list for a deposit'
    Output Schema    $.message
    #    Assertions
    String    $.status    OK
    String    $.message   The result is a form list for a deposit
    
    Output    Asserting each form's name...
    String    $.result[0].name    Search by Location
    String    $.result[1].name    Search by Desc
    String    $.result[2].name    Search Advanced
    String    $.result[3].name    Search by Title
    Output    Assertions completed...
    
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Genereting JSON response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output Schema     $.result
    
Get all forms with invalid deposit id    [Arguments]    ${DEPOSIT}    ${OUTPUT}
    Get    /services/rest/v2.0/extensions/documents/deposits/${DEPOSIT}/forms?sessionId=${SESSIONID}    timeout=10    headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'Not Found'
    Output Schema    $.status
    Output    Server message response must be 'The deposit does not exist'
    Output Schema    $.message
    #    Assertions
    String    $.status    Not Found
    String    $.message   The deposit does not exist
        
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output

Get all forms with invalid or empty session id    [Arguments]    ${DEPOSIT}    ${SESSION}    ${OUTPUT}
    Get    /services/rest/v2.0/extensions/documents/deposits/${DEPOSIT}/forms?sessionId=${SESSION}    timeout=10    headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'Unauthorized'
    Output Schema    $.status
    Output    Server message response must be 'Invalid session id.'
    Output Schema    $.message
    #    Assertions
    String    $.status    Unauthorized
    String    $.message   Invalid session id.

    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output       

Get all forms for a deposit without form    [Arguments]    ${DEPOSIT}    ${OUTPUT}
    Get    /services/rest/v2.0/extensions/documents/deposits/${DEPOSIT}/forms?sessionId=${SESSIONID}    timeout=10    headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'OK'
    Output Schema    $.status
    Output    Server message response must be 'The result is a form list for a deposit'
    Output Schema    $.message
    #    Assertions
    String    $.status    OK
    String    $.message   The result is a form list for a deposit
    
    Output    Asserting each form's name...
    String    $.result[0].name    General search
    Output    Assertions completed...
    
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Genereting JSON response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output Schema     $.result
    
Get all forms for Hyperlink deposit    [Arguments]    ${DEPOSIT}    ${OUTPUT}
    Get    /services/rest/v2.0/extensions/documents/deposits/${DEPOSIT}/forms?sessionId=${SESSIONID}    timeout=10    headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'Bad Request'
    Output Schema    $.status
    Output    Server message response must be 'Hyperlink deposits do not support forms'
    Output Schema    $.message
    #    Assertions
    String    $.status    Bad Request
    String    $.message   Hyperlink deposits do not support forms
    
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output  

Get all forms by depositId with a user without permissions    [Arguments]    ${OUTPUT}
    Close session    ${SESSIONID}
    Open Session    anonymous    ${PASSWORD}    ${TYPE}
    
    Get    /services/rest/v2.0/extensions/documents/deposits/${DEPOSITID}/forms?sessionId=${SESSIONID}    timeout=10    headers={"Content-Type":"application/json"}
    #    Logs
    Output    Server status response must be 'Bad Request'
    Output Schema    $.status
    Output    Server message response should be 'The user does not have permission to perform this action'
    Output Schema    $.message
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The user does not have permission to perform this action
    
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output
    
    Close session    ${SESSIONID}
    Open Session    ${USERNAME}    ${PASSWORD}    ${TYPE}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
Get form by deposit id and form id    [Arguments]    ${OUTPUT}
    Get    /services/rest/v2.0/extensions/documents/deposits/${DEPOSITID}/forms/${FORMID}?sessionId=${SESSIONID}    timeout=10    headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'OK'
    Output Schema    $.status
    Output    Server message response must be 'The result is a form list for a deposit'
    Output Schema    $.message
    #    Assertions
    String    $.status    OK    #Asserts that the response status was OK
    String    $.message    The result is a form list for a deposit
    String    $.result.name    Search by Location
    
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output Schema     $.result

Get form by form id with invalid deposit id    [Arguments]    ${DEPOSIT}    ${FORM}    ${OUTPUT}
    Get    /services/rest/v2.0/extensions/documents/deposits/${DEPOSIT}/forms/${FORM}?sessionId=${SESSIONID}    timeout=10    headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'Bad Request'
    Output Schema    $.status
    Output    Server message response must be 'The user does not have permission to perform this action'
    Output Schema    $.message
    #    Assertions
    String    $.status    Bad Request
    String    $.message   The user does not have permission to perform this action
        
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output
    
Get form by deposit id with invalid form id    [Arguments]    ${DEPOSIT}    ${FORM}    ${OUTPUT}
    Get    /services/rest/v2.0/extensions/documents/deposits/${DEPOSIT}/forms/${FORM}?sessionId=${SESSIONID}    timeout=10    headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'Not Found'
    Output Schema    $.status
    Output    Server message response must be 'The form does not exist'
    Output Schema    $.message
    #    Assertions
    String    $.status    Not Found
    String    $.message   The form does not exist
        
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output
    
Get form by deposit id and form id with invalid or empty session id    [Arguments]    ${DEPOSIT}    ${FORM}    ${SESSION}    ${OUTPUT}
    Get    /services/rest/v2.0/extensions/documents/deposits/${DEPOSIT}/forms/${FORM}?sessionId=${SESSION}    timeout=10    headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'Unauthorized'
    Output Schema    $.status
    Output    Server message response must be 'Invalid session id.'
    Output Schema    $.message
    #    Assertions
    String    $.status    Unauthorized
    String    $.message   Invalid session id.

    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output       

Get form by deposit id and form id on hyperlink deposit    [Arguments]    ${DEPOSIT}    ${FORM}    ${OUTPUT}
    Get    /services/rest/v2.0/extensions/documents/deposits/${DEPOSIT}/forms/${FORM}?sessionId=${SESSIONID}    timeout=10    headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'Bad Request'
    Output Schema    $.status
    Output    Server message response must be 'Hyperlink deposits do not support forms'
    Output Schema    $.message
    #    Assertions
    String    $.status    Bad Request
    String    $.message   Hyperlink deposits do not support forms
    
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output  

Get form by deposit id and form id with a user without permissions    [Arguments]    ${OUTPUT}
    Close session    ${SESSIONID}
    Open Session    anonymous    ${PASSWORD}    ${TYPE}
    
    Get    /services/rest/v2.0/extensions/documents/deposits/${DEPOSITID}/forms/${FORMID}?sessionId=${SESSIONID}    timeout=10    headers={"Content-Type":"application/json"}
    #    Logs
    Output    Server status response must be 'Bad Request'
    Output Schema    $.status
    Output    Server message response should be 'The user does not have permission to perform this action'
    Output Schema    $.message
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The user does not have permission to perform this action
    
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output
    
    Close session    ${SESSIONID}
    Open Session    ${USERNAME}    ${PASSWORD}    ${TYPE}
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get RichPreview Informations for selected element    [Arguments]    ${URL}    ${OUTPUT}
    Get    /services/rest/v2.0/extensions/documents/hyperlinks/richpreview?url=${URL}&sessionId=${SESSIONID}    timeout=10    headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'OK'
    Output Schema    $.status
    Output    Server message response must be 'The result is the hyperlink rich preview descriptor'
    Output Schema    $.message
    #    Assertions
    String    $.status    OK
    String    $.message   The result is the hyperlink rich preview descriptor
    String    $.result.url    ${HYPERLINK_URL}
    String    $.result.linkTitle    Google Translate
    
    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output  

Get RichPreview Informations for selected element with invalid or empty session id    [Arguments]    ${URL}    ${SESSION}    ${OUTPUT}
    Get    /services/rest/v2.0/extensions/documents/hyperlinks/richpreview?url=${URL}&sessionId=${SESSION}    timeout=10    headers={"Content-Type":"application/json"}
    #     Logs
    Output    Server status response must be 'Unauthorized'
    Output Schema    $.status
    Output    Server message response must be 'Invalid session id.'
    Output Schema    $.message
    #    Assertions
    String    $.status    Unauthorized
    String    $.message   Invalid session id.

    Run Keyword If    '${OUTPUT}'=='${True}'    Output	Server response:
    Run Keyword If    '${OUTPUT}'=='${True}'    Output
    

