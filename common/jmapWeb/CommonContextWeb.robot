*** Settings ***
Documentation     Common keywords of Contexts for JMap Web
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
Library    SeleniumLibrary		# Selenium framework
Library    OperatingSystem
Library    Collections  
Library    String   
#Library    SeleniumLibraryHeadlessChromeDownload
#-----------------------------------------------------------------------------------------------------------------------------------------------------------  
Resource    ../admin/CommonKeywords.robot
Resource    ../CommonLogin.robot
Resource    ../../common/jmapWeb/CommonAnnotationWeb.robot
Resource    CommonWeb.robot
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
*** Variables ***
${CONTEXT_BACKGROUND_COLOR}    rgba(255, 255, 255, 1)
${CONTEXT_URL}    ${EMPTY}

#------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Keywords ***
Get Context    [Arguments]    ${titleText}
    [Documentation]    This keyword for JMap Web, allows
    Log    -----> Go to search the Context: "${titleText}"    console=yes
    ${contextCount}    Get JMap Web Component Element Count    //div[@class='contextList']/div 
    ${curTitleContext}    Set Variable If    ${contextCount} == 0    No Title  
    :FOR    ${i}    IN RANGE    0    ${contextCount}
    \    ${curTitleContext}    Get Text    //div[@class='contextList']/div[${i+1}]//div[@class='contextTitle']
    \    Exit For Loop If    "${curTitleContext}"=="${titleText}" 
    ${curDescContext}    Run Keyword If    ${contextCount} > 0    Get Text    //div[@class='contextList']/div[${i+1}]//div[@class='contextDescription']  
    @{contextInfos}    Run Keyword If    "${curTitleContext}"=="${titleText}"    Create List    ${i+1}    ${curTitleContext}    ${curDescContext}    ELSE    Create List    No Context       
    Log    -----> Context Infos : @{contextInfos}    console=yes
    [Return]    @{contextInfos}
    
Click On "Save New Map" Icon
    [Documentation]    This keyword for JMap Web, allows to click on the (+) button to add a new context
    Log    \n====================== Open a new context's form =======================    console=yes
    Wait Until Element Is Enabled    //a[@id='saveButton']    timeout=10s 
    Click Element    //a[@id='saveButton']
    Sleep    1s
    Log    -----> The Context's form IS OPENED.    console=yes

Verify That Modal Dialog Title Is    [Arguments]    ${texte}
    [Documentation]    This keyword for JMap Web, allows to verify the title (text) of the context's form
    Wait Until Element Is Enabled    //h4[@class='modal-title']    timeout=10s
    ${getTitleForm}    Get Text    //h4[@class='modal-title'] 
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${getTitleForm}    ${texte}    message=The Modal Dialog Title is "${getTitleForm}". However, it should be "${texte}".
    Run Keyword If    "${getTitleForm}"=="${texte}"    Log    -----> The title of the current Modal Dialog IS REALLY: "${texte}".    console=yes

Enter Value "${value}" In "${fieldName}" Field
    [Documentation]    This keyword for JMap Web, allows to enter a value in the "Title" field of the context's form
    Log    \n====================== Go to fill the field "${fieldName}" with: "${value}" =======================    console=yes
    ${locator}    Set Locator Of Context Field    ${fieldName}  
    Set Selenium Speed    0.01 seconds  
    Wait Until Element Is Enabled    ${locator}    timeout=10s  
    Clear Element Text    ${locator} 
    Run Keyword If    "${value}"!="${EMPTY}"    Input Text    ${locator}    ${value}
    Sleep    1s    reason=Wait in order to verify the values       
    Verify That The Value Of "${fieldName}" Field In Context Form Is "${value}"
                    
Create New Context    [Arguments]    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}=${EMPTY}
    [Documentation]    Create new context with the given name and description
    Open Inner Tab Menu Panel
    Go To My Maps Tab
    Click On "Save New Map" Icon
    Verify That Modal Dialog Title Is    My maps
    Enter Value "${CONTEXT_NAME}" In "Title" Field
    Enter Value "${CONTEXT_DESCRIPTION}" In "Description" Field
    Save Context
    # Reload Page        

