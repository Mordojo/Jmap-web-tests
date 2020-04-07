*** Settings ***

Documentation     Draw Annotation Test cases
#--------------------------------------------------------------------------------------------------------------------------------
Library    String
Library    OperatingSystem
Library    SeleniumLibrary    run_on_failure=No Operation   
Library    Dialogs
Library    BuiltIn
Library    DateTime
#--------------------------------------------------------------------------------------------------------------------------------
Resource    ../../../../common/admin/CommonKeywords.robot
Resource    ../../../../common/CommonLogin.robot
Resource    ../../../../common/jmapWeb/CommonAnnotationWeb.robot
Resource    ../../../../common/jmapWeb/CommonWeb.robot 
#--------------------------------------------------------------------------------------------------------------------------------
Test Setup   Run Keywords    
             ...    Open Browser On JMap Web    ${URLWebApp}    ${RESOLUTION_X}    ${RESOLUTION_Y}    AND
             ...    Login To JMap Web    ${UserName}    ${Password}
Test Teardown    LogOut 
Metadata    author    Mordjane Boussad
#-------------------------------------------------------------------------------------------------------------------------------- 
*** Variable ***

${textAnnotationField}    //div[@class='textAnnotationInputDiv']//input
${mapElement}    //div[@id='map']   
#--------------------------------------------------------------------------------------------------------------------------------
*** Test Cases ***

JM70-638:Draw a freehand annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Freehand Annotation
    Element Annotation Should Be Selected    Freehand
    Draw With Freehand Annotation    -175    130
    #Success criterion
    Verify That The Annotation Type Is    LineString
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-879:Create a text annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Text Annotation
    Element Annotation Should Be Selected    Text
    Double Click On The Map At Coordinates    -175   130
    Verify Text Annotation Field Is Exist
    Create annotation with text     Argentina
    #Success criterion
    Verify That The Annotation Type Is    Text
    Verify That The Annotation Text Is    Argentina
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-880:Draw a point annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Point Annotation
    Element Annotation Should Be Selected    Point       
    Draw With Point Annotation    -175   130
    #success criterion    
    Verify That The Annotation Type Is    Point
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-881:Draw a line annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Line Annotation
    Element Annotation Should Be Selected    Line
    Draw With Line Annotation
    #success criterion
    Verify That The Annotation Type Is    LineString
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-882:Draw a rectangle annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Rectangle Annotation
    Element Annotation Should Be Selected    Rectangle
    Draw With Rectangle Annotation
    #success criterion
    Verify That The Annotation Type Is    Rectangle
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-883:Draw a polygon annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Polygon Annotation
    Element Annotation Should Be Selected    Polygon
    Draw With Polygon Annotation
    #success criterion
    Verify That The Annotation Type Is    Polygon
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-884:Draw a circle annotation    #Test case is failed
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Circle Annotation
    Element Annotation Should Be Selected    Circle
    Draw With Circle Annotation
    #success criterion
    Verify That The Annotation Type Is    Circle
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
#----------------------------------------------------------------------------------------------------------------------------------------
*** Keywords ***

