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
Resource    ../../common/admin/CommonSpatialDataSource.robot
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Suite Setup    Start Up    
Suite Teardown    Suite Down        
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Variables ***

${USERNAME}    administrator
${PASSWORD}    ${EMPTY}
${TYPE}    WEB    #The session type must be DESKTOP, WEB or MOBILE.
${INVALIDSESSIONID}    -3
${PROJECTID}    0
${PROJECTNAME}    The World
${INVALIDPROJECTID}    -3
${LAYERID}    7
${LAYERNAME}    Cities
${INVALIDLAYERID}    -3
${ELEMENTID}    2940
${ELEMENTSID}    0%2C1%2C2    # %2C is the character for ",". So this is translated to 0,1,2
${INVALIDELEMENTSID}    0%2C1%2C-3
${INVALIDELEMENTID}    -3
${INVALIDPROJECTION}    BAD
${ELEMENT_COUNT}    ${EMPTY}
${ELEMENTID_COUNT}    ${EMPTY}
${ELEMENTNAME}    ${EMPTY}
${PHOTOID}    0
${INVALIDFILTERTYPE}    INVALID
${INVALIDATTRIBUTE}    INVALID    
${JMAPADMIN}    http://192.168.0.25:8080
@{SDS_LIST}=    World Cities    World Continent Names    World Countries    World Hydro    World Lakes    World Ocean Names
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Test Cases ***

Get All Layers Elements
    [Documentation]    Get all GeoJson collection of elements in a layer
    Get All Layers Elements
    
Get All Layers Elements With Invalid Session Id
    [Documentation]    Try to get all GeoJson collection of elements in a layer with invalid session id
    Get All Layers Elements With Invalid Session Id
    
Get All Layers Elements With Empty Session Id
    [Documentation]    Try to get all GeoJson collection of elements in a layer with empty session id
    Get All Layers Elements With Empty Session Id
    
Get All Layers Elements With Invalid Project Id
    [Documentation]    Try to get all GeoJson collection of elements in a layer with invalid project id
    Get All Layers Elements With Invalid Project Id
    
Get All Layers Elements With Invalid Layer Id
    [Documentation]    Try to get all GeoJson collection of elements in a layer with invalid layer id
    Get All Layers Elements With Invalid Layer Id
    
Get All Layers Elements With Invalid Projection
    [Documentation]    Try to get all GeoJson collection of elements in a layer with invalid projection
    Get All Layers Elements With Invalid Projection
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Create New Layer Elements
    [Documentation]    Add new element to layer
    Create New Layer Elements    
    
Create New Layer Elements With Invalid Session Id
    [Documentation]    Try to add new element to layer with invalid session id
    Create New Layer Elements With Invalid Session Id
    
Create New Layer Elements With Empty Session Id
    [Documentation]    Try to add new element to layer with empty session id
    Create New Layer Elements With Empty Session Id
    
Create New Layer Elements With Invalid Project Id
    [Documentation]    Try to add new element to layer with invalid project id
    Create New Layer Elements With Invalid Project Id
    
Create New Layer Elements With Invalid Layer Id
    [Documentation]    Try to add new element to layer with invalid layer id
    Create New Layer Elements With Invalid Layer Id
    
Create New Layer Elements With Invalid Body Parameters
    [Documentation]    Try to add new element to layer with invalid body parameters
    Create New Layer Elements With Invalid Body Parameters
    