Update The Context "${CONTEXT_NAME}" And "${CONTEXT_DESCRIPTION}" With The Values "${NEW_CONTEXT_NAME}" And "${NEW_CONTEXT_DESCRIPTION}"
    [Documentation]    This keyword for JMap Web, allows to update an existing context
    Click On Update Icon Of The Context    ${CONTEXT_NAME}
    Verify That Modal Dialog Title Is    My maps
    Verify That The Value Of "Title" Field In Context Form Is "${CONTEXT_NAME}"
    Verify That The Value Of "Description" Field In Context Form Is "${CONTEXT_DESCRIPTION}"
    Enter Value "${NEW_CONTEXT_NAME}" In "Title" Field
    Enter Value "${NEW_CONTEXT_DESCRIPTION}" In "Description" Field
    Save Context

Update The Context "${CONTEXT_NAME}" Without Values 
    [Documentation]    This keyword for JMap Web, allows to update an existing context withous values (e.g: only with new map)
    Click On Update Icon Of The Context    ${CONTEXT_NAME}
    Verify That Modal Dialog Title Is    My maps
    Verify That The Value Of "Title" Field In Context Form Is "${CONTEXT_NAME}"
    Save Context
     
Save Context
    [Documentation]    This keyword for JMap Web, allows to click on the "SAVE" button of the context's form
    Log    \n====================== Save The Context's Form =======================    console=yes
    Run Keyword And Continue On Failure    Wait Until Element Is Enabled    xpath://a[@class='btn btn-default btn-primary']    timeout=10s    
    Run Keyword And Continue On Failure    Click Element    xpath://a[@class='btn btn-default btn-primary']
    Sleep    1s    

Dismiss Context
    [Documentation]    This keyword for JMap Web, allows to click on the "CANCEL" button of the context's form
    Log    \n====================== Cancel The Context's Form =======================    console=yes
    Run Keyword And Continue On Failure    Wait Until Element Is Enabled    xpath://a[@class='btn btn-default buttonSpacer']    timeout=10s    
    Run Keyword And Continue On Failure    Click Element    xpath://a[@class='btn btn-default buttonSpacer']
    Sleep    1s 

Select Context    [Arguments]    ${CONTEXT_NAME}
    [Documentation]    Select context from the list by the given name
    Log    \n====================== Go To Select The Context: ${CONTEXT_NAME} =======================    console=yes
    Open Inner Tab Menu Panel
    Go To My Maps Tab
    @{contextInfos}    Get Context    ${CONTEXT_NAME}
    Run Keyword And Continue On Failure    Click Element    //div[@class='contextList']/div[${contextInfos[0]}]/div
        
Delete Context    [Arguments]    ${CONTEXT_NAME}
    [Documentation]    Delete context from the list by the given na
    Log    \n====================== Go To Delete The Context: ${CONTEXT_NAME} =======================    console=yes
    Open Inner Tab Menu Panel
    Go To My Maps Tab
    @{contextInfos}    Get Context    ${CONTEXT_NAME}
    ${countInfos}    Get Length    ${contextInfos}
    Run Keyword If    ${countInfos} > 1  
    ...    Run Keywords    
           ...    Click Element    xpath=//div[@class='contextList']/div[${contextInfos[0]}]//div[@class='deleteContextButton']    AND
           ...    Verify Alert Text And Accept    Are You sure you want to delete this map? 
    Verify That The Context That Does Not Exist In The List Is    ${CONTEXT_NAME}

Set Locator Of Context Field    [Arguments]    ${fieldName}
    [Documentation]    This keyword for JMap Web, allows to set the locator of the "Title" or "Description" fields of the context's form
    ${locator}    Set Variable If    '${fieldName}'=='Title'    xpath=//input[@placeholder='${fieldName}'] 
    ...    '${fieldName}'=='Description'    xpath=//textarea[@placeholder='${fieldName}']
    [Return]    ${locator}

Click On Update Icon Of The Context    [Arguments]    ${CONTEXT_NAME}
    [Documentation]    This keyword for JMap Web, allows to open the form of the desired context
    Log    \n====================== Go To Update The Context: ${CONTEXT_NAME} =======================    console=yes
    @{contextInfos}    Get Context    ${CONTEXT_NAME}
    Run Keyword And Continue On Failure    Click Element    xpath=//div[@class='contextList']/div[${contextInfos[0]}]//div[@class='updateContextButton']
    Sleep    1s    reason=Wait for the context form to open 

