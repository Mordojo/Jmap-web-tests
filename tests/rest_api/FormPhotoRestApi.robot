*** Setting ***

Documentation    Tests for Photo Form REST API in JMap 7 
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
Resource    ../../common/admin/CommonDatabase.robot
Resource    ../../common/admin/CommonSpatialDataSource.robot
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Suite Setup    Start Up    #Create Attribute Form with Photo components. Open a session before the suite
Suite Teardown    Suite Down        #Close the session after the suite
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
${FORMID}    ${EMPTY}
${PHOTOID}    0
${INVALIDFORMID}    -3
${INVALIDPHOTOID}    -3
${ELEMENTID}    645
${INVALIDELEMENTID}    -3
${OBJECTID}    8    #objectid of the photo saved in the Database
${INVALIDOBJECTID}    -3
${PHOTOTITLE}    title on photo
${PHOTOCOMMENT}    comment on photo
${JMAPADMIN}    http://192.168.0.25:8080
${DBNAME}    PostgresPhoto
@{SDS_LIST}=    World Cities    World Continent Names    World Countries    World Hydro    World Lakes    World Ocean Names
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Test Cases ***

Add a New Photo
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Add a new photo (supported format are JPEG, PNG or GIF) endpoint
    ...    PUT endpoint that receive project id, layer id, form id and body with element id, title, comment and imageBase64
    Add a New Photo
    
Add a New Database Photo
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Add a new photo (supported format are JPEG, PNG or GIF) endpoint
    ...    PUT endpoint that receive project id, layer id, database form id and body with element id, title, comment and imageBase64
    Add a New Database Photo
    
Add a New Photo With Invalid Session Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Add a new photo (supported format are JPEG, PNG or GIF) endpoint
    ...    with invalid session id    
    Add a New Photo With Invalid Session Id
    
Add a New Photo With Empty Session Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Add a new photo (supported format are JPEG, PNG or GIF) endpoint
    ...    with empty session id 
    Add a New Photo With Empty Session Id

Add a New Photo With Invalid Project Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Add a new photo (supported format are JPEG, PNG or GIF) endpoint
    ...    with invalid project id 
    Add a New Photo With Invalid Project Id
    
Add a New Photo With Invalid Layer Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Add a new photo (supported format are JPEG, PNG or GIF) endpoint
    ...    with invalid layer id 
    Add a New Photo With Invalid Layer Id
    
Add a New Photo With Invalid Form Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Add a new photo (supported format are JPEG, PNG or GIF) endpoint
    ...    with invalid form id 
    Add a New Photo With Invalid Form Id

Add a New Photo With Invalid Image
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Add a new photo (supported format are JPEG, PNG or GIF) endpoint
    ...    with invalid image 
    Add a New Photo With Invalid Image

Add a New Photo With Invalid Image Format
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Add a new photo (supported format are JPEG, PNG or GIF) endpoint
    ...    with invalid image format 
    Add a New Photo With Invalid Image Format
    
Add a New Photo With Empty Image
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Add a new photo (supported format are JPEG, PNG or GIF) endpoint
    ...    with empty image 
    Add a New Photo With Empty Image
    
Add a New Photo With Invalid Element Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Add a new photo (supported format are JPEG, PNG or GIF) endpoint
    ...    with invalid element id 
    Add a New Photo With Invalid Element Id
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get a Photo
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Get a photo endpoint
    ...    GET endpoint that receive project id, layer id, form id and photo id
    Get a Photo

Get a Photo With Invalid Session Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Get a photo endpoint
    ...    with invalid session id
    Get a Photo With Invalid Session Id
    
Get a Photo With Empty Session Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Get a photo endpoint
    ...    with empty session id
    Get a Photo With Empty Session Id
    
Get a Photo With Invalid Project Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Get a photo endpoint
    ...    with invalid project id
    Get a Photo With Invalid Project Id
    
Get a Photo With Invalid Layer Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Get a photo endpoint
    ...    with invalid layer id
    Get a Photo With Invalid Layer Id
    
Get a Photo With Invalid Form Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Get a photo endpoint
    ...    with invalid form id
    Get a Photo With Invalid Form Id
    
Get a Photo With Invalid Photo Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Get a photo endpoint
    ...    with invalid photo id
    Get a Photo With Invalid Photo Id
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   
Update a Photo Properties
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Update a photo properties endpoint
    ...    POST endpoint that receive project id, layer id, form id, photo id and body with title and comment
    Update a Photo Properties
    
Update a Photo Properties With Invalid Session Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Update a photo properties endpoint
    ...    with invalid session id
    Update a Photo Properties With Invalid Session Id
    
Update a Photo Properties With Empty Session Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Update a photo properties endpoint
    ...    with empty session id
    Update a Photo Properties With Empty Session Id
    
Update a Photo Properties With Invalid Project Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Update a photo properties endpoint
    ...    with invalid project id
    Update a Photo Properties With Invalid Project Id
    
Update a Photo Properties With Invalid Layer Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Update a photo properties endpoint
    ...    with invalid layer id
    Update a Photo Properties With Invalid Layer Id
    
Update a Photo Properties With Invalid Form Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Update a photo properties endpoint
    ...    with invalid form id
    Update a Photo Properties With Invalid Form Id

Update a Photo Properties With Invalid Photo Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Update a photo properties endpoint
    ...    with invalid photo id
    Update a Photo Properties With Invalid Photo Id
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get All Photos for a Particular Element
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Get all photos for a particular element endpoint
    ...    GET endpoint that receive project id, layer id, form id and element id
    Get All Photos for a Particular Element

Get All Photos for a Particular Element With Entry Parameter
    [Documentation]    To execute this test case, the execution of 'Get Multiple Database Form Descriptors' is needed to get 
    ...    the database form id and use it in the Photo Form REST API endpoint. Execute Get all photos for a particular element endpoint
    ...    GET endpoint that receive project id, layer id, form id and object id
    Get All Photos for a Particular Element With Entry Parameter

Get All Photos for a Particular Element With Invalid Session Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Get all photos for a particular element endpoint
    ...    with invalid session id
    Get All Photos for a Particular Element With Invalid Session Id
    
Get All Photos for a Particular Element With Empty Session Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Get all photos for a particular element endpoint
    ...    with empty session id
    Get All Photos for a Particular Element With Empty Session Id
    
Get All Photos for a Particular Element With Invalid Project Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Get all photos for a particular element endpoint
    ...    with invalid project id
    Get All Photos for a Particular Element With Invalid Project Id
    
Get All Photos for a Particular Element With Invalid Layer Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Get all photos for a particular element endpoint
    ...    with invalid layer id
    Get All Photos for a Particular Element With Invalid Layer Id
    
Get All Photos for a Particular Element With Invalid Form Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Get all photos for a particular element endpoint
    ...    with invalid form id
    Get All Photos for a Particular Element With Invalid Form Id
    
Get All Photos for a Particular Element With Invalid Element Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Get all photos for a particular element endpoint
    ...    with invalid element id
    Get All Photos for a Particular Element With Invalid Element Id
    
Get All Photos for a Particular Element With Invalid Entry Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Get all photos for a particular element endpoint
    ...    with invalid entry/object id
    Get All Photos for a Particular Element With Invalid Entry Id
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
Delete a Photo
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Delete a photo endpoint
    ...    DELETE endpoint that receive project id, layer id, form id and photo id
    Delete a Photo
    
Delete a Photo From Database Form
    [Documentation]    To execute this test case, the execution of 'Get Multiple Database Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Delete a photo endpoint
    ...    DELETE endpoint that receive project id, layer id, form id and photo id
    Delete a Photo From Database Form
    
Delete a Photo With Invalid Session Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Delete a photo endpoint
    ...    with invalid session id
    Delete a Photo With Invalid Session Id
    
Delete a Photo With Empty Session Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Delete a photo endpoint
    ...    with empty session id
    Delete a Photo With Empty Session Id
    
Delete a Photo With Invalid Project Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Delete a photo endpoint
    ...    with invalid project id
    Delete a Photo With Invalid Project Id

Delete a Photo With Invalid Layer Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Delete a photo endpoint
    ...    with invalid layer id
    Delete a Photo With Invalid Layer Id
    
Delete a Photo With Invalid Form Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Delete a photo endpoint
    ...    with invalid form id
    Delete a Photo With Invalid Form Id
    
Delete a Photo With Invalid Photo Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed to get 
    ...    the form id and use it in the Photo Form REST API endpoint. Execute Delete a photo endpoint
    ...    with invalid photo id
    Delete a Photo With Invalid Photo Id
