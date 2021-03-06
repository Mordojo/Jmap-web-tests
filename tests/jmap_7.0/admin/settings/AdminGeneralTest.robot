*** Settings ***

Documentation     Test JMap Admin general features
#-------------------------------------------------------------------------------------------------------------------------------------------
Library		SeleniumLibrary		# Selenium framework
#-------------------------------------------------------------------------------------------------------------------------------------------
Resource    ../../../../common/CommonLogin.robot
#-------------------------------------------------------------------------------------------------------------------------------------------
Suite Setup    Login JMap Admin    administrator    ${EMPTY}    English    ${LOGIN URL}    ${DELAY}
Test Teardown    Run Keyword If Test Failed    Reload Page
Suite Teardown		Logout JMap    ${True}
#-------------------------------------------------------------------------------------------------------------------------------------------
*** Variables ***

${DELAY}    0.2
${LOGIN URL}      http://192.168.0.25:8080/jmapadmin/login.jsf
#-------------------------------------------------------------------------------------------------------------------------------------------
*** Test Cases ***