Click On Share Icon Of The Context    [Arguments]    ${CONTEXT_NAME}
    [Documentation]    This keyword for JMap Web, allows to click on "Share" icon to open the short page "Sharing a map"
    Log    -----> Click on Share icon of the Context: ${CONTEXT_NAME}    console=yes
    @{contextInfos}    Get Context    ${CONTEXT_NAME}
    Run Keyword And Continue On Failure    Click Element    xpath=//div[@class='contextList']/div[${contextInfos[0]}]//div[@class='shareContextButton']
    Sleep    1s    reason=Wait for the short page "Sharing a map" to open

Click On Copy Link Icon 
    [Documentation]    This keyword for JMap Web, allows to copy the link of the desired context
    Log    -----> Clicking On Copy Link Icon    console=yes
    Run Keyword And Continue On Failure    Wait Until Element Is Enabled    //div[@class='CopyLinkDiv']/i    5s 
    Run Keyword And Continue On Failure    Click Element    //div[@class='CopyLinkDiv']/i    
    Sleep    1s    reason=Wait for the "Copied" tooltip to appear

Get Context URL
    [Documentation]    This keyword for JMap Web, allows to copy the link of the desired context
    Log    -----> Getting Context URL...   console=yes
    Run Keyword And Continue On Failure    Wait Until Page Contains Element    id=linkUrl    5s
    ${CONTEXT_URL}    Get Element Attribute    id=linkUrl    value
    Set Test Variable    ${CONTEXT_URL}    
    Log    -----> The context URL is: ${CONTEXT_URL}   console=yes        
Sort Contexts By    [Arguments]    ${sortedBy}
    [Documentation]    This keyword for "JMap Web", allows to sort a contexts list
    ...    The argument $sortedBy should be: 'Alphabetical', 'Last Used' or 'Last Update' in english deployment. 
    ...    And it should be: 'Alphabétique', 'Dernière utilisation' or 'Mise à jour' in French deployment.
    ...    And it should be: 'Alfabético', 'Último utilizado' or 'Último actualizado' in Spanish deployment.
    Log    \n=================== Go to sort Contexts list ===================    console=yes
    Wait Until Element Is Enabled    //span[@class='contextSortMessage']    5s
    Click Element    //span[@class='contextSortMessage']
    Wait Until Element Is Enabled    //label[contains(text(),'${sortedBy}')]    5s
    Click Element    //label[contains(text(),'${sortedBy}')]        
    Log    -----> The Contexts list is sorted by: ${sortedBy}    console=yes
    Sleep    1s  

Filter Contexts By    [Arguments]    ${text}
    [Documentation]    This keyword for JMap Web, allows to filter the contexts list
    Log    \n=================== Go to filter Contexts list with: "${text}" ===================    console=yes 
    Type    id=contextSearchInputField    ${text}
    Verify Value    id=contextSearchInputField    ${text} 

Close Modal Dialog Of The Shared Context
    [Documentation]    This keyword for JMap Web, allows to close the modal dialog of the shared context
    Log    -----> Closing the modal dialog of the shared context    console=yes
    Run Keyword And Continue On Failure    Wait Until Element Is Enabled    //a[@data-dismiss='modal']    5s 
    Run Keyword And Continue On Failure    Click Element    //a[@data-dismiss='modal']    
    Sleep    1s
    
Share Context    [Arguments]    ${CONTEXT_NAME}
    [Documentation]    This keyword for JMap Web, allows to Share the desired context
    Log    \n====================== Go to share the context: ${CONTEXT_NAME} =======================    console=yes
    Open Inner Tab Menu Panel
    Go To My Maps Tab
    Click On Share Icon Of The Context    ${CONTEXT_NAME}
    Verify That Modal Dialog Title Is    Sharing a map
    Select Checkbox    //div[@class='shareContextDiv']//input
    Verify That Context Id Appears As Parameter With The URL    ${URLWebApp}
    Click On Copy Link Icon 
    Verify That Context Link Is Copied
    Close Modal Dialog Of The Shared Context
                        
