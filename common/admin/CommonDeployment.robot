*** Settings ***

Documentation     Common keywords for deployments
#-------------------------------------------------------------------------------------------------------------------
Library		SeleniumLibrary		# Selenium framework
#-------------------------------------------------------------------------------------------------------------------
Resource    CommonKeywords.robot
#-------------------------------------------------------------------------------------------------------------------
*** Keywords ***

Create Web Deployment   [Arguments]    ${NAME}    ${PROTOCOL}    ${HOST}    ${PORT}    ${PATH}    ${PROJECT_NAME}
    [Documentation]    Create new web deployment with the given name, protocol, host, port, path and project name
    Click Create Button
    Wait Until Element Is Visible    xpath://div[@id='deploymentWizardForm:deploymentWizardSteps']    10
    Click Element    xpath://div[@id='deploymentWizardForm:html_web']
    Click Next Button
    Type Deployment Name    ${NAME}        
    Select Element in JMap List Items Component    deploymentWizardForm:applicationProtocol    ${PROTOCOL}
    Type Deployment Host    ${HOST}
    Type Deployment Port    ${PORT}
    Type Deployment Path    ${PATH}
    Click Next Button       
    Select Element in JMap List Items Component    deploymentWizardForm:htmlProjectId    ${PROJECT_NAME}
    Click Next Button
    Wait Until Element Is Enabled    xpath://button[@id='deploymentWizardForm:buttonAddHtmlLayer']     timeout=10s
    Click Element    xpath://button[@id='deploymentWizardForm:buttonAddHtmlLayer']
    Wait Until Element Is Enabled    xpath://span[contains(text(),'JMap dynamic layer (entire project)')]        
    Click Element    xpath://span[contains(text(),'JMap dynamic layer (entire project)')]
    Wait Until Element Is Enabled    xpath://button[@id='deploymentWizardForm:buttonSaveUserDefinedLayer']    
    Click Element    xpath://button[@id='deploymentWizardForm:buttonSaveUserDefinedLayer']    
    Click Next Button
    Click Next Button
    Click Next Button
    Click Finish Button
    Wait Until Keyword Succeeds    200    1     Page Should Contain Element    xpath://span[contains(text(),'Launch')]             
    
Click Deployment Wizard Cancel Button
    [Documentation]    Click Deployment wizard cancel button. 
    Click Button    xpath://button[@id='deploymentWizardForm:wizardButtonCancel'] 
            
Type Deployment Name    [Arguments]    ${DEPLOYMENT_NAME}
    [Documentation]    Type Deployment name in the wizard 
    Input Text    xpath://input[@id='deploymentWizardForm:wizardDeploymentName']    ${DEPLOYMENT_NAME}
    
Type Deployment Host    [Arguments]    ${HOST}
    [Documentation]    Type Deployment host in the wizard
    Input Text    xpath://input[@id='deploymentWizardForm:appHost']    ${HOST}
    
Type Deployment Port    [Arguments]    ${PORT}
    [Documentation]    Type Deployment port in the wizard
    Clean Input    xpath://input[@id='deploymentWizardForm:appWebPort']    ${PORT}    
    
Type Deployment Path    [Arguments]    ${PATH}
    [Documentation]    Type Deployment path in the wizard
    Input Text    xpath://input[@id='deploymentWizardForm:appPath']    ${PATH}
    
Exist Deployment    [Arguments]    ${NAME}
    [Documentation]    Check in the deployment table if the name exist. Return True is the deployment exist, false if not.
    ${FALG}    Set Variable    ${False}
    ${FLAG}=    Exist Element in JMap Table Component a    theForm:tblApplications    ${NAME}
    [Return]    ${FLAG}    