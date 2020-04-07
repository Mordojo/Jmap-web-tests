*** Settings ***

Documentation     Edit Annotation Test cases
#-----------------------------------------------------------------------------------------------------------------------------
Library    String
Library    OperatingSystem
Library    SeleniumLibrary   
Library    Dialogs
Library    BuiltIn
Library    DateTime
#------------------------------------------------------------------------------------------------------------------------------
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

JM70-892:Modify the form of a freehand annotation
    Draw a Freehand Annotation With Coordinates    -175    130
    Click On Modification Icon
    Edit The Form Of The Drawing Of The Freehand Annotation
    Click On Selection Icon
    Click On Modification Icon
    Select The Drawing Tool Freehand Annotation    125    80         
    #Success criterion
    The Icone Rotate Right Should be Exist
    The Icone Rotate Left Should be Exist
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-893:Modify the form of a line annotation
    Draw a Line Annotation
    Click On Modification Icon
    Edit The Form Of The Drawing Of The Line Annotation
    Click On Selection Icon
    Click On Modification Icon
    Select The Drawing Tool Line Annotation    125    130           
    #Success criterion
    The Icone Rotate Right Should be Exist
    The Icone Rotate Left Should be Exist
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-894:Modify the form of a rectangle annotation    #To Review
    Draw a rectangle annotation
    Click On Modification Icon
    Edit The Form Of The Drawing Of The Rectangle Annotation
    Click On Selection Icon
    Click On Modification Icon
    Select The Drawing Tool Rectangle Annotation    -60   10
    #Success criterion
    Verify That The Drawn Annotation Is Selected To Modify It
    The Icone Rotate Right Should be Exist
    The Icone Rotate Left Should be Exist
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-895:Modify the form of a polygon annotation 
    Draw a Polygon annotation
    Click On Modification Icon
    Edit The Form Of The Drawing Of The Polygon Annotation  
    Click On Selection Icon
    Click On Modification Icon
    Select The Drawing Tool Rectangle Annotation    120   50
    #Success criterion
    Verify That The Drawn Annotation Is Selected To Modify It
    The Icone Rotate Right Should be Exist
    The Icone Rotate Left Should be Exist
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-896:Modify the form of a circle annotation    #To be complited
    Draw a Circle annotation    
    Click On Modification Icon
    Edit The Form Of The Drawing Of The Circle Annotation
    Click On Selection Icon
    Click On Modification Icon
    Select The Drawing Tool Rectangle Annotation    40    05
    #Success criterion
    The Icone Rotate Right Should be Exist
    The Icone Rotate Left Should be Exist
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-897:Modify a freehand annotation with the right rotation
    Draw a Freehand Annotation With Coordinates    -175    130
    Click On Modification Icon
    Select The Drawing Tool Freehand Annotation    -125   93 
    The Icone Rotate Right Should be Exist
    Click 10 Times On The Icone Rotate Right
    Click On Selection Icon
    Click On Modification Icon
    Select The Drawing Tool Freehand Annotation    -180   80  
    #Success criterion
    The Icone Rotate Right Should be Exist
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-898:Modify a text annotation with the right rotation
    Draw a Text Annotation With Text And Coordinates    Argentina    -175   130
    Click On Modification Icon
    Select The Text Annotation On The Map    -175   130
    The Icone Rotate Right Should be Exist
    Click 10 Times On The Icone Rotate Right
    Click On Selection Icon
    Click On Modification Icon
    Select The Text Annotation On The Map    -209   110
    #Success criterion
    The Icone Rotate Right Should be Exist
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-899:Modify a line annotation with the right rotation
    Draw a Line Annotation
    Click On Modification Icon
    Select The Drawing Tool Line Annotation    -125    92 
    The Icone Rotate Right Should be Exist
    Click 10 Times On The Icone Rotate Right
    Click On Selection Icon
    Click On Modification Icon
    Select The Drawing Tool Line Annotation    -150   75
    #Success criterion
    The Icone Rotate Right Should be Exist
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-900:Modify a rectangle annotation with the right rotation
    Draw a rectangle annotation
    Click On Modification Icon
    Select The Drawing Tool Rectangle Annotation    0   -20
    The Icone Rotate Right Should be Exist
    Click 10 Times On The Icone Rotate Right    
    Click On Selection Icon
    Click On Modification Icon
    Select The Drawing Tool Rectangle Annotation    23   -90 
    #Success criterion
    The Icone Rotate Right Should be Exist
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-901:Modify a polygon annotation with the right rotation
    Draw a Polygon annotation
    Click On Modification Icon
    Select The Drawing Tool Polygon Annotation    -20   -10
    The Icone Rotate Right Should be Exist
    Click 10 Times On The Icone Rotate Right
    Click On Selection Icon
    Click On Modification Icon
    Select The Drawing Tool Polygon Annotation    -63   -130 
    #Success criterion
    The Icone Rotate Right Should be Exist
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-902:Modify a freehand annotation with the left rotation
    Draw a Freehand Annotation With Coordinates    -175    130
    Click On Modification Icon
    Select The Drawing Tool Freehand Annotation    -125   93 
    The Icone Rotate Left Should be Exist
    Click 10 Times On The Icone Rotate Left
    Click On Selection Icon
    Click On Modification Icon
    Select The Drawing Tool Freehand Annotation    -133   157  
    #Success criterion
    The Icone Rotate Left Should be Exist
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-903:Modify a text annotation with the left rotation
    Draw a Text Annotation With Text And Coordinates    Argentina    -175   130
    Click On Modification Icon
    Select The Text Annotation On The Map    -175   130
    The Icone Rotate Left Should be Exist
    Click 10 Times On The Icone Rotate Left
    Click On Selection Icon
    Click On Modification Icon
    Select The Text Annotation On The Map    -210   143
    #Success criterion
    The Icone Rotate Left Should be Exist
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-904:Modify a line annotation with the left rotation
    Draw a Line Annotation
    Click On Modification Icon
    Select The Drawing Tool Line Annotation    -125    92 
    The Icone Rotate Left Should be Exist
    Click 10 Times On The Icone Rotate Left
    Click On Selection Icon
    Click On Modification Icon
    Select The Drawing Tool Line Annotation    -133   157
    #Success criterion
    The Icone Rotate Left Should be Exist
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-905:Modify a rectangle annotation with the left rotation
    Draw a Rectangle annotation
    Click On Modification Icon
    Select The Drawing Tool Rectangle Annotation    0   -20
    The Icone Rotate Left Should be Exist
    Click 10 Times On The Icone Rotate Left
    Click On Selection Icon
    Click On Modification Icon
    Select The Drawing Tool Rectangle Annotation    25   20 
    #Success criterion
    The Icone Rotate Left Should be Exist
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-906:Modify a polygon annotation with the left rotation
    Draw a Polygon annotation
    Click On Modification Icon
    Select The Drawing Tool Polygon Annotation    -20   -10
    The Icone Rotate Left Should be Exist
    Click 10 Times On The Icone Rotate Left
    Click On Selection Icon
    Click On Modification Icon
    Select The Drawing Tool Polygon Annotation    -67   40 
    #Success criterion
    The Icone Rotate Left Should be Exist
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message 
      