#------------------------------------------------------------------------------------------------------------------------------------------------------
*** Keywords ***

Add a New Photo
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed
    ${FORMID}    Get Multiple Attribute Form Descriptors    ${PROJECTID}    ${LAYERID}    
    ${RESULT}=    Put    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos?sessionId=${SESSIONID}    timeout=10    body={"elementId": ${ELEMENTID},"comment": "${PHOTOCOMMENT}","title": "${PHOTOTITLE}","imageBase64": "iVBORw0KGgoAAAANSUhEUgAAADEAAAAKCAYAAAAdIbZyAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAATKSURBVEhLxVVrTFRXEP7u3rsPARcKUn9UtFqjUdLYB0aDGpLiI41KU39YirZgTakIpW1qi2haSolFjbGkiU0b4w+baC1pU5tWC0WgdpH3CouyQkB57PLcBXZld9ld9t7TOXfpI4390R9tJ7n3zJmZc2a+OWfmCOP3gwz/IzE2514QIIS5B9JvdgLZ/ZU06p8MREkLg0ELnU6riv4L4oFpJAkPGXUQiP+7bHK7iEgdIufp/gD9J9KoAHQ6DHW347vyr3C9rhlR8zkQATq9FpIkchNIWgJIc54JzmvpC+t4AiQVPNcJGpHk4blGQ1kjmZZ4bs9JXTuXKI0oIeAaR8GRU4giIJKohhP29XsyBRhJV/3NJXxd24Zo4rmRREnXzJ2KehJ6A1B54SyutY/j/OkPcfZbM+LnSzBV/ICegVHEGrXo7WhCdUUVZkMKerutsDSZ0G8fQwxt6rR1ofqna9DoJPgmRzDYfw911VXw0k01aBW0/FyF5pabiKDk9Foa0FDfDH0kB62BEpyByVSPltZWOF0+2k8Lm7UVtTW/YB7ZRxgE3Kg1ob31puqv4ZpJBdxvbcGYy6sCEd8pfO8DrV7Erbpa6BevRcysHY8mpaLi8yK0jOlx7lQpEtesQOarRVi46BEkJ63Ezu3piHk4Hh+dPIvUDauRnVcMMeTBlz+2Y1l0EDkFZRB8Dlw2dQH2Rpy42IDlyxKgjPei8HQ5HD1m3HbqsXXdY/B5vLh4oRyRBj1OlJ3H5vWL8FJ+GXReG652TGPWWokzl80IuEexKmkjzhzJw+bXDmDX0+uQcegIIgV5riaIREkHa0MlLtWPYU/KclRXNSIuNgrbtiQjYsFqHM7egca6Org8IQKwGEcP5WHJfIYmUyMSntiE0uMlGO6ywONnSEpJxbGSN+EesWHH3hwkLzHA3NGDdnMbImNisSoxEfERBijkV5FDMEQvxNHDbyGGTeDqletITd+P4x8Xoub7CnRa76L45ElkpW2AwxdCSVE+SgtKYUxOx0ojEFKorjgAXire+y5s3vsGijMex9ufXEF27suwWjox7BERrwyirW8CHscwHNMB6BU39mYdwJS0AGm7n8fk7evYkbYHTz6zBUa9jBl/AO7paao1CTdqquEXdOi+ZUXytp0IOGzoszuxYmUCgiF+4wVMT9iQvicHiE9E5r4M1J4/hbTtB7EvNxObUtbi9awMlF2sgSDPYuOuV1D5xWc4mLsfniCPnupi3B1gDk+IDY442KDTz2Zkxsyd/WyWKvbeoJ112SeZO8jYnd4BZnMRI8+wp1J2s54RJ5sIMFXnCcwya/8ooykbcd5nd0fczDntZ71DE2yCRkt3H5sipU9hbNLtYZYeG3N6Fcbb+5jLx+xTfmYbdTA3OaVwmMvrY3cGHWoMHvp6BoaY2y+zAaeXhcj/0oQ1qtxB6/ke4XeCqp13FTpctTuI1CVCIZlGST0nRVGok3A9NQFlBvnvHsex0yXQ01UIyQqt1UCkApPJjncj3pQUfswkp7gh8lGR52Si2rVkWVb348TtOHE/FJs6550ubEOFS74ZU2CMkvDC1mfx4vuf4rn1S+H2BcMd8R89duSAkYM42myKaoM7fdDj828RT3AcdS+Kna5sGAAA/ArsfWjMREMYtAAAAABJRU5ErkJggg=="}
    
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'Result is photo's id'    
    ${PHOTOID}    Set Variable    ${RESULT['body']}
    ${PHOTOID}    Set Variable    ${PHOTOID['result']}
    ${PHOTOID}    Set Variable    ${PHOTOID['photoId']}
    
    #    Assertions
    String    $.status    OK
    String    $.message    Result is photo's id
    Integer    $.result.photoId    ${PHOTOID}
    Set Global Variable    ${PHOTOID}        

Add a New Database Photo
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed
    ${DATABASEFORMID}    Get Multiple Database Form Descriptors    ${PROJECTID}    ${LAYERID}
    ${RESULT}=    Put    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${DATABASEFORMID}/photos?sessionId=${SESSIONID}    timeout=10    body={"elementId": ${ELEMENTID},"comment": "${PHOTOCOMMENT}","title": "${PHOTOTITLE}","imageBase64": "iVBORw0KGgoAAAANSUhEUgAAADEAAAAKCAYAAAAdIbZyAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAATKSURBVEhLxVVrTFRXEP7u3rsPARcKUn9UtFqjUdLYB0aDGpLiI41KU39YirZgTakIpW1qi2haSolFjbGkiU0b4w+baC1pU5tWC0WgdpH3CouyQkB57PLcBXZld9ld9t7TOXfpI4390R9tJ7n3zJmZc2a+OWfmCOP3gwz/IzE2514QIIS5B9JvdgLZ/ZU06p8MREkLg0ELnU6riv4L4oFpJAkPGXUQiP+7bHK7iEgdIufp/gD9J9KoAHQ6DHW347vyr3C9rhlR8zkQATq9FpIkchNIWgJIc54JzmvpC+t4AiQVPNcJGpHk4blGQ1kjmZZ4bs9JXTuXKI0oIeAaR8GRU4giIJKohhP29XsyBRhJV/3NJXxd24Zo4rmRREnXzJ2KehJ6A1B54SyutY/j/OkPcfZbM+LnSzBV/ICegVHEGrXo7WhCdUUVZkMKerutsDSZ0G8fQwxt6rR1ofqna9DoJPgmRzDYfw911VXw0k01aBW0/FyF5pabiKDk9Foa0FDfDH0kB62BEpyByVSPltZWOF0+2k8Lm7UVtTW/YB7ZRxgE3Kg1ob31puqv4ZpJBdxvbcGYy6sCEd8pfO8DrV7Erbpa6BevRcysHY8mpaLi8yK0jOlx7lQpEtesQOarRVi46BEkJ63Ezu3piHk4Hh+dPIvUDauRnVcMMeTBlz+2Y1l0EDkFZRB8Dlw2dQH2Rpy42IDlyxKgjPei8HQ5HD1m3HbqsXXdY/B5vLh4oRyRBj1OlJ3H5vWL8FJ+GXReG652TGPWWokzl80IuEexKmkjzhzJw+bXDmDX0+uQcegIIgV5riaIREkHa0MlLtWPYU/KclRXNSIuNgrbtiQjYsFqHM7egca6Org8IQKwGEcP5WHJfIYmUyMSntiE0uMlGO6ywONnSEpJxbGSN+EesWHH3hwkLzHA3NGDdnMbImNisSoxEfERBijkV5FDMEQvxNHDbyGGTeDqletITd+P4x8Xoub7CnRa76L45ElkpW2AwxdCSVE+SgtKYUxOx0ojEFKorjgAXire+y5s3vsGijMex9ufXEF27suwWjox7BERrwyirW8CHscwHNMB6BU39mYdwJS0AGm7n8fk7evYkbYHTz6zBUa9jBl/AO7paao1CTdqquEXdOi+ZUXytp0IOGzoszuxYmUCgiF+4wVMT9iQvicHiE9E5r4M1J4/hbTtB7EvNxObUtbi9awMlF2sgSDPYuOuV1D5xWc4mLsfniCPnupi3B1gDk+IDY442KDTz2Zkxsyd/WyWKvbeoJ112SeZO8jYnd4BZnMRI8+wp1J2s54RJ5sIMFXnCcwya/8ooykbcd5nd0fczDntZ71DE2yCRkt3H5sipU9hbNLtYZYeG3N6Fcbb+5jLx+xTfmYbdTA3OaVwmMvrY3cGHWoMHvp6BoaY2y+zAaeXhcj/0oQ1qtxB6/ke4XeCqp13FTpctTuI1CVCIZlGST0nRVGok3A9NQFlBvnvHsex0yXQ01UIyQqt1UCkApPJjncj3pQUfswkp7gh8lGR52Si2rVkWVb348TtOHE/FJs6550ubEOFS74ZU2CMkvDC1mfx4vuf4rn1S+H2BcMd8R89duSAkYM42myKaoM7fdDj828RT3AcdS+Kna5sGAAA/ArsfWjMREMYtAAAAABJRU5ErkJggg=="}
    
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'Result is photo's id'    
       
    ${DATABASEPHOTOID}    Set Variable    ${RESULT['body']}
    ${DATABASEPHOTOID}    Set Variable    ${DATABASEPHOTOID['result']}
    ${DATABASEPHOTOID}    Set Variable    ${DATABASEPHOTOID['photoId']}
    #    Assertions
    String    $.status    OK
    String    $.message    Result is photo's id
    Integer    $.result.photoId    ${DATABASEPHOTOID}
    Set Global Variable    ${DATABASEPHOTOID}      

