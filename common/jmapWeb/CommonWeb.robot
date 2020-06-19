*** Settings ***
Documentation     Common keywords for JMap Web
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
Library    SeleniumLibrary		# Selenium framework
Library    OperatingSystem
Library    Collections 
Library    String       
#-----------------------------------------------------------------------------------------------------------------------------------------------------------  
Resource    ../admin/CommonKeywords.robot
Resource    ../CommonLogin.robot
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
*** Variables ***

${URLWebNightly}    http://192.168.0.25:8080/Test84Map7_0/login.jsp
${Title}        JMap_Web_WorldTest_HTTP    
${internPort}    8080
${externPort}    8081    #8081   8442
${localhost}    localhost    #jmap7dev.jmaponline.net   192.168.2.71  192.168.0.33
${URLWebApp}    http://${localhost}:${externPort}/${Title}
${URLWebNGApp}    http://${localhost}:${internPort}/services/jmap
${UserName}    userTest1
${Password}    userTest1
${Browser}    Chrome    #headlesschrome
${English}    en
${French}    fr
${Spanish}    es
#------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Keywords ***

Close Elements Attribute Table
    Click Element    xpath://span[@class='elementAttributeTablePanelButton elementAttributeTablePanelControlClose']

Activate / Deactivate Selection Tool    [Arguments]    ${TYPE}
    [Documentation]    Click in selection tool for the given type of selection
    Click On Selection Down List Arrow
    Run Keyword If    '${TYPE}'=='PUNCTUAL'     Click Element    xpath://div[@id='point_SelectionTrigger']
    Run Keyword If    '${TYPE}'=='LINEAR'     Click Element    xpath://div[@id='linestring_SelectionTrigger']
    Run Keyword If    '${TYPE}'=='RECTANGULAR'     Click Element    xpath://div[@id='rectangle_SelectionTrigger']
    Run Keyword If    '${TYPE}'=='POLYGONAL'     Click Element    xpath://div[@id='polygon_SelectionTrigger']
    Run Keyword If    '${TYPE}'=='CIRCULAL'     Click Element    xpath://div[@id='circle_SelectionTrigger']
    Sleep    1s    