JM70-907:Move a Freehand annotation
    Draw a Freehand Annotation With Coordinates    -175    130
    Click On Selection Icon
    Select The Drawing Tool Freehand Annotation    -125    93
    Drag And Drop The Freehand Annotation By Offset    100    10
    Click On Modification Icon
    Select The Drawing Tool Freehand Annotation    100    10
    #Success criterion
    The Icone Rotate Right Should be Exist
    The Icone Rotate Left Should be Exist
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-908:Move a Text annotation
    Draw a Text Annotation With Text And Coordinates    Montreal    0   0
    Click On Selection Icon
    Select The Drawing Tool Text Annotation    0   0
    Drag And Drop The Text Annotation By Offset    125    80
    Click On Modification Icon
    Select The Drawing Tool Text Annotation    125    80          
    #Success criterion
    The Icone Rotate Right Should be Exist
    The Icone Rotate Left Should be Exist 
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message 
    
JM70-909:Move a Point annotation
    Draw a Point Annotation With Coordinates    0   0
    Click On Selection Icon
    Select The Drawing Tool Point Annotation    0   0
    Drag And Drop The Point Annotation By Offset    100    10
    Click On Modification Icon
    Select The Drawing Tool Point Annotation    100    10          
    #Success criterion
    The Icone Rotate Right Should be Exist
    The Icone Rotate Left Should be Exist
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message 
    
