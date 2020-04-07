*** Settings ***

Documentation     Verify style Annotation Test cases
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Library    String
Library    OperatingSystem
Library    SeleniumLibrary    run_on_failure=No Operation  
Library    Dialogs
Library    BuiltIn
Library    DateTime
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Resource    ../../../../common/admin/CommonKeywords.robot
Resource    ../../../../common/CommonLogin.robot 
Resource    ../../../../common/jmapWeb/CommonAnnotationWeb.robot
Resource    ../../../../common/jmapWeb/CommonWeb.robot
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Test Setup   Run Keywords    
             ...    Open Browser On JMap Web    ${URLWebApp}    ${RESOLUTION_X}    ${RESOLUTION_Y}    AND
             ...    Login To JMap Web    ${UserName}    ${Password}
Test Teardown    LogOut
Metadata    Author    Mordjane Boussad
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Variable ***

${redColorDrawing}    ff0000-1
${blackColorDrawing}    [0, 0, 0, 1]
${brownColorDrawing}    [120, 63, 4, 1]
${greenColorDrawing}    00ff00-1
${darkBlueColorDrawing}    0000ff-1
${blueSkyColorDrawing}    4e9eff-1
${yellowColorDrawing}    ffff00-1
${redColorField}    rgba(255, 0, 0, 1)
${blackColorField}    rgba(0, 0, 0, 1)
${blueSkyColorField}    rgba(78, 158, 255, 1)
${yellowColorField}    rgba(255, 255, 0, 1)
${Normal}    0
${Linedash}    1
${brownColorElement}   //div[@class='sp-container sp-light sp-alpha-enabled sp-buttons-disabled sp-palette-buttons-disabled sp-initial-disabled']//div[@class='sp-cf sp-palette-row sp-palette-row-6']//span[2]
${darkBlueColorElement}    //div[@class='sp-container sp-light sp-alpha-enabled sp-buttons-disabled sp-palette-buttons-disabled sp-initial-disabled']//div[@class='sp-cf sp-palette-row sp-palette-row-1']//span[6]
${greenColorElement}    //div[@class='sp-container sp-light sp-alpha-enabled sp-buttons-disabled sp-palette-buttons-disabled sp-initial-disabled']//div[@class='sp-cf sp-palette-row sp-palette-row-1']//span[4]  
${yellowColorElement}    //div[@class='sp-container sp-light sp-alpha-enabled sp-buttons-disabled sp-palette-buttons-disabled sp-initial-disabled']//div[@class='sp-cf sp-palette-row sp-palette-row-1']//span[3]
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Test Cases ***

JM70-933:Verify the defaul values of the Freehand annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Freehand Annotation
    Element Annotation Should Be Selected    Freehand
    Click On Style Icon
    Verify The Background Color Of The Line Field    ${redColorField}
    Verify That The value Of The Width Field Is    1
    Verify That The Data Of The Style Field Is    Normal 
    Click On Style Icon
    Draw With Freehand Annotation    -175    130
    #Success criterion
    Verify That The Annotation Type Is    LineString    
    Verify That The Annotation Line Color Is    ${redColorDrawing}
    Verify That The Annotation stroke Width Is    1
    Verify That The Line Type Is    ${Normal} 
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
         
JM70-934:Verify the line color of the Freehand annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Freehand Annotation
    Element Annotation Should Be Selected    Freehand
    Click On Style Icon
    Choose The Color Via The Line Field    ${darkBlueColorElement}       
    Click On Style Icon
    Draw With Freehand Annotation    -175    130
    #Success criterion
    Verify That The Annotation Type Is    LineString 
    Verify That The Annotation Line Color Is    ${darkBlueColorDrawing} 
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message 
    
JM70-935:Verify the stroke width of the Freehand annotation with valid data
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Freehand Annotation
    Element Annotation Should Be Selected    Freehand
    ${myList}    Create list    1    2    5    9    10 
    :FOR    ${i}    IN    @{myList}
    \   Click On Style Icon
    \   Fill The Width Field With    ${i}
    \   Click On Style Icon
    \   Draw With Freehand Annotation    -175    130
    #Success criterion
    \   Verify That The Annotation Type Is    LineString
    \   Verify That The Annotation stroke Width Is    ${i} 
    #Return the situation to its original state
    \   Click On Delete Icon  
    \   Confirm Message
    
