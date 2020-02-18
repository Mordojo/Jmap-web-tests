*** Settings ***

Documentation     Select Annotation Test cases
#--------------------------------------------------------------------------------------------------------------------------------------------------------
Library    String
Library    OperatingSystem
Library    SeleniumLibrary    run_on_failure=No Operation   
Library    Dialogs
Library    BuiltIn
Library    DateTime
#---------------------------------------------------------------------------------------------------------------------------------------------------------
Resource    ../../../../common/admin/CommonKeywords.robot
Resource    ../../../../common/CommonLogin.robot
Resource    ../../../../common/jmapWeb/CommonAnnotationWeb.robot
Resource    ../../../../common/jmapWeb/CommonWeb.robot 
#---------------------------------------------------------------------------------------------------------------------------------------------------------
Test Setup   Run Keywords    
             ...    Open Browser On JMap Web    ${URLWebApp}    ${RESOLUTION_X}    ${RESOLUTION_Y}    AND
             ...    Login To JMap Web
Test Teardown    LogOut
Metadata    author    Mordjane Boussad
#---------------------------------------------------------------------------------------------------------------------------------------------------------
*** Variable ***

${textAnnotationField}    //div[@class='textAnnotationInputDiv']//input
${mapElement}    //div[@id='map'] 
#---------------------------------------------------------------------------------------------------------------------------------------------------------
*** Test Cases ***

JM70-885:Select a Freehand annotation
    Draw a Freehand Annotation With Coordinates    -175   130    #Preconditions
    Click On Selection Icon
    Select The Drawing Tool Freehand Annotation    -175   130           
    #Success criterion
    Verify That The Annotation Type Is    LineString
    The Annotation Drawing Should Be Selected
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-886:Select a Text annotation
    Draw a Text Annotation With Text And Coordinates    Argentina    -175   130
    Click On Selection Icon
    Select The Drawing Tool Freehand Annotation    -175   130
    #Success criterion
    Verify That The Annotation Type Is    Text
    The Annotation Drawing Should Be Selected
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-887:Select a Point annotation
    Draw a Point Annotation With Coordinates    -175   130
    Click On Selection Icon
    Select The Drawing Tool Freehand Annotation    -175   130    
    #Success criterion
    Verify That The Annotation Type Is    Point
    The Annotation Drawing Should Be Selected
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-888:Select a Line annotation
    Draw a Line Annotation
    Click On Selection Icon
    Select The Drawing Tool Line Annotation    -175   130
    #Success criterion
    Verify That The Annotation Type Is    LineString
    The Annotation Drawing Should Be Selected
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-889:Select a Rectangle annotation
    Draw a Rectangle annotation
    Click On Selection Icon
    Select The Drawing Tool Rectangle Annotation    115   -70
    #Success criterion
    Verify That The Annotation Type Is    Rectangle
    The Annotation Drawing Should Be Selected
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-890:Select a Polygon annotation
    Draw a Polygon annotation
    Click On Selection Icon
    Select The Drawing Tool Polygon Annotation    -90   -90
    #Success criterion
    Verify That The Annotation Type Is    Polygon
    The Annotation Drawing Should Be Selected
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-891:Select a Circle annotation
    Draw a Circle annotation
    Click On Selection Icon
    Select The Drawing Tool Circle Annotation    -30   30
    #Success criterion
    Verify That The Annotation Type Is    Circle
    The Annotation Drawing Should Be Selected
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
*** Keywords *** 
 
The Annotation Drawing Should Be Selected
    Sleep    1s    reason=Wait until the Annotation be selectable
    ${getSelectAttribute}    Execute Javascript    return window.JMap.app.clickToolManager.getSelectionTool().interaction.getFeatures().getArray().length
    ${getSelectAttribute}    Convert To String    ${getSelectAttribute}
    Run Keyword And Continue On Failure    Should Be Equal    ${getSelectAttribute}    1    msg=The current annotation does not selected. But, it should be selected !!!
    
The Annotation Drawing Should Not Be Selected
    Sleep    1s    reason=Wait until the Annotation be not selectable
    ${getSelectAttribute}    Execute Javascript    Execute Javascript    return window.JMap.app.clickToolManager.getSelectionTool().interaction.getFeatures().getArray().length
    ${getSelectAttribute}    Convert To String    ${getSelectAttribute}
    Run Keyword And Continue On Failure    Should Be Equal    ${getSelectAttribute}    0    msg=The current annotation is selected. But, it should be not selected !!!