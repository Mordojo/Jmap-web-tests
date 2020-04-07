*** Settings ***

Documentation     Common keywords for statistics
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Library		SeleniumLibrary		# Selenium framework
Library    OperatingSystem
Library    Collections    
# Library    SeleniumLibraryHeadlessChromeDownload
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Resource    ../admin/CommonKeywords.robot
Resource    ../CommonLogin.robot
Resource    ../rest_api/CommonRestApi.robot
Resource    ../admin/CommonDeployment.robot
Resource    ../admin/CommonSpatialDataSource.robot
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Variables ***

${BROWSER}        Chrome    
${HEADLESS}    ${False}    #--normal    #--headless
${VAL}    ${EMPTY}
${VAL1}    ${EMPTY}
@{SDS_LIST}=    World Cities    World Continent Names    World Countries    World Hydro    World Lakes    World Ocean Names
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Keywords ***

Open Admin REST API Session
    [Documentation]    Open an admin REST API session
    Open Admin Session    administrator    ${EMPTY}
    
Go to Usage statistics
    [Documentation]    Go to Usage statistics page in JMap Admin
    Click Sections
    Wait Until Element Is Enabled    xpath://span[contains(text(),'Usage statistics')]    timeout=10s        
    Click Element    xpath://span[contains(text(),'Usage statistics')]
    
Go to Context Tab
    [Documentation]    Go to Context tab in usage statistics page
    Wait Until Element Is Enabled    xpath://a[contains(text(),'Context')]    timeout=10s    
    Click Element    xpath://a[contains(text(),'Context')] 
    
Go to Layer Tab
    [Documentation]    Go to Layer tab in usage statistics page
    Wait Until Element Is Enabled    xpath://a[contains(text(),'Layer')]    timeout=10s
    Click Element    xpath://a[contains(text(),'Layer')]
     
Go to Project Tab
    [Documentation]    Go to Project tab in usage statistics page
    Wait Until Element Is Enabled    xpath://a[contains(text(),'Project')]    timeout=10s
    Click Element    xpath://a[contains(text(),'Project')]
     
Show Project Statistics    [Arguments]    ${USER}    ${INITIALDATE}    ${FINALDATE}    ${YEAR}
    [Documentation]    User go to project tab in usage statistics and after filter click Apply button
    Go to Usage statistics
    Go to Project Tab
    Wait Until Element Is Enabled    xpath://input[@id='theForm:tabView:dateFrom_input']    timeout=10s    
    Input Text    xpath://input[@id='theForm:tabView:dateFrom_input']    ${INITIALDATE}/${YEAR}
    Wait Until Element Is Enabled    xpath://input[@id='theForm:tabView:dateTo_input']    timeout=10s    
    Input Text    xpath://input[@id='theForm:tabView:dateTo_input']    ${FINALDATE}/${YEAR}
    Wait Until Element Is Enabled    id:theForm:tabView:userFilter    timeout=10s                
    Select Element in JMap List Items Component    theForm:tabView:userFilter    ${USER}
    Wait Until Element Is Enabled    xpath://button//span[contains(text(),'Apply')]    timeout=10s    
    Click Element    xpath://button//span[contains(text(),'Apply')]
    
Check Project Statistics Exist    [Arguments]    ${PROJECT_NAME}    ${COUNT}
    [Documentation]    Check if the project statistics are showed after click Apply
    Wait Until Element Is Enabled    xpath://div[@id='theForm:tabView:tblStatsProject']//tr//td[1]    timeout=10s     
    ${TEXT}    Get Text    xpath://div[@id='theForm:tabView:tblStatsProject']//tr//td[1]       
    Run Keyword If   '${TEXT}'!='( Empty )'      
    ...    Element Text Should Be    xpath://span[contains(text(),'${PROJECT_NAME}')]    ${PROJECT_NAME}
    Run Keyword If    '${TEXT}'!='( Empty )' 
    ...    Element Text Should Be    xpath://td[contains(text(),'${COUNT}')]    ${COUNT}
    
Reset Statistics
    [Documentation]    Reset statistics clicking on Reset button
    Wait Until Element Is Enabled    xpath://button//span[contains(text(),'Reset')]    timeout=10s    
    Click Element    xpath://button//span[contains(text(),'Reset')]
    
Check if Statistics are Empty
    [Documentation]    Checking if statistics are empty in the list
    Wait Until Element Is Enabled    xpath://td[contains(text(),'( Empty )')]    timeout=10s    
    Element Text Should Be    xpath://td[contains(text(),'( Empty )')]    ( Empty )
    
Download Statistics    [Arguments]    ${TYPE}
    [Documentation]    Download statistics by the type(Excel or PDF)
    Wait Until Element Is Enabled    xpath://button//span[contains(text(),'${TYPE}')]    timeout=10s    
    Click Element    xpath://button//span[contains(text(),'${TYPE}')]
        