Select Spatial Elements    [Arguments]    @{ELEMENTS}
    [Documentation]    Receive as parameter the spatial elements list, each one separated by a tab space.
    ...    The action is done by Javascripts
    ${FIRST_ELEMENT}=    Remove From List    ${ELEMENTS}    0
    # ${Y}=    Get From List    ${ELEMENTS}    2
    ${PARAMS}=    Catenate    SEPARATOR=    [
    ${PARAMS}=    Catenate    SEPARATOR=    ${PARAMS}    {"attributeName":"COUNTRY","layerName":"Countries","elementIds":["    ${FIRST_ELEMENT}    "]}
    :FOR    ${ELEMENT}    IN    @{ELEMENTS}
    \    ${PARAMS}=    Catenate    SEPARATOR=    ${PARAMS}    ,
    \    ${PARAMS}=    Catenate    SEPARATOR=    ${PARAMS}    {"attributeName":"COUNTRY","layerName":"Countries","elementIds":["
    \    ${PARAMS}=    Catenate    SEPARATOR=    ${PARAMS}    ${ELEMENT}
    \    ${PARAMS}=    Catenate    SEPARATOR=    ${PARAMS}    "]}
    
    ${PARAMS}=    Catenate    SEPARATOR=    ${PARAMS}    ]
    Execute Javascript    JMAP_API.Service.Selection.setSelection(${PARAMS})
    Sleep    5s
    Execute Javascript    JMAP_API.Service.Selection.initializeElementAttributesPanel(JMap.api.getSelectedElements())
   
Clear Spatial Selection
    [Documentation]    Clear the spatial selection if exist.
    ...    The action is done by Javascripts
    Execute Javascript    JMap.api.clearSelection()

Zoom in
    [Documentation]    Zoom in the map by the + icon
    Wait Until Element Is Enabled    xpath://*[@id="ZoomButtonControlIn"]    timeout=10s    
    Click Element    xpath://*[@id="ZoomButtonControlIn"] 
    Sleep    7s       
    
Zoom out
    [Documentation]    Zoom out the map by the - icon
    Wait Until Element Is Enabled    xpath://*[@id="ZoomButtonControlOut"]    timeout=10s    
    Click Element    xpath://*[@id="ZoomButtonControlOut"]
    Sleep    3s
    
Zoom to Initial View
    [Documentation]    Zoom or Restore to initial view by the icon
    Wait Until Element Is Enabled    xpath://*[@id="InitialView"]    timeout=10s    
    Click Element    xpath://*[@id="InitialView"]
    Sleep    7s 
    
Open Element Mouseover Bubble Over    [Arguments]    @{COORDINATES}
    [Documentation]    Execute a JMap javascript function to open the mouse over bubble over a desired coordinate
    ${X}=    Get From List    ${COORDINATES}    1
    ${Y}=    Get From List    ${COORDINATES}    2
    Execute Javascript    JMap.app.clickToolManager.currentTool.singleclick({coordinate :[${X}, ${Y}]})  

Pan The Map    [Arguments]    @{COORDINATES}
    [Documentation]    Pan the map to an specific coordinates, x and y pair
    ...    The action is done by Javascripts
    ${X}=    Get From List    ${COORDINATES}    0
    ${Y}=    Get From List    ${COORDINATES}    1
    Execute Javascript    JMap.app.map.getView().setCenter([${X}, ${Y}])
    Sleep    1s  
        
Click On The Map At Coordinates    [Arguments]    ${xoffset}    ${yoffset}
    [Documentation]    Click on the map using xoffset and yoffset as displacement from the center of the map (0.0)
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Enabled    xpath://div[@id='map']    timeout=2s    
    Click Element At Coordinates    xpath://div[@id='map']    ${xoffset}    ${yoffset} 
    
Double Click On The Map At Coordinates    [Arguments]    ${xoffset}    ${yoffset}
    [Documentation]    Double Click on the map using xoffset and yoffset as displacement from the center of the map (0.0)
    :FOR    ${count}    IN RANGE    1    3
    \    Click On The Map At Coordinates    ${xoffset}    ${yoffset}  
    Sleep    1s  
      
Click On Options Icon
    [Documentation]    Go to Option menu
    Wait Until Element Is Enabled    xpath://i[@class='configMenuIcon']    timeout=10s    
    Click Element    xpath://i[@class='configMenuIcon']
    Sleep    1s    
    
Click On Share features Icon
    [Documentation]    Go to Share features menu
    Wait Until Element Is Enabled    xpath://button[@class='glyphicon jmap_share btn btn-default']    timeout=10s    
    Click Element   xpath://button[@class='glyphicon jmap_share btn btn-default']
    
Click On Measurement Down List Arrow
    [Documentation]    Go to Measurement menu
    Wait Until Element Is Enabled    xpath://div[@id='smallTrigger_measureSet']    timeout=10s    
    Click Element    xpath://div[@id='smallTrigger_measureSet']
    Sleep    1s    
  
Click On Selection Down List Arrow
    [Documentation]    Go to Selection menu
    Wait Until Element Is Enabled    xpath://div[@id='smallTrigger_selectionSet']    timeout=10s    
    Click Element    xpath://div[@id='smallTrigger_selectionSet']
    Sleep    1s
      
Close Error Message Of Login Page
    [Documentation]    Close the Error message after login with invalid credentials
    Wait Until Element Is Enabled    xpath://button[@class='close']    timeout=10s    
    Click Element    xpath://button[@class='close'] 
    
Type    [Arguments]    ${locator}    ${value}
    [Documentation]    Type the value in the locator after been clean
    Set Selenium Timeout    0.1s
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Enabled    ${locator}    2s
    Clear Element Text    ${locator}   
    Input Text    ${locator}    ${value} 
    Sleep    1s    
    
Verify Title    [Arguments]    ${text}
    [Documentation]    Check for the title existence
    Set Browser Implicit Wait    5s
    Run Keyword And Continue On Failure    Title Should Be    ${text}
    
Verify Text    [Arguments]    ${locator}    ${text}
    [Documentation]    Check for the text existence on the locator      
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Visible    ${locator}    2s         
    Run Keyword And Continue On Failure    Element Text Should Be    ${locator}    ${text}    
         
Verify Value    [Arguments]    ${locator}    ${value}
    [Documentation]    Check for the value existence on the locator
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Enabled    ${locator}             
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    ${locator}    value    ${value}    
    
Verify That Text Of The Cover Page Is    [Arguments]    ${text}
    [Documentation]    Check for the text of the cover page
    Wait Until Element Is Enabled    xpath://h4[@id='jmap-title']    timeout=10s       
    Verify Text    //h4[@id='jmap-title']    ${text}
    
Verify That Title Of The Cover Page Is    [Arguments]    ${text}
    [Documentation]    Check for the title of the cover page 
    Verify Title    ${text}
    
Verify That Texts Of Options Icon Are    [Arguments]    ${iconText}    ${text1}    ${text2}    ${text3}    ${text4}
    [Documentation]    Check the links of the Option Menu
    Wait Until Element Is Visible    //button[@class='configMenu btn btn-default']    5s    
    Element Attribute Value Should Be    //button[@class='configMenu btn btn-default']    data-original-title    ${iconText}
    Verify Text    //a[contains(text(),'${text1}')]    ${text1}
    Verify Text    //a[contains(text(),'${text2}')]    ${text2}
    Verify Text    //a[contains(text(),'${text3}')]    ${text3}
    Verify Text    //a[contains(text(),'${text4}')]    ${text4}
    
Verify That Texts Of Share Features Icon Are    [Arguments]    ${iconText}    ${text1}    ${text2}    ${text3}
    [Documentation]    Check the links of the Share Features Menu
    Wait Until Element Is Visible    //button[@class='glyphicon jmap_share btn btn-default']    5s    
    Element Attribute Value Should Be    //button[@class='glyphicon jmap_share btn btn-default']    data-original-title    ${iconText}
    Verify Text    //a[contains(text(),'${text1}')]    ${text1}
    Verify Text    //a[contains(text(),'${text2}')]    ${text2}
    Verify Text    //a[contains(text(),'${text3}')]    ${text3}
    
Verify That Text Of Full Screen Icon Is    [Arguments]    ${iconText}
    [Documentation]    Check the links of the Full Screen tool
    Wait Until Element Is Visible    //button[@class='btn btn-default ol-full-screen-false']    5s    
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //button[@class='btn btn-default ol-full-screen-false']    data-original-title    ${iconText}
    
Verify That Text Of Overview Map Icon Is    [Arguments]    ${iconText}
    [Documentation]    Check the links of the Overview Map tool
    Wait Until Element Is Visible    //div[@id='OverViewTrigger']    5s    
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //div[@id='OverViewTrigger']    data-original-title    ${iconText}
    
Verify That Text Of Print Map Icon Is    [Arguments]    ${iconText}
    [Documentation]    Check the links of the Print Map tool
    Wait Until Element Is Visible    //div[@id='printTrigger']    5s    
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //div[@id='printTrigger']    data-original-title    ${iconText}
    
Verify That Text Of Google Directions Icon Is    [Arguments]    ${iconText}
    [Documentation]    Check the links of the Google Directions tool
    Wait Until Element Is Visible    //div[@id='GoogleDirectionTrigger']    5s   
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //div[@id='GoogleDirectionTrigger']    data-original-title    ${iconText}
    
Verify That Text Of Google Street View Icon Is    [Arguments]    ${iconText}
    [Documentation]    Check the links of the Google Street View tool
    Wait Until Element Is Visible    //div[@id='streetTrigger']    5s   
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //div[@id='streetTrigger']    data-original-title    ${iconText}
    
Verify That Text Of Information Report Icon Is    [Arguments]    ${iconText}
    [Documentation]    Check the links of the Information Report tool
    Wait Until Element Is Enabled    //div[@id='infoReportTrigger']    5s   
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //div[@id='infoReportTrigger']    data-original-title    ${iconText}
    
Verify That Text Of Distance Measurement Icon Is    [Arguments]    ${iconText}
    [Documentation]    Check the links of the Distance Measurement tool
    Wait Until Element Is Enabled    //div[@id='measureLineTrigger']    5s   
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //div[@id='measureLineTrigger']    data-original-title    ${iconText}
    
Verify That Text Of Surface Measurement Icon Is    [Arguments]    ${iconText}
    [Documentation]    Check the links of the Surface Measurement tool
    Wait Until Element Is Enabled    //div[@id='measureAreaTrigger']    5s   
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //div[@id='measureAreaTrigger']    data-original-title    ${iconText}
    
Verify That Text Of Circular Surface Measurement Icon Is    [Arguments]    ${iconText}
    [Documentation]    Check the links of the Circular Measurement tool
    Wait Until Element Is Enabled    //div[@id='measureCircleTrigger']    5s   
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //div[@id='measureCircleTrigger']    data-original-title    ${iconText}
    
Verify That Text Of Punctual Selection Icon Is    [Arguments]    ${iconText}
    [Documentation]    Check the links of the Punctual Selection tool
    Wait Until Element Is Enabled    //div[@id='point_SelectionTrigger']    5s   
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //div[@id='point_SelectionTrigger']    data-original-title    ${iconText}
    
Verify That Text Of Linear Selection Icon Is    [Arguments]    ${iconText}
    [Documentation]    Check the links of the Linear Selection tool
    Wait Until Element Is Enabled    //div[@id='linestring_SelectionTrigger']    5s   
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //div[@id='linestring_SelectionTrigger']    data-original-title    ${iconText}
    
Verify That Text Of Rectangular Selection Icon Is    [Arguments]    ${iconText}
    [Documentation]    Check the links of the Rentangular Selection tool
    Wait Until Element Is Enabled    //div[@id='rectangle_SelectionTrigger']    5s   
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //div[@id='rectangle_SelectionTrigger']    data-original-title    ${iconText}
    
Verify That Text Of Polygonal Selection Icon Is    [Arguments]    ${iconText}
    [Documentation]    Check the links of the Polygonal Selection tool
    Wait Until Element Is Enabled    //div[@id='polygon_SelectionTrigger']    5s   
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //div[@id='polygon_SelectionTrigger']    data-original-title    ${iconText}
    
Verify That Text Of Circular Selection Icon Is    [Arguments]    ${iconText}
    [Documentation]    Check the links of the Circular Selection tool
    Wait Until Element Is Enabled    //div[@id='circle_SelectionTrigger']    5s   
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //div[@id='circle_SelectionTrigger']    data-original-title    ${iconText}
    
Verify That Text Of Show Sidebar Icon Is    [Arguments]    ${iconText}
    [Documentation]    Check the links of the Layer List menu
    Wait Until Element Is Visible    //div[@id='TabMenuControlTrigger']    5s   
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //div[@id='TabMenuControlTrigger']    data-original-title    ${iconText}
    
Verify That Text Of Layers Tab Is    [Arguments]    ${text}
    [Documentation]    Check the links of the Layer Tab      
    Verify Text    //div[@class='ulList']//li    ${text}
     
Verify That Text Of Search Tab Is    [Arguments]    ${text}
    [Documentation]    Check the links of the Search Tab  
    Verify Text    //div[@class='ulList']//li[2]    ${text}
    
Verify That Text Of My Maps Tab Is    [Arguments]    ${text}
    [Documentation]    Check the links of the Context Tab  
    Verify Text    //div[@class='ulList']//li[3]    ${text}

Verify That The ${toolName} Selection Is Selected
    [Documentation]    Check if the selected tool is active
    ...    The argument $toolName must be: Punctual, Linear, Rectangular, Polygonal or Circular
    Log    \n====================== Verify That The "${toolName} Selection" Is Selected =======================    console=yes
    Wait Until Element Is Enabled    id=dropdownButton_selectionSet    timeout=10s
    ${class}    Get Element Attribute    id=dropdownButton_selectionSet    Class   
    ${active}    Set Variable    ${class[-6:]}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${active}    Active    msg=The "${toolName}" selection tool is not activated. However, it should be active.          
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    id=dropdownButton_selectionSet    data-original-title    ${toolName} selection    
    # Check with Javascript
    ${selectionType}    Execute Javascript    return window.JMap.app.clickToolManager.currentTool.selectionType
    ${isSelected}    Execute Javascript    return window.JMap.app.clickToolManager.currentTool.showElementAttributeTablePanelOnSelection
    ${selectionName}    Execute Javascript    return window.JMap.app.clickToolManager.currentTool.name
    ${checkSelectionType}    Set Variable If    '${toolName}'=='Punctual'    Point
    ...    '${toolName}'=='Linear'    LineString
    ...    '${toolName}'=='Rectangular'    Rectangle
    ...    '${toolName}'=='Polygonal'    Polygon
    ...    '${toolName}'=='Circular'    Circle
    ${checkselectionName}    Set Variable If    '${toolName}'=='Punctual'    PointSelection
    ...    '${toolName}'=='Linear'    LineSelection
    ...    '${toolName}'=='Rectangular'    RectangleSelection
    ...    '${toolName}'=='Polygonal'    ShapeSelection
    ...    '${toolName}'=='Circular'    CircularSelection
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${selectionType}    ${checkSelectionType}    msg=The "${checkSelectionType}" selection tool does not appear as SELECTED in the console. However, it should be.            
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${selectionName}    ${checkselectionName}    msg=The "${checkselectionName}" selection tool does not appear as TRUE in the console. However, it should be.
        
Verify Alert Text And Accept    [Arguments]    ${AlertMsg}
    [Documentation]    Check for the Alert message and Accept the popup
    Run Keyword And Continue On Failure    Alert Should Be Present     text=${AlertMsg}    action=ACCEPT    timeout=3s
    Log    -----> The Alert message is REALLY: ${AlertMsg}  
    Sleep    1s
    
Verify Alert Text And Cancel    [Arguments]    ${text}
    [Documentation]    Check for the Alert message and Cancel the popup
    Run Keyword And Continue On Failure    Alert Should Be Present     text=${text}    action=DISMISS    timeout=3s
    Sleep    1s
    
Verify Background Color    [Arguments]    ${Locator}    ${color}
    [Documentation]    Check for the css backgroud color of the web element located in locator
    ${elem}    Get Webelement    ${Locator}
    ${getBgColor}    Call Method    ${elem}    value_of_css_property    background-color
    Run Keyword And Continue On Failure    Should Be Equal    ${getBgColor}    ${color} 
    
Press Enter    [Arguments]    ${locator}
    [Documentation]    Press Enter key
    Press Key    ${locator}    \\13
    Sleep    1s            
    
Click On Show Sidebar Icon
    [Documentation]    Click on the menu to open layer list
    
    Wait Until Element Is Enabled    xpath://div[@id='TabMenuControlTrigger']    timeout=10s    
    Click Element    xpath://div[@id='TabMenuControlTrigger'] 
    Sleep    1s

Open Inner Tab Menu Panel
    [Documentation]    This keyword for JMap Web, allows to check if the "Inner Tab Menu Panel" is already opened or not. If not, we will click on "Sidebar" Icon
    Log    \n====================== Go to open "Inner Tab Menu Panel" =======================    console=yes
    ${isClosedMenuPanal}    Run Keyword And Return Status    Wait Until Page Does Not Contain Element    //div[@class='TabMenuPanel jmap_active_panel']    3s
    Run Keyword If    ${isClosedMenuPanal}    Click On Show Sidebar Icon    ELSE    Log    -----> The "Inner Tab Menu Panel" is ALREADY OPENED.    console=yes                 

Close Inner Tab Menu Panel
    [Documentation]    This keyword for JMap Web, allows to check if the "Inner Tab Menu Panel" is already closed or not. If not, we will click on "Sidebar" Icon
    Log    \n====================== Go to close "Inner Tab Menu Panel" =======================    console=yes
    ${isInnerMenuPanal}    Run Keyword And Return Status    Wait Until Page Contains Element    //div[@class='TabMenuPanel jmap_active_panel']    3s
    Run Keyword If    ${isInnerMenuPanal}    Click On Show Sidebar Icon    ELSE    Log    -----> The "Inner Tab Menu Panel" is ALREADY CLOSED.    console=yes
    Sleep    3s    
           
Change Layer Visibility    [Arguments]    ${LAYER_NAME}
    [Documentation]    Click the checkbox for visibility in the layer list for the given layer name
    Click Element    xpath://span[contains(text(),'${LAYER_NAME}')]//preceding::input[1]    
    
Go To My Maps Tab
    [Documentation]    Go to context tab in the layer list
    Log    \n====================== Go to "My Maps Tab" =======================    console=yes
    Wait Until Element Is Enabled    xpath://div[@class='ulList']//li[3]    timeout=10s    
    Click Element    xpath://div[@class='ulList']//li[3]
    Sleep    2s
    Log    -----> The "My Maps Tab" IS OPENED.    console=yes

Verify That The "${pTab}" Does Not Exist In The Page
    Log    \n====================== Verify That The "${pTab}" Tab Does Not Exist In The Page =======================    console=yes
    ${tabCount}    Get JMap Web Component Element Count    //div[@class='ulList']//li
    :FOR    ${i}    IN RANGE    1    ${tabCount}+1
    \    ${curTab}    Get Text    //div[@class='ulList']//li[${i}]/a
    \    Exit For Loop If    "${curTab}"=="${pTab}"               
    Run Keyword And Continue On Failure    Should Not Be Equal    ${curTab}    ${pTab}    msg=The "${pTab}" tab exists in the page. However, it should not be exist                   

Get JMap Web Component Element Count    [Arguments]    ${xPath}   
    [Documentation]    This keyword for JMap Web, allows to get the count of elements in a table or tab. Receive the xpath of the table and return count number
    Run Keyword And Ignore Error    Wait Until Element Is Enabled    ${xPath}    7s 
    ${COUNT}    Get Element Count    ${xPath}
    [Return]    ${COUNT}  
        
Confirm Message
   [Documentation]    Confirm the alert pop ups in JMap Web
   Handle Alert    action=ACCEPT     timeout=3s
   
Cancel Message
   [Documentation]    Cancel the alert pop ups in JMap Web
   Handle Alert    action=DISMISS     timeout=3s

Go to Form Edition Tool
    [Documentation]    Click over the Form Edition tool. To edit the attributes of an element 
    Wait Until Element Is Enabled    xpath://div[@id='ElementFormTrigger']//i    timeout=10s    
    Click Element    xpath://div[@id='ElementFormTrigger']//i

Go to Edit Elements Edition Tool
    [Documentation]    Click over the Edit Elements Edition tool. To move or delete an element 
    Wait Until Element Is Enabled    xpath://div[@id='ElementModifyTrigger']//i    timeout=10s    
    Click Element    xpath://div[@id='ElementModifyTrigger']//i
   
Go to Create Element Edition Tool
    [Documentation]    Click over the Create Element Edition tool. To add an element
    Wait Until Element Is Enabled    xpath://div[@id='ElementMakerTrigger']//i    timeout=10s    
    Click Element    xpath://div[@id='ElementMakerTrigger']//i   

Switch Between Windows    [Arguments]    ${URL}
    [Documentation]    Switch focus between windows or tabs in the same browser using the url
    Select Window    url=${URL}
  
Switch Between Browser    [Arguments]    ${ALIAS}
    [Documentation]    Switch focus between browsers using the alias
    Switch Browser    ${ALIAS}
    Sleep    1s    
    
Enable Edition Options for a Layer    [Arguments]    ${LAYERNAME}
    [Documentation]    Enable Edition Options to the given layer. Click on the pencil icon in the layer list
    Wait Until Element Is Enabled    xpath://span[contains(text(),'${LAYERNAME}')]//following::div[@class='editableButtonOff']    timeout=10s
    Click Element    xpath://span[contains(text(),'${LAYERNAME}')]//following::div[@class='editableButtonOff']
    Wait Until Element Is Visible    xpath://div[@id='ElementFormTrigger']//i    timeout=10s

Disable Edition Options for a Layer    [Arguments]    ${LAYERNAME}
    [Documentation]    Disable Edition Options to the given layer. Click on the active pencil icon in the layer list
    Wait Until Element Is Enabled    xpath://span[contains(text(),'${LAYERNAME}')]//following::div[@class='editableButtonOn']    timeout=10s
    Click Element    xpath://span[contains(text(),'${LAYERNAME}')]//following::div[@class='editableButtonOn']
    Wait Until Element Is Not Visible        xpath://div[@id='ElementFormTrigger']//i    timeout=10s
    
Add photo from Photo Form    [Arguments]    ${PHOTO_PATH}
    [Documentation]    Add a photo to a form
    Wait Until Element Is Enabled    xpath://input[@id='file']    timeout=10s
    Choose File    xpath://input[@id='file']    ${PHOTO_PATH} 
    Wait Until Element Is Enabled    xpath://div[@class='itemInnerContainer']//img    timeout=10s    

Delete photo from Photo Form
    [Documentation]    Check for a photo to exist and remove it from the form
    Wait Until Element Is Enabled    xpath://div[@class='itemInnerContainer']//img    timeout=10s 
    ${EXIST}    Run Keyword And Return Status    Element Should Be Visible    xpath://div[@class='itemInnerContainer']//img
    Run Keyword If    '${EXIST}'=='${TRUE}'    Click Element    xpath://a[@class='jmap_photo_deleteButton']
    Run Keyword If    '${EXIST}'=='${TRUE}'    Confirm Message
       
Change Photo from Photo Form    [Arguments]    ${PHOTO_PATH}    ${OFFSET_X}    ${OFFSET_Y}
    [Documentation]    Check for a photo to exist. Delete the photo if exist and add a new one    
    Wait Until Element Is Enabled    xpath://input[@id='file']    timeout=10s
    ${EXIST}    Run Keyword And Return Status    Element Should Be Visible    xpath://div[@class='itemInnerContainer']//img
    Run Keyword If    '${EXIST}'=='${TRUE}'    Delete photo from Photo Form
    Run Keyword If    '${EXIST}'=='${TRUE}'    Click Save Button in Form
    Run Keyword If    '${EXIST}'=='${TRUE}'    Save Transaction
    Run Keyword If    '${EXIST}'=='${TRUE}'    Click On The Map At Coordinates    ${OFFSET_X}    ${OFFSET_Y}
    Wait Until Element Is Visible    xpath://div[@class='modal-dialog']    timeout=10s        
    Choose File    xpath://input[@id='file']    ${PHOTO_PATH} 
    Wait Until Element Is Enabled    xpath://div[@class='itemInnerContainer']//img    timeout=10s    

Edit Photo Title From Photo Form    [Arguments]    ${PHOTO_PATH}    ${PHOTOTITLE}    ${OFFSET_X}    ${OFFSET_Y}
    [Documentation]    Check for a photo to exist. Add a new one if not and change the title of the new photo
    Wait Until Element Is Enabled    xpath://input[@id='file']    timeout=10s
    ${EXIST}    Run Keyword And Return Status    Element Should Be Visible    xpath://div[@class='itemInnerContainer']//img
    Run Keyword If    '${EXIST}'!='${TRUE}'    Choose File    xpath://input[@id='file']    ${PHOTO_PATH}
    Run Keyword If    '${EXIST}'!='${TRUE}'    Click Save Button in Form
    Run Keyword If    '${EXIST}'!='${TRUE}'    Save Transaction
    Run Keyword If    '${EXIST}'!='${TRUE}'    Click On The Map At Coordinates    ${OFFSET_X}    ${OFFSET_Y}    
    Click Element    xpath://div[@class='itemInnerContainer']//img    
    Wait Until Element Is Visible    xpath://input[@class='form-control']    timeout=10s
    Input Text    xpath://input[@class='form-control']    ${PHOTOTITLE}
    Click Element    xpath://div[@class='jmap-form-photo-editor-footButtons']//a[@id='saveButton']    

Edit Photo Comment From Photo Form    [Arguments]    ${PHOTO_PATH}    ${PHOTOCOMMENT}    ${OFFSET_X}    ${OFFSET_Y}
    [Documentation]    Check for a photo to exist. Add a new one if not and change the comment of the new photo
    Wait Until Element Is Enabled    xpath://input[@id='file']    timeout=10s
    ${EXIST}    Run Keyword And Return Status    Element Should Be Visible    xpath://div[@class='itemInnerContainer']//img
    Run Keyword If    '${EXIST}'!='${TRUE}'    Choose File    xpath://input[@id='file']    ${PHOTO_PATH}
    Run Keyword If    '${EXIST}'!='${TRUE}'    Click Save Button in Form
    Run Keyword If    '${EXIST}'!='${TRUE}'    Save Transaction
    Run Keyword If    '${EXIST}'!='${TRUE}'    Click On The Map At Coordinates    ${OFFSET_X}    ${OFFSET_Y}    
    Click Element    xpath://div[@class='itemInnerContainer']//img    
    Wait Until Element Is Visible    xpath://textarea[@class='form-control']    timeout=10s
    Input Text    xpath://textarea[@class='form-control']    ${PHOTOCOMMENT}
    Click Element    xpath://div[@class='jmap-form-photo-editor-footButtons']//a[@id='saveButton']

Edit an Element on the Map    [Arguments]    ${LAYERNAME}    ${OFFSET_X}    ${OFFSET_Y}
    [Documentation]    Edit attributes to an element on the map. Open layer list, enable edition tools
    ...    select Form edition tool and click over an element on the map.
    Click On Show Sidebar Icon
    Enable Edition Options for a Layer    ${LAYERNAME}
    Go to Form Edition Tool    
    Click On The Map At Coordinates    ${OFFSET_X}    ${OFFSET_Y}
    Wait Until Element Is Visible    xpath://div[@class='modal-dialog']    timeout=10s     

Delete an Element from the Map    [Arguments]    ${LAYERNAME}    ${OFFSET_X}    ${OFFSET_Y}    ${LOCATOR}
    [Documentation]    Delete an element on the map. Open layer list, enable edition tools
    ...    select Edit Elements edition tool and click over an element on the map. Press DELETE and confirm the Alert message
    Click On Show Sidebar Icon
    Enable Edition Options for a Layer    ${LAYERNAME}
    Go to Edit Elements Edition Tool        
    Click On The Map At Coordinates    ${OFFSET_X}    ${OFFSET_Y}
    Press Keys    ${LOCATOR}    DEL
    Confirm Message
    Save Transaction    
    
Add an Element on the Map    [Arguments]    ${LAYERNAME}    ${OFFSET_X}    ${OFFSET_Y}
    [Documentation]    Add an element on the map. Open layer list, enable edition tools
    ...    select Create Element edition tool and click over the map.
    Click On Show Sidebar Icon
    Enable Edition Options for a Layer    ${LAYERNAME}
    Go to Create Element Edition Tool
    Click On The Map At Coordinates    ${OFFSET_X}    ${OFFSET_Y}
    Wait Until Element Is Visible    xpath://div[@class='modal-dialog']    timeout=10s    
    
Click Save Button in Form
    [Documentation]    Click Save button in Attribute or External Form
    Wait Until Element Is Enabled    xpath://a[@class='btn btn-default btn-primary']    timeout=10s      
    Click Element    xpath://a[@class='btn btn-default btn-primary']
 
Click Cancel Button in Form
    [Documentation]    Click Cancel button in Attribute or External Form
    Wait Until Element Is Enabled    xpath://a[@class='btn btn-default'][contains(text(),'Cancel')]    timeout=10s      
    Click Element    xpath://a[@class='btn btn-default'][contains(text(),'Cancel')]
       
Save Transaction
    [Documentation]    Save transactions in JMap Web
    Wait Until Element Is Enabled    xpath://div[@class='btn-group']//div[1]    timeout=10s    
    Click Element    xpath://div[@class='btn-group']//div[1]
    
Select Distance Measurement
    [Documentation]    Click on Distance Measurement option after dropdown the measurement menu
    Wait Until Element Is Enabled    xpath://div[@id='measureLineTrigger']//i    10s    
    Click Element    xpath://div[@id='measureLineTrigger']//i
    Sleep    1s    
    
Draw Distance Measurement    [Arguments]    ${xoffset_initial}    ${yoffset_initial}    ${xoffset}    ${yoffset}
    [Documentation]    Draw distance measurement on the map between two points
    Wait Until Element Is Enabled    xpath://div[@id='map']    timeout=10s 
    Click Element At Coordinates    //div[@id='map']    ${xoffset_initial}    ${yoffset_initial}  
    Drag And Drop By Offset    //div[@id='map']    ${xoffset}    ${yoffset}
    Click On The Map At Coordinates    ${xoffset}    ${yoffset}

Draw Circular Surface Measurement    [Arguments]    ${xoffset_initial}    ${yoffset_initial}    ${xoffset}    ${yoffset}
    [Documentation]    Draw Circular Surface measurement on the map between two points
    Wait Until Element Is Enabled    xpath://div[@id='map']    timeout=10s 
    Click Element At Coordinates    //div[@id='map']    ${xoffset_initial}    ${yoffset_initial}  
    Drag And Drop By Offset    //div[@id='map']    ${xoffset}    ${yoffset}
    Sleep    1s    
            
Draw Surface Measurement    [Arguments]    ${xoffset_initial}    ${yoffset_initial}    ${xoffset1}    ${yoffset1}    ${xoffset2}    ${yoffset2}     ${xoffset_end}    ${yoffset_end}
    [Documentation]    Draw a Surface Measurement as rectangle or polygone
    Click On The Map At Coordinates    ${xoffset_initial}    ${yoffset_initial}
    Click On The Map At Coordinates    ${xoffset1}    ${yoffset1}
    Click On The Map At Coordinates    ${xoffset2}    ${yoffset2}
    Double Click On The Map At Coordinates    ${xoffset_end}    ${yoffset_end}
    
Select Surface Measurement
    [Documentation]    Click on Surface Measurement option after dropdown the measurement menu
    Wait Until Element Is Enabled    xpath://div[@id='measureAreaTrigger']//i    10s  
    Click Element    xpath://div[@id='measureAreaTrigger']//i
    Sleep    1s    
    
Select Circular Surface Measurement
    [Documentation]    Click on Circular Surface Measurement option after dropdown the measurement menu
    Wait Until Element Is Enabled    xpath://div[@id='measureCircleTrigger']//i    10s   
    Click Element    xpath://div[@id='measureCircleTrigger']//i

Create A Distance Measurement    [Arguments]    ${xoffset_initial}    ${yoffset_initial}    ${xoffset}    ${yoffset}
    Click On Measurement Down List Arrow
    Select Distance Measurement
    Verify That Text Of Distance Measurement Icon Is    Distance measurement
    Draw Distance Measurement    ${xoffset_initial}    ${yoffset_initial}    ${xoffset}    ${yoffset} 

Create A Surface Measurement    [Arguments]    ${xoffset_initial}    ${yoffset_initial}    ${xoffset1}    ${yoffset1}    ${xoffset2}    ${yoffset2}     ${xoffset_end}    ${yoffset_end}
    [Documentation]    Create a Surface Measurement as rectangle
    Click On Measurement Down List Arrow    
    Select Surface Measurement
    Verify That Text Of Surface Measurement Icon Is    Surface measurement
    Draw Surface Measurement    ${xoffset_initial}    ${yoffset_initial}    ${xoffset1}    ${yoffset1}    ${xoffset2}    ${yoffset2}     ${xoffset_end}    ${yoffset_end}    

Create A Circular Surface Measurement    [Arguments]    ${xoffset_initial}    ${yoffset_initial}    ${xoffset}    ${yoffset}
    Click On Measurement Down List Arrow
    Select Circular Surface Measurement
    Verify That Text Of Circular Surface Measurement Icon Is    Circular surface measurement
    Draw Circular Surface Measurement    ${xoffset_initial}    ${yoffset_initial}    ${xoffset}    ${yoffset}

Click On Erase Icon
    [Documentation]    Click on "Eraser" icon to delete the current measurement 
    Wait Until Element Is Enabled    xpath://div[@id='measureEraser']//i    timeout=7s  
    Click Element    xpath://div[@id='measureEraser']//i
    Sleep    1s   
Delete Measure
    [Documentation]    Allows to delete the current measurement
    Click On Erase Icon
    Verify Alert Text And Accept    Erase all measurments?    # To check!!!
    Verify That The Measure Is Deleted

Verify That The Measure Is Deleted
    [Documentation]    Check thet the "Measure distance", "Measure area (Surface Measurement andCircular Surface Measurement)" is deleted from the map
    Sleep    2s
    Run Keyword And Continue On Failure    Wait Until Page Contains Element    //body[@class='jmap-prevent-overflow-scrolling']/div[@id='jmap']/div[@class='mapContainer']/div[@id='map']/div[@class='ol-viewport']/canvas[1]    10s  
    Run Keyword And Continue On Failure    Page Should Not Contain Element    //div[@class='tooltip tooltip-measure tooltip-measure-total']    message=The Distance or Area Measurement is not deleted from the map. However, it should be deleted.        

Verify That Geometry Type And Its Value Are    [Arguments]    ${geomType}    ${value}
    [Documentation]    Check the type of the Measurement tool
    Run Keyword And Continue On Failure    Wait Until Page Contains Element    //div[@class='tooltip tooltip-measure tooltip-measure-total']    10s   
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //div[@class='tooltip tooltip-measure tooltip-measure-total']    data-geomtype    ${geomType}    message=The geometry type is not "${geomType}" or it does not appear in the map. However, it should be.
    Run Keyword And Continue On Failure    Element Text Should Be    //div[@class='tooltip tooltip-measure tooltip-measure-total']    ${value}    message=The label's value "${value}" does not appear in the map. However, it should be appear.          
    ${labelMeasure}    Run Keyword And Continue On Failure    Get Text    //div[@class='tooltip tooltip-measure tooltip-measure-total']
    Log    -----> The Distance of the Measurement"${geomType}" is: ${labelMeasure}

Verify That The Warning Massage Is    [Arguments]    ${warningMsg}
    [Documentation]    This keyword for JMap Web, allows to check the warning message when we try to add or update a context with wrong data 
    Log    \n====================== Verify The Warning Massage =======================    console=yes
    Run Keyword And Continue On Failure    Wait Until Element Is Enabled    xpath://div[@class='alert alert-warning centerText']    timeout=10s    
    Run Keyword And Continue On Failure    Element Text Should Be    xpath://div[@class='alert alert-warning centerText']    ${warningMsg}    message=The WARNING MESSAGE does not display on the screen OR we don't have the same message. However, it should be. 

Open New Tab    [Arguments]    ${pURL}
    [Documentation]    This keyword for JMap Web, allows to open a new tab of the current browser 
    Log    -----> Openning a new tab with the URL: ${pURL} ...    console=yes      
    Execute Javascript   window.open('${pURL}');
    ${title_var}        Get Window Titles
    #Select Window       title=@{title_var}[1]
    Select Window       NEW
    Sleep    1s

Check The ${mapName} Map View
    [Documentation]    This keyword for "JMap Web", allows to make screenshot on the initial or desired map view.
    ...    The argument "$mapName" must be : 'Initial' or 'New'.
    Wait Until Page Contains Element    //div[@class='mapContainer']    10s
    Sleep    10s    
    Capture Page Screenshot    filename=${mapName}_Map.png
    Sleep    1s
        
Compare Images    [Arguments]      ${Reference_Image_Path}    ${Test_Image_Path}    ${Allowed_Threshold}
   [Documentation]    This keyword for "JMap Web", allows to compare two images.
   ${TEMP}=         Replace String     ${IMAGE_COMPARATOR_COMMAND}    __REFERENCE__     ${Reference_Image_Path}
   ${COMMAND}=      Replace String     ${TEMP}    __TEST__     ${Test_Image_Path}
   Log              Executing: ${COMMAND}
   ${RC}            ${OUTPUT}=     Run And Return Rc And Output     ${COMMAND}
   Log              Return Code: ${RC}
   Log              Return Output: ${OUTPUT}   
   ${RESULT}        Evaluate    ${OUTPUT} < ${Allowed_Threshold}
   [Return]         ${RESULT}
   
Verify That The "${mapName}" Is Displayed  
   [Documentation]    This keyword for "JMap Web", allows to compare two identical images.
   ...    We should have an initial map using the keyword
   ...   The argument "$nameMap" must be only: 'Initial Map' or 'New Map'
   Log    \n====================== Go to verify if The "${mapName}" Is Displayed? =======================    console=yes
   ${mapName}    Replace String    ${mapName}    ${SPACE}    _    
   Wait Until Page Contains Element    //div[@class='mapContainer']    60s
   Sleep    10s    
   Capture Page Screenshot    filename=${mapName}_2.png
   Sleep    2s
   ${isInitMap}    Run Keyword If    '${mapName}'=='Initial_Map'    Compare Images    Initial_Map.png    ${mapName}_2.png    0.05    
   ${isDefOfInitMap}=    Run Keyword If    '${mapName}'=='New_Map'    Compare Images    Initial_Map.png    ${mapName}_2.png    0.05      
   ${isNewMap}=    Run Keyword If    '${mapName}'=='New_Map'    Compare Images    New_Map.png    ${mapName}_2.png    0.05
   
   Run Keyword If    '${mapName}'=='New_Map'
   ...    Run Keywords    
          ...    Run Keyword And Continue On Failure    Should Not Be True    ${isDefOfInitMap}    msg= The "${mapName}" does not different of "Initial Map". However, it Should be different !!!    AND
          ...    Run Keyword And Continue On Failure    Should Be True    ${isNewMap}    msg= The "${mapName}" does not display on the screen. However, it Should be display !!!
   ...    ELSE IF    '${mapName}'=='Initial_Map'    Run Keyword And Continue On Failure    Should Be True    ${isInitMap}    msg= The "${mapName}" does not display on the screen. However, it Should be display !!!
   Run Keyword If    '${isInitMap}'=='${True}'    Log    -----> The curently map is EXACTLY: "INITIAL MAP"    console=yes
   ...    ELSE IF    '${isNewMap}'=='${True}' and '${isDefOfInitMap}'=='${False}'    Log    -----> The curently map is EXACTLY: "NEW MAP"    console=yes  
   Remove File    ${mapName}_2.png
   Run Keyword If    '${mapName}'=='New_Map'    Remove Files    Initial_Map.png    New_Map.png
   Sleep    1s 
          
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#JMap Admin Keywords
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------     

Click On Projects Icon
    Wait Until Page Contains Element    id=sideBarMenuIconProjects    timeout=10s
    Click Element    id=sideBarMenuIconProjects 

Type In Name Field Of Projects
    [Arguments]    ${pProject}
    Wait Until Page Contains Element    //span[contains(text(),'Name')]/following::input[1]    15s
    Input Text    //span[contains(text(),'Name')]/following::input[1]    ${pProject} 
    Sleep    2s

Choose The Project    [Arguments]    ${pProject}
    [Documentation]    This keyword for "JMap Admin", allows to choose the desired project "$pProject" that exist in the "Projects" page. 
       
    Wait Until Keyword Succeeds    15s    1s    Wait Until Page Contains Element    //tbody[@id='theForm:tblProjects_data']/tr       
    ${projectsCount}    Get Element Count    //tbody[@id='theForm:tblProjects_data']/tr
    :FOR    ${row}    IN RANGE    1    ${projectsCount}+1
    \    ${curProjectName}    Get Text    //tbody[@id='theForm:tblProjects_data']/tr[${row}]/td[2]    
    \    Exit For Loop If    '${curProjectName}' == '${pProject}'    
    Click Element    //tbody[@id='theForm:tblProjects_data']/tr[${row}]/td[2]/a
    Sleep    2s

Create A New Project
    [Arguments]    ${vProject}
    Click On Create
    Wait Until Element Is Visible    id=dialogForm:wizardProjectName    5s
    Input Text    id=dialogForm:wizardProjectName    ${vProject} 
    Select Default Language For Project    English
    Select Available languages    English
    ${isChecked}    CheckBox Should Be Marked    //div[@id='dialogForm:invalidateMapBoxTileCache']//div[@class='ui-chkbox-box ui-widget ui-corner-all ui-state-default ui-state-active']       
    Run Keyword If    ${isChecked}    Click Element    //div[@id='dialogForm:invalidateMapBoxTileCache']//div[@class='ui-chkbox-box ui-widget ui-corner-all ui-state-default ui-state-active']    
    Click Element    id=dialogForm:wizardButtonNext
    Select Map Projection    WGS 84 / Pseudo-Mercator - EPSG:3857
    Select Map Unit    Meters
    Select Display Unit    Meters
    Select Distance Unit    Meters
    Click On Finish

Select Available languages
    [Arguments]    ${language}
    Sleep    1s
    Click Element    //label[@id='dialogForm:projectsLanguages_label']
    Sleep    1s
    ${isNotChecked}    Run Keyword And Return Status    Element Should Be Visible    //li[@class='ui-selectcheckboxmenu-item ui-selectcheckboxmenu-list-item ui-corner-all ui-selectcheckboxmenu-unchecked']//label[contains(text(),'${language}')]        
    Run Keyword If    ${isNotChecked}    Click Element    //li[@class='ui-selectcheckboxmenu-item ui-selectcheckboxmenu-list-item ui-corner-all ui-selectcheckboxmenu-unchecked']//label[contains(text(),'${language}')]
    Click Element    //label[@id='dialogForm:projectsLanguages_label']

Select Map Projection
    [Arguments]    ${mapProjection}
    Wait Until Element Is Visible    id=dialogForm:wizardProjectMapProjection_label    3s
    Click Element    id=dialogForm:wizardProjectMapProjection_label
    Sleep    1s
    Click Element    //div[@id='dialogForm:wizardProjectMapProjection_panel']//li[contains(text(),'${mapProjection}')]        

Select Map Unit
    [Arguments]    ${mapUnit}
    Wait Until Element Is Visible    id=dialogForm:wizardProjectMapUnit_label    3s
    Click Element    id=dialogForm:wizardProjectMapUnit_label
    Sleep    1s
    Click Element    //ul[@id='dialogForm:wizardProjectMapUnit_items']//li[contains(text(),'${mapUnit}')]    

Select Display Unit
    [Arguments]    ${displayUnit}
    Wait Until Element Is Visible    id=dialogForm:wizardProjectDisplayUnit_label    3s
    Click Element    id=dialogForm:wizardProjectDisplayUnit_label
    Sleep    1s
    Click Element    //ul[@id='dialogForm:wizardProjectDisplayUnit_items']//li[contains(text(),'${displayUnit}')]    

Select Distance Unit
    [Arguments]    ${distanceUnit}
    Wait Until Element Is Visible    id=dialogForm:wizardProjectDistanceUnit_label    3s
    Click Element    dialogForm:wizardProjectDistanceUnit_label

Click On Finish
    Wait Until Element Is Visible    id=dialogForm:wizardButtonFinish    3s  
    Click Element    id=dialogForm:wizardButtonFinish
    
Click On Create                            
    Wait Until Element Is Visible    id=theForm:cmlNewV2    5s
    Click Element    id=theForm:cmlNewV2

Select Default Language For Project
    [Arguments]    ${language}
    Sleep    1s
    Click Element    id=dialogForm:selectOneMenuDefaultLanguage_label
    Sleep    1s
    Click Element    //li[contains(text(),'${language}')]
                         
Go To The Project Page
    [Arguments]    ${pProject}
    Click On Projects Icon
    Type In Name Field Of Projects    ${pProject}
    ${isNotProject}    Run Keyword And Return Status    Page Should Not Contain Element    //a[contains(text(),'${pProject}')]        
    Run Keyword If    ${isNotProject}
    ...    Create A New Project    ${pProject}      
    Choose The Project    ${pProject} 
    Verify That The JMap Admin Page Is    Project Configuration
 
Verify That The JMap Admin Page Is    [Arguments]    ${expected}
    [Documentation]    This keyword for "JMap Admin", allows to check the current page.    
    Log    \n=================== Verify the current page ===================    console=yes   
    ${isCurrentPage}    Run Keyword And Return Status    Wait Until Keyword Succeeds    10s    1s    Element Text Should Be    //div[@class='toolbarTitleStyle']    ${expected}
    Run Keyword If    '${isCurrentPage}' == '${False}'    Execute Javascript    window.location.reload(true);                 
    Wait Until Keyword Succeeds    10s    1s    Element Text Should Be    //div[@class='toolbarTitleStyle']    ${expected}    message=The Current page DOES NOT CONTAIN "${expected}"
    Log    -----> The Current page IS EXACTLY :${expected}.    console=yes    

Search And Close Specific Session
    [Arguments]    ${pUsername}    ${pProject}    ${pJMapSession}        
    Wait Until Page Contains Element    //thead[@id='theForm:tabView:tblSessions_head']//th[2]//input[1]    10s
    Clear Element Text    //thead[@id='theForm:tabView:tblSessions_head']//th[2]//input[1]
    Input Text   //thead[@id='theForm:tabView:tblSessions_head']//th[2]//input[1]    ${pUsername}
    Wait Until Page Contains Element    //thead[@id='theForm:tabView:tblSessions_head']//th[5]//input[1]    10s
    Clear Element Text    //thead[@id='theForm:tabView:tblSessions_head']//th[5]//input[1]
    Input Text   //thead[@id='theForm:tabView:tblSessions_head']//th[5]//input[1]    ${pProject}
    Wait Until Page Contains Element    //thead[@id='theForm:tabView:tblSessions_head']//th[8]//input[1]    10s
    Clear Element Text    //thead[@id='theForm:tabView:tblSessions_head']//th[8]//input[1]
    Input Text   //thead[@id='theForm:tabView:tblSessions_head']//th[8]//input[1]    ${pJMapSession}
    Sleep    2s    
    ${isNotEmpty}    Run Keyword And Return Status    Page Should Not Contain Element    //td[contains(text(),'( Empty )')]      
    Run Keyword If    ${isNotEmpty}    Click On Top CheckBox And Close Sessions
    Sleep    1s     
    
Click On Top CheckBox And Close Sessions
    Click Element    //div[@class='ui-chkbox ui-chkbox-all ui-widget']//div[@class='ui-chkbox-box ui-widget ui-corner-all ui-state-default']
    Sleep    1s
    Click Element    //button[@id='theForm:closeButton']
    Sleep    2s
    Run Keyword And Continue On Failure    Element Text Should Be    //div[@id='theForm:genericConfirmDialog_content']    Do you want to close selected active sessions?            
    Click Element    id=theForm:genericConfirmYes 
    
Go To "${pOption}" Page
    Log    \n=================== Go to click on the option '${pOption}' from the drop-down list =====================    console=yes
    Wait Until Page Contains Element    //span[@class='ui-button-icon-left ui-icon ui-c ui-icon-triangle-1-s']    15s
    Click Element    //span[@class='ui-button-icon-left ui-icon ui-c ui-icon-triangle-1-s']
    Wait Until Page Contains Element    //span[contains(text(),'${pOption}')]    15s
    Click Element    //span[contains(text(),'${pOption}')]
    Sleep    3s    reason=Wait 2s for "${pOption}" page.
    Log    -----> The page of the option '${pOption}' DISPLAYS NOW in the screen.     console=yes

Search In Permission List The User Name    [Arguments]    ${pUser}
    [Documentation]    This keyword for "JMap Admin"
    Log    \n=================== Search In Permission List The User Name : '${pUser}' =====================    console=yes
    Run Keyword And Continue On Failure    Wait Until Page Contains Element    //thead[@id='theForm:tabViewPermissionsOwners:tblPrincipals_head']//parent::div//following::input[1]    30s
    Clear Element Text    //thead[@id='theForm:tabViewPermissionsOwners:tblPrincipals_head']//parent::div//following::input[1]
    Input Text    //thead[@id='theForm:tabViewPermissionsOwners:tblPrincipals_head']//parent::div//following::input[1]    ${pUser}
    Sleep    2s

Get The Required User From Permission List    [Arguments]    ${pUser}
    [Documentation]    This keyword for "JMap Admin"
    
    Log    \n=================== Go to look for the user '${pUser}' in permissions list =====================    console=yes
    Run Keyword And Continue On Failure    Wait Until Page Contains Element    //table/tbody[@id='theForm:tabViewPermissionsOwners:tblPrincipals_data']/tr    30s
    ${rowCount}    Get Element Count    //table/tbody[@id='theForm:tabViewPermissionsOwners:tblPrincipals_data']/tr   
    :FOR    ${rowIndex}    IN RANGE    1    ${rowCount}+1
    \    ${isNotEmptyTable}    Run Keyword And Return Status    Page Should Contain Element    //table/tbody[@id='theForm:tabViewPermissionsOwners:tblPrincipals_data']/tr[${rowIndex}]/td[2]
    \    ${curUser}    Run Keyword If    '${isNotEmptyTable}'=='${True}'    Get Text    //table/tbody[@id='theForm:tabViewPermissionsOwners:tblPrincipals_data']/tr[${rowIndex}]/td[2]    ELSE    Set Variable    ${EMPTY}                    
    \    Exit For Loop If    '${curUser}'=='${pUser}'   
    @{requiredUser}    Create List    ${curUser}    ${rowIndex}    
    [Return]    @{requiredUser}

Click On Plus Button
    [Documentation]    This keyword for "JMap Admin", allows to click on the button "(+)" to add a user.
    Click Element    //button[@id='theForm:tabViewPermissionsOwners:tblPrincipals:cmlAdd']
    Sleep    1s
    
Add In Permissions Page The User    [Arguments]    ${vUser}
    Log    \n=================== Go to add the user '${vUser}' in the table of 'Permissions' tab ===================    console=yes
    Wait Until Keyword Succeeds    10s    1s    Click On Plus Button
    Wait Until Page Contains Element    //input[@id='theForm:tabViewPermissionsOwners:tblPrincipalsAvailable:columnAvailableUsername:filter']    5s
    Clear Element Text    //input[@id='theForm:tabViewPermissionsOwners:tblPrincipalsAvailable:columnAvailableUsername:filter']
    Input Text    //input[@id='theForm:tabViewPermissionsOwners:tblPrincipalsAvailable:columnAvailableUsername:filter']    ${vUser}   
    Sleep    2s
    ${rowCount}    Get Element Count    //table/tbody[@id='theForm:tabViewPermissionsOwners:tblPrincipalsAvailable_data']/tr 
    :FOR    ${row}    IN RANGE   1    ${rowCount}+1
    \    ${curUser}    Get Text    //table/tbody[@id='theForm:tabViewPermissionsOwners:tblPrincipalsAvailable_data']/tr[${row}]/td[2]
    \    Exit For Loop If    '${curUser}' == '${vUser}'
    Run Keyword If    '${curUser}' == '${vUser}'    Click Element    //table/tbody[@id='theForm:tabViewPermissionsOwners:tblPrincipalsAvailable_data']/tr[${row}]/td[2]
    Click Element    //button[@id='theForm:tabViewPermissionsOwners:cmlDlgSave']
    Save Permissions   
    Log    -----> The user '${vUser}' IS ADDED NOW in the table of 'Permissions' tab.    console=yes

CheckBox Should Be Marked
    [Arguments]    ${locator}           
    ${isChecked}    Run Keyword And Return Status    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element     ${locator}          
    [Return]    ${isChecked}
    
Select In Permissions List The User    [Arguments]    ${pUser}    ${pRow} 
    Log    \n=================== Go to click on the user '${pUser}' in permissions list =====================    console=yes
    # @{requiredUser}    Get The Required User From Permission List    ${pUser}
    ${isSelectedUser}    CheckBox Should Be Marked    //table/tbody[@id='theForm:tabViewPermissionsOwners:tblPrincipals_data']/tr[${pRow}]/td[2]//preceding::div[1]//span[@class='ui-chkbox-icon ui-icon ui-icon-check ui-c']  
    Run Keyword If    '${isSelectedUser}'=='${False}'    Click Element    //table/tbody[@id='theForm:tabViewPermissionsOwners:tblPrincipals_data']/tr[${pRow}]/td[2]//preceding::div[1]//span[@class='ui-chkbox-icon ui-icon ui-icon-blank ui-c']    ELSE IF    '${isSelectedUser}' == '${True}'    Log    -----> The user "${pUser}" IS ALREADY SELECTED in permission list.    console=yes     
    Sleep    1s
                
Go To Select In Permissions List The User    [Arguments]    ${pUser}
    [Documentation]    This keyword for "JMap Admin"
    Log    \n=================== Go to select the user '${pUser}' in permissions list =====================    console=yes
    Search In Permission List The User Name    ${pUser}
    @{requiredUser}    Get The Required User From Permission List    ${pUser}           
    
    Run Keyword If    '${requiredUser[0]}' != '${pUser}'
    ...    Add In Permissions Page The user    ${pUser}  
    ...    ELSE
    ...    Log    -----> The user "${pUser}" IS ALREADY EXIST in permissions list.    console=yes
    @{requiredUser}    Run Keyword If    '${requiredUser[0]}' != '${pUser}'    Get The Required User From Permission List    ${pUser}    ELSE    Set Variable    @{requiredUser}
    Select In Permissions List The User    ${requiredUser[0]}    ${requiredUser[1]}

Get All Permissions Name With Status
    [Documentation]    This keyword for "JMap Admin", allows to get a list of permissions users in project, layer and form page.
    
    Log    \n============================= Go to get all permissions with its status =========================================    console=yes
    @{PermissionsList}    Create List       
    Wait Until Keyword Succeeds    15s    1s    Wait Until Page Contains Element    //table[@id='theForm:tabViewPermissionsOwners:panelPermissionsUsers']//tr
    ${rowCount}    Get Element Count    //table[@id='theForm:tabViewPermissionsOwners:panelPermissionsUsers']//tr
    :FOR    ${row}    IN RANGE    1    ${rowCount}+1
    \    ${dictPermissions}    Create Dictionary 
    \    ${getPermission}    Get Text    //table[@id='theForm:tabViewPermissionsOwners:panelPermissionsUsers']//tr[${row}]//span[contains(@class, 'ui-chkbox-label')]
    \    ${isPermissionChecked}    CheckBox Should Be Marked    //table[@id='theForm:tabViewPermissionsOwners:panelPermissionsUsers']//tr[${row}]//span[@class='ui-chkbox-icon ui-icon ui-c ui-icon-check']
    \    Log    -----> PERMISSION [(${row})] : "${getPermission}" is "${isPermissionChecked}" 
    \    Set To Dictionary    ${dictPermissions}    permission=${getPermission}    status=${isPermissionChecked}
    \    Append To List    ${PermissionsList}    ${dictPermissions}          
    Log    -----> The list of permissions IS RETRIEVED with the following values: ${PermissionsList}.    console=yes
    [Return]    @{PermissionsList}
    
Give All Permissions To The User
    [Documentation]    This keyword for "JMap Admin", it used in the keyword : "Add The User "${pUser}" In The Permissions List"
    [Arguments]    ${pUser}
    
    Log    \n============================= Go to add the desired permission to the user "${pUser}". ============================    console=yes   
    @{permissionsValues}    Get All Permissions Name With Status
    ${lenPermissionsValues}    Get Length    ${permissionsValues}
    :FOR    ${i}    IN RANGE    0    ${lenPermissionsValues}
    \    Log    --------------------------------------------------------------------
    \    Log    PERMISSION IS : ${permissionsValues[${i}]}[permission]
    \    Log    STATUS IS : ${permissionsValues[${i}]}[status]
    \    Run Keyword If    '${permissionsValues[${i}]}[status]' == '${False}'    Click Element    //table[@id='theForm:tabViewPermissionsOwners:panelPermissionsUsers']//tr[${i+1}]//span[@class='ui-chkbox-icon ui-icon ui-c ui-icon-blank']    ELSE    Log    ----> The Permission "${permissionsValues[${i}]}[permission]" IS ALREADY SELECTED.    console=yes
    \    ${isChecked}    CheckBox Should Be Marked    //table[@id='theForm:tabViewPermissionsOwners:panelPermissionsUsers']//tr[${i+1}]//span[@class='ui-chkbox-icon ui-icon ui-c ui-icon-check'] 
    \    Run Keyword And Continue On Failure    Should Be True    ${isChecked}    msg=The checkBox of permission "${permissionsValues[${i}]}[permission]" IS NOT SELECTED. However, it should BE SELECTED               
    Save Permissions

Save Permissions
    [Documentation]    This keyword for "JMap Admin", allows to click on the save button of permission page
    Wait Until Keyword Succeeds    5s    1s    Click Element    //button[@id='theForm:cmlSave'] 
    Wait Until Keyword Succeeds    7s    1s    Element Text Should Be    //span[@class='ui-growl-title']    Configuration saved.  
    Sleep    1s
                    
Go To Add User In The Project With All Permisions
    [Arguments]    ${pUser}    ${pProject}
    Wait Until Keyword Succeeds    15s    1s    Go To The Project Page    ${pProject}
    Wait Until Keyword Succeeds    15s    1s    Go To "Permissions" Page
    Go To Select In Permissions List The User    ${pUser}
    Give All Permissions To The User    ${pUser}      
    
Click On JMap Server Icon 
    Wait Until Page Contains Element    id=sideBarMenuIconStatus
    Click Element    id=sideBarMenuIconStatus 
    
Go To Close Specific Session    [Arguments]    ${pUsername}    ${pProject}    ${pJMapSession}
    [Documentation]    This keyword for JMap Admin
    Click On JMap Server Icon
    Go To "Sessions" Page
    Search And Close Specific Session    ${pUsername}    ${pProject}    ${pJMapSession}
                