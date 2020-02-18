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
Test Setup   Open Browser On JMap Web    ${URLWebApp}    ${RESOLUTION_X}    ${RESOLUTION_Y}
Test Teardown    Close JMap Web
#-------------------------------------------------------------------------------------------------------------------------------------------------------
*** Variables ***

${Options}    //i[@class='configMenuIcon']
${Login}    id=submit
${RESOLUTION_X}    1920
${RESOLUTION_Y}    1080
#-------------------------------------------------------------------------------------------------------------------------------------------------------
*** Test Cases ***

JM70-922:Login to JMap with valid data
    Login JMap Web With Check Language    ${Title}    en    LOGIN    ${UserName}    ${Password}
    Verify That The Page Contains The Element    ${Options}
    Verify That The Page Not Contains The Element    ${Login} 
        
JM70-923:Login with invalid data in english language
    Login JMap Web With Check Language    ${Title}    en    LOGIN    ${UserName}    test007 
    Verify That The Page Contains The Element    ${Login}
    Verify That The Page Not Contains The Element    ${Options}
    Verify That Error Message To Login Is    Invalid Username and/or Password
    Close Error Message Of Login Page
    Enter JMap Web credentials    userTest    ${Password}
    Verify That Values of Username And Password Fields Are    userTest    ${Password}
    Click Login JMap Web
    Verify That The Page Contains The Element    ${Login}
    Verify That The Page Not Contains The Element    ${Options}
    Verify That Error Message To Login Is    Invalid Username and/or Password
    
JM70-924:Login with invalid data in french language
    Login JMap Web With Check Language    ${Title}    fr    SE CONNECTER    ${UserName}    test007 
    Verify That The Page Contains The Element    ${Login}
    Verify That The Page Not Contains The Element    ${Options}
    Verify That Error Message To Login Is    Nom d'utilisateur et/ou Mot de passe invalide
    Close Error Message Of Login Page
    Enter JMap Web credentials    userTest    ${Password}
    Verify That Values of Username And Password Fields Are    userTest    ${Password}
    Click Login JMap Web
    Verify That The Page Contains The Element    ${Login}
    Verify That The Page Not Contains The Element    ${Options}
    Verify That Error Message To Login Is    Nom d'utilisateur et/ou Mot de passe invalide
    
JM70-925:Login with invalid data in spanish language 
    Login JMap Web With Check Language    ${Title}    es    CONECTARSE    ${UserName}    test007
    Verify That The Page Contains The Element    ${Login}
    Verify That The Page Not Contains The Element    ${Options}
    Verify That Error Message To Login Is    Nombre de usuario y / o contraseña inválida
    Close Error Message Of Login Page
    Enter JMap Web credentials    userTest    ${Password}
    Verify That Values of Username And Password Fields Are    userTest    ${Password}
    Click Login JMap Web
    Verify That The Page Contains The Element    ${Login}
    Verify That The Page Not Contains The Element    ${Options}
    Verify That Error Message To Login Is    Nombre de usuario y / o contraseña inválida
    
JM70-926:Login With The Lack of Data in english language
    Login JMap Web With Check Language    ${Title}    en    LOGIN    ${EMPTY}    ${UserName}
    Verify That The Page Contains The Element    ${Login}
    Verify That The Page Not Contains The Element    ${Options}
    Verify That Error Message To Login Is    Invalid Username and/or Password
    Close Error Message Of Login Page
    Enter JMap Web credentials    ${UserName}    ${EMPTY}
    Verify That Values of Username And Password Fields Are    ${UserName}    ${EMPTY}
    Click Login JMap Web
    Verify That The Page Contains The Element    ${Login}
    Verify That The Page Not Contains The Element    ${Options}
    Verify That Error Message To Login Is    Invalid Username and/or Password
    
JM70-927:Login With The Lack of Data in french language
    Login JMap Web With Check Language    ${Title}    fr    SE CONNECTER    ${EMPTY}    ${UserName}
    Verify That The Page Contains The Element    ${Login}
    Verify That The Page Not Contains The Element    ${Options}
    Verify That Error Message To Login Is    Nom d'utilisateur et/ou Mot de passe invalide
    Close Error Message Of Login Page
    Enter JMap Web credentials    ${UserName}    ${EMPTY}
    Verify That Values of Username And Password Fields Are    ${UserName}    ${EMPTY}
    Click Login JMap Web
    Verify That The Page Contains The Element    ${Login}
    Verify That The Page Not Contains The Element    ${Options}
    Verify That Error Message To Login Is    Nom d'utilisateur et/ou Mot de passe invalide
    
JM70-928:Login With The Lack of Data in spanish language
    Login JMap Web With Check Language    ${Title}    es    CONECTARSE    ${EMPTY}    ${UserName}
    Verify That The Page Contains The Element    ${Login}
    Verify That The Page Not Contains The Element    ${Options}
    Verify That Error Message To Login Is    Nombre de usuario y / o contraseña inválida
    Close Error Message Of Login Page
    Enter JMap Web credentials    ${UserName}    ${EMPTY}
    Verify That Values of Username And Password Fields Are    ${UserName}    ${EMPTY}
    Click Login JMap Web
    Verify That The Page Contains The Element    ${Login}
    Verify That The Page Not Contains The Element    ${Options}
    Verify That Error Message To Login Is    Nombre de usuario y / o contraseña inválida
    
JM70-929:Logout From JMap
    Login JMap Web With Check Language    ${Title}    en    LOGIN    ${UserName}    ${Password}
    Verify That The Page Contains The Element    ${Options}
    Verify That The Page Not Contains The Element    ${Login}
    Click On Logout
    Verify That The Page Contains The Element    ${Login}
    Verify That The Page Not Contains The Element    ${Options}
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Keywords ***
Verify That The Page Contains The Element    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}    7s    
    Page Should Contain Element    ${element}
    
Verify That The Page Not Contains The Element    [Arguments]    ${element}    
    Page Should Not Contain Element    ${element}
    