JM70-936:Verify the stroke width of the Freehand annotation with invalid data
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Freehand Annotation
    Element Annotation Should Be Selected    Freehand
    @{InvaldValues}    Create list    0    -1    -5    -15    -50    11    15    25    50
    @{checkedValues}    Create list    1    1    1    1    1    10    10    10    10
    ${length}    Get Length    ${InvaldValues}  
    :FOR    ${i}    IN RANGE    ${length}
    \   Click On Style Icon
    \   Fill The Width Field With    ${InvaldValues[${i}]}
    \   Click On Style Icon
    \   Draw With Freehand Annotation    -175    130
    #Success criterion
    \   Verify That The Annotation Type Is    LineString
    \   Verify That The Annotation stroke Width Is    ${checkedValues[${i}]}
    #Return the situation to its original state
    \   Click On Delete Icon  
    \   Confirm Message
    \   Verify That The Drawn Annotation Is Erased
       
JM70-937:Verify the line type of the freehand annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Freehand Annotation
    Element Annotation Should Be Selected    Freehand
    @{myList}    Create list    Normal    Line dash 
    @{myCheckList}    Create list    ${Normal}    ${Linedash} 
    :FOR    ${i}    IN RANGE    0    2   
    \    Click On Style Icon
    \    Select The Data in the Style drop-down list    ${myList[${i}]}    
    \    Click On Style Icon
    \    Draw With Freehand Annotation    -175    130
    #Success criterion
    \    Verify That The Annotation Type Is    LineString
    \    Verify That The Line Type Is    ${myCheckList[${i}]}
    #Return the situation to its original state
    \    Click On Delete Icon
    \    Confirm Message
     
JM70-938:Verify the default values of the text annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Text Annotation
    Element Annotation Should Be Selected    Text
    Click On Style Icon
    Verify The Background Color Of The Text Field    ${blackColorField}
    Verify The Data Of The Font Size Field    20
    The Bold CheckBox Should Not Be Selected
    The Italic CheckBox Should Not Be Selected
    Click On Style Icon
    Double Click On The Map At Coordinates    -175   130
    Verify Text Annotation Field Is Exist
    Create annotation with text     Argentina
    #Success criterion
    Verify That The Annotation Type Is     Text
    Verify That The Annotation Text Color Is    ${blackColorDrawing}
    Verify That The Annotation Text Is   Argentina
    Verify That The Annotation Text Bold Is    False
    Verify That The Annotation Text Italic Is    False
    Verify That The Annotation Text Rotation Is    0
    Verify That The Annotation Text Font Size Is    20   
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message 
    
JM70-939:Verify the text color of the Text annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Text Annotation
    Element Annotation Should Be Selected    Text
    Click On Style Icon
    Choose The Color Via The Text Field    ${brownColorElement}
    Click On Style Icon
    Double Click On The Map At Coordinates    -175   130
    Create annotation with text     Argentina
    #Success criterion
    Verify That The Annotation Type Is     Text
    Verify That The Annotation Text Is   Argentina
    Verify That The Annotation Text Color Is    ${brownColorDrawing}
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message 
    
JM70-940:Verify the font size of the Text annotation with valid data
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Text Annotation
    Element Annotation Should Be Selected    Text
    ${myList}    Create list    10    11    15    19    21    25    35    39    40 
    :FOR    ${i}    IN    @{myList}
    \   Click On Style Icon
    \   Fill The Font Size Field With    ${i}
    \   Click On Style Icon
    \   Double Click On The Map At Coordinates    -175   130
    \   Create annotation with text     Argentina
    #Success criterion
    \   Verify That The Annotation Type Is     Text
    \   Verify That The Annotation Text Is   Argentina 
    \   Verify That The Annotation Text Font Size Is    ${i}
    #Return the situation to its original state
    \    Click On Delete Icon  
    \    Confirm Message

JM70-941:Verify the font size of the Text annotation with invalid data 
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Text Annotation
    Element Annotation Should Be Selected    Text
    @{InvaldValues}    Create list    9    5    0    -1    -10    -30    41    45    50    70    90 
    @{checkedValues}    Create list    10    10    10    10    10    10    40    40    40    40    40
    ${length}    Get Length    ${InvaldValues}
    :FOR    ${i}    IN RANGE    ${length}
    \   Click On Style Icon
    \   Fill The Font Size Field With    ${InvaldValues[${i}]}
    \   Click On Style Icon
    \   Double Click On The Map At Coordinates    -175   130
    \   Create annotation with text     Argentina
    #Success criterion
    \   Verify That The Annotation Type Is     Text
    \   Verify That The Annotation Text Is   Argentina 
    \   Verify That The Annotation Text Font Size Is    ${checkedValues[${i}]}
    #Return the situation to its original state
    \    Click On Delete Icon  
    \    Confirm Message
    \    Verify That The Drawn Annotation Is Erased
     