Verify That The Value Of "${fieldName}" Field In Context Form Is "${value}"
    [Documentation]    This keyword for JMap Web, allows to verify the value of the "Title" and "Description" fields of the context's form
    ${locator}    Set Locator Of Context Field    ${fieldName}   
    Wait Until Element Is Enabled    ${locator}    7s 
    ${curValue}    Get Value    ${locator} 
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${curValue}    ${value}    msg=The Value Of "${fieldName}" Field Is "${curValue}". However, it should be "${value}" 
    Run Keyword If    "${curValue}"=="${value}"    Log    -----> The Field "${fieldName}" IS REALLY CONTAINS the value: "${value}" =======================    console=yes

Verify That The Context That Exist In The List Is    [Arguments]    ${titleText}    ${descText}
    [Documentation]    This keyword for JMap Web, allows to check the existence of the context (it can be display or hidden)
    Log    -----> The Context "${titleText}" IS CREATED and ADDED in the list.    console=yes
    @{contextInfos}    Get Context    ${titleText}    
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${contextInfos[1]}    ${titleText}    msg=The title Of the created context "${contextInfos[0]}" Is "${contextInfos[1]}". However, it should be "${titleText}"          
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${contextInfos[2]}    ${descText}    msg=The title Of the created context "${contextInfos[0]}" Is "${contextInfos[2]}". However, it should be "${descText}"
       
Verify That The Image Preview Is Visible In The Context    [Arguments]    ${titleText}
    [Documentation]    This keyword for JMap Web, allows to check the existence of the image preview in the desired context
    Log    \n====================== Go To Verify That The Image Preview Appears In The Context: ${titleText} =======================    console=yes
    @{contextInfos}    Get Context    ${titleText}
    ${elem}    Get Webelement    //div[@class='contextList']/div[${contextInfos[0]}]//div[@class='contextImgContainer']
    ${img_src}=    Get Element Attribute    //div[@class='contextList']/div[${contextInfos[0]}]//img[@class='contextImgPreview']    src  
    ${curBgColor}    Call Method    ${elem}    value_of_css_property    background-color
    ${imgContainer}    Fetch From Right    ${img_src}    data:image/png;base64,
    ${countImgContainer}    Get length    ${imgContainer}
    Run Keyword If    '${curBgColor}'=='${CONTEXT_BACKGROUND_COLOR}'    Log    -----> The BACKGROUND COLOR Appears in the image of the context: ${titleText}. As expected.    console=yes
    Run Keyword If    ${countImgContainer} > 1    Log    -----> The image src Appears in the context: ${titleText}. As expected.    console=yes
    Run Keyword And Continue On Failure    Should Be Equal    ${curBgColor}    ${CONTEXT_BACKGROUND_COLOR}    msg=The BACKGROUND COLOR is "${curBgColor}". However, it should be "${CONTEXT_BACKGROUND_COLOR}"
    Run Keyword And Continue On Failure    Should Contain    ${img_src}    data:image/png;base64,
    Run Keyword And Continue On Failure    Run Keyword Unless     ${countImgContainer} > 1     Fail    msg=The image src does not appear in the context: "${titleText}". However, it should be appear in the context.   
    
Verify That The Context That Does Not Exist In The List Is    [Arguments]    ${titleText}
    [Documentation]    This keyword for JMap Web, allows to check that the context must be deleted or the list of contexts is empty
    Log    \n====================== Go To Verify That The Context "${titleText}" Does Not Exist In The List =======================    console=yes
    @{contextInfos}    Get Context    ${titleText}
    ${noContext}    Convert To String    ${contextInfos[0]}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${noContext}    No Context    msg=The Context "${titleText}" exists in the list. However, it should be not exist
    Run Keyword If    "${noContext}"=="No Context"    Log    -----> The Context '${title Text}' does not exist or has been deleted/hidden from the list or the list of contexts is EMPTY. As expected    console=yes 

Verify That Context "${pContext}" Is In "${pNumRank}" st/nd Rank
    Log    \n====================== Verify That Context "${pContext}" Is In "${pNumRank}" st/nd Rank =======================    console=yes
    @{contextInfos}    Get Context    ${pContext}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${contextInfos[0]}    ${pNumRank}    msg=The context "${pContext}" does not appear in the row "${pNumRank}". But, it is in row "${contextInfos[0]}" (it should be in the row "${pNumRank}")        
    Run Keyword If    "${contextInfos[1]}"=="${pContext}"    Log    -----> The Context "${pContext}" is realy in the rank: ${contextInfos[0]}    console=yes