JM70-910:Move a Line annotation
    Draw a Line Annotation
    Click On Selection Icon
    Select The Drawing Tool Line Annotation    0    0
    Drag And Drop The Line Annotation By Offset    100   150
    Click On Modification Icon
    Select The Drawing Tool Line Annotation    100   150   
    #Success criterion
    The Icone Rotate Right Should be Exist
    The Icone Rotate Left Should be Exist
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-911:Move a Rectangle annotation
    Draw a Rectangle annotation
    Click On Selection Icon
    Select The Drawing Tool Rectangle Annotation    115   -70
    Drag And Drop The Rectangle Annotation By Offset    100   150
    Click On Modification Icon
    Select The Drawing Tool Rectangle Annotation    100   150
    #Success criterion
    The Icone Rotate Right Should be Exist
    The Icone Rotate Left Should be Exist
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-912:Move a Polygon annotation
    Draw a Polygon annotation
    Click On Selection Icon
    Select The Drawing Tool Polygon Annotation    0   0
    Drag And Drop The Polygon Annotation By Offset    100   150
    Click On Modification Icon
    Select The Drawing Tool Polygon Annotation    100   150
    #Success criterion
    The Icone Rotate Right Should be Exist
    The Icone Rotate Left Should be Exist
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-913:Move a Circle annotation
    Draw a Circle annotation
    Click On Selection Icon
    Select The Drawing Tool Circle Annotation    -30   30
    Drag And Drop The Circle Annotation By Offset    100   150
    Click On Modification Icon
    Select The Drawing Tool Circle Annotation    100   150
    #Success criterion
    The Icone Rotate Right Should be Exist
    The Icone Rotate Left Should be Exist    
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
#------------------------------------------------------------------------------------------------------------------------------------------                                                
*** Keywords ***

Edit The Form Of The Drawing Of The Freehand Annotation
    Click On The Map At Coordinates    -125    93
    Sleep    1s       
    Drag And Drop By Offset    //div[@id='map']    125    80
    
Edit The Form Of The Drawing Of The Line Annotation
    Click On The Map At Coordinates    -125    92
    Sleep    1s       
    Drag And Drop By Offset    //div[@id='map']    125    130 
    
Edit The Form Of The Drawing Of The Rectangle Annotation
    Click On The Map At Coordinates    115   -70
    Sleep    1s    
    Drag And Drop By Offset    ${mapElement}    -60   10
    
Edit The Form Of The Drawing Of The Polygon Annotation
    Click On The Map At Coordinates    -20   -10
    Sleep    1s
    Drag And Drop By Offset    ${mapElement}    120   50
    
Edit The Form Of The Drawing Of The Circle Annotation
    Click On The Map At Coordinates    -30   30
    Sleep    1s
    Drag And Drop By Offset    ${mapElement}    70   10
    
Unselect Drawing Tool Annotation
    Click Element    xpath://div[@id='dropdownButton_freehandSet']
    Sleep    1s 
    
Drag And Drop The Freehand Annotation By Offset    [Arguments]    ${xoffset}    ${yoffset}
    Drag And Drop By Offset    //div[@id='map']    ${xoffset}    ${yoffset}
    sleep    1s
    
Drag And Drop The Text Annotation By Offset    [Arguments]    ${xoffset}    ${yoffset}
    Drag And Drop By Offset    //div[@id='map']    ${xoffset}    ${yoffset}
    sleep    1s
    
Drag And Drop The Point Annotation By Offset    [Arguments]    ${xoffset}    ${yoffset}
    Drag And Drop By Offset    //div[@id='map']    ${xoffset}    ${yoffset}
    sleep    1s
    
Drag And Drop The Line Annotation By Offset    [Arguments]    ${xoffset}    ${yoffset}
    Drag And Drop By Offset    //div[@id='map']    ${xoffset}    ${yoffset}
    sleep    1s
    
Drag And Drop The Rectangle Annotation By Offset    [Arguments]    ${xoffset}    ${yoffset}
    Drag And Drop By Offset    //div[@id='map']    ${xoffset}    ${yoffset}
    sleep    1s
    
Drag And Drop The Polygon Annotation By Offset    [Arguments]    ${xoffset}    ${yoffset}
    Drag And Drop By Offset    //div[@id='map']    ${xoffset}    ${yoffset}
    sleep    1s
    
Drag And Drop The Circle Annotation By Offset    [Arguments]    ${xoffset}    ${yoffset}
    Drag And Drop By Offset    //div[@id='map']    ${xoffset}    ${yoffset}
    sleep    1s 
    
Click 10 Times On The Icone Rotate Right
    :FOR    ${count}    IN RANGE    1    10
    \    Set Selenium Speed    0.5s
    \    Click Element    xpath://div[@name='rotateRight']
    
Click 10 Times On The Icone Rotate Left
    :FOR    ${count}    IN RANGE    1    10
    \    Set Selenium Speed    0.5s
    \    Click Element    xpath://div[@name='rotateLeft']