*** Settings ***

Documentation     Common keywords for login
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Library		SeleniumLibrary		# Selenium framework
#Library    SeleniumLibraryHeadlessChromeDownload
Library    OperatingSystem
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Resource    admin/CommonKeywords.robot
Resource    jmapWeb/CommonWeb.robot
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Variables ***

#${URLAdmin}    http://${localhost}:${internPort}/jmapadmin/login.jsf
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Keywords ***

Select language    [Arguments]    ${LANGUAGE}
    [Documentation]    Select language in the login page
    Wait Until Element Is Enabled    id:selectOneLanguage    timeout=10s    
    Select Element in JMap List Items Component    selectOneLanguage    ${LANGUAGE}
    # Wait Until Element Is Enabled    xpath://*[@id='selectOneLanguage']/div[3]/span    
    # Click Element		xpath://*[@id='selectOneLanguage']/div[3]/span
    # Wait Until Element Is Enabled    xpath://*[@id='selectOneLanguage_items']/li[@data-label='    ${LANGUAGE}    ']    
    # ${XPATH} =    Catenate	SEPARATOR=    //*[@id='selectOneLanguage_items']/li[@data-label='    ${LANGUAGE}    ']
    # Click Element    xpath:${XPATH}    

Select Language Of JMap Web    [Arguments]    ${language}
    [Documentation]    Select Language of JMap Web app
    Wait Until Element Is Enabled    xpath://a[@id='${language}']    timeout=10s    
    ${IslanguageSelected}   Run Keyword And Return Status    Element Attribute Value Should Be    //a[@id='${language}']    class    ${EMPTY}                  
    Run Keyword If    ${IslanguageSelected}
    ...    Click Element    xpath://a[@id='${language}']
        
Enter credentials    [Arguments]    ${USERNAME}    ${PASSWORD}=${EMPTY}
    [Documentation]    Enter username and password in JMap Admin login page
    Wait Until Element Is Enabled    id:inputTextUsername    timeout=10s  
    Clear Element Text    id:inputTextUsername  
    Input Text		id:inputTextUsername  	${USERNAME}
    Wait Until Element Is Enabled    id:inputTextPassword    timeout=10s  
    Clear Element Text    id:inputTextPassword  
	Input Text		id:inputTextPassword  	${PASSWORD}
	
Click Login
    [Documentation]    Click login button in JMap Admin login page
    Wait Until Element Is Enabled    id:buttonLogin    timeout=10s    
    Click Button  	id:buttonLogin

Open JMap Admin    [Arguments]    ${LOGIN URL}
    [Documentation]    Open browser with the jmap url. Set window size to 1920x1080 and Maximize the window for headless test
    Open Browser		${LOGIN URL}  browser=${BROWSER}    alias=JMap Admin
    Set Window Size    1920    1080
    Maximize Browser Window
    
Login JMap Admin    [Arguments]    ${USER}    ${PASS}    ${LANGUAGE}    ${URL}    ${DELAY}
    [Documentation]    Login in JMap Admin with user and pass in a given language 
    Open JMap Admin    ${URL}
    ${SPEED}  Set Selenium Speed		${DELAY}
    Select language    ${LANGUAGE}
    Enter credentials    ${USER}    ${PASS}
    Click Login
	
Logout JMap    [Arguments]    ${CLOSE_BROWSER}
    [Documentation]    Log out JMap Admin and close the browser if the option is given
    Switch Between Browser    JMap
    Wait Until Element Is Enabled    id:theForm:userMenu    timeout=10s    
    Click Element		id:theForm:userMenu
    Wait Until Element Is Enabled    xpath://span[@class='ui-menuitem-text'][text()='Logout']    timeout=10s    
	Click Element		xpath://span[@class='ui-menuitem-text'][text()='Logout']
	Run Keyword If    '${CLOSE_BROWSER}'=='${True}'    Close Browser

Logout From JMap Admin
    [Documentation]    Log out from JMap Admin and close the browser
    Wait Until Element Is Enabled    id:theForm:userMenu    timeout=10s    
    Click Element		id:theForm:userMenu
    Wait Until Element Is Enabled    xpath://span[@class='ui-menuitem-text'][text()='Logout']    timeout=10s    
	Click Element		xpath://span[@class='ui-menuitem-text'][text()='Logout']
	Sleep    1s    
	Close Browser
	Sleep    1s
        