Verify That Context Id Appears As Parameter With The URL    [Arguments]    ${linkURL}
    [Documentation]    This keyword for JMap Web, allows to verify that the URL $linkURL must appear with an automatically generated context identifier
    Log    -----> Verifing That context id appears as parameter with the URL...   console=yes
    Get Context URL
    Run Keyword And Continue On Failure    Should Contain    ${CONTEXT_URL}    ${linkURL}?context=
    ${contextId}    Fetch From Right    ${CONTEXT_URL}    ${linkURL}?context=
    ${countContextId}    Get length    ${contextId}
    Run Keyword And Continue On Failure    Run Keyword Unless     ${countContextId} > 10     Fail    msg=The Context link is not copied correctly. In other words, the Id of the linked context is not genered correctly !!!   
           
Verify That Context Link Is Copied 
    [Documentation]    This keyword for JMap Web, check that the context is copied correctly
    Log    -----> Verifying That Context Link Is Copied correctly    console=yes
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //div[@class='CopyLinkDiv']/i    data-original-title    Copied!    
        
Create Context With Freehand Annotation    [Arguments]    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}=${EMPTY}
    [Documentation]    This keyword for JMap Web, allows to create new context with Freehand Annotation
    ...    The coordinates are fixed, because it's not necessary to add them as variables 
    ...    It's used it also as precondition for other keywords
    Draw a Freehand Annotation With Coordinates    -175    130
    Verify That The Annotation Type Is    LineString
    Create New Context    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}
    
Verify That The Freehand Annotation Appears In The Context    [Arguments]    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION} 
    [Documentation]    This keyword for JMap Web, allows to check whether the Freehand Annotation is added correctly
    ...    it verify the keyword : "Create Context With Freehand Annotation"
    Verify That The Context That Exist In The List Is    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}
    Verify That The Image Preview Is Visible In The Context    ${CONTEXT_NAME}
    Reload Page
    Select Context    ${CONTEXT_NAME}
    Verify That The Annotation Type Is    LineString
    Close Inner Tab Menu Panel
    Click On Annotation Down List Arrow
    Click On Freehand Annotation
    Element Annotation Should Be Selected    Freehand
    Click On Modification Icon
    Select The Drawing Tool Freehand Annotation    -175    130
    The Icone Rotate Right Should be Exist

Create Context With Line Annotation    [Arguments]    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}=${EMPTY}
    [Documentation]    This keyword for JMap Web, allows to create new context with Line Annotation
    ...    The coordinates are fixed in the keyword "Draw a Line Annotation", because it's not necessary to add them as variables 
    ...    It's used it also as precondition for other keywords
    Draw a Line Annotation
    Verify That The Annotation Type Is    LineString
    Create New Context    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}
    
Verify That The Line Annotation Appears In The Context    [Arguments]    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}
    [Documentation]    This keyword for JMap Web, allows to check whether the Line Annotation is added correctly
    ...    it verify the keyword : "Create Context With Line Annotation"
    Verify That The Context That Exist In The List Is    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}
    Verify That The Image Preview Is Visible In The Context    ${CONTEXT_NAME}
    Reload Page
    Select Context    ${CONTEXT_NAME}
    Verify That The Annotation Type Is    LineString
    Close Inner Tab Menu Panel
    Click On Annotation Down List Arrow
    Click On Line Annotation
    Element Annotation Should Be Selected    Line
    Click On Modification Icon
    Select The Drawing Tool Line Annotation    -175    130
    The Icone Rotate Right Should be Exist

Create Context With Point Annotation    [Arguments]    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}=${EMPTY}
    [Documentation]    This keyword for JMap Web, allows to create new context with Point Annotation
    ...    The coordinates are fixed in the keyword "Draw a Point Annotation With Coordinates", because it's not necessary to add them as variables 
    ...    It's used it also as precondition for other keywords
    Draw a Point Annotation With Coordinates    0   0
    Verify That The Annotation Type Is    Point
    Create New Context    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}
    
