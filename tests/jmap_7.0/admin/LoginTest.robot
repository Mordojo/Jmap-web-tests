*** Settings ***

Documentation     Tests for login in JMap Admin 7.0
#-------------------------------------------------------------------------------------------------------------------------------------------------
Library		SeleniumLibrary		# Selenium framework
#-------------------------------------------------------------------------------------------------------------------------------------------------
Resource    ../../../common/CommonLogin.robot
Resource    ../../../common/admin/CommonKeywords.robot
#-------------------------------------------------------------------------------------------------------------------------------------------------
Suite Teardown		Close Browser
#-------------------------------------------------------------------------------------------------------------------------------------------------
*** Variables ***

${LOGIN URL}      http://192.168.0.25:8080/jmapadmin/login.jsf
${DELAY}		0.5
#-------------------------------------------------------------------------------------------------------------------------------------------------
*** Test Cases ***

JMap Valid Login
	[Documentation]		Test that users can login with valid credentials
	JMap Valid Login
JMap Logout
	[Documentation] 	Test that users can logout from JMap
	JMap Logout
JMap Invalid Login
	[Documentation] 	Test that users cannot login with wrong credentials
	[Tags]		Wrong_Credentials
	JMap Invalid Login
#-------------------------------------------------------------------------------------------------------------------------------------------------
*** Keywords ***

JMap Valid Login
    Open JMap Admin    ${LOGIN URL}
	${SPEED}  Set Selenium Speed		${DELAY}
	Select language    English    # Valid parameter values: English, Francais, Espanol, Portugues. Cause error with UTF-8 encoding
	Enter credentials    administrator    ${EMPTY}    # ${EMPTY} is a built-in variable
    Click Login
	Page Should Contain Image    xpath://img[@alt='Logo']		loglevel=DEBUG
	
JMap Logout
	Logout JMap    ${False}
	Title Should Be 	JMap Admin
	Page Should Contain Image    xpath://img[@src='images/JMapSplashWebAdmin.png']		loglevel=DEBUG
	
JMap Invalid Login
	Select language    English
	Enter credentials    administrador    administrador
    Click Login
    Page Should Contain		Authentication failed for user		loglevel=DEBUG