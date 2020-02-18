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

${URLWebNightly}    http://nightlybuild.jmaponline.net:8080/Test84Map7_0/login.jsp
${Title}        JMap_Web_WorldTest    #MordjaneExternal
${internPort}    8080
${externPort}    8442    #8081
${localhost}    192.168.0.33    #jmap7dev.jmaponline.net # 192.168.2.71
${URLWebApp}    http://${localhost}:${internPort}/${Title}
${URLWebNGApp}    http://${localhost}:${internPort}/services/jmap
${UserName}    userTest1
${Password}    userTest1
${Browser}    Chrome
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
    
Zoom out
    [Documentation]    Zoom out the map by the - icon
    Wait Until Element Is Enabled    xpath://*[@id="ZoomButtonControlOut"]    timeout=10s    
    Click Element    xpath://*[@id="ZoomButtonControlOut"]

Zoom to Initial View
    [Documentation]    Zoom or Restore to initial view by the icon
    Wait Until Element Is Enabled    xpath://*[@id="InitialView"]    timeout=10s    
    Click Element    xpath://*[@id="InitialView"]
    
Open Element Mouseover Bubble Over    [Arguments]    @{COORDINATES}
    [Documentation]    Execute a JMap javascript function to open the mouse over bubble over a desired coordinate
    ${X}=    Get From List    ${COORDINATES}    1
    ${Y}=    Get From List    ${COORDINATES}    2
    Execute Javascript    JMap.app.clickToolManager.currentTool.singleclick({coordinate :[${X}, ${Y}]})  

Pan The Map    [Arguments]    @{COORDINATES}
    [Documentation]    Pan the map to an specific coordinates, x and y pair
    ...    The action is done by Javascripts
    ${X}=    Get From List    ${COORDINATES}    1
    ${Y}=    Get From List    ${COORDINATES}    2
    Execute Javascript    JMap.app.map.getView().setCenter([${X}, ${Y}]) 
        
Click On The Map At Coordinates    [Arguments]    ${xoffset}    ${yoffset}
    [Documentation]    Click on the map using xoffset and yoffset as displacement from the center of the map (0.0)
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Enabled    xpath://div[@id='map']    timeout=2s    
    Click Element At Coordinates    xpath://div[@id='map']    ${xoffset}    ${yoffset} 
    
Double Click On The Map At Coordinates    [Arguments]    ${xoffset}    ${yoffset}
    [Documentation]    Double Click on the map using xoffset and yoffset as displacement from the center of the map (0.0)
    :FOR    ${count}    IN RANGE    1    3
    \    Click On The Map At Coordinates    ${xoffset}    ${yoffset}  
 
Click On Options Icon
    [Documentation]    Go to Option menu
    Wait Until Element Is Enabled    xpath://i[@class='configMenuIcon']    timeout=10s    
    Click Element    xpath://i[@class='configMenuIcon']
    
Click On Share features Icon
    [Documentation]    Go to Share features menu
    Wait Until Element Is Enabled    xpath://button[@class='glyphicon jmap_share btn btn-default']    timeout=10s    
    Click Element   xpath://button[@class='glyphicon jmap_share btn btn-default']
    
Click On Measurement Down List Arrow
    [Documentation]    Go to Measurement menu
    Wait Until Element Is Enabled    xpath://div[@id='smallTrigger_measureSet']    timeout=10s    
    Click Element    xpath://div[@id='smallTrigger_measureSet']
    
Click On Selection Down List Arrow
    [Documentation]    Go to Selection menu
    Wait Until Element Is Enabled    xpath://div[@id='smallTrigger_selectionSet']    timeout=10s    
    Click Element    xpath://div[@id='smallTrigger_selectionSet']
      
Close Error Message Of Login Page
    [Documentation]    Close the Error message after login with invalid credentials
    Wait Until Element Is Enabled    xpath://button[@class='close']    timeout=10s    
    Click Element    xpath://button[@class='close'] 
    
Type    [Arguments]    ${locator}    ${value}
    [Documentation]    Type the value in the locator after been clean
    Set Selenium Timeout    0.2s
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Visible    ${locator}    2s 
    Clear Element Text    ${locator}   
    Input Text    ${locator}    ${value} 
    
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
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Visible    ${locator}    2s              
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
    Wait Until Element Is Visible    //div[@id='infoReportTrigger']    5s   
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //div[@id='infoReportTrigger']    data-original-title    ${iconText}
    
Verify That Text Of Distance Measurement Icon Is    [Arguments]    ${iconText}
    [Documentation]    Check the links of the Distance Measurement tool
    Wait Until Element Is Visible    //div[@id='measureLineTrigger']    5s   
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //div[@id='measureLineTrigger']    data-original-title    ${iconText}
    
Verify That Text Of Surface Measurement Icon Is    [Arguments]    ${iconText}
    [Documentation]    Check the links of the Surface Measurement tool
    Wait Until Element Is Visible    //div[@id='measureAreaTrigger']    5s   
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //div[@id='measureAreaTrigger']    data-original-title    ${iconText}
    