Verify That The Point Annotation Appears In The Context    [Arguments]    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}
    [Documentation]    This keyword for JMap Web, allows to check whether the Point Annotation is added correctly
    ...    it verify the keyword : "Create Context With Point Annotation"
    Verify That The Context That Exist In The List Is    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}
    Verify That The Image Preview Is Visible In The Context    ${CONTEXT_NAME}
    Reload Page
    Select Context    ${CONTEXT_NAME}
    Verify That The Annotation Type Is    Point
    Close Inner Tab Menu Panel
    Click On Annotation Down List Arrow
    Click On Point Annotation
    Element Annotation Should Be Selected    Point
    Click On Modification Icon
    Select The Drawing Tool Point Annotation    0   0
    The Icone Rotate Right Should be Exist
    
Create Context With Rectangle Annotation    [Arguments]    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}=${EMPTY}
    Draw a rectangle annotation
    Verify That The Annotation Type Is    Rectangle
    Create New Context    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}

Verify That The Rectangle Annotation Appears In The Context    [Arguments]    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}    
    Verify That The Context That Exist In The List Is    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}
    Verify That The Image Preview Is Visible In The Context    ${CONTEXT_NAME}
    Reload Page
    Select Context    ${CONTEXT_NAME}
    Verify That The Annotation Type Is    Rectangle
    Close Inner Tab Menu Panel
    Click On Annotation Down List Arrow
    Click On Rectangle Annotation
    Element Annotation Should Be Selected    Rectangle
    Click On Modification Icon
    Select The Drawing Tool Rectangle Annotation    0   0
    The Icone Rotate Right Should be Exist 
    
Create Context With Polygon Annotation    [Arguments]    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}=${EMPTY}
    Draw a Polygon annotation
    Verify That The Annotation Type Is    Polygon
    Create New Context    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}
    
Verify That The Polygon Annotation Appears In The Context    [Arguments]    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}
    Verify That The Context That Exist In The List Is    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}
    Verify That The Image Preview Is Visible In The Context    ${CONTEXT_NAME}
    Reload Page
    Select Context    ${CONTEXT_NAME}
    Verify That The Annotation Type Is    Polygon
    Close Inner Tab Menu Panel
    Click On Annotation Down List Arrow
    Click On Polygon Annotation
    Element Annotation Should Be Selected    Polygon
    Click On Modification Icon
    Select The Drawing Tool Polygon Annotation    0   0
    The Icone Rotate Right Should be Exist
      
Create Context With Circle Annotation    [Arguments]    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}=${EMPTY}
    Draw a Circle annotation
    Verify That The Annotation Type Is    Circle
    Create New Context    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}
    
Verify That The Circle Annotation Appears In The Context    [Arguments]    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}
    Verify That The Context That Exist In The List Is    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}
    Verify That The Image Preview Is Visible In The Context    ${CONTEXT_NAME}
    Reload Page
    Select Context    ${CONTEXT_NAME}
    Verify That The Annotation Type Is    Circle
    Close Inner Tab Menu Panel
    Click On Annotation Down List Arrow
    Click On Circle Annotation
    Element Annotation Should Be Selected    Circle
    Click On Modification Icon
    Select The Drawing Tool Circle Annotation    0   0
    The Icone Rotate Right Should be Exist
    
Create Context With Text Annotation    [Arguments]    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}=${EMPTY}
    Draw a Text Annotation With Text And Coordinates    Argentina    0   0
    Verify That The Annotation Type Is    Text
    Verify That The Annotation Text Is    Argentina
    Create New Context    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}
    
Verify That The Text Annotation Appears In The Context    [Arguments]    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}
    Verify That The Context That Exist In The List Is    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}
    Verify That The Image Preview Is Visible In The Context    ${CONTEXT_NAME}
    Reload Page
    Select Context    ${CONTEXT_NAME}
    Verify That The Annotation Type Is    Text
    Verify That The Annotation Text Is    Argentina
    Close Inner Tab Menu Panel
    Click On Annotation Down List Arrow
    Click On Text Annotation
    Element Annotation Should Be Selected    Text
    Click On Modification Icon
    Select The Drawing Tool Text Annotation    0   0
    The Icone Rotate Right Should be Exist

