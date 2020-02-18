*** Settings ***

Documentation     TC for manage photo on spatial element on the map
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Library    String
Library    OperatingSystem
Library    SeleniumLibrary   
Library    Dialogs
Library    BuiltIn
Library    DateTime
Library    XML
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
Resource    ../../../../common/admin/CommonKeywords.robot
Resource    ../../../../common/CommonLogin.robot 
Resource    ../../../../common/jmapWeb/CommonWeb.robot
Resource    ../../../../common/admin/CommonProject.robot
Resource    ../../../../common/admin/CommonLayer.robot
Resource    ../../../../common/admin/CommonDatabase.robot
Resource    ../../../../common/admin/CommonDeployment.robot
Resource    ../../../../common/admin/CommonSpatialDataSource.robot
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
Suite Setup   Start Setup
Suite Teardown		Suite Down 
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Variable ***

${MAPELEMENT}    //div[@id='map']   
${JMAPADMIN}    http://192.168.0.25:8080
${JMAPWEBAPP}    ManagePhotoWeb
${LAYERNAME}    Cities
${ATLANTIS_X}    -40    
${ATLANTIS_Y}    35
${PHOTO_PATH}    C://Users/Daryll/Documents/RegressionTestWorkSpace/JMapRobotTests/images/avatars.jpg
${EDITED_PHOTO_PATH}    C://Users/Daryll/Documents/RegressionTestWorkSpace/JMapRobotTests/images/book.png
${TITLE}    Photo Title
${COMMENT}    Photo Comment
${EDITED_COMMENT}    New Comment
${HOST}    192.168.0.25
${PORT}    8080    
@{ATLANTIS}    Create List    -40    35
@{SDS_LIST}=    World Cities    World Continent Names    World Countries    World Hydro    World Lakes    World Ocean Names
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Test Cases ***

Add Element with Photo
    [Documentation]    User Click On Show Sidebar Icon and enable edition tools for the layer. Select Create Elements tool
    ...     and click on the map. User add a photo from a file. User save transaction
    Add Element with Photo
    
Add Photo to an Element
    [Documentation]    User Click On Show Sidebar Icon and enable edition tools for the layer. Select Form tool
    ...     and click on an element. User add a photo from a file. User save transaction
    Add Photo to an Element
    
Edit Photo title of an Element
    [Documentation]    User Click On Show Sidebar Icon and enable edition tools for the layer. Select Form tool and 
    ...    select one element on the map. User click on the photo and edit the title. User save transaction
    Edit Photo title of an Element
    
Display title in photo full size
    [Documentation]    User click on an element to show mouseover with Photo as Thumbnail. User click on the photo
    ...    in the bubble and the image is showed full size. Title of the photo should be present
    Display title in photo full size
    
Add Photo to an Element with Comment
    [Documentation]    User Click On Show Sidebar Icon and enable edition tools for the layer. Select Form tool and 
    ...    select one element on the map. User add a photo from a file. User click on the previous added 
    ...    photo and add a comment. User save transaction
    Add Photo to an Element with Comment
    
Display comment in photo full size
    [Documentation]    User click on an element to show mouseover with Photo as Thumbnail. User click on the photo
    ...    in the bubble and the image is showed full size. Comment of the photo should be present
    Display comment in photo full size
    
Edit Photo Comment of an Element
    [Documentation]    User Click On Show Sidebar Icon and enable edition tools for the layer. Select Form tool and 
    ...    select one element on the map. User click on the photo and edit the comment. User save transaction
    Edit Photo Comment of an Element        

MouseOver with Photo As Thumbnail
    [Documentation]    User click on an element to show mouseover with Photo as Thumbnail
    MouseOver with Photo As Thumbnail
    
See MouseOver photo in full size
    [Documentation]    User click on an element to show mouseover with Photo as Thumbnail. User click on the photo
    ...    in the bubble and the image is showed full size
    See MouseOver photo in full size

Delete Photo from Element
    [Documentation]    User Click On Show Sidebar Icon and enable edition tools for the layer. Select Form tool
    ...     and click on an element. User delete a photo. User save transaction
    Delete Photo from Element
    
Delete Element with Photo
    [Documentation]    User Click On Show Sidebar Icon and enable edition tools for the layer. Select Edit Elements tool
    ...     and click on an element. User press DELETE key and confirm. User save transaction
    Delete Element with Photo
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
*** Keywords ***

