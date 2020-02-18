*** Settings ***

Documentation     Tests project creation in JMap Admin 7.0
#-------------------------------------------------------------------------------------------------------------------------------------------
Library		SeleniumLibrary		# Selenium framework
#-------------------------------------------------------------------------------------------------------------------------------------------
Resource    ../../../../common/CommonLogin.robot
Resource    ../../../../common/admin/CommonProject.robot
Resource    ../../../../common/admin/CommonLayer.robot
#-------------------------------------------------------------------------------------------------------------------------------------------
Suite Setup    Login JMap Admin    administrator    ${EMPTY}    English    ${LOGIN URL}    ${DELAY}
Suite Teardown		Close Browser
#-------------------------------------------------------------------------------------------------------------------------------------------
*** Variables ***

${DELAY}    0.8
${LOGIN URL}      http://192.168.0.25:8080/jmapadmin/login.jsf
#-------------------------------------------------------------------------------------------------------------------------------------------
*** Test Cases ***

Create Project
    [Documentation]		Test creation of new project
	Create Project
	
Add Layer to Project
    [Documentation]		Test addition of a layer to an existing project
    Add layer to Project
#------------------------------------------------------------------------------------------------------------------------------------------	
*** Keywords ***

Create Project
    Go to Projects
    Create new project    Project 1    Project description
    Select Project Projection    Longitude/Latitude (WGS 84) - EPSG:4326
    Click Finish Project Wizard
    Page Should Contain    Project 1
    
Add layer to Project
    Go to Projects
    Open Project    Project 1
    Go to Layers Page
    Add new Layer
    Select Layer Datasource    World Cities
    Enter Layer Name    World Cities
    Bind All Layer Attributes
    Enter Geometry Angle
    Select Request Mode    Load by region
    Click Finish Layer Wizard
    Page Should Contain    World Cities
    Go to Layer Details    World Cities
    Page Should Contain    This layer is not published