JM70-942:Verify the text Bold of the Text annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Text Annotation
    Element Annotation Should Be Selected    Text       
    Click On Style Icon
    Click On The Bold Checkbox
    The Bold CheckBox Should Be Selected
    Click On Style Icon
    Double Click On The Map At Coordinates    -175   130
    Create annotation with text     Argentina
    #Success criterion
    Verify That The Annotation Type Is     Text
    Verify That The Annotation Text Bold Is    True 
    #Return the situation to its original state
    Click On Delete Icon  
    Confirm Message
    
JM70-943:Verify the text Italic of the Text annotation 
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Text Annotation
    Element Annotation Should Be Selected    Text       
    Click On Style Icon
    Click On The Italic Checkbox
    The Italic CheckBox Should Be Selected
    Click On Style Icon
    Double Click On The Map At Coordinates    -175   130
    Create annotation with text     Argentina
    #Success criterion
    Verify That The Annotation Type Is     Text
    Verify That The Annotation Text Italic Is    True 
    #Return the situation to its original state
    Click On Delete Icon  
    Confirm Message
    
JM70-944:Verify the default values for point annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Point Annotation
    Element Annotation Should Be Selected    Point
    Click On Style Icon
    Verify The Background Color Of The Line Field    ${redColorField}
    Verify The Background Color Of The Fill Field    ${blueSkyColorField}
    Click On Style Icon       
    Draw With Point Annotation    -175   130
    #Success criterion
    Verify That The Annotation Type Is    Point
    Verify That The Annotation Line Color Is    ${redColorDrawing} 
    Verify That The Annotation Fill Color Is    ${blueSkyColorDrawing}
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message 
    
JM70-945:Verify the line color for Point annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Point Annotation
    Element Annotation Should Be Selected    Point
    Click On Style Icon
    Choose The Color Via The Line Field    ${darkBlueColorElement}       
    Click On Style Icon
    Draw With Point Annotation    -175    130
    #Success criterion
    Verify That The Annotation Type Is    Point
    Verify That The Annotation Line Color Is    ${darkBlueColorDrawing}
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-946:Verify the Fill color of the Point annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Point Annotation
    Element Annotation Should Be Selected    Point
    Click On Style Icon
    Choose The Color Via The Fill Field    ${yellowColorElement}
    Verify The Background Color Of The Fill Field    ${yellowColorField}       
    Click On Style Icon
    Draw With Point Annotation    -175    130
    #Success criterion
    Verify That The Annotation Type Is    Point
    Verify That The Annotation Fill Color Is    ${yellowColorDrawing}   
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-947:Verify the defaul values of the Line annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Line Annotation
    Element Annotation Should Be Selected    Line
    Click On Style Icon
    Verify The Background Color Of The Line Field    ${redColorField}
    Verify that The value Of The Width Field Is    1
    Verify That The Data Of The Style Field Is    Normal 
    Click On Style Icon
    Draw With Line Annotation
    #Success criterion
    Verify That The Annotation Type Is    LineString    
    Verify That The Annotation Line Color Is    ${redColorDrawing}
    Verify That The Annotation stroke Width Is    1
    Verify That The Line Type Is    ${Normal} 
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message 
    
JM70-948:Verify the line color of the Line annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Line Annotation
    Element Annotation Should Be Selected    Line
    Click On Style Icon
    Choose The Color Via The Line Field    ${darkBlueColorElement}       
    Click On Style Icon
    Draw With Line Annotation
    #Success criterion
    Verify That The Annotation Type Is    LineString 
    Verify That The Annotation Line Color Is    ${darkBlueColorDrawing} 
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message 
    
JM70-949:Verify the stroke width of the Line annotation with valid data
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Line Annotation
    Element Annotation Should Be Selected    Line
    ${myList}    Create list    1    2    5    9    10 
    :FOR    ${i}    IN    @{myList}
    \   Click On Style Icon
    \   Fill The Width Field With    ${i}  
    \   Click On Style Icon
    \   Draw With Line Annotation
    #Success criterion
    \   Verify That The Annotation Type Is    LineString
    \   Verify That The Annotation stroke Width Is    ${i} 
    #Return the situation to its original state
    \   Click On Delete Icon  
    \   Confirm Message
    