Create New Layer Elements With Invalid Projection
    [Documentation]    Try to add new element to layer with invalid projection
    Create New Layer Elements With Invalid Projection
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Update a Subset of Elements
    [Documentation]    Update an element (full updates like PUT method will be performed on each layer's elements)
    Update a subset of elements
    
Update a Subset of Elements With Invalid Session Id
    [Documentation]    Try to update an element with invalid session id
    Update a Subset of Elements With Invalid Session Id
    
Update a Subset of Elements With Empty Session Id
    [Documentation]    Try to update an element with empty session id
    Update a Subset of Elements With Empty Session Id
    
Update a Subset of Elements With Invalid Project Id
    [Documentation]    Try to update an element with invalid project id
    Update a Subset of Elements With Invalid Project Id
    
Update a Subset of Elements With Invalid Layer Id
    [Documentation]    Try to update an element with invalid layer id
    Update a Subset of Elements With Invalid Layer Id
    
Update a Subset of Elements With Invalid Body Parameters
    [Documentation]    Try to update an element with invalid body parameters
    Update a Subset of Elements With Invalid Body Parameters
    
Update a Subset of Elements With Invalid Projection
    [Documentation]    Try to update an element with invalid projection
    Update a Subset of Elements With Invalid Projection
    
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get a Layer Element
    [Documentation]    Get a GeoJson info for a layer element
    Get a Layer Element    

Get a Layer Element With Invalid Session Id
    [Documentation]    Try to get a GeoJson info for a layer element with invalid session id
    Get a Layer Element With Invalid Session Id
    
Get a Layer Element With Empty Session Id
    [Documentation]    Try to get a GeoJson info for a layer element with empty session id
    Get a Layer Element With Empty Session Id 
    
Get a Layer Element With Invalid Project Id
    [Documentation]    Try to get a GeoJson info for a layer element with invalid project id
    Get a Layer Element With Invalid Project Id
    
Get a Layer Element With Invalid Layer Id
    [Documentation]    Try to get a GeoJson info for a layer element with invalid layer id
    Get a Layer Element With Invalid Layer Id
    
Get a Layer Element With Invalid Element Id
    [Documentation]    Try to get a GeoJson info for a layer element with invalid element id
    Get a Layer Element With Invalid Element Id   
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Full Update of a Layer Element
    [Documentation]    Update an element in the layer
    Full Update of a Layer Element
    
Full Update of a Layer Element With Invalid Session Id
    [Documentation]    Try to update an element in the layer with invalid session id
    Full Update of a Layer Element With Invalid Session Id
    
Full Update of a Layer Element With Empty Session Id
    [Documentation]    Try to update an element in the layer with empty session id
    Full Update of a Layer Element With Empty Session Id
    
Full Update of a Layer Element With Invalid Project Id
    [Documentation]    Try to update an element in the layer with invalid project id
    Full Update of a Layer Element With Invalid Project Id
    
Full Update of a Layer Element With Invalid Layer Id
    [Documentation]    Try to update an element in the layer with invalid layer id
    Full Update of a Layer Element With Invalid Layer Id
    
Full Update of a Layer Element With Different Element Id
    [Documentation]    Try to update an element in the layer with different element id in the form and in the body
    Full Update of a Layer Element With Different Element Id
    
Full Update of a Layer Element With Invalid Element Id
    [Documentation]    Try to update an element in the layer with invalid element id
    Full Update of a Layer Element With Invalid Element Id
    
Full Update of a Layer Element With Invalid Projection Parameters
    [Documentation]    Try to update an element in the layer with invalid projection
    Full Update of a Layer Element With Invalid Projection Parameters
    
Full Update of a Layer Element With Invalid Body Parameters
    [Documentation]    Try to update an element in the layer with invalid body parameters
    Full Update of a Layer Element With Invalid Body Parameters
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get All Photos Descriptors of a Layer Element (with base64 encoded thumbnail)
    [Documentation]    Get photo information associated to an element
    Get All Photos Descriptors of a Layer Element (with base64 encoded thumbnail)
    
Get All Photos Descriptors of a Layer Element With Invalid Session Id
    [Documentation]    Try to get photo information associated to an element with invalid session id
    Get All Photos Descriptors of a Layer Element With Invalid Session Id
    
Get All Photos Descriptors of a Layer Element With Empty Session Id
    [Documentation]    Try to get photo information associated to an element with empty session id
    Get All Photos Descriptors of a Layer Element With Empty Session Id
    
Get All Photos Descriptors of a Layer Element With Invalid Project Id
    [Documentation]    Try to get photo information associated to an element with invalid project id
    Get All Photos Descriptors of a Layer Element With Invalid Project Id
    
Get All Photos Descriptors of a Layer Element With Invalid Layer Id
    [Documentation]    Try to get photo information associated to an element with invalid layer id
    Get All Photos Descriptors of a Layer Element With Invalid Layer Id
    
Get All Photos Descriptors of a Layer Element With Invalid Element Id
    [Documentation]    Try to get photo information associated to an element with invalid element id
    Get All Photos Descriptors of a Layer Element With Invalid Element Id
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Download a Specific Photo of a Layer Element
    [Documentation]    Download the photo associated to an element in the layer
    Download a Specific Photo of a Layer Element
    
# Download a Specific Photo of a Layer Element With Invalid Session Id
    # [Documentation]    Try to download the photo associated to an element in the layer with invalid session id
    # Download a Specific Photo of a Layer Element With Invalid Session Id
    
# Download a Specific Photo of a Layer Element With Empty Session Id
    # [Documentation]    Try to download the photo associated to an element in the layer with empty session id
    # Download a Specific Photo of a Layer Element With Empty Session Id
    
# Download a Specific Photo of a Layer Element With Invalid Project Id
    # [Documentation]    Try to download the photo associated to an element in the layer with invalid project id
    # Download a Specific Photo of a Layer Element With Invalid Project Id
    
# Download a Specific Photo of a Layer Element With Invalid Layer Id
    # [Documentation]    Try to download the photo associated to an element in the layer with invalid layer id
    # Download a Specific Photo of a Layer Element With Invalid Layer Id
    
# Download a Specific Photo of a Layer Element With Invalid Element Id
    # [Documentation]    Try to download the photo associated to an element in the layer with invalid element id
    # Download a Specific Photo of a Layer Element With Invalid Element Id
    
# Download a Specific Photo of a Layer Element With Invalid Photo Id
    # [Documentation]    Try to download the photo associated to an element in the layer with invalid photo id
    # Download a Specific Photo of a Layer Element With Invalid Photo Id
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get All Layer Feature Collection
    [Documentation]    Get all GeoJson feature collection of elements
    Get All Layer Feature Collection
    
Get All Layer Feature Collection With Invalid Session Id
    [Documentation]    Try to get all GeoJson feature collection of elements with invalid session id
    Get All Layer Feature Collection With Invalid Session Id
    
Get All Layer Feature Collection With Empty Session Id
    [Documentation]    Try to get all GeoJson feature collection of elements with empty session id
    Get All Layer Feature Collection With Empty Session Id
    
Get All Layer Feature Collection With Invalid Project Id
    [Documentation]    Try to get all GeoJson feature collection of elements with invalid project id
    Get All Layer Feature Collection With Invalid Project Id
    
Get All Layer Feature Collection With Invalid Layer Id
    [Documentation]    Try to get all GeoJson feature collection of elements with invalid layer id
    Get All Layer Feature Collection With Invalid Layer Id
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get All or Partial Layer Elements by Passing a Filter Parameter
    [Documentation]    Get all elements in a layer with a filter parameter
    Get All or Partial Layer Elements by Passing a Filter Parameter
    
Get All or Partial Layer Elements by Passing a Filter Parameter With Invalid Session Id
    [Documentation]    Try to get all elements in a layer with a filter parameter with invalid session id
    Get All or Partial Layer Elements by Passing a Filter Parameter With Invalid Session Id
    
Get All or Partial Layer Elements by Passing a Filter Parameter With Empty Session Id
    [Documentation]    Try to get all elements in a layer with a filter parameter with empty session id
    Get All or Partial Layer Elements by Passing a Filter Parameter With Empty Session Id
    
Get All or Partial Layer Elements by Passing a Filter Parameter With Invalid Project Id
    [Documentation]    Try to get all elements in a layer with a filter parameter with invalid project id
    Get All or Partial Layer Elements by Passing a Filter Parameter With Invalid Project Id
    
Get All or Partial Layer Elements by Passing a Filter Parameter With Invalid Layer Id
    [Documentation]    Try to get all elements in a layer with a filter parameter with invalid layer id
    Get All or Partial Layer Elements by Passing a Filter Parameter With Invalid Layer Id
    
Get All or Partial Layer Elements by Passing a Filter Parameter With Invalid Body Parameters
    [Documentation]    Try to get all elements in a layer with a filter parameter with invalid body parameters
    Get All or Partial Layer Elements by Passing a Filter Parameter With Invalid Body Parameters
    
Get All or Partial Layer Elements by Passing a Filter Parameter With Invalid Filter Attribute Parameters
    [Documentation]    Try to get all elements in a layer with a filter parameter with invalid body parameters
    Get All or Partial Layer Elements by Passing a Filter Parameter With Invalid Filter Attribute Parameters
    
Get All or Partial Layer Elements by Passing a Filter Parameter With Invalid Projection
    [Documentation]    Try to get all elements in a layer with a filter parameter with invalid projection
    Get All or Partial Layer Elements by Passing a Filter Parameter With Invalid Projection
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Delete a Layer Element
    [Documentation]    Delete an element from a layer
    Delete a Layer Element
    
Delete a Layer Element With Invalid Session Id
    [Documentation]   Try to delete an element from a layer with invalid session id
    Delete a Layer Element With Invalid Session Id 
    
Delete a Layer Element With Empty Session Id
    [Documentation]   Try to delete an element from a layer with empty session id
    Delete a Layer Element With Empty Session Id
    
Delete a Layer Element With Invalid Project Id
    [Documentation]   Try to delete an element from a layer with invalid project id
    Delete a Layer Element With Invalid Project Id
    
Delete a Layer Element With Invalid Layer Id
    [Documentation]   Try to delete an element from a layer with invalid layer id
    Delete a Layer Element With Invalid Layer Id
    
Delete a Layer Element With Invalid Element Id
    [Documentation]   Try to delete an element from a layer with invalid element id
    Delete a Layer Element With Invalid Element Id
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Delete a Subset of Layers Elements
    [Documentation]    Delete a subset of elements from a layer
    Delete a Subset of Layers Elements

Delete a Subset of Layers Elements With Invalid Session Id
    [Documentation]    Try to delete subset of elements from a layer with invalid session id
    Delete a Subset of Layers Elements With Invalid Session Id
    
Delete a Subset of Layers Elements With Empty Session Id
    [Documentation]    Try to delete subset of elements from a layer with empty session id
    Delete a Subset of Layers Elements With Empty Session Id
    
Delete a Subset of Layers Elements With Invalid Project Id
    [Documentation]    Try to delete subset of elements from a layer with invalid project id
    Delete a Subset of Layers Elements With Invalid Project Id
    
Delete a Subset of Layers Elements With Invalid Layer Id
    [Documentation]    Try to delete subset of elements from a layer with invalid layer id
    Delete a Subset of Layers Elements With Invalid Layer Id  
    
Delete a Subset of Layers Elements With Invalid Element Id
    [Documentation]    Try to delete subset of elements from a layer with invalid element id
    Delete a Subset of Layers Elements With Invalid Element Id  

#------------------------------------------------------------------------------------------------------------------------------------------------------
*** Keywords ***

Get All Layers Elements
    ${ELEMENT_COUNT}=    Get Layer Element Count    ${PROJECTID}    ${LAYERID}    
    ${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements?sessionId=${SESSIONID}    timeout=10    
           
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'Result is a GeoJson feature-collection containing ${ELEMENT_COUNT} elements'    
    
    #    Assertions
    String    $.status    OK
    String    $.message    Result is a GeoJson feature-collection containing ${ELEMENT_COUNT} elements
    String    $.result.type    FeatureCollection    

Get All Layers Elements With Invalid Session Id
    ${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements?sessionId=${INVALIDSESSIONID}    timeout=10    
            
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
     
Get All Layers Elements With Empty Session Id
    ${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements?sessionId=${EMPTY}    timeout=10    
            
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Get All Layers Elements With Invalid Project Id
    ${RESULT}=    Get    /services/rest/v2.0/projects/${INVALIDPROJECTID}/layers/${LAYERID}/elements?sessionId=${SESSIONID}    timeout=10    
            
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested project (id = ${INVALIDPROJECTID}) does not exist.'    
    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested project (id \=\ ${INVALIDPROJECTID}) does not exist.

Get All Layers Elements With Invalid Layer Id
    ${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${INVALIDLAYERID}/elements?sessionId=${SESSIONID}    timeout=10    
            
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested layer (id = ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}.'    
    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested layer (id \=\ ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}.
    
Get All Layers Elements With Invalid Projection
    ${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements?projection=${INVALIDPROJECTION}&sessionId=${SESSIONID}    timeout=10    
            
    #    Logs
    Output    Server status response must be 'Internal Server Error'    
    Output    Server message response must be 'Provided projection '${INVALIDPROJECTION}' is unknown'    
    
    #    Assertions
    String    $.status    Internal Server Error
    String    $.message    Provided projection '${INVALIDPROJECTION}' is unknown
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 

Create New Layer Elements    
    ${ELEMENT_COUNT}=    Get Layer Element Count    ${PROJECTID}    ${LAYERID} 
    ${CRITERIA}=    Catenate    {"projection": "EPSG:4326","features": [{"type": "Feature","id": "${ELEMENT_COUNT}","geometry": {"type": "Point","coordinates": [-74.57,46.52,0]},"properties": {"0": "NewCity","1": "Canada","2": "0","3": 122000},"bbox": [-74.57,46.52,-74.57,46.52]}]}
    ${RESULT}=    Post    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements?sessionId=${SESSIONID}    body=${CRITERIA}    timeout=10     
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'The result is an edition result array'    
    Output    $.result..status
    #    Assertions
    String    $.status    OK
    String    $.message    The result is an edition result array
    String    $.result..status    EDITION_STATUS_SUCCESS
    ${ELEMENTID}=    Get Element Layer Id by Name    NewCity    
    Delete    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/${ELEMENTID}?sessionId=${SESSIONID}    timeout=10    
    
Create New Layer Elements With Invalid Session Id
    ${ELEMENT_COUNT}=    Get Layer Element Count    ${PROJECTID}    ${LAYERID} 
    ${CRITERIA}=    Catenate    {"projection": "EPSG:4326","features": [{"type": "Feature","id": "${ELEMENT_COUNT}","geometry": {"type": "Point","coordinates": [-74.57,46.52,0]},"properties": {"0": "TestCity","1": "Canada","2": "0","3": 122000},"bbox": [-74.57,46.52,-74.57,46.52]}]}
    ${RESULT}=    Post    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements?sessionId=${INVALIDSESSIONID}    timeout=10    body=${CRITERIA} 
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'     
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.    
    
Create New Layer Elements With Empty Session Id
    ${ELEMENT_COUNT}=    Get Layer Element Count    ${PROJECTID}    ${LAYERID} 
    ${CRITERIA}=    Catenate    {"projection": "EPSG:4326","features": [{"type": "Feature","id": "${ELEMENT_COUNT}","geometry": {"type": "Point","coordinates": [-74.57,46.52,0]},"properties": {"0": "TestCity","1": "Canada","2": "0","3": 122000},"bbox": [-74.57,46.52,-74.57,46.52]}]}
    ${RESULT}=    Post    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements?sessionId=${EMPTY}    timeout=10    body=${CRITERIA} 
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'     
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Create New Layer Elements With Invalid Project Id
    ${ELEMENT_COUNT}=    Get Layer Element Count    ${PROJECTID}    ${LAYERID} 
    ${CRITERIA}=    Catenate    {"projection": "EPSG:4326","features": [{"type": "Feature","id": "${ELEMENT_COUNT}","geometry": {"type": "Point","coordinates": [-74.57,46.52,0]},"properties": {"0": "TestCity","1": "Canada","2": "0","3": 122000},"bbox": [-74.57,46.52,-74.57,46.52]}]}
    ${RESULT}=    Post    /services/rest/v2.0/projects/${INVALIDPROJECTID}/layers/${LAYERID}/elements?sessionId=${SESSIONID}    timeout=10    body=${CRITERIA} 
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested project (id = ${INVALIDPROJECTID}) does not exist.'     
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested project (id \=\ ${INVALIDPROJECTID}) does not exist.
    
Create New Layer Elements With Invalid Layer Id
    ${ELEMENT_COUNT}=    Get Layer Element Count    ${PROJECTID}    ${LAYERID} 
    ${CRITERIA}=    Catenate    {"projection": "EPSG:4326","features": [{"type": "Feature","id": "${ELEMENT_COUNT}","geometry": {"type": "Point","coordinates": [-74.57,46.52,0]},"properties": {"0": "TestCity","1": "Canada","2": "0","3": 122000},"bbox": [-74.57,46.52,-74.57,46.52]}]}
    ${RESULT}=    Post    /services/rest/v2.0/projects/${PROJECTID}/layers/${INVALIDLAYERID}/elements?sessionId=${SESSIONID}    timeout=10    body=${CRITERIA} 
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested layer (id = ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}.'    
    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested layer (id \=\ ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}.
    
Create New Layer Elements With Invalid Body Parameters
    ${ELEMENT_COUNT}=    Get Layer Element Count    ${PROJECTID}    ${LAYERID} 
    ${CRITERIA}=    Catenate    {"projection": "EPSG:4326","features": [{"type": "Feature","id": "${ELEMENT_COUNT}","geometry": {"type": "BAD","coordinates": [-74.57,46.52,0]},"properties": {"0": "TestCity","1": "Canada","2": "0","3": 122000},"bbox": [-74.57,46.52,-74.57,46.52]}]}
    ${RESULT}=    Post    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements?sessionId=${SESSIONID}    timeout=10    body=${CRITERIA} 
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'Provided feature collection is not good !'    
    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    Provided feature collection is not good \!\
    
Create New Layer Elements With Invalid Projection
    ${ELEMENT_COUNT}=    Get Layer Element Count    ${PROJECTID}    ${LAYERID} 
    ${CRITERIA}=    Catenate    {"projection": "BAD","features": [{"type": "Feature","id": "${ELEMENT_COUNT}","geometry": {"type": "Point","coordinates": [-74.57,46.52,0]},"properties": {"0": "TestCity","1": "Canada","2": "0","3": 122000},"bbox": [-74.57,46.52,-74.57,46.52]}]}
    ${RESULT}=    Post    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements?sessionId=${SESSIONID}    timeout=10    body=${CRITERIA} 
    #    Logs
    Output    Server status response must be 'Internal Server Error'    
    Output    Server message response must be 'The server returned the following error message:Bad projection code provided'    
    
    #    Assertions
    String    $.status    Internal Server Error
    String    $.message    The server returned the following error message\:\\nBad projection code provided
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Delete a Subset of Layers Elements
    ${CRITERIA}=    Catenate    {"projection": "EPSG:4326","features": [{"type": "Feature","id": "0","geometry": {"type": "Point","coordinates": [-74.57,46.52,0]},"properties": {"0": "Element1","1": "Canada","2": "0","3": 122000},"bbox": [-75.57,46.52,-75.57,46.52]}]}
    Post    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements?sessionId=${SESSIONID}    body=${CRITERIA}    timeout=10     
    ${VAL1}=    Get Element Layer Id by Name    Element1
    
    ${CRITERIA}=    Catenate    {"projection": "EPSG:4326","features": [{"type": "Feature","id": "0","geometry": {"type": "Point","coordinates": [-74.57,46.52,0]},"properties": {"0": "Element2","1": "Canada","2": "0","3": 122000},"bbox": [-76.57,46.52,-76.57,46.52]}]}
    Post    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements?sessionId=${SESSIONID}    body=${CRITERIA}    timeout=10     
    ${VAL2}=    Get Element Layer Id by Name    Element2
    
    ${CRITERIA}=    Catenate    {"projection": "EPSG:4326","features": [{"type": "Feature","id": "0","geometry": {"type": "Point","coordinates": [-74.57,46.52,0]},"properties": {"0": "Element3","1": "Canada","2": "0","3": 122000},"bbox": [-77.57,46.52,-77.57,46.52]}]}
    Post    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements?sessionId=${SESSIONID}    body=${CRITERIA}    timeout=10     
    ${VAL3}=    Get Element Layer Id by Name    Element3
            
    ${ELEMENTSID}=    Catenate    ${VAL1}%2C${VAL2}%2C${VAL3}         
    ${RESULT}=    Delete    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements?ids=${ELEMENTSID}&sessionId=${SESSIONID}    timeout=10    
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'The result is an edition result array'    
    
    #    Assertions
    String    $.status    OK
    String    $.message    The result is an edition result array
    String    $.result..status    EDITION_STATUS_SUCCESS
   
Delete a Subset of Layers Elements With Invalid Session Id
    ${RESULT}=    Delete    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements?ids=${ELEMENTSID}&sessionId=${INVALIDSESSIONID}    timeout=10    
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'     
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Delete a Subset of Layers Elements With Empty Session Id
    ${RESULT}=    Delete    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements?ids=${ELEMENTSID}&sessionId=${EMPTY}    timeout=10    
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'     
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Delete a Subset of Layers Elements With Invalid Project Id
    ${RESULT}=    Delete    /services/rest/v2.0/projects/${INVALIDPROJECTID}/layers/${LAYERID}/elements?ids=${ELEMENTSID}&sessionId=${SESSIONID}    timeout=10    
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested project (id = ${INVALIDPROJECTID}) does not exist.'     
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested project (id \=\ ${INVALIDPROJECTID}) does not exist.
    
Delete a Subset of Layers Elements With Invalid Layer Id
    ${RESULT}=    Delete    /services/rest/v2.0/projects/${PROJECTID}/layers/${INVALIDLAYERID}/elements?ids=${ELEMENTSID}&sessionId=${SESSIONID}    timeout=10    
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested layer (id = ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}.'    
    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested layer (id \=\ ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}.
    
Delete a Subset of Layers Elements With Invalid Element Id
    ${RESULT}=    Delete    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements?ids=${INVALIDELEMENTSID}&sessionId=${SESSIONID}    timeout=10    
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'The result is an edition result array'    
    
    #    Assertions
    String    $.status    OK
    String    $.message    The result is an edition result array
    String    $.result[2].status    EDITION_STATUS_ERROR        
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Update a Subset of Elements
    ${CRITERIA}=    Catenate    {"projection": "EPSG:4326","features": [{"type": "Feature","id": "0","geometry": {"type": "Point","coordinates": [-74.57,46.52,0]},"properties": {"0": "CityForUpdate","1": "Canada","2": "0","3": 122000},"bbox": [-75.57,46.52,-75.57,46.52]}]}
    Post    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements?sessionId=${SESSIONID}    body=${CRITERIA}    timeout=10     
    ${ELEMENTID}=    Get Element Layer Id by Name    CityForUpdate
    ${CRITERIA}=    Catenate    {"projection": "EPSG:4326","features": [{"type": "Feature","id": "${ELEMENTID}","geometry": {"type": "Point","coordinates": [-74.57,46.52,0]},"properties": {"0": "CityUpdated","1": "Canada","2": "0","3": 122000},"bbox": [-74.57,46.52,-74.57,46.52]}]}
    ${RESULT}=    Patch    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements?sessionId=${SESSIONID}    timeout=10    body=${CRITERIA} 
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'The result is an edition result array'    
    Output    $.result..status
    #    Assertions
    String    $.status    OK
    String    $.message    The result is an edition result array
    String    $.result..status    EDITION_STATUS_SUCCESS
    Delete    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/${ELEMENTID}?sessionId=${SESSIONID}    timeout=10    

Update a Subset of Elements With Invalid Session Id
    ${CRITERIA}=    Catenate    {"projection": "EPSG:4326","features": [{"type": "Feature","id": "0","geometry": {"type": "Point","coordinates": [-74.57,46.52,0]},"properties": {"0": "TestCity","1": "Canada","2": "0","3": 122000},"bbox": [-74.57,46.52,-74.57,46.52]}]}
    ${RESULT}=    Patch    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements?sessionId=${INVALIDSESSIONID}    timeout=10    body=${CRITERIA} 
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.

Update a Subset of Elements With Empty Session Id     
    ${CRITERIA}=    Catenate    {"projection": "EPSG:4326","features": [{"type": "Feature","id": "0","geometry": {"type": "Point","coordinates": [-74.57,46.52,0]},"properties": {"0": "TestCity","1": "Canada","2": "0","3": 122000},"bbox": [-74.57,46.52,-74.57,46.52]}]}
    ${RESULT}=    Patch    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements?sessionId=${EMPTY}    timeout=10    body=${CRITERIA} 
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.

Update a Subset of Elements With Invalid Project Id     
    ${CRITERIA}=    Catenate    {"projection": "EPSG:4326","features": [{"type": "Feature","id": "0","geometry": {"type": "Point","coordinates": [-74.57,46.52,0]},"properties": {"0": "TestCity","1": "Canada","2": "0","3": 122000},"bbox": [-74.57,46.52,-74.57,46.52]}]}
    ${RESULT}=    Patch    /services/rest/v2.0/projects/${INVALIDPROJECTID}/layers/${LAYERID}/elements?sessionId=${SESSIONID}    timeout=10    body=${CRITERIA} 
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested project (id = ${INVALIDPROJECTID}) does not exist.'     
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested project (id \=\ ${INVALIDPROJECTID}) does not exist. 
    
Update a Subset of Elements With Invalid Layer Id
    ${CRITERIA}=    Catenate    {"projection": "EPSG:4326","features": [{"type": "Feature","id": "0","geometry": {"type": "Point","coordinates": [-74.57,46.52,0]},"properties": {"0": "TestCity","1": "Canada","2": "0","3": 122000},"bbox": [-74.57,46.52,-74.57,46.52]}]}
    ${RESULT}=    Patch    /services/rest/v2.0/projects/${PROJECTID}/layers/${INVALIDLAYERID}/elements?sessionId=${SESSIONID}    timeout=10    body=${CRITERIA} 
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested layer (id = ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}.'    
    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested layer (id \=\ ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}.
    
Update a Subset of Elements With Invalid Body Parameters
    ${CRITERIA}=    Catenate    {"projection": "EPSG:4326","features": [{"type": "Feature","id": "0","geometry": {"type": "Points","coordinates": [-74.57,46.52,0]},"properties": {"0": "TestCity","1": "Canada","2": "0","3": 122000},"bbox": [-74.57,46.52,-74.57,46.52]}]}
    ${RESULT}=    Patch    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements?sessionId=${SESSIONID}    timeout=10    body=${CRITERIA} 
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The feature collection provided is not good !'    
    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The feature collection provided is not good \! 
    
Update a Subset of Elements With Invalid Projection
    ${CRITERIA}=    Catenate    {"projection": "BAD","features": [{"type": "Feature","id": "0","geometry": {"type": "Point","coordinates": [-74.57,46.52,0]},"properties": {"0": "TestCity","1": "Canada","2": "0","3": 122000},"bbox": [-74.57,46.52,-74.57,46.52]}]}
    ${RESULT}=    Patch    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements?sessionId=${SESSIONID}    timeout=10    body=${CRITERIA} 
    #    Logs
    Output    Server status response must be 'Internal Server Error'    
    Output    Server message response must be 'The server returned the following error message:Bad projection code provided'    
    
    #    Assertions
    String    $.status    Internal Server Error
    String    $.message    The server returned the following error message\:\\nBad projection code provided
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get a Layer Element    
    ${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/${ELEMENTID}?sessionId=${SESSIONID}    timeout=10    
           
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'Result is a GeoJson Feature element'    
    
    #    Assertions
    String    $.status    OK
    String    $.message    Result is a GeoJson Feature element
    String    $.result.type    Feature

Get a Layer Element With Invalid Session Id    
    ${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/${ELEMENTID}?sessionId=${INVALIDSESSIONID}    timeout=10    
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.

Get a Layer Element With Empty Session Id    
    ${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/${ELEMENTID}?sessionId=${EMPTY}    timeout=10    
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.

Get a Layer Element With Invalid Project Id    
    ${RESULT}=    Get    /services/rest/v2.0/projects/${INVALIDPROJECTID}/layers/${LAYERID}/elements/${ELEMENTID}?sessionId=${SESSIONID}    timeout=10    
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested project (id \=\ ${INVALIDPROJECTID}) does not exist.'    
    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested project (id \=\ ${INVALIDPROJECTID}) does not exist.

Get a Layer Element With Invalid Layer Id    
    ${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${INVALIDLAYERID}/elements/${ELEMENTID}?sessionId=${SESSIONID}    timeout=10    
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested layer (id = ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}.'    
    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested layer (id \=\ ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}.
    
Get a Layer Element With Invalid Element Id    
    ${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/${INVALIDELEMENTID}?sessionId=${SESSIONID}    timeout=10    
    #    Logs
    Output    Server status response must be 'Not Found'    
    Output    Server message response must be 'No element found with id=${INVALIDELEMENTID}'    
       
    #    Assertions
    String    $.status    Not Found
    String    $.message    No element found with id\=${INVALIDELEMENTID}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    

Full Update of a Layer Element
    ${ELEMENT_COUNT}=    Get Layer Element Count    ${PROJECTID}    ${LAYERID} 
    ${CRITERIA}=    Catenate    {"projection": "EPSG:4326","features": [{"type": "Feature","id": "${ELEMENT_COUNT}","geometry": {"type": "Point","coordinates": [-74.57,46.52,0]},"properties": {"0": "NewFullUpdateCity","1": "Canada","2": "0","3": 122000},"bbox": [-74.57,46.52,-74.57,46.52]}]}
    Post    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements?sessionId=${SESSIONID}    body=${CRITERIA}    timeout=10     
    ${ELEMENTID}=    Get Element Layer Id by Name    NewFullUpdateCity 
    ${CRITERIA}=    Catenate    {"projection": "EPSG:4326","feature": {"type": "Feature","id": "${ELEMENTID}","geometry": {"type": "Point","coordinates": [-73.57,45.52,0]},"properties": {"0": "FullUpdateCity","1": "Canada","2": "0","3": 122000},"bbox": [-73.57,45.52,-73.57,45.52]}}
    ${RESULT}=    Put    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/${ELEMENTID}?sessionId=${SESSIONID}    body=${CRITERIA}    timeout=10     
    ${VAL}    Set Variable    ${RESULT['body']}
    ${VAL}    Set Variable    ${VAL['result']}
    ${VAL}    Set Variable    ${VAL['feature']}
    ${VAL}    Set Variable    ${VAL['properties']}
    #${NAME}=    Set Variable    &{VAL}[0]
    ${VAL}=    Get From Dictionary    ${VAL}    0
    #${NAME}=    Get Variable Value    ${NAME}        
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'The result is an edition result'    
   
    #    Assertions
    String    $.status    OK
    String    $.message    The result is an edition result
    String    $.result.status    EDITION_STATUS_SUCCESS        
    Should Be Equal    ${VAL}    FullUpdateCity          
    Delete    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/${ELEMENTID}?sessionId=${SESSIONID}    timeout=10    
    
Full Update of a Layer Element With Invalid Session Id
    ${ELEMENT_COUNT}=    Get Layer Element Count    ${PROJECTID}    ${LAYERID} 
    ${CRITERIA}=    Catenate    {"projection": "EPSG:4326","feature": {"type": "Feature","id": "${ELEMENT_COUNT}","geometry": {"type": "Point","coordinates": [-73.57,45.52,0]},"properties": {"0": "TestCityUpdated","1": "Canada","2": "0","3": 122000},"bbox": [-73.57,45.52,-73.57,45.52]}}
    ${RESULT}=    Put    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/${ELEMENT_COUNT}?sessionId=${INVALIDSESSIONID}    body=${CRITERIA}    timeout=10     
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'     
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Full Update of a Layer Element With Empty Session Id
    ${ELEMENT_COUNT}=    Get Layer Element Count    ${PROJECTID}    ${LAYERID} 
    ${CRITERIA}=    Catenate    {"projection": "EPSG:4326","feature": {"type": "Feature","id": "${ELEMENT_COUNT}","geometry": {"type": "Point","coordinates": [-73.57,45.52,0]},"properties": {"0": "TestCityUpdated","1": "Canada","2": "0","3": 122000},"bbox": [-73.57,45.52,-73.57,45.52]}}
    ${RESULT}=    Put    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/${ELEMENT_COUNT}?sessionId=${EMPTY}    body=${CRITERIA}    timeout=10     
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Full Update of a Layer Element With Invalid Project Id
    ${ELEMENT_COUNT}=    Get Layer Element Count    ${PROJECTID}    ${LAYERID} 
    ${CRITERIA}=    Catenate    {"projection": "EPSG:4326","feature": {"type": "Feature","id": "${ELEMENT_COUNT}","geometry": {"type": "Point","coordinates": [-73.57,45.52,0]},"properties": {"0": "TestCityUpdated","1": "Canada","2": "0","3": 122000},"bbox": [-73.57,45.52,-73.57,45.52]}}
    ${RESULT}=    Put    /services/rest/v2.0/projects/${INVALIDPROJECTID}/layers/${LAYERID}/elements/${ELEMENT_COUNT}?sessionId=${SESSIONID}    body=${CRITERIA}    timeout=10     
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested project (id \=\ ${INVALIDPROJECTID}) does not exist.'    
    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested project (id \=\ ${INVALIDPROJECTID}) does not exist.
    
Full Update of a Layer Element With Invalid Layer Id
    ${ELEMENT_COUNT}=    Get Layer Element Count    ${PROJECTID}    ${LAYERID} 
    ${CRITERIA}=    Catenate    {"projection": "EPSG:4326","feature": {"type": "Feature","id": "${ELEMENT_COUNT}","geometry": {"type": "Point","coordinates": [-73.57,45.52,0]},"properties": {"0": "TestCityUpdated","1": "Canada","2": "0","3": 122000},"bbox": [-73.57,45.52,-73.57,45.52]}}
    ${RESULT}=    Put    /services/rest/v2.0/projects/${PROJECTID}/layers/${INVALIDLAYERID}/elements/${ELEMENT_COUNT}?sessionId=${SESSIONID}    body=${CRITERIA}    timeout=10     
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested layer (id = ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}.'    
    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested layer (id \=\ ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}.
    
Full Update of a Layer Element With Different Element Id
    ${ELEMENT_COUNT}=    Get Layer Element Count    ${PROJECTID}    ${LAYERID} 
    ${CRITERIA}=    Catenate    {"projection": "EPSG:4326","feature": {"type": "Feature","id": "${ELEMENT_COUNT}","geometry": {"type": "Point","coordinates": [-73.57,45.52,0]},"properties": {"0": "TestCityUpdated","1": "Canada","2": "0","3": 122000},"bbox": [-73.57,45.52,-73.57,45.52]}}
    ${RESULT}=    Put    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/${INVALIDELEMENTID}?sessionId=${SESSIONID}    body=${CRITERIA}    timeout=10     
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'Provided feature has not the same id as the id specified in the url'    
    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    Provided feature has not the same id as the id specified in the url
    
Full Update of a Layer Element With Invalid Element Id    
    ${CRITERIA}=    Catenate    {"projection": "EPSG:4326","feature": {"type": "Feature","id": "${INVALIDELEMENTID}","geometry": {"type": "Point","coordinates": [-73.57,45.52,0]},"properties": {"0": "TestCityUpdated","1": "Canada","2": "0","3": 122000},"bbox": [-73.57,45.52,-73.57,45.52]}}
    ${RESULT}=    Put    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/${INVALIDELEMENTID}?sessionId=${SESSIONID}    body=${CRITERIA}    timeout=10     
    #    Logs
    Output    Server status response must be 'OK'
    Output    Server message response must be    'The result is an edition result'    
    Output    Result message response must be 'The element id [${INVALIDELEMENTID}] could not be update in the geometry table.'    
      
    #    Assertions
    String    $.status    OK
    String    $.message    The result is an edition result
    String    $.result.message    The element id \[${INVALIDELEMENTID}\] could not be update in the geometry table.
    String    $.result.status    EDITION_STATUS_ERROR 
    
Full Update of a Layer Element With Invalid Projection Parameters
    ${ELEMENT_COUNT}=    Get Layer Element Count    ${PROJECTID}    ${LAYERID}    
    ${CRITERIA}=    Catenate    {"projection": "${INVALIDPROJECTION}","feature": {"type": "Feature","id": "${ELEMENT_COUNT}","geometry": {"type": "Point","coordinates": [-73.57,45.52,0]},"properties": {"0": "TestCityUpdated","1": "Canada","2": "0","3": 122000},"bbox": [-73.57,45.52,-73.57,45.52]}}
    ${RESULT}=    Put    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/${ELEMENT_COUNT}?sessionId=${SESSIONID}    body=${CRITERIA}    timeout=10     
    #    Logs
    Output    Server status response must be 'Internal Server Error'    
    Output    Server message response must be 'The server returned the following error message: Bad projection code provided'    
    
    #    Assertions
    String    $.status    Internal Server Error
    String    $.message    The server returned the following error message\:\\nBad projection code provided

Full Update of a Layer Element With Invalid Body Parameters
    ${ELEMENT_COUNT}=    Get Layer Element Count    ${PROJECTID}    ${LAYERID}    
    ${CRITERIA}=    Catenate    {"projection": "EPSG:4326","feature": {"type": "Feature","id": "${ELEMENT_COUNT}","geometry": {"type": "WrongType","coordinates": [-73.57,45.52,0]},"properties": {"0": "TestCityUpdated","1": "Canada","2": "0","3": 122000},"bbox": [-73.57,45.52,-73.57,45.52]}}
    ${RESULT}=    Put    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/${ELEMENT_COUNT}?sessionId=${SESSIONID}    body=${CRITERIA}    timeout=10     
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'Provided feature is not good'    
    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    Provided feature is not good                  

Delete a Layer Element
    ${CRITERIA}=    Catenate    {"projection": "EPSG:4326","features": [{"type": "Feature","id": "0","geometry": {"type": "Point","coordinates": [-74.57,46.52,0]},"properties": {"0": "ElementForDelete","1": "Canada","2": "0","3": 122000},"bbox": [-75.57,46.52,-75.57,46.52]}]}
    Post    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements?sessionId=${SESSIONID}    body=${CRITERIA}    timeout=10     
    ${VAL}=    Get Element Layer Id by Name    ElementForDelete
    #${VAL}=    Convert To Integer    ${VAL}    
    ${RESULT}=    Delete    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/${VAL}?sessionId=${SESSIONID}    timeout=10    
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'The result is an edition result'    
    
    #    Assertions
    String    $.status    OK
    String    $.message    The result is an edition result
    String    $.result.status    EDITION_STATUS_SUCCESS

Delete a Layer Element With Invalid Session Id
    ${ELEMENT_COUNT}=    Get Layer Element Count    ${PROJECTID}    ${LAYERID}
    ${RESULT}=    Delete    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/${ELEMENT_COUNT}?sessionId=${INVALIDSESSIONID}    timeout=10    
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'     
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Delete a Layer Element With Empty Session Id
    ${ELEMENT_COUNT}=    Get Layer Element Count    ${PROJECTID}    ${LAYERID}
    ${RESULT}=    Delete    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/${ELEMENT_COUNT}?sessionId=${EMPTY}    timeout=10    
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'     
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Delete a Layer Element With Invalid Project Id
    ${ELEMENT_COUNT}=    Get Layer Element Count    ${PROJECTID}    ${LAYERID}
    ${RESULT}=    Delete    /services/rest/v2.0/projects/${INVALIDPROJECTID}/layers/${LAYERID}/elements/${ELEMENT_COUNT}?sessionId=${SESSIONID}    timeout=10    
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested project (id = ${INVALIDPROJECTID}) does not exist.'     
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested project (id \=\ ${INVALIDPROJECTID}) does not exist.
    
Delete a Layer Element With Invalid Layer Id
    ${ELEMENT_COUNT}=    Get Layer Element Count    ${PROJECTID}    ${LAYERID}
    ${RESULT}=    Delete    /services/rest/v2.0/projects/${PROJECTID}/layers/${INVALIDLAYERID}/elements/${ELEMENT_COUNT}?sessionId=${SESSIONID}    timeout=10    
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested layer (id = ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}.'    
    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested layer (id \=\ ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}.
    
Delete a Layer Element With Invalid Element Id
    ${RESULT}=    Delete    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/${INVALIDELEMENTID}?sessionId=${SESSIONID}    timeout=10    
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'The result is an edition result'    
    
    #    Assertions
    String    $.status    OK
    String    $.message    The result is an edition result
    String    $.result.message    elementId not found \!
    String    $.result.status    EDITION_STATUS_ERROR
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get All Photos Descriptors of a Layer Element (with base64 encoded thumbnail)
    ${CRITERIA}=    Catenate    {"projection": "EPSG:4326","features": [{"type": "Feature","id": "0","geometry": {"type": "Point","coordinates": [-74.57,46.52,0]},"properties": {"0": "ElementForPhoto","1": "Canada","2": "0","3": 122000},"bbox": [-75.57,46.52,-75.57,46.52]}]}
    Post    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements?sessionId=${SESSIONID}    body=${CRITERIA}    timeout=10     
    ${ELEMENTID}=    Get Element Layer Id by Name    ElementForPhoto
    
    ${FORMID}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms?sessionId=${SESSIONID}    
    ${FORMID}    Integer    $.result[0].id
    ${FORMID}    Catenate    ${FORMID}[0]
    Put    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos?sessionId=${SESSIONID}    timeout=10    body={"elementId": ${ELEMENTID},"comment": "New Comment","title": "New Title","imageBase64": "iVBORw0KGgoAAAANSUhEUgAAADEAAAAKCAYAAAAdIbZyAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAATKSURBVEhLxVVrTFRXEP7u3rsPARcKUn9UtFqjUdLYB0aDGpLiI41KU39YirZgTakIpW1qi2haSolFjbGkiU0b4w+baC1pU5tWC0WgdpH3CouyQkB57PLcBXZld9ld9t7TOXfpI4390R9tJ7n3zJmZc2a+OWfmCOP3gwz/IzE2514QIIS5B9JvdgLZ/ZU06p8MREkLg0ELnU6riv4L4oFpJAkPGXUQiP+7bHK7iEgdIufp/gD9J9KoAHQ6DHW347vyr3C9rhlR8zkQATq9FpIkchNIWgJIc54JzmvpC+t4AiQVPNcJGpHk4blGQ1kjmZZ4bs9JXTuXKI0oIeAaR8GRU4giIJKohhP29XsyBRhJV/3NJXxd24Zo4rmRREnXzJ2KehJ6A1B54SyutY/j/OkPcfZbM+LnSzBV/ICegVHEGrXo7WhCdUUVZkMKerutsDSZ0G8fQwxt6rR1ofqna9DoJPgmRzDYfw911VXw0k01aBW0/FyF5pabiKDk9Foa0FDfDH0kB62BEpyByVSPltZWOF0+2k8Lm7UVtTW/YB7ZRxgE3Kg1ob31puqv4ZpJBdxvbcGYy6sCEd8pfO8DrV7Erbpa6BevRcysHY8mpaLi8yK0jOlx7lQpEtesQOarRVi46BEkJ63Ezu3piHk4Hh+dPIvUDauRnVcMMeTBlz+2Y1l0EDkFZRB8Dlw2dQH2Rpy42IDlyxKgjPei8HQ5HD1m3HbqsXXdY/B5vLh4oRyRBj1OlJ3H5vWL8FJ+GXReG652TGPWWokzl80IuEexKmkjzhzJw+bXDmDX0+uQcegIIgV5riaIREkHa0MlLtWPYU/KclRXNSIuNgrbtiQjYsFqHM7egca6Org8IQKwGEcP5WHJfIYmUyMSntiE0uMlGO6ywONnSEpJxbGSN+EesWHH3hwkLzHA3NGDdnMbImNisSoxEfERBijkV5FDMEQvxNHDbyGGTeDqletITd+P4x8Xoub7CnRa76L45ElkpW2AwxdCSVE+SgtKYUxOx0ojEFKorjgAXire+y5s3vsGijMex9ufXEF27suwWjox7BERrwyirW8CHscwHNMB6BU39mYdwJS0AGm7n8fk7evYkbYHTz6zBUa9jBl/AO7paao1CTdqquEXdOi+ZUXytp0IOGzoszuxYmUCgiF+4wVMT9iQvicHiE9E5r4M1J4/hbTtB7EvNxObUtbi9awMlF2sgSDPYuOuV1D5xWc4mLsfniCPnupi3B1gDk+IDY442KDTz2Zkxsyd/WyWKvbeoJ112SeZO8jYnd4BZnMRI8+wp1J2s54RJ5sIMFXnCcwya/8ooykbcd5nd0fczDntZ71DE2yCRkt3H5sipU9hbNLtYZYeG3N6Fcbb+5jLx+xTfmYbdTA3OaVwmMvrY3cGHWoMHvp6BoaY2y+zAaeXhcj/0oQ1qtxB6/ke4XeCqp13FTpctTuI1CVCIZlGST0nRVGok3A9NQFlBvnvHsex0yXQ01UIyQqt1UCkApPJjncj3pQUfswkp7gh8lGR52Si2rVkWVb348TtOHE/FJs6550ubEOFS74ZU2CMkvDC1mfx4vuf4rn1S+H2BcMd8R89duSAkYM42myKaoM7fdDj828RT3AcdS+Kna5sGAAA/ArsfWjMREMYtAAAAABJRU5ErkJggg=="}
    
    ${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/${ELEMENTID}/photos?sessionId=${SESSIONID}    timeout=10    
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'The result is an array containing all photos'    
    ${PHOTOID}    Integer    $.result[0].id
    ${PHOTOID}    Catenate    ${PHOTOID}[0]    
    ${FORMID}    Integer    $.result[0].formId
    ${FORMID}    Catenate    ${FORMID}[0]
    #    Assertions
    String    $.status    OK
    String    $.message    The result is an array containing all photos
                
    Set Global Variable    ${PHOTOID}
    Delete    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos/${PHOTOID}?sessionId=${SESSIONID}    timeout=10
    Delete    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/${ELEMENTID}?sessionId=${SESSIONID}    timeout=10    
    
Get All Photos Descriptors of a Layer Element With Invalid Session Id
    ${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/${ELEMENTID}/photos?sessionId=${INVALIDSESSIONID}    timeout=10    
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'     
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Get All Photos Descriptors of a Layer Element With Empty Session Id
    ${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/${ELEMENTID}/photos?sessionId=${EMPTY}    timeout=10    
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'     
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Get All Photos Descriptors of a Layer Element With Invalid Project Id
    ${RESULT}=    Get    /services/rest/v2.0/projects/${INVALIDPROJECTID}/layers/${LAYERID}/elements/${ELEMENTID}/photos?sessionId=${SESSIONID}    timeout=10    
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested project (id = ${INVALIDPROJECTID}) does not exist.'     
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested project (id \=\ ${INVALIDPROJECTID}) does not exist.
    
Get All Photos Descriptors of a Layer Element With Invalid Layer Id
    ${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${INVALIDLAYERID}/elements/${ELEMENTID}/photos?sessionId=${SESSIONID}    timeout=10    
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested layer (id = ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}.'    
    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested layer (id \=\ ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}.
    
Get All Photos Descriptors of a Layer Element With Invalid Element Id
    ${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/${INVALIDELEMENTID}/photos?sessionId=${SESSIONID}    timeout=10    
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'The result is an array containing all photos'
    
    ${RESULT}    Set Variable    ${RESULT['body']}
    ${RESULT}    Set Variable    ${RESULT['result']}     
    ${LENGTH}=    Get Length    ${RESULT}
    #    Assertions
    Should Be Empty    ${RESULT}    
    String    $.status    OK
    String    $.message    The result is an array containing all photos
            
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Download a Specific Photo of a Layer Element
    ${CRITERIA}=    Catenate    {"projection": "EPSG:4326","features": [{"type": "Feature","id": "0","geometry": {"type": "Point","coordinates": [-74.57,46.52,0]},"properties": {"0": "ElementForDownload","1": "Canada","2": "0","3": 122000},"bbox": [-75.57,46.52,-75.57,46.52]}]}
    Post    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements?sessionId=${SESSIONID}    body=${CRITERIA}    timeout=10     
    ${ELEMENTID}=    Get Element Layer Id by Name    ElementForDownload
    
    ${FORMID}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms?sessionId=${SESSIONID}    
    ${FORMID}    Integer    $.result[0].id
    ${FORMID}    Catenate    ${FORMID}[0]
    Put    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos?sessionId=${SESSIONID}    timeout=10    body={"elementId": ${ELEMENTID},"comment": "New Comment","title": "New Title","imageBase64": "iVBORw0KGgoAAAANSUhEUgAAADEAAAAKCAYAAAAdIbZyAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAATKSURBVEhLxVVrTFRXEP7u3rsPARcKUn9UtFqjUdLYB0aDGpLiI41KU39YirZgTakIpW1qi2haSolFjbGkiU0b4w+baC1pU5tWC0WgdpH3CouyQkB57PLcBXZld9ld9t7TOXfpI4390R9tJ7n3zJmZc2a+OWfmCOP3gwz/IzE2514QIIS5B9JvdgLZ/ZU06p8MREkLg0ELnU6riv4L4oFpJAkPGXUQiP+7bHK7iEgdIufp/gD9J9KoAHQ6DHW347vyr3C9rhlR8zkQATq9FpIkchNIWgJIc54JzmvpC+t4AiQVPNcJGpHk4blGQ1kjmZZ4bs9JXTuXKI0oIeAaR8GRU4giIJKohhP29XsyBRhJV/3NJXxd24Zo4rmRREnXzJ2KehJ6A1B54SyutY/j/OkPcfZbM+LnSzBV/ICegVHEGrXo7WhCdUUVZkMKerutsDSZ0G8fQwxt6rR1ofqna9DoJPgmRzDYfw911VXw0k01aBW0/FyF5pabiKDk9Foa0FDfDH0kB62BEpyByVSPltZWOF0+2k8Lm7UVtTW/YB7ZRxgE3Kg1ob31puqv4ZpJBdxvbcGYy6sCEd8pfO8DrV7Erbpa6BevRcysHY8mpaLi8yK0jOlx7lQpEtesQOarRVi46BEkJ63Ezu3piHk4Hh+dPIvUDauRnVcMMeTBlz+2Y1l0EDkFZRB8Dlw2dQH2Rpy42IDlyxKgjPei8HQ5HD1m3HbqsXXdY/B5vLh4oRyRBj1OlJ3H5vWL8FJ+GXReG652TGPWWokzl80IuEexKmkjzhzJw+bXDmDX0+uQcegIIgV5riaIREkHa0MlLtWPYU/KclRXNSIuNgrbtiQjYsFqHM7egca6Org8IQKwGEcP5WHJfIYmUyMSntiE0uMlGO6ywONnSEpJxbGSN+EesWHH3hwkLzHA3NGDdnMbImNisSoxEfERBijkV5FDMEQvxNHDbyGGTeDqletITd+P4x8Xoub7CnRa76L45ElkpW2AwxdCSVE+SgtKYUxOx0ojEFKorjgAXire+y5s3vsGijMex9ufXEF27suwWjox7BERrwyirW8CHscwHNMB6BU39mYdwJS0AGm7n8fk7evYkbYHTz6zBUa9jBl/AO7paao1CTdqquEXdOi+ZUXytp0IOGzoszuxYmUCgiF+4wVMT9iQvicHiE9E5r4M1J4/hbTtB7EvNxObUtbi9awMlF2sgSDPYuOuV1D5xWc4mLsfniCPnupi3B1gDk+IDY442KDTz2Zkxsyd/WyWKvbeoJ112SeZO8jYnd4BZnMRI8+wp1J2s54RJ5sIMFXnCcwya/8ooykbcd5nd0fczDntZ71DE2yCRkt3H5sipU9hbNLtYZYeG3N6Fcbb+5jLx+xTfmYbdTA3OaVwmMvrY3cGHWoMHvp6BoaY2y+zAaeXhcj/0oQ1qtxB6/ke4XeCqp13FTpctTuI1CVCIZlGST0nRVGok3A9NQFlBvnvHsex0yXQ01UIyQqt1UCkApPJjncj3pQUfswkp7gh8lGR52Si2rVkWVb348TtOHE/FJs6550ubEOFS74ZU2CMkvDC1mfx4vuf4rn1S+H2BcMd8R89duSAkYM42myKaoM7fdDj828RT3AcdS+Kna5sGAAA/ArsfWjMREMYtAAAAABJRU5ErkJggg=="}
    
    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/${ELEMENTID}/photos?sessionId=${SESSIONID}    timeout=10    
      
    ${PHOTOID}    Integer    $.result[0].id
    ${PHOTOID}    Catenate    ${PHOTOID}[0]
    
    ${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/${ELEMENTID}/photos/${PHOTOID}?sessionId=${SESSIONID}    timeout=10
   
    Expect Response    {"headers":{"content-type": "image/png"}}    
    
    Delete    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos/${PHOTOID}?sessionId=${SESSIONID}    timeout=10
    Delete    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/${ELEMENTID}?sessionId=${SESSIONID}    timeout=10    
    
#Download a specific photo of a layer element with invalid session id
    #Get all photos descriptors of a layer element (with base64 encoded thumbnail)
    #${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/${ELEMENTID}/photos/${PHOTOID}?sessionId=${INVALIDSESSIONID}    timeout=10
    #TODO When the issue TFIFT-9316 is fixed
    
#Download a specific photo of a layer element with empty session id
    #Get all photos descriptors of a layer element (with base64 encoded thumbnail)
    #${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/${ELEMENTID}/photos/${PHOTOID}?sessionId=${EMPTY}    timeout=10
    #TODO When the issue TFIFT-9316 is fixed 
    
#Download a specific photo of a layer element with invalid project id
    #Get all photos descriptors of a layer element (with base64 encoded thumbnail)
    #${RESULT}=    Get    /services/rest/v2.0/projects/${INVALIDPROJECTID}/layers/${LAYERID}/elements/${ELEMENTID}/photos/${PHOTOID}?sessionId=${SESSIONID}    timeout=10
    #TODO When the issue TFIFT-9316 is fixed 
    
#Download a specific photo of a layer element with invalid layer id
    #Get all photos descriptors of a layer element (with base64 encoded thumbnail)
    #${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${INVALIDLAYERID}/elements/${ELEMENTID}/photos/${PHOTOID}?sessionId=${SESSIONID}    timeout=10
    #TODO When the issue TFIFT-9316 is fixed 
    
#Download a specific photo of a layer element with invalid element id
    #Get all photos descriptors of a layer element (with base64 encoded thumbnail)
    #${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/${INVALIDELEMENTID}/photos/${PHOTOID}?sessionId=${SESSIONID}    timeout=10
    #TODO When the issue TFIFT-9316 is fixed
    
#Download a specific photo of a layer element with invalid photo id
    #Get all photos descriptors of a layer element (with base64 encoded thumbnail)
    #${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/${ELEMENTID}/photos/${INVALIDPHOTOID}?sessionId=${SESSIONID}    timeout=10
    #TODO When the issue TFIFT-9316 is fixed     
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get All Layer Feature Collection
    ${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/elements.geojson?sessionId=${SESSIONID}    timeout=10    
    String    $.type    FeatureCollection
    
Get All Layer Feature Collection With Invalid Session Id
    ${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/elements.geojson?sessionId=${INVALIDSESSIONID}    timeout=10    
    
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'     
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id. 
    
Get All Layer Feature Collection With Empty Session Id
    ${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/elements.geojson?sessionId=${EMPTY}    timeout=10    
    
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'     
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Get All Layer Feature Collection With Invalid Project Id
    ${RESULT}=    Get    /services/rest/v2.0/projects/${INVALIDPROJECTID}/layers/${LAYERID}/elements/elements.geojson?sessionId=${SESSIONID}    timeout=10    
    
     #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested project (id = ${INVALIDPROJECTID}) does not exist.'     
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested project (id \=\ ${INVALIDPROJECTID}) does not exist.
    
Get All Layer Feature Collection With Invalid Layer Id
    ${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${INVALIDLAYERID}/elements/elements.geojson?sessionId=${SESSIONID}    timeout=10    
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested layer (id = ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}.'    
    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested layer (id \=\ ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}.
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get All or Partial Layer Elements by Passing a Filter Parameter
    ${CRITERIA}=    Catenate    {"attributeFilters": [{"logicalOperator": 0,"attributeName": "CITY","attributeType": 12,"values": [ "Paris", "La Havana" ]}],"geometryTypeFilters": [{"logicalOperator": 0,"type": 1}],"spatialFilters": [{"logicalOperator": 0,"projection": "EPSG:4326","operationType": 0,"geometry": {"type": "Polygon","coordinates": [ [ -180, -90], [ -180, 90 ], [ 180, 90 ], [ 180, -90], [ -180, -90] ]}}],"projection": "EPSG:4326"}
    ${RESULT}=    Post    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/filter?sessionId=${SESSIONID}    body=${CRITERIA}    timeout=10     
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'Result is a GeoJson feature-collection containing 2 elements'    
        #    Assertions
    String    $.status    OK
    String    $.message    Result is a GeoJson feature-collection containing 2 elements
    String    $.result.type    FeatureCollection

Get All or Partial Layer Elements by Passing a Filter Parameter With Invalid Session Id
    ${CRITERIA}=    Catenate    {"attributeFilters": [{"logicalOperator": 0,"attributeName": "CITY","attributeType": 12,"values": [ "Paris", "La Havana" ]}],"geometryTypeFilters": [{"logicalOperator": 0,"type": 1}],"spatialFilters": [{"logicalOperator": 0,"projection": "EPSG:4326","operationType": 0,"geometry": {"type": "Polygon","coordinates": [ [ -180, -90], [ -180, 90 ], [ 180, 90 ], [ 180, -90], [ -180, -90] ]}}],"projection": "EPSG:4326"}
    ${RESULT}=    Post    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/filter?sessionId=${INVALIDSESSIONID}    body=${CRITERIA}    timeout=10     
    
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'     
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id. 

Get All or Partial Layer Elements by Passing a Filter Parameter With Empty Session Id
    ${CRITERIA}=    Catenate    {"attributeFilters": [{"logicalOperator": 0,"attributeName": "CITY","attributeType": 12,"values": [ "Paris", "La Havana" ]}],"geometryTypeFilters": [{"logicalOperator": 0,"type": 1}],"spatialFilters": [{"logicalOperator": 0,"projection": "EPSG:4326","operationType": 0,"geometry": {"type": "Polygon","coordinates": [ [ -180, -90], [ -180, 90 ], [ 180, 90 ], [ 180, -90], [ -180, -90] ]}}],"projection": "EPSG:4326"}
    ${RESULT}=    Post    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/filter?sessionId=${EMPTY}    body=${CRITERIA}    timeout=10     
    
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'     
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Get All or Partial Layer Elements by Passing a Filter Parameter With Invalid Project Id
    ${CRITERIA}=    Catenate    {"attributeFilters": [{"logicalOperator": 0,"attributeName": "CITY","attributeType": 12,"values": [ "Paris", "La Havana" ]}],"geometryTypeFilters": [{"logicalOperator": 0,"type": 1}],"spatialFilters": [{"logicalOperator": 0,"projection": "EPSG:4326","operationType": 0,"geometry": {"type": "Polygon","coordinates": [ [ -180, -90], [ -180, 90 ], [ 180, 90 ], [ 180, -90], [ -180, -90] ]}}],"projection": "EPSG:4326"}
    ${RESULT}=    Post    /services/rest/v2.0/projects/${INVALIDPROJECTID}/layers/${LAYERID}/elements/filter?sessionId=${SESSIONID}    body=${CRITERIA}    timeout=10     
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested project (id = ${INVALIDPROJECTID}) does not exist.'     
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested project (id \=\ ${INVALIDPROJECTID}) does not exist.
    
Get All or Partial Layer Elements by Passing a Filter Parameter With Invalid Layer Id
    ${CRITERIA}=    Catenate    {"attributeFilters": [{"logicalOperator": 0,"attributeName": "CITY","attributeType": 12,"values": [ "Paris", "La Havana" ]}],"geometryTypeFilters": [{"logicalOperator": 0,"type": 1}],"spatialFilters": [{"logicalOperator": 0,"projection": "EPSG:4326","operationType": 0,"geometry": {"type": "Polygon","coordinates": [ [ -180, -90], [ -180, 90 ], [ 180, 90 ], [ 180, -90], [ -180, -90] ]}}],"projection": "EPSG:4326"}
    ${RESULT}=    Post    /services/rest/v2.0/projects/${PROJECTID}/layers/${INVALIDLAYERID}/elements/filter?sessionId=${SESSIONID}    body=${CRITERIA}    timeout=10     
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested layer (id = ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}.'    
    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested layer (id \=\ ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}.
    
Get All or Partial Layer Elements by Passing a Filter Parameter With Invalid Body Parameters
    ${ELEMENT_COUNT}=    Get Layer Element Count    ${PROJECTID}    ${LAYERID} 
    ${CRITERIA}=    Catenate    {"attributeFilters": [{"logicalOperator": 0,"attributeName": "CITY","attributeType": 12,"values": [ "Paris", "La Havana" ]}],"geometryTypeFilters": [{"logicalOperator": 0,"type": 1}],"spatialFilters": [{"logicalOperator": 0,"projection": "EPSG:4326","operationType": 0,"geometry": {"type": "${INVALIDFILTERTYPE}","coordinates": [ [ -180, -90], [ -180, 90 ], [ 180, 90 ], [ 180, -90], [ -180, -90] ]}}],"projection": "EPSG:4326"}
    ${RESULT}=    Post    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/filter?sessionId=${SESSIONID}    body=${CRITERIA}    timeout=10     
    #    Logs
    Output    Server status response must be 'Internal Server Error'    
    Output    Server message response must be 'The server returned the following error message:null'    
    
    #    Assertions
    String    $.status    Internal Server Error
    String    $.message    The server returned the following error message\:\\nnull

Get all or partial layer elements by passing a filter parameter with invalid filter attribute parameters
    ${ELEMENT_COUNT}=    Get Layer Element Count    ${PROJECTID}    ${LAYERID} 
    ${CRITERIA}=    Catenate    {"attributeFilters": [{"logicalOperator": 0,"attributeName": "${INVALIDATTRIBUTE}","attributeType": 12,"values": [ "Paris", "La Havana" ]}],"geometryTypeFilters": [{"logicalOperator": 0,"type": 1}],"spatialFilters": [{"logicalOperator": 0,"projection": "EPSG:4326","operationType": 0,"geometry": {"type": "Polygon","coordinates": [ [ -180, -90], [ -180, 90 ], [ 180, 90 ], [ 180, -90], [ -180, -90] ]}}],"projection": "EPSG:4326"}
    ${RESULT}=    Post    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/filter?sessionId=${SESSIONID}    body=${CRITERIA}    timeout=10     
    #    Logs
    Output    Server status response must be 'Internal Server Error'    
    Output    Server message response must be 'The server returned the following error message: Column '${INVALIDATTRIBUTE}' is either not in any table in the FROM list or appears within a join specification and is outside the scope of the join specification or appears in a HAVING clause and is not in the GROUP BY list. If this is a CREATE or ALTER TABLE statement then '${INVALIDATTRIBUTE}' is not a column in the target table.'    
    
    #    Assertions
    String    $.status    Internal Server Error
    #String    $.message    The server returned the following error message\:\\nColumn \'${INVALIDATTRIBUTE}\' is either not in any table in the FROM list or appears within a join specification and is outside the scope of the join specification or appears in a HAVING clause and is not in the GROUP BY list. If this is a CREATE or ALTER TABLE statement then 'INVALID' is not a column in the target table.    
    
Get All or Partial Layer Elements by Passing a Filter Parameter With Invalid Projection
    ${ELEMENT_COUNT}=    Get Layer Element Count    ${PROJECTID}    ${LAYERID} 
    ${CRITERIA}=    Catenate    {"attributeFilters": [{"logicalOperator": 0,"attributeName": "CITY","attributeType": 12,"values": [ "Paris", "La Havana" ]}],"geometryTypeFilters": [{"logicalOperator": 0,"type": 1}],"spatialFilters": [{"logicalOperator": 0,"projection": "EPSG:4326","operationType": 0,"geometry": {"type": "Polygon","coordinates": [ [ -180, -90], [ -180, 90 ], [ 180, 90 ], [ 180, -90], [ -180, -90] ]}}],"projection": "${INVALIDPROJECTION}"}
    ${RESULT}=    Post    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements/filter?sessionId=${SESSIONID}    body=${CRITERIA}    timeout=10     
    #    Logs
    Output    Server status response must be 'Internal Server Error'    
    Output    Server message response must be 'Provided projection '${INVALIDPROJECTION}' is unknown'   
    
    #    Assertions
    String    $.status    Internal Server Error
    String    $.message    Provided projection '${INVALIDPROJECTION}' is unknown
           
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Start Up
    [Documentation]    Precondotion for running the Elements endpoints
    Login JMap Admin    administrator    ${EMPTY}    English    ${JMAPADMIN}    0.5
    Go to Spatial Datasources
    Update One SDS    ${SDS_LIST[0]}
    Update One SDS    ${SDS_LIST[1]}
    Update One SDS    ${SDS_LIST[2]}
    Update One SDS    ${SDS_LIST[3]}
    Update One SDS    ${SDS_LIST[4]}
    Update One SDS    ${SDS_LIST[5]}
    Go to Projects
    Open Project    The World
    Go to Layers Page
    Go to Layer Details    ${LAYERNAME}
    Go to Layer Permissions Page
    ${EXISTUSER}=    Exist Element in JMap Table Component td    theForm:tabViewPermissionsOwners:tblPrincipals    administrator
    Run Keyword If    '${EXISTUSER}'!='${True}'    Add Permissions to a User    administrator    Add elements    Modify attribute values    Modify elements    Delete elements            
    Run Keyword If    '${EXISTUSER}'!='${True}'    Clicks on Save Permissions
    Go to Forms Page
    ${EXISTFORM}=    Exist Element in JMap Table Component a    theForm:tabViewForms:tblForms   Attribute Form    
    Run Keyword If    '${EXISTFORM}'=='${True}'    Delete Attribute Form    Attribute Form    
    Create Attribute Form    Attribute Form    
    Add Component for an Attribute    Photo form    PHOTO    0    0    ${False}    ${True}    JMap    Database    ${True}    PostgresDB    public.phototable    id    objectid    filename    photo    title    comment    C:\    
    Save Form Layout
    Page Should Contain    Attribute Form
    Open Session    ${USERNAME}    ${PASSWORD}    ${TYPE}
       

Suite Down
    [Documentation]    Close REST API and JMap Admin sessions
    Close session    ${SESSIONID}
    Logout JMap    ${True}
    
Get Element Layer Id by Name    [Arguments]    ${ELEMENT_NAME}
    ${RESULT}=    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/elements?sessionId=${SESSIONID}    timeout=10    
    ${RESULT}    Set Variable    ${RESULT['body']}
    ${RESULT}    Set Variable    ${RESULT['result']}
    ${RESULT}    Set Variable    ${RESULT['features']}
    
    ${TEMP}    Set Variable    ${EMPTY}
    :FOR    ${item}    IN    @{RESULT}
    \    ${TEMP}    Set Variable    ${item['properties']}    
    \    ${TEMP}    Set Variable    ${TEMP['0']} 
    \    Run Keyword If    "${TEMP}" == "${ELEMENT_NAME}"    Return From Keyword    ${item['id']}   
     
                      