Create Context With Distance Measurement    [Arguments]    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}=${EMPTY}
    Create A Distance Measurement    -185   115    0    0           
    Verify That Geometry Type And Its Value Are    LineString    Length: 3,068,383.65 meters
    Create New Context    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}
    
Verify That The Distance Measurement Appears In The Context    [Arguments]    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}
    Verify That The Context That Exist In The List Is    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}
    Reload Page
    Select Context    ${CONTEXT_NAME}
    Verify That The Context That Exist In The List Is    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}
    Verify That Geometry Type And Its Value Are    LineString    Length: 3,068,383.65 meters

Create Context With Surface Measurement    [Arguments]    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}=${EMPTY}
    Create A Surface Measurement    0   0    125   -90    120    10    -75    50
    Verify That Geometry Type And Its Value Are    Polygon    Perimeter: 6,674,465.48 meters\nArea: 1,360,467,310,043.09 meters2
    Create New Context    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}
    
Verify That The Surface Measurement Appears In The Context    [Arguments]    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}
    Verify That The Context That Exist In The List Is    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}
    Reload Page
    Select Context    ${CONTEXT_NAME}
    Verify That The Context That Exist In The List Is    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}
    Verify That Geometry Type And Its Value Are    Polygon    Perimeter: 6,674,465.48 meters\nArea: 1,360,467,310,043.09 meters2

Create Context With Circular Surface Measurement    [Arguments]    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}=${EMPTY}
    Create A Circular Surface Measurement    -50   50    0    0
    Verify That Geometry Type And Its Value Are    Circle    Radius: 985,894.97 meters\nCircumference: 6,160,249.64 meters\nArea: 3,027,973,794,596.89 meters2
    Create New Context    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}
    
Verify That The Circular Surface Measurement Appears In The Context    [Arguments]    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}
    Verify That The Context That Exist In The List Is    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}
    Reload Page
    Select Context    ${CONTEXT_NAME}
    Verify That The Context That Exist In The List Is    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}
    Verify That Geometry Type And Its Value Are    Circle    Radius: 985,894.97 meters\nCircumference: 6,160,249.64 meters\nArea: 3,027,973,794,596.89 meters2 
    
Share Context With A Normal Page    [Arguments]    ${CONTEXT_NAME}
    Check The Initial Map View
    Pan The Map    100    -150
    Check The New Map View
    Create New Context    ${CONTEXT_NAME}
    Verify That The Context That Exist In The List Is    ${CONTEXT_NAME}    ${EMPTY}
    Share Context    ${CONTEXT_NAME}
    Open New Tab     ${CONTEXT_URL}
    Verify That The "New Map" Is Displayed
    Open Inner Tab Menu Panel
    Go To My Maps Tab
    Verify That The Context That Exist In The List Is    ${CONTEXT_NAME}    ${EMPTY}
    Verify That The Image Preview Is Visible In The Context    ${CONTEXT_NAME}
    Close Window
    Select Window    MAIN
    Delete Context    ${CONTEXT_NAME}

Share Context With Freehand Annotation    [Arguments]    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}=${EMPTY} 
    Create Context With Freehand Annotation    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}
    Share Context    ${CONTEXT_NAME}
    Open New Tab     ${CONTEXT_URL}
    Verify That The Annotation Type Is    LineString 
    Open Inner Tab Menu Panel
    Go To My Maps Tab   
    Verify That The Freehand Annotation Appears In The Context    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}  
    Close Window
    Select Window    MAIN
    Delete Context    ${CONTEXT_NAME}

Share Context With Line Annotation    [Arguments]    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}=${EMPTY} 
    Create Context With Line Annotation    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}       
    Share Context    ${CONTEXT_NAME}
    Open New Tab     ${CONTEXT_URL}
    Verify That The Annotation Type Is    LineString 
    Open Inner Tab Menu Panel
    Go To My Maps Tab   
    Verify That The Line Annotation Appears In The Context    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}  
    Close Window
    Select Window    MAIN
    Delete Context    ${CONTEXT_NAME} 
    
Share Context With Point Annotation    [Arguments]    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}=${EMPTY}
    Create Context With Point Annotation    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}       
    Share Context    ${CONTEXT_NAME}
    Open New Tab     ${CONTEXT_URL}
    Verify That The Annotation Type Is    Point 
    Open Inner Tab Menu Panel
    Go To My Maps Tab   
    Verify That The Point Annotation Appears In The Context    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}  
    Close Window
    Select Window    MAIN
    Delete Context    ${CONTEXT_NAME}