Verify That Text Of Circular Surface Measurement Icon Is    [Arguments]    ${iconText}
    [Documentation]    Check the links of the Circular Measurement tool
    Wait Until Element Is Visible    //div[@id='measureCircleTrigger']    5s   
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //div[@id='measureCircleTrigger']    data-original-title    ${iconText}
    
Verify That Text Of Punctual Selection Icon Is    [Arguments]    ${iconText}
    [Documentation]    Check the links of the Punctual Selection tool
    Wait Until Element Is Visible    //div[@id='point_SelectionTrigger']    5s   
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //div[@id='point_SelectionTrigger']    data-original-title    ${iconText}
    
Verify That Text Of Linear Selection Icon Is    [Arguments]    ${iconText}
    [Documentation]    Check the links of the Linear Selection tool
    Wait Until Element Is Visible    //div[@id='linestring_SelectionTrigger']    5s   
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //div[@id='linestring_SelectionTrigger']    data-original-title    ${iconText}
    
Verify That Text Of Rectangular Selection Icon Is    [Arguments]    ${iconText}
    [Documentation]    Check the links of the Rentangular Selection tool
    Wait Until Element Is Visible    //div[@id='rectangle_SelectionTrigger']    5s   
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //div[@id='rectangle_SelectionTrigger']    data-original-title    ${iconText}
    
Verify That Text Of Polygonal Selection Icon Is    [Arguments]    ${iconText}
    [Documentation]    Check the links of the Polygonal Selection tool
    Wait Until Element Is Visible    //div[@id='polygon_SelectionTrigger']    5s   
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //div[@id='polygon_SelectionTrigger']    data-original-title    ${iconText}
    
Verify That Text Of Circular Selection Icon Is    [Arguments]    ${iconText}
    [Documentation]    Check the links of the Circular Selection tool
    Wait Until Element Is Visible    //div[@id='circle_SelectionTrigger']    5s   
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
        
Verify Alert Text And Accept    [Arguments]    ${text}
    [Documentation]    Check for the Alert message and Accept the popup
    Alert Should Be Present     text=${text}    action=ACCEPT    timeout=3s
    
Verify Alert Text And Cancel    [Arguments]    ${text}
    [Documentation]    Check for the Alert message and Cancel the popup
    Alert Should Be Present     text=${text}    action=DISMISS    timeout=3s
    
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
    
Change Layer Visibility    [Arguments]    ${LAYER_NAME}
    [Documentation]    Click the checkbox for visibility in the layer list for the given layer name
    Click Element    xpath://span[contains(text(),'${LAYER_NAME}')]//preceding::input[1]    
    
Go to My Maps Tab
    [Documentation]    Go to context tab in the layer list
    Wait Until Element Is Enabled    xpath://a[contains(text(),'My maps')]    timeout=10s    
    Click Element    xpath://a[contains(text(),'My maps')]
    
Create New Context    [Arguments]    ${CONTEXT_NAME}    ${CONTEXT_DESCRIPTION}
    [Documentation]    Create new context with the given name and description
    Wait Until Element Is Enabled    xpath://a[@id='saveButton']    timeout=10s    
    Click Element    xpath://a[@id='saveButton']
    Wait Until Element Is Enabled    xpath://input[@placeholder='Title']    timeout=10s    
    Input Text    xpath://input[@placeholder='Title']    ${CONTEXT_NAME}
    Wait Until Element Is Enabled    xpath://textarea[@placeholder='Description']    timeout=10s    
    Input Text    xpath://textarea[@placeholder='Description']    ${CONTEXT_DESCRIPTION}
    Wait Until Element Is Enabled    xpath://a[@class='btn btn-default btn-primary']    timeout=10s    
    Click Element    xpath://a[@class='btn btn-default btn-primary']
    Reload Page    

Delete Context    [Arguments]    ${CONTEXT_NAME}
    [Documentation]    Delete context from the list by the given name
    ${VAR}    Catenate    //div[contains(text(),'${CONTEXT_NAME}')]/following-sibling::div[3]//div[@class='deleteContextButton']
    Wait Until Element Is Enabled    xpath:${VAR}    timeout=10s    
    Click Element    xpath:${VAR}
    Confirm Message

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
    Wait Until Element Is Enabled    xpath://div[@id='measureLineTrigger']//i    
    Click Element    xpath://div[@id='measureLineTrigger']//i
    
Draw Distance Measurement    [Arguments]    ${xoffset_initial}    ${yoffset_initial}    ${xoffset}    ${yoffset}
    [Documentation]    Draw distance measurement on the map between two points
    Wait Until Element Is Enabled    xpath://div[@id='map']    timeout=10s 
    Click Element At Coordinates    //div[@id='map']    ${xoffset_initial}    ${yoffset_initial}  
    Drag And Drop By Offset    //div[@id='map']    ${xoffset}    ${yoffset}
    Double Click On The Map At Coordinates    ${xoffset}    ${yoffset}
                      