Login JMap Web    [Arguments]    ${USER}    ${PASS}    ${URL}    ${DELAY}
    [Documentation]    Login in JMap Web with user and pass 
    Open JMap Web    ${URL}
    ${SPEED}  Set Selenium Speed		${DELAY}
    Enter JMap Web credentials    ${USER}    ${PASS}
    Click Login JMap Web
    
Login JMap Web NG in ${URL} Using user ${USER} and password ${PASS} with a speed of ${DELAY}
    [Documentation]    Login in JMap Web with user and pass 
    ${SPEED}  Set Selenium Speed		${DELAY}
    Enter JMap WebNG credentials    ${USER}    ${PASS}
    Click Login JMap WebNG

LogOut
    [Documentation]    Log out from JMap Web
    Click On Logout
    Close JMap Web
   
Click On Logout
    [Documentation]    Click on Log out option in JMap Web
    Click On Options Icon
    Wait Until Element Is Enabled    xpath://div[@class='headerContainer']//li[4]    timeout=10s    
    Click Element    xpath://div[@class='headerContainer']//li[4]
    Sleep    2s
    
Logout JMap Web    [Arguments]    ${USER}    ${CLOSE_BROWSER}
    [Documentation]    Log out JMap Web and close the browser if the option is given
    Wait Until Element Is Enabled    xpath://i[@class='configMenuIcon']    timeout=10s    
    Click Element    xpath://i[@class='configMenuIcon']
    Wait Until Element Is Enabled    xpath://a[text()='Logout (${USER})']    timeout=10s    
    Click Element    xpath://a[text()='Logout (${USER})']
    Run Keyword If    '${CLOSE_BROWSER}'=='${True}'    Close Browser
    
Enter JMap Web credentials    [Arguments]    ${USERNAME}    ${PASSWORD}
    [Documentation]    Enter username and password in JMap Web login page
    Wait Until Element Is Enabled    id:username    timeout=10s    
    Input Text		id:username  	${USERNAME}
	Wait Until Element Is Enabled    id:password    timeout=10s    
	Input Text		id:password  	${PASSWORD}
	
Enter JMap WebNG credentials    [Arguments]    ${USERNAME}    ${PASSWORD}
    [Documentation]    Enter username and password in JMap Web login page
    Wait Until Element Is Enabled    id:jmap-login-username-input    timeout=10s    
    Input Text		id:jmap-login-username-input  	${USERNAME}
	Wait Until Element Is Enabled    id:jmap-login-password-input    timeout=10s    
	Input Text		id:jmap-login-password-input  	${PASSWORD}
	
Click Login JMap Web
    [Documentation]    Click login button in JMap Web login page
    Wait Until Element Is Enabled    id:submit    timeout=10s    
    Click Button    id:submit
    Sleep    1s
    
Click Login JMap WebNG
    [Documentation]    Click login button in JMap Web NG login page
    Wait Until Element Is Enabled    id=jmap-login-button    timeout=10s    
    Click Element    id=jmap-login-button
    Sleep    1s
    
Login JMap Web With Check Language    [Arguments]     ${pTitle}    ${pLanguage}    ${ptextButton}    ${pUserName}    ${pPassword}
    [Documentation]    Login in JMap Web with the language provided
    Verify That Text Of The Cover Page is    ${pTitle}          
    Verify That Title Of The Cover Page Is    ${pTitle}    
    Select Language Of JMap Web    ${pLanguage}
    Verify That Selected JMap Web Language Is    ${pLanguage}         
    Verify That Text of Login Button Is   ${ptextButton}             
    Enter JMap Web credentials    ${pUserName}    ${pPassword}
    Verify That Values of Username And Password Fields Are    ${pUserName}    ${pPassword}  
    Click Login JMap Web    

#Open Browser And Login On JMap Web    [Arguments]    ${vURL}
    #[Documentation]    Open Browser and login JMap Web
    #Open Browser    ${vURL}    ${Browser}
    #Set Window Size    1920    1080
    #Maximize Browser Window
    #Login To JMap Web 