Share Context With Rectangle Annotation    [Arguments]    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}=${EMPTY}
    Create Context With Rectangle Annotation    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}       
    Share Context    ${CONTEXT_NAME}
    Open New Tab     ${CONTEXT_URL}
    Verify That The Annotation Type Is    Rectangle 
    Open Inner Tab Menu Panel
    Go To My Maps Tab   
    Verify That The Rectangle Annotation Appears In The Context    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}  
    Close Window
    Select Window    MAIN
    Delete Context    ${CONTEXT_NAME}
    
Share Context With Polygon Annotation    [Arguments]    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}=${EMPTY}
    Create Context With Polygon Annotation    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}       
    Share Context    ${CONTEXT_NAME}
    Open New Tab     ${CONTEXT_URL}
    Verify That The Annotation Type Is    Polygon 
    Open Inner Tab Menu Panel
    Go To My Maps Tab   
    Verify That The Polygon Annotation Appears In The Context    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}  
    Close Window
    Select Window    MAIN
    Delete Context    ${CONTEXT_NAME}

Share Context With Circle Annotation    [Arguments]    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}=${EMPTY}
    Create Context With Circle Annotation    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}       
    Share Context    ${CONTEXT_NAME}
    Open New Tab     ${CONTEXT_URL}
    Verify That The Annotation Type Is    Circle 
    Open Inner Tab Menu Panel
    Go To My Maps Tab   
    Verify That The Circle Annotation Appears In The Context    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}  
    Close Window
    Select Window    MAIN
    Delete Context    ${CONTEXT_NAME}

Share Context With Text Annotation    [Arguments]    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}=${EMPTY}
    Create Context With Text Annotation    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}       
    Share Context    ${CONTEXT_NAME}
    Open New Tab     ${CONTEXT_URL}
    Run Keywords    Verify That The Annotation Type Is    Text    AND    Verify That The Annotation Text Is    Argentina        
    Open Inner Tab Menu Panel
    Go To My Maps Tab   
    Verify That The Text Annotation Appears In The Context    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}  
    Close Window
    Select Window    MAIN
    Delete Context    ${CONTEXT_NAME}
    
Share Context With Distance Measurement    [Arguments]    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}=${EMPTY}
    Create Context With Distance Measurement    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION} 
    Share Context    ${CONTEXT_NAME}
    Open New Tab     ${CONTEXT_URL}
    Verify That Geometry Type And Its Value Are    LineString    Length: 3,068,383.65 meters  
    Open Inner Tab Menu Panel
    Go To My Maps Tab   
    Verify That The Distance Measurement Appears In The Context    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}  
    Close Window
    Select Window    MAIN
    Delete Context    ${CONTEXT_NAME}
    
Share Context With Surface Measurement    [Arguments]    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}=${EMPTY}
    Create Context With Surface Measurement    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION} 
    Share Context    ${CONTEXT_NAME}
    Open New Tab     ${CONTEXT_URL}
    Verify That Geometry Type And Its Value Are    Polygon    Perimeter: 6,674,465.48 meters\nArea: 1,360,467,310,043.09 meters2  
    Open Inner Tab Menu Panel
    Go To My Maps Tab   
    Verify That The Surface Measurement Appears In The Context    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}  
    Close Window
    Select Window    MAIN
    Delete Context    ${CONTEXT_NAME}
    
Share Context With Circular Surface Measurement    [Arguments]    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}=${EMPTY}
    Create Context With Circular Surface Measurement    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}   
    Share Context    ${CONTEXT_NAME}  
    Open New Tab     ${CONTEXT_URL}  
    Verify That Geometry Type And Its Value Are    Circle    Radius: 985,894.97 meters\nCircumference: 6,160,249.64 meters\nArea: 3,027,973,794,596.89 meters2
    Open Inner Tab Menu Panel
    Go To My Maps Tab   
    Verify That The Circular Surface Measurement Appears In The Context    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}  
    Close Window
    Select Window    MAIN
    Delete Context    ${CONTEXT_NAME}