Show Layer Statistics    [Arguments]    ${USER}    ${PROJECT}    ${INITIALDATE}    ${FINALDATE}    ${YEAR}
    [Documentation]    User go to layer tab in usage statistics and after filter click Apply button
    Go to Usage statistics
    Go to Layer Tab
    Wait Until Element Is Enabled    xpath://input[@id='theForm:tabView:dateFrom_input']    timeout=10s     
    Input Text    xpath://input[@id='theForm:tabView:dateFrom_input']    ${INITIALDATE}/${YEAR}
    Wait Until Element Is Enabled    xpath://input[@id='theForm:tabView:dateTo_input']    timeout=10s    
    Input Text    xpath://input[@id='theForm:tabView:dateTo_input']    ${FINALDATE}/${YEAR}
    Wait Until Element Is Enabled    id:theForm:tabView:projectFilter    timeout=10s     
    Select Element in JMap List Items Component    theForm:tabView:projectFilter    ${PROJECT}
    Wait Until Element Is Enabled    id:theForm:tabView:userFilter    timeout=10s           
    Select Element in JMap List Items Component    theForm:tabView:userFilter    ${USER}
    Wait Until Element Is Enabled    xpath://button//span[contains(text(),'Apply')]    timeout=10s    
    Click Element    xpath://button//span[contains(text(),'Apply')]
    
Check Layer Statistics Exist    [Arguments]    ${LAYER}    ${COUNT}
    [Documentation]    Check if the layer statistics are showed after click Apply
    Wait Until Element Is Enabled    xpath://div[@id='theForm:tabView:tblStatsLayer']//tr//td[1]    timeout=10s    
    ${TEXT}    Get Text    xpath://div[@id='theForm:tabView:tblStatsLayer']//tr//td[1]        
    Run Keyword If   '${TEXT}'!='( Empty )'      
    ...    Element Text Should Be    xpath://span[contains(text(),'${LAYER}')]    ${LAYER}
    Run Keyword If    '${TEXT}'!='( Empty )' 
    ...    Element Text Should Be    xpath://td[contains(text(),'${COUNT}')]    ${COUNT}
        
Show Context Statistics    [Arguments]    ${USER}    ${FILTER}    ${INITIALDATE}    ${FINALDATE}    ${YEAR}
    [Documentation]    User go to context tab in usage statistics and after filter click Apply button
    Go to Usage statistics
    Go to Context Tab
    Wait Until Element Is Enabled    xpath://input[@id='theForm:tabView:dateFrom_input']    timeout=10s    
    Input Text    xpath://input[@id='theForm:tabView:dateFrom_input']    ${INITIALDATE}/${YEAR}
    Wait Until Element Is Enabled    xpath://input[@id='theForm:tabView:dateTo_input']    timeout=10s    
    Input Text    xpath://input[@id='theForm:tabView:dateTo_input']    ${FINALDATE}/${YEAR}
    Wait Until Element Is Enabled    id:theForm:tabView:filter    timeout=10s     
    Select Element in JMap List Items Component    theForm:tabView:filter    ${FILTER}
    Wait Until Element Is Enabled    id:theForm:tabView:userFilter    timeout=10s           
    Select Element in JMap List Items Component    theForm:tabView:userFilter    ${USER}
    Wait Until Element Is Enabled    xpath://button//span[contains(text(),'Apply')]    timeout=10s    
    Click Element    xpath://button//span[contains(text(),'Apply')]
    
Show Context Statistics by Project    [Arguments]    ${FILTER}    ${INITIALDATE}    ${FINALDATE}    ${YEAR}
    [Documentation]    User go to context tab in usage statistics and after filter by project click Apply button
    Go to Usage statistics
    Go to Context Tab
    Wait Until Element Is Enabled    xpath://input[@id='theForm:tabView:dateFrom_input']    timeout=10s    
    Input Text    xpath://input[@id='theForm:tabView:dateFrom_input']    ${INITIALDATE}/${YEAR}
    Wait Until Element Is Enabled    xpath://input[@id='theForm:tabView:dateTo_input']    timeout=10s    
    Input Text    xpath://input[@id='theForm:tabView:dateTo_input']    ${FINALDATE}/${YEAR}
    Wait Until Element Is Enabled    id:theForm:tabView:filter    timeout=10s    
    Select Element in JMap List Items Component    theForm:tabView:filter    ${FILTER} 
    Wait Until Element Is Enabled    xpath://button//span[contains(text(),'Apply')]    timeout=10s          
    Click Element    xpath://button//span[contains(text(),'Apply')]
    
Check Context Statistics Exist by User    [Arguments]    ${PROJECT_NAME}    ${COUNT}
    [Documentation]    Check if the context exist by user statistics are showed after click Apply
    Wait Until Element Is Enabled    xpath://div[@id='theForm:tabView:tblStatsContext']//tr//td[1]    timeout=10s    
    ${TEXT}    Get Text    xpath://div[@id='theForm:tabView:tblStatsContext']//tr//td[1]        
    Run Keyword If   '${TEXT}'!='( Empty )'      
    ...    Element Text Should Be    xpath://span[contains(text(),'${PROJECT_NAME}')]    ${PROJECT_NAME}
    Run Keyword If    '${TEXT}'!='( Empty )' 
    ...    Element Text Should Be    xpath://td[contains(text(),'${COUNT}')]    ${COUNT}
        
