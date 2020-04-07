*** Settings ***

Documentation     Tests stadistics in JMap Web
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Library		SeleniumLibrary		# Selenium framework
Library    BuiltIn
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Resource    ../../../../common/CommonLogin.robot
Resource    ../../../../common/jmapWeb/CommonWeb.robot
Resource    ../../../../common/admin/CommonKeywords.robot
Resource    ../../../../common/statistics/CommonStatistics.robot
Resource    ../../../../common/rest_api/CommonRestApi.robot
Resource    ../../../../common/jmapWeb/CommonContextWeb.robot
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Suite Setup    Edit Project with Usage Statistics    ${PROJECT_NAME}    ${LOGIN URL}    ${DELAY}    ${NAME}    ${PROTOCOL}    ${HOST}    ${PORT}    ${PATH}           
Suite Teardown		Logout JMap    ${True}   
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Variables ***

${LOGIN URL}    http://192.168.0.25:8080
${LOGIN WEB URL}      http://192.168.0.25:8080/World_Web/login.jsp
${JMAP URL}      http://192.168.0.25:8080/World_Web/index.jsp
${DELAY}		0.5
${PROJECTID}    0     #required field
${VAL}    0
${LAYERID}     7
${LAYERID_VISIBILITY}    2
${PROJECT_NAME}    The World
${CONTEXT_NAME}    MyContext
${CONTEXT_DESCRIPTION}    MyDescription
${LAYER_NAME}    Continents Name
${NAME}    World_Web
${PROTOCOL}    http
${HOST}    192.168.0.25
${PORT}    8080
${PATH}    /World_Web
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Test Cases ***

Add Project Web Statistics on App Start Up
    [Documentation]   Capture user activity (project opened) in JMap Web, so can send this data to JMap Server.
    ...  every time a user opens a project in web application, a counter is incremented for that project.
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${PROJECTID}, "targetType": "PROJECT", "action": "OPEN"}   
    Add Project Web Statistics on App Start Up    ${CRITERIA}    ${LOGIN WEB URL}    ${DELAY}
    
Add Layer Web Statistics on App Start Up
    [Documentation]   Capture user activity (layer viewed) in JMap Web on start up, so can send this data to JMap Server.
    ...  every time a user opens a web application, a counter is incremented for that layer.
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERID}, "targetType": "LAYER", "action": "VIEW"}   
    Add Layer Web Statistics on App Start Up    ${CRITERIA}
    
Add Layer Web Statistics Changing Layer Visibility
    [Documentation]   Capture user activity (layer viewed) in JMap Web, so can send this data to JMap Server.
    ...  the first time a user change layer visibility in web application, a counter is incremented for that layer.
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERID_VISIBILITY}, "targetType": "LAYER", "action": "VIEW"}   
    Add Layer Web Statistics Changing Layer Visibility    ${CRITERIA}
    
Check Layer Web Statistics for Layer with no Visibility
    [Documentation]   Check user activity (layer viewed) in JMap Web for layer with no visibility in web application,
    ...     a counter should not be incremented for that layer.
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERID_VISIBILITY}, "targetType": "LAYER", "action": "VIEW"}   
    Check Layer Web Statistics for Layer with no Visibility    ${CRITERIA}
    
Check Layer Web Statistics Changing Layer Visibility More Than One Time
    [Documentation]   Check user activity (layer viewed) in JMap Web. 
    ...    the second time a user change layer visibility in web application, a counter should not be incremented for that layer.
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetId": ${LAYERID_VISIBILITY}, "targetType": "LAYER", "action": "VIEW"}   
    Check Layer Web Statistics Changing Layer Visibility More Than One Time    ${CRITERIA} 
    
Add Context Web Statistics
    [Documentation]   Capture user activity (context created) in JMap Web, so can send this data to JMap Server.
    ...  every time a user create a context in web application, a counter is incremented for that context.
    ${CRITERIA}=    Catenate    {"projectId": ${PROJECTID}, "targetType": "CONTEXT", "action": "CREATE"}   
    Add Context Web Statistics    ${CRITERIA}    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
*** Keywords ***

Add Project Web Statistics on App Start Up    [Arguments]    ${CRITERIA}    ${LOGIN WEB URL}    ${DELAY}
    Check if Statistics Increases on Start Up    ${CRITERIA}    ${LOGIN WEB URL}    ${DELAY}    
           
Add Layer Web Statistics on App Start Up    [Arguments]    ${CRITERIA}
    Check if Statistics Increases on Start Up    ${CRITERIA}    ${LOGIN WEB URL}    ${DELAY}        
   
Add Layer Web Statistics Changing Layer Visibility    [Arguments]    ${CRITERIA}
    Login JMap Web    administrator    ${EMPTY}     ${LOGIN WEB URL}    ${DELAY}
    ${VAL}=    Get Statistics Counter    ${CRITERIA}
    Click On Show Sidebar Icon
    Change Layer Visibility    ${LAYER_NAME}
    ${VAL1}=    Get Statistics Counter    ${CRITERIA} 
    Check if Value Increases    ${VAL}    ${VAL1}          
    Logout JMap Web    administrator    ${True}

Check Layer Web Statistics for Layer with no Visibility    [Arguments]    ${CRITERIA}
    ${VAL}=    Get Statistics Counter    ${CRITERIA} 
    Login JMap Web    administrator    ${EMPTY}     ${LOGIN WEB URL}    ${DELAY}
    Click On Show Sidebar Icon      
    ${VAL1}=    Get Statistics Counter    ${CRITERIA} 
    Check if Value is not Increases    ${VAL}    ${VAL1}       
    Logout JMap Web    administrator    ${True}
    
Check Layer Web Statistics Changing Layer Visibility More Than One Time    [Arguments]    ${CRITERIA}
    Login JMap Web    administrator    ${EMPTY}     ${LOGIN WEB URL}    ${DELAY}
    ${VAL}=    Get Statistics Counter    ${CRITERIA}
    Click On Show Sidebar Icon
    Change Layer Visibility    ${LAYER_NAME}
    ${VAL1}=    Get Statistics Counter    ${CRITERIA} 
    Check if Value Increases    ${VAL}    ${VAL1}
    Change Layer Visibility    ${LAYER_NAME}
    Change Layer Visibility    ${LAYER_NAME}
    ${VAL}=    Get Statistics Counter    ${CRITERIA}
    Check if Value is not Increases    ${VAL}    ${VAL1}         
    Logout JMap Web    administrator    ${True}    
    
Add Context Web Statistics    [Arguments]    ${CRITERIA}    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}
    Login JMap Web    administrator    ${EMPTY}     ${LOGIN WEB URL}    ${DELAY}
    ${VAL}=    Get Statistics Counter    ${CRITERIA}
    Click On Show Sidebar Icon
    Go to My Maps Tab
    Create New Context    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}
    Click On Show Sidebar Icon
    Go to My Maps Tab    
    ${VAL1}=    Get Statistics Counter    ${CRITERIA}
    Check if Value Increases    ${VAL}    ${VAL1} 
    Delete Context    ${CONTEXT_NAME}    
    Logout JMap Web    administrator    ${True}    