Login To JMap Web    [Arguments]    ${pUsername}    ${pPassword}
     Wait Until Element Is Visible    id=username    10s
     Clear Element Text    id=username 
     Clear Element Text    id=password     
     Type    id=username    ${pUsername}
     Type    id=password   ${pPassword}
     Click Element   id=submit
     Sleep    1s
         
Open JMap Web    [Arguments]    ${LOGIN URL}
    [Documentation]    Open browser with the given URL. Set the browser options and the download path
    ...    Set windows size to 1920x1080 and maximize the window
    Set Global Variable    ${HEADLESS}
    Open Custom Chrome Browser    ${LOGIN URL}    
    Set Window Size    1920    1080
    Maximize Browser Window
        
Open Custom Chrome Browser    [Arguments]    ${LOGIN URL}
    [Documentation]    Open customize browser for headless and other chrome options
    ${HOME}=    Get Environment Variable    USERPROFILE
    ${PATH}=    Catenate    SEPARATOR=${/}    ${HOME}    Downloads
    ${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome options}    add_argument    start-maximized
    Run Keyword If   '${HEADLESS}'=='${True}'    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --window-size\=1920,1080
    Call Method    ${chrome_options}    add_argument    --lang\=en-us
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    ${prefs}       Create Dictionary    download.default_directory=${PATH}    download.prompt_for_download=false   
    Call Method    ${chrome options}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    ${BROWSER}    chrome_options=${chrome options}
    #Run Keyword If   '${HEADLESS}'=='${True}'    Enable Download In Headless Chrome    ${PATH}
    Go To    ${LOGIN URL}
    
Open Browser On JMap Web    [Arguments]    ${vURL}    ${RESOLUTION_X}    ${RESOLUTION_Y}
    [Documentation]    Open Browser with the given URL and maximize the window to the resolution
    Setup Metrics
    #Open Browser    ${vURL}    ${Browser}    alias=JMap Web
    Run Keyword If    '${Browser}'=='Chrome'    Open Chrome    ELSE IF    '${Browser}'=='Firefox'    Open Firefox    ELSE    Open Edge    
    Go To    ${vURL}
    Set Window Size    ${RESOLUTION_X}    ${RESOLUTION_Y}
    Maximize Browser Window

Open Chrome
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --ignore-certificate-errors    
    Create Webdriver    ${Browser}    chrome    chrome_options=${chrome_options}
    
Open Firefox
    ${profile}    Evaluate    sys.modules['selenium.webdriver'].FirefoxProfile()    sys, selenium.webdriver
    Call Method    ${profile}    set_preference    accept_untrusted_certs    True    
    Create Webdriver    ${Browser}    firefox    firefox_profile=${profile}    

Open Edge
    ${edge_options}    Evaluate    sys.modules['selenium.webdriver'].EdgeOptions()    sys, selenium.webdriver
    Call Method    ${edge_options}    add_argument    acceptSslCerts    True    
    Create Webdriver    ${Browser}    edge    edge_options=${edge_options}
        
Verify That Selected JMap Web Language Is    [Arguments]    ${expected}
    [Documentation]    Check the language in JMap Web
    Sleep    1s
    Wait Until Element Is Enabled    xpath://a[@id='${expected}']    timeout=10s          
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //a[@id='${expected}']    class    selected
    
Verify That Text of Login Button Is    [Arguments]    ${text}
    [Documentation]    Check the text for loggin button
    Wait Until Element Is Enabled    xpath://button[@id='submit']    timeout=10s    
    Verify Text    //button[@id='submit']    ${text}
    
Verify That Values of Username And Password Fields Are    [Arguments]    ${username}    ${password}
    [Documentation]    Check the values of the user and password fields
    Wait Until Element Is Enabled    xpath://input[@id='username']    timeout=10s    
    Verify Value    //input[@id='username']    ${username}
    Wait Until Element Is Enabled    xpath://input[@id='password']    timeout=10s    
    Verify Value    //input[@id='password']    ${password} 
   
Verify That Error Message To Login Is    [Arguments]    ${expected}
    [Documentation]    Check the error message on wrong login try
    Wait Until Element Contains    //div[@class='alert alert-danger alert-dismissible']    ${expected}    5s    
    Element Should Contain    //div[@class='alert alert-danger alert-dismissible']    ${expected}