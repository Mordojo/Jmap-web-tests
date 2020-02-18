*** Settings ***

Documentation     Draw Annotation Test cases
#--------------------------------------------------------------------------------------------------------------------------------
Library    String
Library    OperatingSystem
Library    SeleniumLibrary   
Library    Dialogs
Library    BuiltIn
Library    DateTime
Library    XML
#--------------------------------------------------------------------------------------------------------------------------------
Resource    ../../../../common/admin/CommonKeywords.robot
Resource    ../../../../common/CommonLogin.robot
Resource    ../../../../common/jmapWeb/CommonAnnotationWeb.robot
Resource    ../../../../common/jmapWeb/CommonWeb.robot 
#--------------------------------------------------------------------------------------------------------------------------------
Test Setup   Run Keywords    
             ...    Open Browser On JMap Web    ${URLWebApp}    ${RESOLUTION_X}    ${RESOLUTION_Y}    AND
             ...    Login To JMap Web
Test Teardown    LogOut 
Metadata    author    Mordjane Boussad
#-------------------------------------------------------------------------------------------------------------------------------- 
*** Variable ***

${textAnnotationField}    //div[@class='textAnnotationInputDiv']//input
${mapElement}    //div[@id='map']   
#--------------------------------------------------------------------------------------------------------------------------------
*** Test Cases ***


#----------------------------------------------------------------------------------------------------------------------------------------
*** Keywords ***