Add Element with Photo
    Add an Element on the Map    ${LAYERNAME}    ${ATLANTIS_X}    ${ATLANTIS_Y}
    Add photo from Photo Form    ${PHOTO_PATH}
    Click Save Button in Form
    Save Transaction
    Go to Form Edition Tool
    Click On The Map At Coordinates    ${ATLANTIS_X}    ${ATLANTIS_Y}
    Wait Until Element Is Visible    xpath://div[@class='itemInnerContainer']//img    timeout=10s    
    Element Should Be Visible    xpath://div[@class='itemInnerContainer']//img    timeout=10s
    Click Cancel Button in Form
    Disable Edition Options for a Layer    ${LAYERNAME}
    Click On Show Sidebar Icon
    
Add Photo to an Element
    Element Exist with Photo on the Map    ${LAYERNAME}    ${ATLANTIS_X}    ${ATLANTIS_Y}    ${PHOTO_PATH}
    Edit an Element on the Map    ${LAYERNAME}    ${ATLANTIS_X}    ${ATLANTIS_Y}
    Change Photo from Photo Form    ${EDITED_PHOTO_PATH}    ${ATLANTIS_X}    ${ATLANTIS_Y}
    Click Save Button in Form
    Save Transaction
    Click On The Map At Coordinates    ${ATLANTIS_X}    ${ATLANTIS_Y}
    Wait Until Element Is Visible    xpath://div[@class='itemInnerContainer']//img    timeout=10s    
    Element Should Be Visible    xpath://div[@class='itemInnerContainer']//img    timeout=10s
    Click Cancel Button in Form    
    Disable Edition Options for a Layer    ${LAYERNAME}
    Click On Show Sidebar Icon    
    
See MouseOver photo in full size
    Element Exist with Photo on the Map    ${LAYERNAME}    ${ATLANTIS_X}    ${ATLANTIS_Y}    ${PHOTO_PATH}    
    Click On The Map At Coordinates    ${ATLANTIS_X}    ${ATLANTIS_Y}
    Click Element    xpath://img[@class='mCS_img_loaded']
    Wait Until Element Is Visible    xpath://img[@id='jmap-photo-viewer-img']    timeout=10s    
    Page Should Contain Image    xpath://img[@id='jmap-photo-viewer-img']    The image is missing
    Wait Until Element Is Enabled    xpath://a[@id='closeButton']    timeout=10s           
    Click Element    xpath://a[@id='closeButton']
    Wait Until Element Is Enabled    xpath://a[@class='jmapPopupCloser material-icons']    timeout=10s    
    Click Element    xpath://a[@class='jmapPopupCloser material-icons']        

Edit Photo title of an Element    
    Edit an Element on the Map    ${LAYERNAME}    ${ATLANTIS_X}    ${ATLANTIS_Y}
    Edit Photo Title From Photo Form    ${PHOTO_PATH}    ${TITLE}    ${ATLANTIS_X}    ${ATLANTIS_Y}    
    Click Save Button in Form
    Save Transaction        
    Click On The Map At Coordinates    ${ATLANTIS_X}    ${ATLANTIS_Y}
    Wait Until Element Is Visible    xpath://div[@class='itemInnerContainer']//img    timeout=10s    
    Click Element    xpath://div[@class='itemInnerContainer']//img
    Wait Until Element Is Enabled    xpath://input[@class='form-control']    timeout=10s    
    Element Attribute Value Should Be    xpath://input[@class='form-control']    value    ${TITLE}
    Wait Until Element Is Enabled    xpath://a[@id='closeButton']    timeout=10s            
    Click Element    xpath://a[@id='closeButton']
    Click Cancel Button in Form        
    Disable Edition Options for a Layer    ${LAYERNAME}
    Click On Show Sidebar Icon    

Display title in photo full size
    Element Exist with Photo on the Map    ${LAYERNAME}    ${ATLANTIS_X}    ${ATLANTIS_Y}    ${PHOTO_PATH} 
    Edit Photo title of an Element
    Click On The Map At Coordinates    ${ATLANTIS_X}    ${ATLANTIS_Y}
    Wait Until Element Is Visible    xpath://img[@class='mCS_img_loaded']    timeout=10s    
    Click Element    xpath://img[@class='mCS_img_loaded']
    Wait Until Element Is Visible    xpath://input[@class='form-control']    timeout=10s    
    Element Attribute Value Should Be    xpath://input[@class='form-control']    value    ${TITLE}
    Wait Until Element Is Enabled    xpath://a[@id='closeButton']    timeout=10s    
    Click Element    xpath://a[@id='closeButton']
    Wait Until Element Is Enabled    xpath://a[@class='jmapPopupCloser material-icons']    timeout=10s    
    Click Element    xpath://a[@class='jmapPopupCloser material-icons']        

