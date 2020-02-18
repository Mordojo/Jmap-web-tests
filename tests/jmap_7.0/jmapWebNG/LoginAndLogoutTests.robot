*** Settings ***

Documentation     Test Cases for Log in and log out
#-----------------------------------------------------------------------------------------------------------------------------------------------------
Library    Collections
Library    String
Library    OperatingSystem
Library    SeleniumLibrary    run_on_failure=No Operation   
Library    Dialogs
Library    BuiltIn
Library    DateTime
#------------------------------------------------------------------------------------------------------------------------------------------------------
Resource    ../../../common/admin/CommonKeywords.robot
Resource    ../../../common/CommonLogin.robot
Resource    ../../../common/jmapWeb/CommonWeb.robot
#------------------------------------------------------------------------------------------------------------------------------------------------------
Test Setup   Open Browser On JMap Web    ${URLWebNGApp}    ${RESOLUTION_X}    ${RESOLUTION_Y}
Test Teardown    Close JMap Web
#-------------------------------------------------------------------------------------------------------------------------------------------------------
*** Variables ***

${Project}    Survey Demo
${ChooseLabel}    //h1[contains(text(),'Choose a project')]
${Login}    id=jmap-login-button
${Logout}    id=jmap-mode-user-icon
${RESOLUTION_X}    1920
${RESOLUTION_Y}    1080
#-------------------------------------------------------------------------------------------------------------------------------------------------------
*** Test Cases ***

JM70-922:Login to JMap with valid data
    Login JMap Web NG in ${URLWebNGApp} Using user ${UserName} and password ${Password} with a speed of 0.3s
    Verify That The Page Contains The Element    ${ChooseLabel}
    Verify That The Page Not Contains The Element    ${Login} 
    Select Project ${Project}
    Verify That The Page Contains The Element    ${Logout}
    
        
JM70-923:Login with invalid data in english language
    Login JMap Web NG in ${URLWebNGApp} Using user ${UserName} and password test007 with a speed of 0.3s     
    Verify That The Page Contains The Element    ${Login}
    Verify That The Page Not Contains The Element    ${ChooseLabel}
    Verify That Error Message Is Bad username or password
    Enter JMap WebNG credentials    userTest    ${Password}
    Click Login JMap WebNG
    Verify That The Page Contains The Element    ${Login}
    Verify That The Page Not Contains The Element    ${ChooseLabel}
    Verify That Error Message Is Bad username or password
    
JM70-924:Login with invalid data in french language
    Login JMap Web NG in ${URLWebNGApp} Using user ${UserName} and password test007 with a speed of 0.3s     
    Verify That The Page Contains The Element    ${Login}
    Verify That The Page Not Contains The Element    ${ChooseLabel}
    Verify That Error Message Is Nom d'utilisateur et/ou Mot de passe invalide
    Enter JMap WebNG credentials    userTest    ${Password}
    Click Login JMap WebNG
    Verify That The Page Contains The Element    ${Login}
    Verify That The Page Not Contains The Element    ${ChooseLabel}
    Verify That Error Message Is Nom d'utilisateur et/ou Mot de passe invalide
    
JM70-925:Login with invalid data in spanish language 
    Login JMap Web NG in ${URLWebNGApp} Using user ${UserName} and password test007 with a speed of 0.3s     
    Verify That The Page Contains The Element    ${Login}
    Verify That The Page Not Contains The Element    ${ChooseLabel}
    Verify That Error Message Is Nombre de usuario y / o contrasena invalida
    Enter JMap WebNG credentials    userTest    ${Password}
    Click Login JMap WebNG
    Verify That The Page Contains The Element    ${Login}
    Verify That The Page Not Contains The Element    ${ChooseLabel}
    Verify That Error Message Is Nombre de usuario y / o contrasena invalida
    
JM70-926:Login With The Lack of Data in english language
    Login JMap Web NG in ${URLWebNGApp} Using user ${EMPTY} and password test007 with a speed of 0.3s     
    Verify That The Page Contains The Element    ${Login}
    Verify That The Page Not Contains The Element    ${ChooseLabel}
    Verify That Error Message Is Enter a username
        
JM70-927:Login With The Lack of Data in french language
    Login JMap Web NG in ${URLWebNGApp} Using user ${EMPTY} and password test007 with a speed of 0.3s     
    Verify That The Page Contains The Element    ${Login}
    Verify That The Page Not Contains The Element    ${ChooseLabel}
    Verify That Error Message Is Saisir un nom d'utilisateur
    
JM70-928:Login With The Lack of Data in spanish language
    Login JMap Web NG in ${URLWebNGApp} Using user ${EMPTY} and password test007 with a speed of 0.3s     
    Verify That The Page Contains The Element    ${Login}
    Verify That The Page Not Contains The Element    ${ChooseLabel}
    Verify That Error Message Is Introduzca un nombre de usuario
    
JM70-929:Logout From JMap WebNG
   Login JMap Web NG in ${URLWebNGApp} Using user ${UserName} and password ${Password} with a speed of 0.3s
   Verify That The Page Contains The Element    ${ChooseLabel}
   Verify That The Page Not Contains The Element    ${Login}
   Select Project ${Project}
   Verify That The Page Contains The Element    ${Logout}
   Click On Logout in the Sidebar
   Verify That The Page Contains The Element    ${Login}
   Verify That The Page Not Contains The Element    ${Logout}
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Keywords ***
Verify That Error Message Is ${expected}
    [Documentation]    Check the error message on wrong login
    Wait Until Element Is Visible    class=jmap-error    5s
    Element Should Contain    class=jmap-error   ${expected}

Click On Logout in the Sidebar
    [Documentation]    Click on Log out option in JMap Web NG once it has successfully logged in
    Wait Until Element Is Visible    ${Logout}
    Click Element    ${Logout}
    Wait Until Element Is Enabled    id:jmap-user-panel-logout-button    timeout=10s    
    Click Element    id:jmap-user-panel-logout-button
    Sleep    1s

Select Project ${Project}
    [Documentation]    After loggin in, select a project to display in the map
    Wait Until Element Is Visible    id=jmap-select-project-list  
    ${count}    Get Element Count    //div[@id='jmap-select-project-list']//div
    ${f_temp}   Set Variable    ${EMPTY}
    ${i}	Set Variable    0
    
    :FOR    ${i}    IN RANGE    ${count}
    \    ${f_temp}    Get Text    id=jmap-select-project-item${i}
    \    Run Keyword If    "${Project}"=="${f_temp}"    Click Element    id=jmap-select-project-item${i}  
    \    Exit For Loop IF    "${Project}" == "${f_temp}" 
    

Verify That The Page Contains The Element    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}    7s    
    Page Should Contain Element    ${element}
    
Verify That The Page Not Contains The Element    [Arguments]    ${element}    
    Page Should Not Contain Element    ${element}
    