JM70-950:Verify the stroke width of the Line annotation with invalid data
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Line Annotation
    Element Annotation Should Be Selected    Line
    @{InvaldValues}    Create list    0    -1    -5    -15    -50    11    15    25    50
    @{checkedValues}    Create list    1    1    1    1    1    10    10    10    10
    ${length}    Get Length    ${InvaldValues} 
    :FOR    ${i}    IN RANGE    ${length}
    \   Click On Style Icon
    \   Fill The Width Field With    ${InvaldValues[${i}]}
    \   Click On Style Icon
    \   Draw With Line Annotation
    #Success criterion
    \   Verify That The Annotation Type Is    LineString
    \   Verify That The Annotation stroke Width Is    ${checkedValues[${i}]} 
    #Return the situation to its original state
    \   Click On Delete Icon  
    \   Confirm Message
    \   Verify That The Drawn Annotation Is Erased
    
JM70-951:Verify the line type of the line annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Line Annotation
    Element Annotation Should Be Selected    Line
    @{myList}    Create list    Normal    Line dash 
    @{myCheckList}    Create list    ${Normal}    ${Linedash} 
    :FOR    ${i}    IN RANGE    0    2   
    \    Click On Style Icon
    \    Select The Data in the Style drop-down list    ${myList[${i}]}    
    \    Click On Style Icon
    \    Draw With Line Annotation
    #Success criterion
    \    Verify That The Annotation Type Is    LineString
    \    Verify That The Line Type Is    ${myCheckList[${i}]}
    #Return the situation to its original state
    \    Click On Delete Icon
    \    Confirm Message 
    
JM70-952:Verify the default values of the Rectangle annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Rectangle Annotation
    Element Annotation Should Be Selected    Rectangle
    Click On Style Icon
    Verify The Background Color Of The Line Field    ${redColorField}
    Verify The Background Color Of The Fill Field    ${blueSkyColorField}
    Verify that The value Of The Width Field Is    1
    Verify That The Data Of The Style Field Is    Normal 
    Click On Style Icon
    Draw With Rectangle Annotation
    #Success criterion
    Verify That The Annotation Type Is    Rectangle    
    Verify That The Annotation Line Color Is    ${redColorDrawing}
    Verify That The Annotation Fill Color Is    ${blueSkyColorDrawing}
    Verify That The Annotation stroke Width Is    1
    Verify That The Line Type Is    ${Normal}
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message 
    
JM70-953:Verify the Line color of the Rectangle annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Rectangle Annotation
    Element Annotation Should Be Selected    Rectangle
    Click On Style Icon
    Choose The Color Via The Line Field    ${darkBlueColorElement}       
    Click On Style Icon
    Draw With Rectangle Annotation
    #Success criterion
    Verify That The Annotation Type Is    Rectangle 
    Verify That The Annotation Line Color Is    ${darkBlueColorDrawing} 
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message 
    
JM70-954:Verify the Fill color of the Rectangle annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Rectangle Annotation
    Element Annotation Should Be Selected    Rectangle
    Click On Style Icon
    Choose The Color Via The Fill Field    ${yellowColorElement} 
    Click On Style Icon
    Draw With Rectangle Annotation
    #Success criterion
    Verify That The Annotation Type Is    Rectangle 
    Verify That The Annotation Fill Color Is    ${yellowColorDrawing}
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-955:Verify the stroke width of the Rectangle annotation with valid data
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Rectangle Annotation
    Element Annotation Should Be Selected    Rectangle
    ${myList}    Create list    1    2    5    9    10 
    :FOR    ${i}    IN    @{myList}
    \   Click On Style Icon
    \   Fill The Width Field With    ${i}
    \   Click On Style Icon
    \   Draw With Rectangle Annotation
    #Success criterion
    \   Verify That The Annotation Type Is    Rectangle
    \   Verify That The Annotation stroke Width Is    ${i} 
    #Return the situation to its original state
    \   Click On Delete Icon  
    \   Confirm Message
    
JM70-956:Verify the stroke width of the Rectangle annotation with invalid data
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Rectangle Annotation
    Element Annotation Should Be Selected    Rectangle
    @{InvaldValues}    Create list    0    -1    -5    -15    -50    11    15    25    50
    @{checkedValues}    Create list    1    1    1    1    1    10    10    10    10
    ${length}    Get Length    ${InvaldValues} 
    :FOR    ${i}    IN RANGE   ${length}
    \   Click On Style Icon
    \   Fill The Width Field With    ${InvaldValues[${i}]}
    \   Click On Style Icon
    \   Draw With Rectangle Annotation
    #Success criterion
    \   Verify That The Annotation Type Is    Rectangle
    \   Verify That The Annotation stroke Width Is    ${checkedValues[${i}]} 
    #Return the situation to its original state
    \   Click On Delete Icon  
    \   Confirm Message
    \   Verify That The Drawn Annotation Is Erased
    