Add Photo to an Element with Comment    
    Edit an Element on the Map    ${LAYERNAME}    ${ATLANTIS_X}    ${ATLANTIS_Y}
    Edit Photo Comment From Photo Form    ${PHOTO_PATH}    ${COMMENT}    ${ATLANTIS_X}    ${ATLANTIS_Y}    
    Click Save Button in Form
    Save Transaction        
    Click On The Map At Coordinates    ${ATLANTIS_X}    ${ATLANTIS_Y}
    Wait Until Element Is Visible    xpath://div[@class='itemInnerContainer']//img    timeout=10s    
    Click Element    xpath://div[@class='itemInnerContainer']//img
    Wait Until Element Is Enabled    xpath://textarea[@class='form-control']    timeout=10s    
    SeleniumLibrary.Element Text Should Be    xpath://textarea[@class='form-control']    ${COMMENT}
    Wait Until Element Is Enabled    xpath://a[@id='closeButton']    timeout=10s            
    Click Element    xpath://a[@id='closeButton']
    Click Cancel Button in Form        
    Disable Edition Options for a Layer    ${LAYERNAME}
    Click On Show Sidebar Icon 
    
Display comment in photo full size
    Element Exist with Photo on the Map    ${LAYERNAME}    ${ATLANTIS_X}    ${ATLANTIS_Y}    ${PHOTO_PATH} 
    Add Photo to an Element with Comment   
    Click On The Map At Coordinates    ${ATLANTIS_X}    ${ATLANTIS_Y}
    Wait Until Element Is Visible    xpath://img[@class='mCS_img_loaded']    timeout=10s    
    Click Element    xpath://img[@class='mCS_img_loaded']
    Wait Until Element Is Visible    xpath://textarea[@class='form-control']    timeout=10s    
    SeleniumLibrary.Element Text Should Be    xpath://textarea[@class='form-control']    ${COMMENT}
    Wait Until Element Is Enabled    xpath://a[@id='closeButton']    timeout=10s    
    Click Element    xpath://a[@id='closeButton']
    Wait Until Element Is Enabled    xpath://a[@class='jmapPopupCloser material-icons']    timeout=10s    
    Click Element    xpath://a[@class='jmapPopupCloser material-icons']   

Edit Photo Comment of an Element    
    Edit an Element on the Map    ${LAYERNAME}    ${ATLANTIS_X}    ${ATLANTIS_Y}
    Edit Photo Comment From Photo Form    ${PHOTO_PATH}    ${EDITED_COMMENT}    ${ATLANTIS_X}    ${ATLANTIS_Y}    
    Click Save Button in Form
    Save Transaction        
    Click On The Map At Coordinates    ${ATLANTIS_X}    ${ATLANTIS_Y}
    Wait Until Element Is Visible    xpath://div[@class='itemInnerContainer']//img    timeout=10s    
    Click Element    xpath://div[@class='itemInnerContainer']//img
    Wait Until Element Is Enabled    xpath://textarea[@class='form-control']    timeout=10s    
    SeleniumLibrary.Element Text Should Be    xpath://textarea[@class='form-control']    ${EDITED_COMMENT}        
    Wait Until Element Is Enabled    xpath://a[@id='closeButton']    timeout=10s    
    Click Element    xpath://a[@id='closeButton']
    Click Cancel Button in Form        
    Disable Edition Options for a Layer    ${LAYERNAME}
    Click On Show Sidebar Icon
    
MouseOver with Photo As Thumbnail
    Element Exist with Photo on the Map    ${LAYERNAME}    ${ATLANTIS_X}    ${ATLANTIS_Y}    ${PHOTO_PATH}
    Click On The Map At Coordinates    ${ATLANTIS_X}    ${ATLANTIS_Y}
    Wait Until Element Is Visible    xpath://img[@class='mCS_img_loaded']    timeout=10s
    Element Should Be Visible    xpath://img[@class='mCS_img_loaded']    timeout=10s
    Wait Until Element Is Enabled    xpath://a[@class='jmapPopupCloser material-icons']    timeout=10s            
    Click Element    xpath://a[@class='jmapPopupCloser material-icons']
    