Check Context Statistics Exist    [Arguments]    ${PROJECT_NAME}    ${CONTEXT_NAME}    ${COUNT}
    [Documentation]    Check if the context statistics are showed after click Apply
    Wait Until Element Is Enabled    xpath://div[@id='theForm:tabView:tblStatsContext']//tr//td[1]    timeout=10s        
    ${TEXT}    Get Text    xpath://div[@id='theForm:tabView:tblStatsContext']//tr//td[1]         
    Run Keyword If   '${TEXT}'!='( Empty )'      
    ...    Element Text Should Be    xpath://span[contains(text(),'${PROJECT_NAME}')]    ${PROJECT_NAME}
    Run Keyword If    '${TEXT}'!='( Empty )' 
    ...    Element Text Should Be    xpath://span[contains(text(),'${CONTEXT_NAME}')]    ${CONTEXT_NAME}
    Run Keyword If    '${TEXT}'!='( Empty )'
    ...    Element Text Should Be    xpath://td[contains(text(),'${COUNT}')]    ${COUNT}
        
Edit Project with Usage Statistics    [Arguments]    ${PROJECT_NAME}    ${URL}    ${DELAY}    ${NAME}   ${PROTOCOL}    ${HOST}    ${PORT}    ${PATH}       
    [Documentation]    Start up TC to edit a project to save usage statistics
    Open JMap Admin    ${URL}
    ${SPEED}  Set Selenium Speed		${DELAY}
    Select language    English
    Enter credentials    administrator    ${EMPTY}
    Click Login
    Go to Spatial Datasources
    Update One SDS    ${SDS_LIST[0]}
    Update One SDS    ${SDS_LIST[1]}
    Update One SDS    ${SDS_LIST[2]}
    Update One SDS    ${SDS_LIST[3]}
    Update One SDS    ${SDS_LIST[4]}
    Update One SDS    ${SDS_LIST[5]}
    Go to Projects
    Wait Until Element Is Enabled    id:theForm:tblProjects    timeout=10s    
    Click Element in JMap Table Component    theForm:tblProjects    ${PROJECT_NAME}
    Wait Until Element Is Enabled    xpath://span[contains(text(),'Edit')]    timeout=10s    
    Click Element    xpath://span[contains(text(),'Edit')]
    Wait Until Element Is Enabled    id:dialogForm:usageStatistics    timeout=10s    
    Set Checkbox Sate    dialogForm:usageStatistics    True
    Wait Until Element Is Enabled    xpath://button[@id='dialogForm:wizardButtonNext']    timeout=10s    
    Click Button    xpath://button[@id='dialogForm:wizardButtonNext']
    Wait Until Element Is Enabled    xpath://button[@id='dialogForm:wizardButtonFinish']    timeout=10s    
    Click Button    xpath://button[@id='dialogForm:wizardButtonFinish']
    Go to Deployments
    ${TEMP}=    Exist Element in JMap Table Component a    theForm:tblApplications    ${NAME}
    Run Keyword If    '${TEMP}'!='${True}'
    ...    Create Web Deployment    ${NAME}    ${PROTOCOL}    ${HOST}    ${PORT}    ${PATH}    ${PROJECT_NAME}
    
Get Statistics Counter    [Arguments]    ${CRITERIA}
    [Documentation]    Get the statistics counter from JMAP_CURRENT table and return the value. Use the admin REST API endpoint 
    Open Admin REST API Session
    ${VAL}=    Get Counter Statistics in Current    ${CRITERIA}
    Close Session    ${ADMINSESSIONID}
    [Return]    ${VAL}
    
Check if Statistics Increases on Start Up   [Arguments]    ${CRITERIA}    ${LOGIN WEB URL}    ${DELAY}
    [Documentation]    Check the statistics before and after open Web deployment
    Open Admin REST API Session
    ${VAL}=    Get Counter Statistics in Current    ${CRITERIA}
    Login JMap Web    administrator    ${EMPTY}     ${LOGIN WEB URL}    ${DELAY}
    ${VAL1}=    Get Counter Statistics in Current    ${CRITERIA}    
    Logout JMap Web    administrator    ${True}
    Close Session    ${ADMINSESSIONID}
    Check if Value Increases    ${VAL}    ${VAL1}    

Check if Value Increases    [Arguments]    ${VAL}    ${VAL1}
    [Documentation]    Compare the two given values to see if is increased by one
    ${res}=    Evaluate    ${VAL} + 1
    Should Be Equal    '${res}'    '${VAL1}'	msg=The value was not incremented by 1

Check if Value is not Increases    [Arguments]    ${VAL}    ${VAL1}
    [Documentation]    Compare the two given values to see if is not increased by one
    Should Be Equal    '${VAL}'    '${VAL1}'	msg=The value was incremented by 1            
    
  
    
    
    