JM70-957:Verify the line type of the Rectangle annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Rectangle Annotation
    Element Annotation Should Be Selected    Rectangle
    @{myList}    Create list    Normal    Line dash 
    @{myCheckList}    Create list    ${Normal}    ${Linedash} 
    :FOR    ${i}    IN RANGE    0    2   
    \    Click On Style Icon
    \    Select The Data in the Style drop-down list    ${myList[${i}]}    
    \    Click On Style Icon
    \    Draw With Rectangle Annotation
    #Success criterion
    \    Verify That The Annotation Type Is    Rectangle
    \    Verify That The Line Type Is    ${myCheckList[${i}]}
    #Return the situation to its original state
    \    Click On Delete Icon
    \    Confirm Message 
    
JM70-958:Verify the default values of the Polygon annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Polygon Annotation
    Element Annotation Should Be Selected    Polygon
    Click On Style Icon
    Verify The Background Color Of The Line Field    ${redColorField}
    Verify The Background Color Of The Fill Field    ${blueSkyColorField}
    Verify that The value Of The Width Field Is    1
    Verify That The Data Of The Style Field Is    Normal 
    Click On Style Icon
    Draw With Polygon Annotation
    #Success criterion
    Verify That The Annotation Type Is    Polygon    
    Verify That The Annotation Line Color Is    ${redColorDrawing}
    Verify That The Annotation Fill Color Is    ${blueSkyColorDrawing}
    Verify That The Annotation stroke Width Is    1
    Verify That The Line Type Is    ${Normal}
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message 
    
JM70-959:Verify the Line color of the Polygon annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Polygon Annotation
    Element Annotation Should Be Selected    Polygon
    Click On Style Icon
    Choose The Color Via The Line Field    ${darkBlueColorElement}       
    Click On Style Icon
    Draw With Polygon Annotation
    #Success criterion
    Verify That The Annotation Type Is    Polygon 
    Verify That The Annotation Line Color Is    ${darkBlueColorDrawing} 
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-960:Verify the Fill color of the Polygon annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Polygon Annotation
    Element Annotation Should Be Selected    Polygon
    Click On Style Icon
    Choose The Color Via The Fill Field    ${yellowColorElement} 
    Click On Style Icon
    Draw With Polygon Annotation
    #Success criterion
    Verify That The Annotation Type Is    Polygon 
    Verify That The Annotation Fill Color Is    ${yellowColorDrawing}
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message 
     
JM70-961:Verify the stroke width of the Polygon annotation with valid data
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Polygon Annotation
    Element Annotation Should Be Selected    Polygon
    ${myList}    Create list    1    2    5    9    10 
    :FOR    ${i}    IN    @{myList}
    \   Click On Style Icon
    \   Fill The Width Field With    ${i}
    \   Click On Style Icon
    \   Draw With Polygon Annotation
    #Success criterion
    \   Verify That The Annotation Type Is    Polygon
    \   Verify That The Annotation stroke Width Is    ${i} 
    #Return the situation to its original state
    \   Click On Delete Icon  
    \   Confirm Message 
      
JM70-962:Verify the stroke width of the Polygon annotation with invalid data
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Polygon Annotation
    Element Annotation Should Be Selected    Polygon
    @{InvaldValues}    Create list    0    -1    -5    -15    -50    11    15    25    50
    @{checkedValues}    Create list    1    1    1    1    1    10    10    10    10
    ${length}    Get Length    ${InvaldValues} 
    :FOR    ${i}    IN RANGE   ${length}
    \   Click On Style Icon
    \   Fill The Width Field With    ${InvaldValues[${i}]}
    \   Click On Style Icon
    \   Draw With Polygon Annotation
    #Success criterion
    \   Verify That The Annotation Type Is    Polygon
    \   Verify That The Annotation stroke Width Is    ${checkedValues[${i}]} 
    #Return the situation to its original state
    \   Click On Delete Icon  
    \   Confirm Message 
    \   Verify That The Drawn Annotation Is Erased
    