Delete Photo from Element
    Element Exist with Photo on the Map    ${LAYERNAME}    ${ATLANTIS_X}    ${ATLANTIS_Y}    ${PHOTO_PATH}
    Edit an Element on the Map    ${LAYERNAME}    ${ATLANTIS_X}    ${ATLANTIS_Y}              
    Delete photo from Photo Form
    Click Save Button in Form
    Save Transaction    
    Click On The Map At Coordinates    ${ATLANTIS_X}    ${ATLANTIS_Y}       
    Element Should Not Be Visible    xpath://div[@class='itemInnerContainer']//img    timeout=10s
    Click Cancel Button in Form
    Disable Edition Options for a Layer    ${LAYERNAME}
    Click On Show Sidebar Icon

Delete Element with Photo
    Element Exist with Photo on the Map    ${LAYERNAME}    ${ATLANTIS_X}    ${ATLANTIS_Y}    ${PHOTO_PATH}   
    Delete an Element from the Map    ${LAYERNAME}    ${ATLANTIS_X}    ${ATLANTIS_Y}    None
    Go to Form Edition Tool
    Click On The Map At Coordinates    ${ATLANTIS_X}    ${ATLANTIS_Y}
    Element Should Not Be Visible    xpath://div[@class='modal-dialog']    timeout=10s        
    Disable Edition Options for a Layer    ${LAYERNAME}
    Click On Show Sidebar Icon

Start Setup
    [Documentation]    This is the initial preparation or precondition to run all Photo TC in JMap Web
    ...    It Includes Open JMap Admin, Go to project layer and check for Attribute form with photo component.
    ...    Go to mouseover and add photoAsThumbnail function if necesary. Go to deployment page and check for
    ...    the JMap Web deployment existence. Create it if necesary and launch it.
    Login JMap Admin    administrator    ${EMPTY}    English    ${JMAPADMIN}    0.5
    # Go to Spatial Datasources
    # Update One SDS    ${SDS_LIST[0]}
    # Update One SDS    ${SDS_LIST[1]}
    # Update One SDS    ${SDS_LIST[2]}
    # Update One SDS    ${SDS_LIST[3]}
    # Update One SDS    ${SDS_LIST[4]}
    # Update One SDS    ${SDS_LIST[5]}
    Go to Projects
    Open Project    The World
    Go to Layers Page
    Go to Layer Details    ${LAYERNAME}                
    Go to Layer Permissions Page
    ${EXISTUSER}=    Exist Element in JMap Table Component td    theForm:tabViewPermissionsOwners:tblPrincipals    administrator
    Run Keyword If    '${EXISTUSER}'!='${True}'    Add Permissions to a User    administrator    Add elements    Modify attribute values    Modify elements    Delete elements            
    Run Keyword If    '${EXISTUSER}'!='${True}'    Clicks on Save Permissions
    Go to Forms Page
    ${EXISTFORM}=    Exist Element in JMap Table Component a    theForm:tabViewForms:tblForms   Attribute Form    
    Run Keyword If    '${EXISTFORM}'=='${True}'    Delete Attribute Form    Attribute Form    
    Create Attribute Form    Attribute Form    
    Add Component for an Attribute    Photo form    PHOTO    0    0    ${False}    ${True}    JMap    Database    ${True}    PostgresDB    public.phototable    id    objectid    filename    photo    title    comment    C:\    
    Save Form Layout
    Page Should Contain    Attribute Form
    Wait Until Element Is Enabled    xpath://span[contains(text(),'Settings - Forms')]    timeout=10s    
    Click Element    xpath://span[contains(text(),'Settings - Forms')]
    ${EXISTFORM}=    Exist form   Database Form    
    Run Keyword If    '${EXISTFORM}'=='${True}'    Delete Attribute Form    Database Form
    Go to Projects
    Open Project    The World
    Go to Layers Page
    Go to Layer Details    ${LAYERNAME}    
    Go to Layer MouseOver Page
    Wait Until Element Is Enabled    xpath://textarea[@id='theForm:mouseoverText']    timeout=10s    
    Input Text    xpath://textarea[@id='theForm:mouseoverText']    photosAsThumbnails()
    Wait Until Element Is Enabled    xpath://button[@id='theForm:saveButton']    timeout=10s    
    Click Button    xpath://button[@id='theForm:saveButton']
    Go to Projects
    Open Project    The World
    Go to Layers Page
    Go to Layer Details    ${LAYERNAME}
    ${EXIST}    Run Keyword And Return Status    Page Should Contain Element    xpath://div[contains(text(),'By tile')]
    Run Keyword If    '${EXIST}'=='${TRUE}'    Click Edit Button    
    Run Keyword If    '${EXIST}'=='${TRUE}'    Click Next Button
    Run Keyword If    '${EXIST}'=='${TRUE}'    Click Next Button
    Run Keyword If    '${EXIST}'=='${TRUE}'    Click Element    xpath://label[contains(text(),'Load by region')]    
    Run Keyword If    '${EXIST}'=='${TRUE}'    Click Finish Button
    Go to Deployments
    ${TEMP}=    Exist Deployment    ${JMAPWEBAPP}
    Run Keyword If    '${TEMP}'!='${True}'
    ...    Create Web Deployment    ${JMAPWEBAPP}    http    ${HOST}    ${PORT}    /${JMAPWEBAPP}    The World
    Login JMap Web    administrator    ${EMPTY}    ${JMAPADMIN}/${JMAPWEBAPP}/login.jsp    0.5  
    