Add a New Photo With Invalid Session Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed
    ${FORMID}    Get Multiple Attribute Form Descriptors    ${PROJECTID}    ${LAYERID}
    Put    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos?sessionId=${INVALIDSESSIONID}    timeout=10    body={"elementId": ${ELEMENTID},"comment": "${PHOTOCOMMENT}","title": "${PHOTOTITLE}","imageBase64": "iVBORw0KGgoAAAANSUhEUgAAADEAAAAKCAYAAAAdIbZyAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAATKSURBVEhLxVVrTFRXEP7u3rsPARcKUn9UtFqjUdLYB0aDGpLiI41KU39YirZgTakIpW1qi2haSolFjbGkiU0b4w+baC1pU5tWC0WgdpH3CouyQkB57PLcBXZld9ld9t7TOXfpI4390R9tJ7n3zJmZc2a+OWfmCOP3gwz/IzE2514QIIS5B9JvdgLZ/ZU06p8MREkLg0ELnU6riv4L4oFpJAkPGXUQiP+7bHK7iEgdIufp/gD9J9KoAHQ6DHW347vyr3C9rhlR8zkQATq9FpIkchNIWgJIc54JzmvpC+t4AiQVPNcJGpHk4blGQ1kjmZZ4bs9JXTuXKI0oIeAaR8GRU4giIJKohhP29XsyBRhJV/3NJXxd24Zo4rmRREnXzJ2KehJ6A1B54SyutY/j/OkPcfZbM+LnSzBV/ICegVHEGrXo7WhCdUUVZkMKerutsDSZ0G8fQwxt6rR1ofqna9DoJPgmRzDYfw911VXw0k01aBW0/FyF5pabiKDk9Foa0FDfDH0kB62BEpyByVSPltZWOF0+2k8Lm7UVtTW/YB7ZRxgE3Kg1ob31puqv4ZpJBdxvbcGYy6sCEd8pfO8DrV7Erbpa6BevRcysHY8mpaLi8yK0jOlx7lQpEtesQOarRVi46BEkJ63Ezu3piHk4Hh+dPIvUDauRnVcMMeTBlz+2Y1l0EDkFZRB8Dlw2dQH2Rpy42IDlyxKgjPei8HQ5HD1m3HbqsXXdY/B5vLh4oRyRBj1OlJ3H5vWL8FJ+GXReG652TGPWWokzl80IuEexKmkjzhzJw+bXDmDX0+uQcegIIgV5riaIREkHa0MlLtWPYU/KclRXNSIuNgrbtiQjYsFqHM7egca6Org8IQKwGEcP5WHJfIYmUyMSntiE0uMlGO6ywONnSEpJxbGSN+EesWHH3hwkLzHA3NGDdnMbImNisSoxEfERBijkV5FDMEQvxNHDbyGGTeDqletITd+P4x8Xoub7CnRa76L45ElkpW2AwxdCSVE+SgtKYUxOx0ojEFKorjgAXire+y5s3vsGijMex9ufXEF27suwWjox7BERrwyirW8CHscwHNMB6BU39mYdwJS0AGm7n8fk7evYkbYHTz6zBUa9jBl/AO7paao1CTdqquEXdOi+ZUXytp0IOGzoszuxYmUCgiF+4wVMT9iQvicHiE9E5r4M1J4/hbTtB7EvNxObUtbi9awMlF2sgSDPYuOuV1D5xWc4mLsfniCPnupi3B1gDk+IDY442KDTz2Zkxsyd/WyWKvbeoJ112SeZO8jYnd4BZnMRI8+wp1J2s54RJ5sIMFXnCcwya/8ooykbcd5nd0fczDntZ71DE2yCRkt3H5sipU9hbNLtYZYeG3N6Fcbb+5jLx+xTfmYbdTA3OaVwmMvrY3cGHWoMHvp6BoaY2y+zAaeXhcj/0oQ1qtxB6/ke4XeCqp13FTpctTuI1CVCIZlGST0nRVGok3A9NQFlBvnvHsex0yXQ01UIyQqt1UCkApPJjncj3pQUfswkp7gh8lGR52Si2rVkWVb348TtOHE/FJs6550ubEOFS74ZU2CMkvDC1mfx4vuf4rn1S+H2BcMd8R89duSAkYM42myKaoM7fdDj828RT3AcdS+Kna5sGAAA/ArsfWjMREMYtAAAAABJRU5ErkJggg=="}
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Add a New Photo With Empty Session Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed
    ${FORMID}    Get Multiple Attribute Form Descriptors    ${PROJECTID}    ${LAYERID}
    Put    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos?sessionId=${EMPTY}    timeout=10    body={"elementId": ${ELEMENTID},"comment": "${PHOTOCOMMENT}","title": "${PHOTOTITLE}","imageBase64": "iVBORw0KGgoAAAANSUhEUgAAADEAAAAKCAYAAAAdIbZyAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAATKSURBVEhLxVVrTFRXEP7u3rsPARcKUn9UtFqjUdLYB0aDGpLiI41KU39YirZgTakIpW1qi2haSolFjbGkiU0b4w+baC1pU5tWC0WgdpH3CouyQkB57PLcBXZld9ld9t7TOXfpI4390R9tJ7n3zJmZc2a+OWfmCOP3gwz/IzE2514QIIS5B9JvdgLZ/ZU06p8MREkLg0ELnU6riv4L4oFpJAkPGXUQiP+7bHK7iEgdIufp/gD9J9KoAHQ6DHW347vyr3C9rhlR8zkQATq9FpIkchNIWgJIc54JzmvpC+t4AiQVPNcJGpHk4blGQ1kjmZZ4bs9JXTuXKI0oIeAaR8GRU4giIJKohhP29XsyBRhJV/3NJXxd24Zo4rmRREnXzJ2KehJ6A1B54SyutY/j/OkPcfZbM+LnSzBV/ICegVHEGrXo7WhCdUUVZkMKerutsDSZ0G8fQwxt6rR1ofqna9DoJPgmRzDYfw911VXw0k01aBW0/FyF5pabiKDk9Foa0FDfDH0kB62BEpyByVSPltZWOF0+2k8Lm7UVtTW/YB7ZRxgE3Kg1ob31puqv4ZpJBdxvbcGYy6sCEd8pfO8DrV7Erbpa6BevRcysHY8mpaLi8yK0jOlx7lQpEtesQOarRVi46BEkJ63Ezu3piHk4Hh+dPIvUDauRnVcMMeTBlz+2Y1l0EDkFZRB8Dlw2dQH2Rpy42IDlyxKgjPei8HQ5HD1m3HbqsXXdY/B5vLh4oRyRBj1OlJ3H5vWL8FJ+GXReG652TGPWWokzl80IuEexKmkjzhzJw+bXDmDX0+uQcegIIgV5riaIREkHa0MlLtWPYU/KclRXNSIuNgrbtiQjYsFqHM7egca6Org8IQKwGEcP5WHJfIYmUyMSntiE0uMlGO6ywONnSEpJxbGSN+EesWHH3hwkLzHA3NGDdnMbImNisSoxEfERBijkV5FDMEQvxNHDbyGGTeDqletITd+P4x8Xoub7CnRa76L45ElkpW2AwxdCSVE+SgtKYUxOx0ojEFKorjgAXire+y5s3vsGijMex9ufXEF27suwWjox7BERrwyirW8CHscwHNMB6BU39mYdwJS0AGm7n8fk7evYkbYHTz6zBUa9jBl/AO7paao1CTdqquEXdOi+ZUXytp0IOGzoszuxYmUCgiF+4wVMT9iQvicHiE9E5r4M1J4/hbTtB7EvNxObUtbi9awMlF2sgSDPYuOuV1D5xWc4mLsfniCPnupi3B1gDk+IDY442KDTz2Zkxsyd/WyWKvbeoJ112SeZO8jYnd4BZnMRI8+wp1J2s54RJ5sIMFXnCcwya/8ooykbcd5nd0fczDntZ71DE2yCRkt3H5sipU9hbNLtYZYeG3N6Fcbb+5jLx+xTfmYbdTA3OaVwmMvrY3cGHWoMHvp6BoaY2y+zAaeXhcj/0oQ1qtxB6/ke4XeCqp13FTpctTuI1CVCIZlGST0nRVGok3A9NQFlBvnvHsex0yXQ01UIyQqt1UCkApPJjncj3pQUfswkp7gh8lGR52Si2rVkWVb348TtOHE/FJs6550ubEOFS74ZU2CMkvDC1mfx4vuf4rn1S+H2BcMd8R89duSAkYM42myKaoM7fdDj828RT3AcdS+Kna5sGAAA/ArsfWjMREMYtAAAAABJRU5ErkJggg=="}
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Add a New Photo With Invalid Project Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed
    ${FORMID}    Get Multiple Attribute Form Descriptors    ${PROJECTID}    ${LAYERID}
    Put    /services/rest/v2.0/projects/${INVALIDPROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos?sessionId=${SESSIONID}    timeout=10    body={"elementId": ${ELEMENTID},"comment": "${PHOTOCOMMENT}","title": "${PHOTOTITLE}","imageBase64": "iVBORw0KGgoAAAANSUhEUgAAADEAAAAKCAYAAAAdIbZyAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAATKSURBVEhLxVVrTFRXEP7u3rsPARcKUn9UtFqjUdLYB0aDGpLiI41KU39YirZgTakIpW1qi2haSolFjbGkiU0b4w+baC1pU5tWC0WgdpH3CouyQkB57PLcBXZld9ld9t7TOXfpI4390R9tJ7n3zJmZc2a+OWfmCOP3gwz/IzE2514QIIS5B9JvdgLZ/ZU06p8MREkLg0ELnU6riv4L4oFpJAkPGXUQiP+7bHK7iEgdIufp/gD9J9KoAHQ6DHW347vyr3C9rhlR8zkQATq9FpIkchNIWgJIc54JzmvpC+t4AiQVPNcJGpHk4blGQ1kjmZZ4bs9JXTuXKI0oIeAaR8GRU4giIJKohhP29XsyBRhJV/3NJXxd24Zo4rmRREnXzJ2KehJ6A1B54SyutY/j/OkPcfZbM+LnSzBV/ICegVHEGrXo7WhCdUUVZkMKerutsDSZ0G8fQwxt6rR1ofqna9DoJPgmRzDYfw911VXw0k01aBW0/FyF5pabiKDk9Foa0FDfDH0kB62BEpyByVSPltZWOF0+2k8Lm7UVtTW/YB7ZRxgE3Kg1ob31puqv4ZpJBdxvbcGYy6sCEd8pfO8DrV7Erbpa6BevRcysHY8mpaLi8yK0jOlx7lQpEtesQOarRVi46BEkJ63Ezu3piHk4Hh+dPIvUDauRnVcMMeTBlz+2Y1l0EDkFZRB8Dlw2dQH2Rpy42IDlyxKgjPei8HQ5HD1m3HbqsXXdY/B5vLh4oRyRBj1OlJ3H5vWL8FJ+GXReG652TGPWWokzl80IuEexKmkjzhzJw+bXDmDX0+uQcegIIgV5riaIREkHa0MlLtWPYU/KclRXNSIuNgrbtiQjYsFqHM7egca6Org8IQKwGEcP5WHJfIYmUyMSntiE0uMlGO6ywONnSEpJxbGSN+EesWHH3hwkLzHA3NGDdnMbImNisSoxEfERBijkV5FDMEQvxNHDbyGGTeDqletITd+P4x8Xoub7CnRa76L45ElkpW2AwxdCSVE+SgtKYUxOx0ojEFKorjgAXire+y5s3vsGijMex9ufXEF27suwWjox7BERrwyirW8CHscwHNMB6BU39mYdwJS0AGm7n8fk7evYkbYHTz6zBUa9jBl/AO7paao1CTdqquEXdOi+ZUXytp0IOGzoszuxYmUCgiF+4wVMT9iQvicHiE9E5r4M1J4/hbTtB7EvNxObUtbi9awMlF2sgSDPYuOuV1D5xWc4mLsfniCPnupi3B1gDk+IDY442KDTz2Zkxsyd/WyWKvbeoJ112SeZO8jYnd4BZnMRI8+wp1J2s54RJ5sIMFXnCcwya/8ooykbcd5nd0fczDntZ71DE2yCRkt3H5sipU9hbNLtYZYeG3N6Fcbb+5jLx+xTfmYbdTA3OaVwmMvrY3cGHWoMHvp6BoaY2y+zAaeXhcj/0oQ1qtxB6/ke4XeCqp13FTpctTuI1CVCIZlGST0nRVGok3A9NQFlBvnvHsex0yXQ01UIyQqt1UCkApPJjncj3pQUfswkp7gh8lGR52Si2rVkWVb348TtOHE/FJs6550ubEOFS74ZU2CMkvDC1mfx4vuf4rn1S+H2BcMd8R89duSAkYM42myKaoM7fdDj828RT3AcdS+Kna5sGAAA/ArsfWjMREMYtAAAAABJRU5ErkJggg=="}
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested project (id = ${INVALIDPROJECTID}) does not exist.'    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested project (id \=\ ${INVALIDPROJECTID}) does not exist.

Add a New Photo With Invalid Layer Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed
    ${FORMID}    Get Multiple Attribute Form Descriptors    ${PROJECTID}    ${LAYERID}
    Put    /services/rest/v2.0/projects/${PROJECTID}/layers/${INVALIDLAYERID}/forms/${FORMID}/photos?sessionId=${SESSIONID}    timeout=10    body={"elementId": ${ELEMENTID},"comment": "${PHOTOCOMMENT}","title": "${PHOTOTITLE}","imageBase64": "iVBORw0KGgoAAAANSUhEUgAAADEAAAAKCAYAAAAdIbZyAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAATKSURBVEhLxVVrTFRXEP7u3rsPARcKUn9UtFqjUdLYB0aDGpLiI41KU39YirZgTakIpW1qi2haSolFjbGkiU0b4w+baC1pU5tWC0WgdpH3CouyQkB57PLcBXZld9ld9t7TOXfpI4390R9tJ7n3zJmZc2a+OWfmCOP3gwz/IzE2514QIIS5B9JvdgLZ/ZU06p8MREkLg0ELnU6riv4L4oFpJAkPGXUQiP+7bHK7iEgdIufp/gD9J9KoAHQ6DHW347vyr3C9rhlR8zkQATq9FpIkchNIWgJIc54JzmvpC+t4AiQVPNcJGpHk4blGQ1kjmZZ4bs9JXTuXKI0oIeAaR8GRU4giIJKohhP29XsyBRhJV/3NJXxd24Zo4rmRREnXzJ2KehJ6A1B54SyutY/j/OkPcfZbM+LnSzBV/ICegVHEGrXo7WhCdUUVZkMKerutsDSZ0G8fQwxt6rR1ofqna9DoJPgmRzDYfw911VXw0k01aBW0/FyF5pabiKDk9Foa0FDfDH0kB62BEpyByVSPltZWOF0+2k8Lm7UVtTW/YB7ZRxgE3Kg1ob31puqv4ZpJBdxvbcGYy6sCEd8pfO8DrV7Erbpa6BevRcysHY8mpaLi8yK0jOlx7lQpEtesQOarRVi46BEkJ63Ezu3piHk4Hh+dPIvUDauRnVcMMeTBlz+2Y1l0EDkFZRB8Dlw2dQH2Rpy42IDlyxKgjPei8HQ5HD1m3HbqsXXdY/B5vLh4oRyRBj1OlJ3H5vWL8FJ+GXReG652TGPWWokzl80IuEexKmkjzhzJw+bXDmDX0+uQcegIIgV5riaIREkHa0MlLtWPYU/KclRXNSIuNgrbtiQjYsFqHM7egca6Org8IQKwGEcP5WHJfIYmUyMSntiE0uMlGO6ywONnSEpJxbGSN+EesWHH3hwkLzHA3NGDdnMbImNisSoxEfERBijkV5FDMEQvxNHDbyGGTeDqletITd+P4x8Xoub7CnRa76L45ElkpW2AwxdCSVE+SgtKYUxOx0ojEFKorjgAXire+y5s3vsGijMex9ufXEF27suwWjox7BERrwyirW8CHscwHNMB6BU39mYdwJS0AGm7n8fk7evYkbYHTz6zBUa9jBl/AO7paao1CTdqquEXdOi+ZUXytp0IOGzoszuxYmUCgiF+4wVMT9iQvicHiE9E5r4M1J4/hbTtB7EvNxObUtbi9awMlF2sgSDPYuOuV1D5xWc4mLsfniCPnupi3B1gDk+IDY442KDTz2Zkxsyd/WyWKvbeoJ112SeZO8jYnd4BZnMRI8+wp1J2s54RJ5sIMFXnCcwya/8ooykbcd5nd0fczDntZ71DE2yCRkt3H5sipU9hbNLtYZYeG3N6Fcbb+5jLx+xTfmYbdTA3OaVwmMvrY3cGHWoMHvp6BoaY2y+zAaeXhcj/0oQ1qtxB6/ke4XeCqp13FTpctTuI1CVCIZlGST0nRVGok3A9NQFlBvnvHsex0yXQ01UIyQqt1UCkApPJjncj3pQUfswkp7gh8lGR52Si2rVkWVb348TtOHE/FJs6550ubEOFS74ZU2CMkvDC1mfx4vuf4rn1S+H2BcMd8R89duSAkYM42myKaoM7fdDj828RT3AcdS+Kna5sGAAA/ArsfWjMREMYtAAAAABJRU5ErkJggg=="}
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested layer (id = ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}.'    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested layer (id \=\ ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}.   

Add a New Photo With Invalid Form Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed
    Put    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${INVALIDFORMID}/photos?sessionId=${SESSIONID}    timeout=10    body={"elementId": ${ELEMENTID},"comment": "${PHOTOCOMMENT}","title": "${PHOTOTITLE}","imageBase64": "iVBORw0KGgoAAAANSUhEUgAAADEAAAAKCAYAAAAdIbZyAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAATKSURBVEhLxVVrTFRXEP7u3rsPARcKUn9UtFqjUdLYB0aDGpLiI41KU39YirZgTakIpW1qi2haSolFjbGkiU0b4w+baC1pU5tWC0WgdpH3CouyQkB57PLcBXZld9ld9t7TOXfpI4390R9tJ7n3zJmZc2a+OWfmCOP3gwz/IzE2514QIIS5B9JvdgLZ/ZU06p8MREkLg0ELnU6riv4L4oFpJAkPGXUQiP+7bHK7iEgdIufp/gD9J9KoAHQ6DHW347vyr3C9rhlR8zkQATq9FpIkchNIWgJIc54JzmvpC+t4AiQVPNcJGpHk4blGQ1kjmZZ4bs9JXTuXKI0oIeAaR8GRU4giIJKohhP29XsyBRhJV/3NJXxd24Zo4rmRREnXzJ2KehJ6A1B54SyutY/j/OkPcfZbM+LnSzBV/ICegVHEGrXo7WhCdUUVZkMKerutsDSZ0G8fQwxt6rR1ofqna9DoJPgmRzDYfw911VXw0k01aBW0/FyF5pabiKDk9Foa0FDfDH0kB62BEpyByVSPltZWOF0+2k8Lm7UVtTW/YB7ZRxgE3Kg1ob31puqv4ZpJBdxvbcGYy6sCEd8pfO8DrV7Erbpa6BevRcysHY8mpaLi8yK0jOlx7lQpEtesQOarRVi46BEkJ63Ezu3piHk4Hh+dPIvUDauRnVcMMeTBlz+2Y1l0EDkFZRB8Dlw2dQH2Rpy42IDlyxKgjPei8HQ5HD1m3HbqsXXdY/B5vLh4oRyRBj1OlJ3H5vWL8FJ+GXReG652TGPWWokzl80IuEexKmkjzhzJw+bXDmDX0+uQcegIIgV5riaIREkHa0MlLtWPYU/KclRXNSIuNgrbtiQjYsFqHM7egca6Org8IQKwGEcP5WHJfIYmUyMSntiE0uMlGO6ywONnSEpJxbGSN+EesWHH3hwkLzHA3NGDdnMbImNisSoxEfERBijkV5FDMEQvxNHDbyGGTeDqletITd+P4x8Xoub7CnRa76L45ElkpW2AwxdCSVE+SgtKYUxOx0ojEFKorjgAXire+y5s3vsGijMex9ufXEF27suwWjox7BERrwyirW8CHscwHNMB6BU39mYdwJS0AGm7n8fk7evYkbYHTz6zBUa9jBl/AO7paao1CTdqquEXdOi+ZUXytp0IOGzoszuxYmUCgiF+4wVMT9iQvicHiE9E5r4M1J4/hbTtB7EvNxObUtbi9awMlF2sgSDPYuOuV1D5xWc4mLsfniCPnupi3B1gDk+IDY442KDTz2Zkxsyd/WyWKvbeoJ112SeZO8jYnd4BZnMRI8+wp1J2s54RJ5sIMFXnCcwya/8ooykbcd5nd0fczDntZ71DE2yCRkt3H5sipU9hbNLtYZYeG3N6Fcbb+5jLx+xTfmYbdTA3OaVwmMvrY3cGHWoMHvp6BoaY2y+zAaeXhcj/0oQ1qtxB6/ke4XeCqp13FTpctTuI1CVCIZlGST0nRVGok3A9NQFlBvnvHsex0yXQ01UIyQqt1UCkApPJjncj3pQUfswkp7gh8lGR52Si2rVkWVb348TtOHE/FJs6550ubEOFS74ZU2CMkvDC1mfx4vuf4rn1S+H2BcMd8R89duSAkYM42myKaoM7fdDj828RT3AcdS+Kna5sGAAA/ArsfWjMREMYtAAAAABJRU5ErkJggg=="}
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested form or one of its subforms does not exist in layer ${LAYERNAME}.'    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested form or one of its subforms does not exist in layer ${LAYERNAME}.   

Add a New Photo With Invalid Image Format
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed
    ${FORMID}    Get Multiple Attribute Form Descriptors    ${PROJECTID}    ${LAYERID}
    Put    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos?sessionId=${SESSIONID}    timeout=10    body={"elementId": ${ELEMENTID},"comment": "${PHOTOCOMMENT}","title": "${PHOTOTITLE}","imageBase64": "-3"}
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'Cannot get image extension from byte array !'    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    Cannot get image extension from byte array \!\
    
Add a New Photo With Invalid Image
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed
    ${FORMID}    Get Multiple Attribute Form Descriptors    ${PROJECTID}    ${LAYERID}
    Put    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos?sessionId=${SESSIONID}    timeout=10    body={"elementId": ${ELEMENTID},"comment": "${PHOTOCOMMENT}","title": "${PHOTOTITLE}","imageBase64": "a"}
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'Cannot determine image's type from provided image !'    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    Cannot determine image's type from provided image \!\

Add a New Photo With Empty Image
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed
    ${FORMID}    Get Multiple Attribute Form Descriptors    ${PROJECTID}    ${LAYERID}
    Put    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos?sessionId=${SESSIONID}    timeout=10    body={"elementId": ${ELEMENTID},"comment": "${PHOTOCOMMENT}","title": "${PHOTOTITLE}","imageBase64": "${EMPTY}"}
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'Please provide a base 64 image !'    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    Please provide a base 64 image \!\

Add a New Photo With Invalid Element Id
    [Documentation]    To execute this test case, the execution of 'Get Multiple Attribute Form Descriptors' is needed
    ${FORMID}    Get Multiple Attribute Form Descriptors    ${PROJECTID}    ${LAYERID}
    Put    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos?sessionId=${SESSIONID}    timeout=10    body={"elementId": ${INVALIDELEMENTID},"comment": "${PHOTOCOMMENT}","title": "${PHOTOTITLE}","imageBase64": "iVBORw0KGgoAAAANSUhEUgAAADEAAAAKCAYAAAAdIbZyAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAATKSURBVEhLxVVrTFRXEP7u3rsPARcKUn9UtFqjUdLYB0aDGpLiI41KU39YirZgTakIpW1qi2haSolFjbGkiU0b4w+baC1pU5tWC0WgdpH3CouyQkB57PLcBXZld9ld9t7TOXfpI4390R9tJ7n3zJmZc2a+OWfmCOP3gwz/IzE2514QIIS5B9JvdgLZ/ZU06p8MREkLg0ELnU6riv4L4oFpJAkPGXUQiP+7bHK7iEgdIufp/gD9J9KoAHQ6DHW347vyr3C9rhlR8zkQATq9FpIkchNIWgJIc54JzmvpC+t4AiQVPNcJGpHk4blGQ1kjmZZ4bs9JXTuXKI0oIeAaR8GRU4giIJKohhP29XsyBRhJV/3NJXxd24Zo4rmRREnXzJ2KehJ6A1B54SyutY/j/OkPcfZbM+LnSzBV/ICegVHEGrXo7WhCdUUVZkMKerutsDSZ0G8fQwxt6rR1ofqna9DoJPgmRzDYfw911VXw0k01aBW0/FyF5pabiKDk9Foa0FDfDH0kB62BEpyByVSPltZWOF0+2k8Lm7UVtTW/YB7ZRxgE3Kg1ob31puqv4ZpJBdxvbcGYy6sCEd8pfO8DrV7Erbpa6BevRcysHY8mpaLi8yK0jOlx7lQpEtesQOarRVi46BEkJ63Ezu3piHk4Hh+dPIvUDauRnVcMMeTBlz+2Y1l0EDkFZRB8Dlw2dQH2Rpy42IDlyxKgjPei8HQ5HD1m3HbqsXXdY/B5vLh4oRyRBj1OlJ3H5vWL8FJ+GXReG652TGPWWokzl80IuEexKmkjzhzJw+bXDmDX0+uQcegIIgV5riaIREkHa0MlLtWPYU/KclRXNSIuNgrbtiQjYsFqHM7egca6Org8IQKwGEcP5WHJfIYmUyMSntiE0uMlGO6ywONnSEpJxbGSN+EesWHH3hwkLzHA3NGDdnMbImNisSoxEfERBijkV5FDMEQvxNHDbyGGTeDqletITd+P4x8Xoub7CnRa76L45ElkpW2AwxdCSVE+SgtKYUxOx0ojEFKorjgAXire+y5s3vsGijMex9ufXEF27suwWjox7BERrwyirW8CHscwHNMB6BU39mYdwJS0AGm7n8fk7evYkbYHTz6zBUa9jBl/AO7paao1CTdqquEXdOi+ZUXytp0IOGzoszuxYmUCgiF+4wVMT9iQvicHiE9E5r4M1J4/hbTtB7EvNxObUtbi9awMlF2sgSDPYuOuV1D5xWc4mLsfniCPnupi3B1gDk+IDY442KDTz2Zkxsyd/WyWKvbeoJ112SeZO8jYnd4BZnMRI8+wp1J2s54RJ5sIMFXnCcwya/8ooykbcd5nd0fczDntZ71DE2yCRkt3H5sipU9hbNLtYZYeG3N6Fcbb+5jLx+xTfmYbdTA3OaVwmMvrY3cGHWoMHvp6BoaY2y+zAaeXhcj/0oQ1qtxB6/ke4XeCqp13FTpctTuI1CVCIZlGST0nRVGok3A9NQFlBvnvHsex0yXQ01UIyQqt1UCkApPJjncj3pQUfswkp7gh8lGR52Si2rVkWVb348TtOHE/FJs6550ubEOFS74ZU2CMkvDC1mfx4vuf4rn1S+H2BcMd8R89duSAkYM42myKaoM7fdDj828RT3AcdS+Kna5sGAAA/ArsfWjMREMYtAAAAABJRU5ErkJggg=="}
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'Please provide an element id or object id!'    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    Please provide an element id or object id\!
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get a Photo
    ${FORMID}    Get Multiple Attribute Form Descriptors    ${PROJECTID}    ${LAYERID}
    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos/${PHOTOID}?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'The result is a form photo data'
    
    #    Assertions
    String    $.status    OK
    String    $.message    The result is a form photo data
    
    String    $.result.title    ${PHOTOTITLE}
    String    $.result.comment    ${PHOTOCOMMENT}
    Integer    $.result.id    1
    

Get a Photo With Invalid Session Id
    ${FORMID}    Get Multiple Attribute Form Descriptors    ${PROJECTID}    ${LAYERID}
    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos/${PHOTOID}?sessionId=${INVALIDSESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Get a Photo With Empty Session Id
    ${FORMID}    Get Multiple Attribute Form Descriptors    ${PROJECTID}    ${LAYERID}
    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos/${PHOTOID}?sessionId=${EMPTY}    timeout=10
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Get a Photo With Invalid Project Id
    ${FORMID}    Get Multiple Attribute Form Descriptors   ${PROJECTID}    ${LAYERID}
    Get    /services/rest/v2.0/projects/${INVALIDPROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos/${PHOTOID}?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested project (id = ${INVALIDPROJECTID}) does not exist.'    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested project (id \=\ ${INVALIDPROJECTID}) does not exist.
    
Get a Photo With Invalid Layer Id
    ${FORMID}    Get Multiple Attribute Form Descriptors    ${PROJECTID}    ${LAYERID}
    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${INVALIDLAYERID}/forms/${FORMID}/photos/${PHOTOID}?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested layer (id = ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}'    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested layer (id \=\ ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}.
    
Get a Photo With Invalid Form Id
    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${INVALIDFORMID}/photos/${PHOTOID}?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested form or one of its subforms does not exist in layer ${LAYERNAME}.'    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested form or one of its subforms does not exist in layer ${LAYERNAME}.
    
Get a Photo With Invalid Photo Id
    ${FORMID}    Get Multiple Attribute Form Descriptors    ${PROJECTID}    ${LAYERID}
    Get    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos/${INVALIDPHOTOID}?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Not Found'    
    Output    Server message response must be 'Photo with id='${INVALIDPHOTOID}' not found on form ${FORMID}'    
    #    Assertions
    String    $.status    Not Found
    String    $.message    Photo with id\=\'${INVALIDPHOTOID}' not found on form ${FORMID}    
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Update a Photo Properties
    ${FORMID}    Get Multiple Attribute Form Descriptors    ${PROJECTID}    ${LAYERID}
    Post    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos/${PHOTOID}?sessionId=${SESSIONID}    body={"comment": "updated comment on photo","title": "updated title on photo"}    timeout=10
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'Result is photo's id'
    
    #    Assertions
    String    $.status    OK
    String    $.message    Result is photo's id
    Integer    $.result.photoId    1
    

Update a Photo Properties With Invalid Session Id
    ${FORMID}    Get Multiple Attribute Form Descriptors    ${PROJECTID}    ${LAYERID}
    Post    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos/${PHOTOID}?sessionId=${INVALIDSESSIONID}    body={"comment": "updated comment on photo","title": "updated title on photo"}    timeout=10    
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Update a Photo Properties With Empty Session Id
    ${FORMID}    Get Multiple Attribute Form Descriptors    ${PROJECTID}    ${LAYERID}
    Post    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos/${PHOTOID}?sessionId=${EMPTY}    body={"comment": "updated comment on photo","title": "updated title on photo"}    timeout=10    
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.

Update a Photo Properties With Invalid Project Id
    ${FORMID}    Get Multiple Attribute Form Descriptors    ${PROJECTID}    ${LAYERID}
    Post    /services/rest/v2.0/projects/${INVALIDPROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos/${PHOTOID}?sessionId=${SESSIONID}    body={"comment": "updated comment on photo","title": "updated title on photo"}    timeout=10    
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested project (id = ${INVALIDPROJECTID}) does not exist.'    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested project (id \=\ ${INVALIDPROJECTID}) does not exist.

Update a Photo Properties With Invalid Layer Id
    ${FORMID}    Get Multiple Attribute Form Descriptors    ${PROJECTID}    ${LAYERID}
    Post    /services/rest/v2.0/projects/${PROJECTID}/layers/${INVALIDLAYERID}/forms/${FORMID}/photos/${PHOTOID}?sessionId=${SESSIONID}    body={"comment": "updated comment on photo","title": "updated title on photo"}    timeout=10    
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested layer (id = ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}.'    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested layer (id \=\ ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}.

Update a Photo Properties With Invalid Form Id
    Post    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${INVALIDFORMID}/photos/${PHOTOID}?sessionId=${SESSIONID}    body={"comment": "updated comment on photo","title": "updated title on photo"}    timeout=10    
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested form or one of its subforms does not exist in layer ${LAYERNAME}.'    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested form or one of its subforms does not exist in layer ${LAYERNAME}.

Update a Photo Properties With Invalid Photo Id
    ${FORMID}    Get Multiple Attribute Form Descriptors    ${PROJECTID}    ${LAYERID}
    Post    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos/${INVALIDPHOTOID}?sessionId=${SESSIONID}    body={"comment": "updated comment on photo","title": "updated title on photo"}    timeout=10    
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'null'    
    
    #    Assertions
    String    $.status    Bad Request
    Null    $.message
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get All Photos for a Particular Element
    ${FORMID}    Get Multiple Attribute Form Descriptors    ${PROJECTID}    ${LAYERID}    
    Post    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos/filter?sessionId=${SESSIONID}    body={"elementId": "${ELEMENTID}", "objectId": ""}    timeout=10
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'The result is an array containing all photos'    
    #    Assertions
    String    $.status    OK
    String    $.message    The result is an array containing all photos
    
    String    $.result[0].title    updated title on photo
    String    $.result[0].comment    updated comment on photo
    Integer    $.result[0].id    1

Get All Photos for a Particular Element With Entry Parameter
    ${FORMID}    Get Multiple Database Form Descriptors    ${PROJECTID}    ${LAYERID}    
    Post    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos/filter?sessionId=${SESSIONID}    body={"elementId": "-1", "objectId": "${OBJECTID}","asThumbnail": true}    timeout=10
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'The result is an array containing all photos'    
    #    Assertions
    String    $.status    OK
    String    $.message    The result is an array containing all photos
    
    String    $.result[0].title    title on photo
    String    $.result[0].comment    comment on photo
    Integer    $.result[0].id    1    
    
Get All Photos for a Particular Element With Invalid Session Id
    ${FORMID}    Get Multiple Attribute Form Descriptors    ${PROJECTID}    ${LAYERID}
    Post    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos/filter?sessionId=${INVALIDSESSIONID}    body={"elementId": "${ELEMENTID}","objectId": ""}     timeout=10
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.

Get All Photos for a Particular Element With Empty Session Id
    ${FORMID}    Get Multiple Attribute Form Descriptors    ${PROJECTID}    ${LAYERID}
    Post    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos/filter?sessionId=${EMPTY}    body={"elementId": "${ELEMENTID}","objectId": ""}     timeout=10
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.

Get All Photos for a Particular Element With Invalid Project Id
    ${FORMID}    Get Multiple Attribute Form Descriptors    ${PROJECTID}    ${LAYERID}
    Post    /services/rest/v2.0/projects/${INVALIDPROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos/filter?sessionId=${SESSIONID}    body={"elementId": "${ELEMENTID}","objectId": ""}     timeout=10
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested project (id = ${INVALIDPROJECTID}) does not exist.'    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested project (id \=\ ${INVALIDPROJECTID}) does not exist.

Get All Photos for a Particular Element With Invalid Layer Id
    ${FORMID}    Get Multiple Attribute Form Descriptors    ${PROJECTID}    ${LAYERID}
    Post    /services/rest/v2.0/projects/${PROJECTID}/layers/${INVALIDLAYERID}/forms/${FORMID}/photos/filter?sessionId=${SESSIONID}    body={"elementId": "${ELEMENTID}","objectId": ""}     timeout=10
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested layer (id = ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}.'    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested layer (id \=\ ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}.

Get All Photos for a Particular Element With Invalid Form Id
    Post    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${INVALIDFORMID}/photos/filter?sessionId=${SESSIONID}    body={"elementId": "${ELEMENTID}","objectId": ""}     timeout=10
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested form or one of its subforms does not exist in layer ${LAYERNAME}.'    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested form or one of its subforms does not exist in layer ${LAYERNAME}.

Get All Photos for a Particular Element With Invalid Element Id
    ${FORMID}    Get Multiple Attribute Form Descriptors    ${PROJECTID}    ${LAYERID}
    ${RESULT}=    Post        /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos/filter?sessionId=${SESSIONID}    body={"elementId": "${INVALIDELEMENTID}","objectId": ""}     timeout=10
    #    Logs
    Output    Server status response must be 'Bad Request'
    Output    Server message response must be 'Please provide an element id or object id!'
    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    Please provide an element id or object id\!\
    
Get All Photos for a Particular Element With Invalid Entry Id
    ${FORMID}    Get Multiple Attribute Form Descriptors    ${PROJECTID}    ${LAYERID}
    ${RESULT}=    Post        /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos/filter?sessionId=${SESSIONID}    body={"elementId": "${ELEMENTID}","objectId": "${INVALIDOBJECTID}","asThumbnail": true}     timeout=10
    #    Logs
    Output    Server status response must be 'Bad Request'
    Output    Server message response must be 'Please provide an element id or object id!'
    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    Please provide an element id or object id\!
      
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Delete a Photo
    ${FORMID}    Get Multiple Attribute Form Descriptors    ${PROJECTID}    ${LAYERID}
    Delete    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos/${PHOTOID}?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'Result is photo's id'
    
    #    Assertions
    String    $.status    OK
    String    $.message    Result is photo's id
    Integer    $.result.photoId    1
    
    
Delete a Photo from Database Form
    ${FORMID}    Get Multiple Database Form Descriptors    ${PROJECTID}    ${LAYERID}
    ${RESULT}=    Put    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos?sessionId=${SESSIONID}    timeout=10    body={"elementId": ${ELEMENTID},"comment": "${PHOTOCOMMENT}","title": "${PHOTOTITLE}","imageBase64": "iVBORw0KGgoAAAANSUhEUgAAADEAAAAKCAYAAAAdIbZyAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAATKSURBVEhLxVVrTFRXEP7u3rsPARcKUn9UtFqjUdLYB0aDGpLiI41KU39YirZgTakIpW1qi2haSolFjbGkiU0b4w+baC1pU5tWC0WgdpH3CouyQkB57PLcBXZld9ld9t7TOXfpI4390R9tJ7n3zJmZc2a+OWfmCOP3gwz/IzE2514QIIS5B9JvdgLZ/ZU06p8MREkLg0ELnU6riv4L4oFpJAkPGXUQiP+7bHK7iEgdIufp/gD9J9KoAHQ6DHW347vyr3C9rhlR8zkQATq9FpIkchNIWgJIc54JzmvpC+t4AiQVPNcJGpHk4blGQ1kjmZZ4bs9JXTuXKI0oIeAaR8GRU4giIJKohhP29XsyBRhJV/3NJXxd24Zo4rmRREnXzJ2KehJ6A1B54SyutY/j/OkPcfZbM+LnSzBV/ICegVHEGrXo7WhCdUUVZkMKerutsDSZ0G8fQwxt6rR1ofqna9DoJPgmRzDYfw911VXw0k01aBW0/FyF5pabiKDk9Foa0FDfDH0kB62BEpyByVSPltZWOF0+2k8Lm7UVtTW/YB7ZRxgE3Kg1ob31puqv4ZpJBdxvbcGYy6sCEd8pfO8DrV7Erbpa6BevRcysHY8mpaLi8yK0jOlx7lQpEtesQOarRVi46BEkJ63Ezu3piHk4Hh+dPIvUDauRnVcMMeTBlz+2Y1l0EDkFZRB8Dlw2dQH2Rpy42IDlyxKgjPei8HQ5HD1m3HbqsXXdY/B5vLh4oRyRBj1OlJ3H5vWL8FJ+GXReG652TGPWWokzl80IuEexKmkjzhzJw+bXDmDX0+uQcegIIgV5riaIREkHa0MlLtWPYU/KclRXNSIuNgrbtiQjYsFqHM7egca6Org8IQKwGEcP5WHJfIYmUyMSntiE0uMlGO6ywONnSEpJxbGSN+EesWHH3hwkLzHA3NGDdnMbImNisSoxEfERBijkV5FDMEQvxNHDbyGGTeDqletITd+P4x8Xoub7CnRa76L45ElkpW2AwxdCSVE+SgtKYUxOx0ojEFKorjgAXire+y5s3vsGijMex9ufXEF27suwWjox7BERrwyirW8CHscwHNMB6BU39mYdwJS0AGm7n8fk7evYkbYHTz6zBUa9jBl/AO7paao1CTdqquEXdOi+ZUXytp0IOGzoszuxYmUCgiF+4wVMT9iQvicHiE9E5r4M1J4/hbTtB7EvNxObUtbi9awMlF2sgSDPYuOuV1D5xWc4mLsfniCPnupi3B1gDk+IDY442KDTz2Zkxsyd/WyWKvbeoJ112SeZO8jYnd4BZnMRI8+wp1J2s54RJ5sIMFXnCcwya/8ooykbcd5nd0fczDntZ71DE2yCRkt3H5sipU9hbNLtYZYeG3N6Fcbb+5jLx+xTfmYbdTA3OaVwmMvrY3cGHWoMHvp6BoaY2y+zAaeXhcj/0oQ1qtxB6/ke4XeCqp13FTpctTuI1CVCIZlGST0nRVGok3A9NQFlBvnvHsex0yXQ01UIyQqt1UCkApPJjncj3pQUfswkp7gh8lGR52Si2rVkWVb348TtOHE/FJs6550ubEOFS74ZU2CMkvDC1mfx4vuf4rn1S+H2BcMd8R89duSAkYM42myKaoM7fdDj828RT3AcdS+Kna5sGAAA/ArsfWjMREMYtAAAAABJRU5ErkJggg=="}
    ${RESULT}=    Set Variable    ${RESULT['body']}
    ${RESULT}=    Set Variable    ${RESULT['result']}
    ${PHOTOID}=    Set Variable    ${RESULT['photoId']}
    Delete    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos/${PHOTOID}?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'OK'    
    Output    Server message response must be 'Result is photo's id'   
    #    Assertions
    String    $.status    OK
    String    $.message    Result is photo's id
    Integer    $.result.photoId    ${PHOTOID}
    
        
Delete a Photo With Invalid Session Id
    ${FORMID}    Get Multiple Attribute Form Descriptors    ${PROJECTID}    ${LAYERID}
    Delete    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos/${PHOTOID}?sessionId=${INVALIDSESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Delete a Photo With Empty Session Id
    ${FORMID}    Get Multiple Attribute Form Descriptors    ${PROJECTID}    ${LAYERID}
    Delete    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos/${PHOTOID}?sessionId=${EMPTY}    timeout=10
    #    Logs
    Output    Server status response must be 'Unauthorized'    
    Output    Server message response must be 'Invalid session id.'    
    #    Assertions
    String    $.status    Unauthorized
    String    $.message    Invalid session id.
    
Delete a Photo With Invalid Project Id
    ${FORMID}    Get Multiple Attribute Form Descriptors    ${PROJECTID}    ${LAYERID}
    Delete    /services/rest/v2.0/projects/${INVALIDPROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos/${PHOTOID}?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested project (id = ${INVALIDPROJECTID}) does not exist.'    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested project (id \=\ ${INVALIDPROJECTID}) does not exist.

Delete a Photo With Invalid Layer Id
    ${FORMID}    Get Multiple Attribute Form Descriptors    ${PROJECTID}    ${LAYERID}
    Delete    /services/rest/v2.0/projects/${PROJECTID}/layers/${INVALIDLAYERID}/forms/${FORMID}/photos/${PHOTOID}?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested layer (id = ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}.'    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested layer (id \=\ ${INVALIDLAYERID}) does not exist in project ${PROJECTNAME}.

Delete a Photo With Invalid Form Id
    Delete    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${INVALIDFORMID}/photos/${PHOTOID}?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'The requested form or one of its subforms does not exist in layer ${LAYERNAME}.'    
    #    Assertions
    String    $.status    Bad Request
    String    $.message    The requested form or one of its subforms does not exist in layer ${LAYERNAME}.

Delete a Photo With Invalid Photo Id
    ${FORMID}    Get Multiple Attribute Form Descriptors    ${PROJECTID}    ${LAYERID}
    Delete    /services/rest/v2.0/projects/${PROJECTID}/layers/${LAYERID}/forms/${FORMID}/photos/${INVALIDPHOTOID}?sessionId=${SESSIONID}    timeout=10
    #    Logs
    Output    Server status response must be 'Bad Request'    
    Output    Server message response must be 'null'    
    #    Assertions
    String    $.status    Bad Request
    NULL    $.message
    
Start Up
    [Documentation]    Precondotion for running the Form Photo endpoints
    Login JMap Admin    administrator    ${EMPTY}    English    ${JMAPADMIN}    0.5
    Go to Spatial Datasources
    Update One SDS    ${SDS_LIST[0]}
    Update One SDS    ${SDS_LIST[1]}
    Update One SDS    ${SDS_LIST[2]}
    Update One SDS    ${SDS_LIST[3]}
    Update One SDS    ${SDS_LIST[4]}
    Update One SDS    ${SDS_LIST[5]}
    Go to Databases
    ${EXISTDB}=    Exist database    ${DBNAME}
    Run Keyword If    '${EXISTDB}'!='${True}'    Create new database    ${DBNAME}    ${DBNAME} Description
    Run Keyword If    '${EXISTDB}'!='${True}'    Select database driver    PostgreSQL
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database host    192.168.0.65    PostgreSQL
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database port    5436    PostgreSQL
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database    postgis    PostgreSQL
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database Username    postgres
    Run Keyword If    '${EXISTDB}'!='${True}'    Enter database Password    postgres
    Run Keyword If    '${EXISTDB}'!='${True}'    Click Next Button
    Run Keyword If    '${EXISTDB}'!='${True}'    Click Finish Button
    Page Should Contain    ${DBNAME}
    Go to Projects
    Open Project    The World
    Go to Layers Page
    Go to Layer Details    ${LAYERNAME}
    Go to Layer Permissions Page
    Wait Until Element Is Enabled    id:theForm:tabViewPermissionsOwners:tblPrincipals    
    ${EXISTUSER}=    Exist Element in JMap Table Component td    theForm:tabViewPermissionsOwners:tblPrincipals    administrator
    Run Keyword If    '${EXISTUSER}'!='${True}'    Add Permissions to a User    administrator    Add elements    Modify attribute values    Modify elements    Delete elements        
    Run Keyword If    '${EXISTUSER}'!='${True}'    Clicks on Save Permissions
    Go to Forms Page
    ${EXISTFORM}=    Exist Element in JMap Table Component a    theForm:tabViewForms:tblForms   Attribute Form    
    Run Keyword If    '${EXISTFORM}'=='${True}'    Delete Attribute Form    Attribute Form    
    Create Attribute Form    Attribute Form    
    Add Component for an Attribute    Photo Form    PHOTO    0    0    ${False}    ${True}    JMap    Database    ${True}    ${DBNAME}    public.phototable    id    objectid    filename    photo    title    comment    C:\    
    Save Form Layout
    Page Should Contain    Attribute Form
    Wait Until Element Is Enabled    xpath://span[contains(text(),'Settings - Forms')]    
    Click Element    xpath://span[contains(text(),'Settings - Forms')]    
    ${EXISTFORM}=    Exist form   Database Form    
    Run Keyword If    '${EXISTFORM}'=='${True}'    Delete Attribute Form    Database Form
    Create Database Photo Form    Database Form    ${DBNAME}    select * from geodata    geodata.id
    Add Component for an Attribute    External Photo Form    DATABASEFORMEXTERNALPHOTO    0    0    ${False}    ${True}    External    Database    ${True}    ${DBNAME}    public.phototable    id    objectid    filename    photo    title    comment    C:\        
    Save Database Form Layout
    Page Should Contain    Database Form
    Open Session    ${USERNAME}    ${PASSWORD}    ${TYPE}    

Suite Down
    [Documentation]    Close REST API and JMap Admin sessions
    Close session    ${SESSIONID}
    Logout JMap    ${True}
                      