JM70-963:Verify the line type of the Polygon annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Polygon Annotation
    Element Annotation Should Be Selected    Polygon
    @{myList}    Create list    Normal    Line dash 
    @{myCheckList}    Create list    ${Normal}    ${Linedash} 
    :FOR    ${i}    IN RANGE    0    2   
    \    Click On Style Icon
    \    Select The Data in the Style drop-down list    ${myList[${i}]}    
    \    Click On Style Icon
    \    Draw With Polygon Annotation
    #Success criterion
    \    Verify That The Annotation Type Is    Polygon
    \    Verify That The Line Type Is    ${myCheckList[${i}]}
    #Return the situation to its original state
    \    Click On Delete Icon
    \    Confirm Message
       
JM70-964:Verify the default values of the Circle annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Circle Annotation
    Element Annotation Should Be Selected    Circle
    Click On Style Icon
    Verify The Background Color Of The Line Field    ${redColorField}
    Verify The Background Color Of The Fill Field    ${blueSkyColorField}
    Verify that The value Of The Width Field Is    1
    Verify That The Data Of The Style Field Is    Normal 
    Click On Style Icon
    Draw With Circle Annotation
    #Success criterion
    Verify That The Annotation Type Is    Circle    
    Verify That The Annotation Line Color Is    ${redColorDrawing}
    Verify That The Annotation Fill Color Is    ${blueSkyColorDrawing}
    Verify That The Annotation stroke Width Is    1
    Verify That The Line Type Is    ${Normal}
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-965:Verify the Line color of the Circle annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Circle Annotation
    Element Annotation Should Be Selected    Circle
    Click On Style Icon
    Choose The Color Via The Line Field    ${darkBlueColorElement}       
    Click On Style Icon
    Draw With Circle Annotation
    #Success criterion
    Verify That The Annotation Type Is    Circle 
    Verify That The Annotation Line Color Is    ${darkBlueColorDrawing} 
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message  
     
JM70-966:Verify the Fill color of the Circle annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Circle Annotation
    Element Annotation Should Be Selected    Circle
    Click On Style Icon
    Choose The Color Via The Fill Field    ${yellowColorElement} 
    Click On Style Icon
    Draw With Circle Annotation
    #Success criterion
    Verify That The Annotation Type Is    Circle 
    Verify That The Annotation Fill Color Is    ${yellowColorDrawing}
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message 
    
JM70-967:Verify the stroke width of the Circle annotation with valid data
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Circle Annotation
    Element Annotation Should Be Selected    Circle
    ${myList}    Create list    1    2    5    9    10 
    :FOR    ${i}    IN    @{myList}
    \   Click On Style Icon
    \   Fill The Width Field With    ${i}
    \   Click On Style Icon
    \   Draw With Circle Annotation
    #Success criterion
    \   Verify That The Annotation Type Is    Circle
    \   Verify That The Annotation stroke Width Is    ${i} 
    #Return the situation to its original state
    \   Click On Delete Icon  
    \   Confirm Message 
    
JM70-968:Verify the stroke width of the Circle annotation with invalid data
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Circle Annotation
    Element Annotation Should Be Selected    Circle
    @{InvaldValues}    Create list    0    -1    -5    -15    -50    11    15    25    50
    @{checkedValues}    Create list    1    1    1    1    1    10    10    10    10
    ${length}    Get Length    ${InvaldValues} 
    :FOR    ${i}    IN RANGE   ${length}
    \   Click On Style Icon
    \   Fill The Width Field With    ${InvaldValues[${i}]}
    \   Click On Style Icon
    \   Draw With Circle Annotation
    #Success criterion
    \   Verify That The Annotation Type Is    Circle
    \   Verify That The Annotation stroke Width Is    ${checkedValues[${i}]} 
    #Return the situation to its original state
    \   Click On Delete Icon  
    \   Confirm Message
    \   Verify That The Drawn Annotation Is Erased
    
JM70-969:Verify the line type of the Circle annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Circle Annotation
    Element Annotation Should Be Selected    Circle
    @{myList}    Create list    Normal    Line dash 
    @{myCheckList}    Create list    ${Normal}    ${Linedash} 
    :FOR    ${i}    IN RANGE    0    2   
    \    Click On Style Icon
    \    Select The Data in the Style drop-down list    ${myList[${i}]}    
    \    Click On Style Icon
    \    Draw With Circle Annotation
    #Success criterion
    \    Verify That The Annotation Type Is    Circle
    \    Verify That The Line Type Is    ${myCheckList[${i}]}
    #Return the situation to its original state
    \    Click On Delete Icon
    \    Confirm Message
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Keywords ***