Suite Down
    [Documentation]    This is for close both sessions web and admin
    Click On Show Sidebar Icon
    Enable Edition Options for a Layer    ${LAYERNAME}
    Go to Form Edition Tool
    Click On The Map At Coordinates    ${ATLANTIS_X}    ${ATLANTIS_Y}
    ${EXIST}    Run Keyword And Return Status    Element Should Not Be Visible    xpath://div[@class='modal-dialog']
    Run Keyword If    '${EXIST}'!='${TRUE}'    Click Cancel Button in Form
    Run Keyword If    '${EXIST}'!='${TRUE}'    Delete an Element from the Map    ${LAYERNAME}    ${ATLANTIS_X}    ${ATLANTIS_Y}    None    
    Logout JMap Web    administrator    True 
    Logout JMap    True
    
Element Exist with Photo on the Map    [Arguments]    ${LAYERNAME}    ${ATLANTIS_X}    ${ATLANTIS_Y}    ${PHOTO_PATH}
    [Documentation]    This Keyword check that the element for a layer exist on the map for the especific coordinates
    ...    with Photo configured. If no exist will create the element with Photo from the given path. If the element exist but 
    ...    do not have a photo it will add a photo from the given path.      
    Click On Show Sidebar Icon
    Enable Edition Options for a Layer    ${LAYERNAME}
    Go to Form Edition Tool
    Click On The Map At Coordinates    ${ATLANTIS_X}    ${ATLANTIS_Y}
    ${EXIST}    Run Keyword And Return Status    Element Should Not Be Visible    xpath://div[@class='modal-dialog']        
    ${HAS_PHOTO}    Run Keyword And Return Status    Element Should Not Be Visible    xpath://div[@class='itemInnerContainer']//img
    Run Keyword If    '${EXIST}'=='${TRUE}'    Disable Edition Options for a Layer    ${LAYERNAME}
    Run Keyword If    '${EXIST}'=='${TRUE}'    Click On Show Sidebar Icon
    Run Keyword If    '${EXIST}'=='${TRUE}'    Add an Element on the Map    ${LAYERNAME}    ${ATLANTIS_X}    ${ATLANTIS_Y}
    Run Keyword If    '${EXIST}'=='${TRUE}'    Add photo from Photo Form    ${PHOTO_PATH}
    Run Keyword If    '${EXIST}'=='${TRUE}'    Click Save Button in Form
    Run Keyword If    '${EXIST}'=='${TRUE}'    Save Transaction
    Run Keyword If    '${EXIST}'!='${TRUE}' and '${HAS_PHOTO}'=='${TRUE}'    Add photo from Photo Form    ${PHOTO_PATH}
    Run Keyword If    '${EXIST}'!='${TRUE}' and '${HAS_PHOTO}'=='${TRUE}'    Click Save Button in Form
    Run Keyword If    '${EXIST}'!='${TRUE}' and '${HAS_PHOTO}'=='${TRUE}'    Save Transaction    
    Run Keyword If    '${EXIST}'!='${TRUE}' and '${HAS_PHOTO}'!='${TRUE}'    Click Cancel Button in Form        
    Disable Edition Options for a Layer    ${LAYERNAME}
    Click On Show Sidebar Icon   