*** Settings ***

Documentation     Common keywords for projects
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Library		SeleniumLibrary		# Selenium framework
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Resource    CommonKeywords.robot
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Keywords ***

Create new project    [Arguments]    ${NAME}    ${DESCRIPTION}
    [Documentation]    Create new project with the given name a description
    Click Element    xpath://span[text()='Create']
    Input Text    id:dialogForm:wizardProjectName    ${NAME}
    Input Text    id:dialogForm:wizardProjectDescription    ${DESCRIPTION}
    Go Next in Project Wizard
    
Go Next in Project Wizard
    [Documentation]    Click next in the project wizard
    Wait Until Element Is Enabled    id:dialogForm:wizardButtonNext    timeout=10s    
    Click Button    id:dialogForm:wizardButtonNext
    
Select Project Projection    [Arguments]    ${PROJECTION}
    [Documentation]    Select projection in the project wizard
    Wait Until Element Is Enabled    xpath://*[@id='dialogForm:wizardProjectMapProjection']/div[3]/span    timeout=10s    
    Click Element    xpath://*[@id='dialogForm:wizardProjectMapProjection']/div[3]/span
    ${XPATH} =    Catenate	SEPARATOR=    //*[@id='dialogForm:wizardProjectMapProjection_items']/li[@data-label='    ${PROJECTION}    ']
    Click Element    xpath:${XPATH}
        
Click Finish Project Wizard
    [Documentation]    Click Finish in the project wizard
    Wait Until Element Is Enabled    id:dialogForm:wizardButtonFinish    timeout=10s    
    Click Button    id:dialogForm:wizardButtonFinish
    
Open Project    [Arguments]    ${PROJECTNAME}
    [Documentation]    Click given project name in the list and Open project configuration page
    ${XPATH} =    Catenate	SEPARATOR=	//*[@id='theForm:tblProjects_data']//a[text()='    ${PROJECTNAME}    ']
    Click Element    xpath:${XPATH}
    
Go to Layers Page
    [Documentation]    Go to layers page in the project
    Click Sections
    Wait Until Element Is Enabled    xpath://*[@id='theForm:sectionsButton_menu']//span[text()='Layers']    timeout=10s    
    Click Element    xpath://*[@id='theForm:sectionsButton_menu']//span[text()='Layers']
    
