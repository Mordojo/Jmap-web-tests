*** Settings ***

Documentation     Edit Style Annotation Test cases
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Library    String
Library    OperatingSystem
Library    SeleniumLibrary    run_on_failure=No Operation   
Library    Dialogs
Library    BuiltIn
Library    DateTime
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Resource    ../../../../common/admin/CommonKeywords.robot
Resource    ../../../../common/CommonLogin.robot 
Resource    ../../../../common/jmapWeb/CommonAnnotationWeb.robot
Resource    ../../../../common/jmapWeb/CommonWeb.robot
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Test Setup   Run Keywords    
             ...    Open Browser On JMap Web    ${URLWebApp}    ${RESOLUTION_X}    ${RESOLUTION_Y}    AND
             ...    Login To JMap Web    ${UserName}    ${Password}
Test Teardown    LogOut
Metadata    author    Mordjane Boussad
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Variable ***
${redColorDrawing}    ff0000-1
${blackColorDrawing}    [0, 0, 0, 1]
${greenColorDrawing}    [0, 255, 0, 1]
${brownColorDrawing}    [120, 63, 4, 1]
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
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Test Cases ***

JM70-970:Modify the line color of the Freehand annotation
    Draw a Freehand Annotation With Coordinates    -175    130
    Verify That The Annotation line Color Is    ${redColorDrawing}
    Click On Selection Icon
    Select The Drawing Tool Freehand Annotation    -175    130
    Click On Style Icon
    Choose The Color Via The Line Field    ${darkBlueColorElement}
    Click On Style Icon
    Click On The Map At Coordinates    150    30 
    #Success criterion
    Verify That The Annotation Type Is    LineString
    Verify That The Annotation line Color Is    ${darkBlueColorDrawing}
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-971:Modify the stroke width of the Freehand annotation with valid data
    Draw a Freehand Annotation With Coordinates    -175    130
    Verify That The Annotation stroke Width Is    1
    Click On Selection Icon
    ${myList}    Create list    2    5    9    10 
    :FOR    ${i}    IN    @{myList}
    \   Select The Drawing Tool Freehand Annotation    -175    130
    \   Click On Style Icon
    \   Fill The Width Field With    ${i}
    \   Verify That The Value Of The Width Field Is    ${i}
    \   Click On Style Icon
    \   Click On The Map At Coordinates    150    30
    #Success criterion
    \   Verify That The Annotation Type Is    LineString
    \   Verify That The Annotation stroke Width Is    ${i} 
    #Return the situation to its original state
    Click On Delete Icon  
    Confirm Message
    
JM70-972:Modify the stroke width of the Freehand annotation with invalid data
    Draw a Freehand Annotation With Coordinates    -175    130
    Verify That The Annotation stroke Width Is    1
    Click On Selection Icon
    @{InvaldValues}    Create list    0    -1    -5    -15    -50    11    15    25    50
    @{checkedValues}    Create list    1    1    1    1    1    10    10    10    10
    ${length}    Get Length    ${InvaldValues}
    :FOR    ${i}    IN RANGE   ${length}
    \   Select The Drawing Tool Freehand Annotation    -175    130
    \   Verify That The Drawn Annotation Is Selected
    \   Click On Style Icon
    \   Fill The Width Field With    ${InvaldValues[${i}]}
    \   Verify That The Value Of The Width Field Is    ${InvaldValues[${i}]}
    \   Click On Style Icon
    \   Click On The Map At Coordinates    150    30
    #Success criterion
    \   Verify That The Annotation Type Is    LineString
    \   Verify That The Annotation stroke Width Is    ${checkedValues[${i}]} 
    #Return the situation to its original state
    Click On Delete Icon  
    Confirm Message 
    
JM70-973:Modify the line style of the freehand annotation   
    Draw a Freehand Annotation With Coordinates    -175    130
    Verify That The Line Type Is    ${Normal}
    Click On Selection Icon
    @{myList}    Create list    Line dash    Normal 
    @{myCheckList}    Create list    ${Linedash}    ${Normal} 
    :FOR    ${i}    IN RANGE    0    2 
    \   Select The Drawing Tool Freehand Annotation    -130    96
    \   Click On Style Icon
    \   Select The Data in the Style drop-down list    ${myList[${i}]}
    \   Click On Style Icon
    \   Click On The Map At Coordinates    150    30
    #Success criterion
    \   Verify That The Annotation Type Is    LineString
    \   Verify That The Line Type Is    ${myCheckList[${i}]} 
    #Return the situation to its original state
    Click On Delete Icon  
    Confirm Message
    
 JM70-974:Modify the text color of the text annotation   
    Draw a Text Annotation With Text And Coordinates    Argentina    -175    130
    Verify The Background Color Of The Text Field    ${blackColorField} 
    Click On Selection Icon
    Select The Drawing Tool Text Annotation    -175    130
    Click On Style Icon
    Choose The Color Via The Text Field    ${greenColorElement}
    Click On Style Icon
    Click On The Map At Coordinates    150    30 
    #Success criterion
    Verify That The Annotation Type Is    Text
    Verify That The Annotation Text Color Is    ${greenColorDrawing}
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
 JM70-975:Modify the font size of the text annotation with valid data   
    Draw a Text Annotation With Text And Coordinates    Argentina    -175    130
    Verify That The Annotation Text Font Size Is    20 
    Click On Selection Icon
    ${myList}    Create list    10    11    15    19    21    25    35    39    40 
    :FOR    ${i}    IN    @{myList}
    \   Select The Drawing Tool Text Annotation    -172    130
    \   Click On Style Icon
    \   Fill The Font Size Field With    ${i}
    \   Verify The Data Of The Font Size Field    ${i} 
    \   Click On Style Icon
    \   Click On The Map At Coordinates    150    30
    \   Sleep    2s    
    #Success criterion
    \   Verify That The Annotation Type Is    Text
    \   Verify That The Annotation Text Font Size Is    ${i}
    #Return the situation to its original state
    Click On Delete Icon  
    Confirm Message
    
JM70-976:Modify the font size of the text annotation with invalid data    #Update it in Testlink  
    Draw a Text Annotation With Text And Coordinates    Argentina    -175    130
    Verify That The Annotation Text Font Size Is    20 
    Click On Selection Icon
    @{InvaldValues}    Create list    9    5    0    -1    -10    -30    41    45    50    70    90 
    @{checkedValues}    Create list    10    10    10    10    10    10    40    40    40    40    40
    ${length}    Get Length    ${InvaldValues}
    :FOR    ${i}    IN RANGE   ${length}
    \   Select The Drawing Tool Text Annotation    -172    130
    \   Verify That The Drawn Annotation Is Selected
    \   Click On Style Icon
    \   Fill The Font Size Field With    ${InvaldValues[${i}]}
    \   Verify The Data Of The Font Size Field    ${InvaldValues[${i}]} 
    \   Click On Style Icon
    \   Click On The Map At Coordinates    150    30
    \   Sleep    2s    
    #Success criterion
    \   Verify That The Annotation Type Is    Text
    \   Verify That The Annotation Text Font Size Is    ${checkedValues[${i}]}
    #Return the situation to its original state
    Click On Delete Icon  
    Confirm Message
     
JM70-977:Enable/Disable Bold option
    Draw a Text Annotation With Text And Coordinates    Argentina    -175    130
    Verify That The Annotation Text Bold Is    False 
    Click On Selection Icon
    @{myCheckList}    Create list    True    False 
    :FOR    ${i}    IN RANGE    0    2 
    \    Select The Drawing Tool Text Annotation    -175    130
    \    Click On Style Icon
    \    Click On The Bold Checkbox
    \    Click On Style Icon
    \    Click On The Map At Coordinates    150    30
    #Success criterion
    \    Verify That The Annotation Type Is    Text
    \    Verify That The Annotation Text Bold Is    ${myCheckList[${i}]}
    #Return the situation to its original state
    Click On Delete Icon  
    Confirm Message
    
JM70-978:Enable/Disable Italic option
    Draw a Text Annotation With Text And Coordinates    Argentina    -175    130
    Verify That The Annotation Text Italic Is    False 
    Click On Selection Icon
    @{myCheckList}    Create list    True    False 
    :FOR    ${i}    IN RANGE    0    2 
    \    Select The Drawing Tool Text Annotation    -175    130
    \    Click On Style Icon
    \    Click On The Italic Checkbox
    \    Click On Style Icon
    \    Click On The Map At Coordinates    150    30
    #Success criterion
    \    Verify That The Annotation Type Is    Text
    \    Verify That The Annotation Text Italic Is    ${myCheckList[${i}]}
    #Return the situation to its original state
    Click On Delete Icon  
    Confirm Message
    
 JM70-979:Modify the line color of the Point annotation
    Draw a Point Annotation With Coordinates    -175    130
    Verify That The Annotation line Color Is    ${redColorDrawing}
    Click On Selection Icon
    Select The Drawing Tool Point Annotation    -175    130
    Click On Style Icon
    Choose The Color Via The Line Field    ${darkBlueColorElement}
    Click On Style Icon
    Click On The Map At Coordinates    150    30 
    #Success criterion
    Verify That The Annotation Type Is    Point
    Verify That The Annotation Line Color Is    ${darkBlueColorDrawing}
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
     
 JM70-980:Modify the fill color of the Point annotation
    Draw a Point Annotation With Coordinates    -175    130
    Verify That The Annotation Fill Color Is    ${blueSkyColorDrawing}
    Click On Selection Icon
    Select The Drawing Tool Point Annotation    -175    130
    Click On Style Icon
    Choose The Color Via The Fill Field    ${yellowColorElement}
    Click On Style Icon
    Click On The Map At Coordinates    150    30 
    #Success criterion
    Verify That The Annotation Type Is    Point
    Verify That The Annotation Fill Color Is    ${yellowColorDrawing}
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message 
      
JM70-981:Modify the line color of the Line annotation
    Draw a Line Annotation
    Verify That The Annotation line Color Is    ${redColorDrawing}
    Click On Selection Icon
    Select The Drawing Tool Line Annotation    -175    130
    Click On Style Icon
    Choose The Color Via The Line Field    ${darkBlueColorElement}
    Click On Style Icon
    Click On The Map At Coordinates    150    30 
    #Success criterion
    Verify That The Annotation Type Is    LineString
    Verify That The Annotation line Color Is    ${darkBlueColorDrawing}
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message 
      
JM70-982:Modify the stroke width of the Line annotation with valid data
    Draw a Line Annotation
    Verify That The Annotation stroke Width Is    1
    Click On Selection Icon
    ${myList}    Create list    2    5    9    10 
    :FOR    ${i}    IN    @{myList}
    \   Select The Drawing Tool Line Annotation    -175    130
    \   Click On Style Icon
    \   Fill The Width Field With    ${i}
    \   Verify That The Value Of The Width Field Is    ${i}
    \   Click On Style Icon
    \   Click On The Map At Coordinates    150    30
    #Success criterion
    \   Verify That The Annotation Type Is    LineString
    \   Verify That The Annotation stroke Width Is    ${i} 
    #Return the situation to its original state
    Click On Delete Icon  
    Confirm Message 
     
JM70-983:Modify the stroke width of the Line annotation with invalid data    #Update it in Testlink  
    Draw a Line Annotation
    Verify That The Annotation stroke Width Is    1
    Click On Selection Icon
    @{InvaldValues}    Create list    0    -1    -5    -15    -50    11    15    25    50
    @{checkedValues}    Create list    1    1    1    1    1    10    10    10    10
    ${length}    Get Length    ${InvaldValues}  
    :FOR    ${i}    IN RANGE    ${length}
    \   Select The Drawing Tool Line Annotation    -175    130
    \   Verify That The Drawn Annotation Is Selected
    \   Click On Style Icon
    \   Fill The Width Field With    ${InvaldValues[${i}]}
    \   Verify That The value Of The Width Field Is    ${InvaldValues[${i}]}
    \   Click On Style Icon
    \   Click On The Map At Coordinates    150    30
    #Success criterion
    \   Verify That The Annotation Type Is    LineString
    \   Verify That The Annotation stroke Width Is    ${checkedValues[${i}]} 
    #Return the situation to its original state
    Click On Delete Icon  
    Confirm Message
      
JM70-984:Modify the line style of the Line annotation   
    Draw a Line Annotation
    Verify That The Line Type Is    ${Normal} 
    Click On Selection Icon
    @{myList}    Create list    Line dash    Normal 
    @{myCheckList}    Create list    ${Linedash}    ${Normal} 
    :FOR    ${i}    IN RANGE    0    2 
    \   Select The Drawing Tool Line Annotation    -175    130
    \   Click On Style Icon
    \   Select The Data in the Style drop-down list    ${myList[${i}]}
    \   Click On Style Icon
    \   Click On The Map At Coordinates    150    30
    #Success criterion
    \   Verify That The Annotation Type Is    LineString
    \   Verify That The Line Type Is    ${myCheckList[${i}]} 
    #Return the situation to its original state
    Click On Delete Icon  
    Confirm Message
    
JM70-985:Modify the line color of the Rectangle annotation
    Draw a Rectangle Annotation
    Verify That The Annotation line Color Is    ${redColorDrawing}
    Click On Selection Icon
    Select The Drawing Tool Rectangle Annotation    0   -20
    Click On Style Icon
    Choose The Color Via The Line Field    ${darkBlueColorElement}
    Click On Style Icon
    Click On The Map At Coordinates    150    30 
    #Success criterion
    Verify That The Annotation Type Is    Rectangle
    Verify That The Annotation line Color Is    ${darkBlueColorDrawing}
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message 
       
JM70-986:Modify the fill color of the Rectangle annotation
    Draw a Rectangle Annotation
    Verify That The Annotation Fill Color Is    ${blueSkyColorDrawing}
    Click On Selection Icon
    Select The Drawing Tool Rectangle Annotation    0    -20
    Click On Style Icon
    Choose The Color Via The Fill Field    ${yellowColorElement}
    Click On Style Icon
    Click On The Map At Coordinates    150    30 
    #Success criterion
    Verify That The Annotation Type Is    Rectangle
    Verify That The Annotation Fill Color Is    ${yellowColorDrawing}
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-987:Modify the stroke width of the Rectangle annotation with valid data
    Draw a Rectangle Annotation
    Verify That The Annotation stroke Width Is    1
    Click On Selection Icon
    ${myList}    Create list    2    5    9    10 
    :FOR    ${i}    IN    @{myList}
    \   Select The Drawing Tool Rectangle Annotation    0    -20
    \   Click On Style Icon
    \   Fill The Width Field With    ${i}
    \   Verify That The Value Of The Width Field Is    ${i}
    \   Click On Style Icon
    \   Click On The Map At Coordinates    150    30
    #Success criterion
    \   Verify That The Annotation Type Is    Rectangle
    \   Verify That The Annotation stroke Width Is    ${i} 
    #Return the situation to its original state
    Click On Delete Icon  
    Confirm Message
        
JM70-988:Modify the stroke width of the Rectangle annotation with invalid data    #Update it in Testlink  
    Draw a Rectangle Annotation
    Verify That The Annotation stroke Width Is    1
    Click On Selection Icon
    @{InvaldValues}    Create list    0    -1    -5    -15    -50    11    15    25    50
    @{checkedValues}    Create list    1    1    1    1    1    10    10    10    10
    ${length}    Get Length    ${InvaldValues}  
    :FOR    ${i}    IN RANGE    ${length}
    \   Select The Drawing Tool Rectangle Annotation    0    -20
    \   Click On Style Icon
    \   Fill The Width Field With    ${InvaldValues[${i}]}
    \   Verify That The Value Of The Width Field Is    ${InvaldValues[${i}]}
    \   Click On Style Icon
    \   Click On The Map At Coordinates    150    30
    #Success criterion
    \   Verify That The Annotation Type Is    Rectangle
    \   Verify That The Annotation stroke Width Is    ${checkedValues[${i}]} 
    #Return the situation to its original state
    Click On Delete Icon  
    Confirm Message
      
JM70-989:Modify the line style of the Rectangle annotation   
    Draw a Rectangle Annotation
    Verify That The Line Type Is    ${Normal} 
    Click On Selection Icon
    @{myList}    Create list    Line dash    Normal 
    @{myCheckList}    Create list    ${Linedash}    ${Normal} 
    :FOR    ${i}    IN RANGE    0    2 
    \   Select The Drawing Tool Rectangle Annotation    0    -20
    \   Click On Style Icon
    \   Select The Data in the Style drop-down list    ${myList[${i}]}
    \   Click On Style Icon
    \   Click On The Map At Coordinates    150    30
    #Success criterion
    \   Verify That The Annotation Type Is    Rectangle
    \   Verify That The Line Type Is    ${myCheckList[${i}]} 
    #Return the situation to its original state
    Click On Delete Icon  
    Confirm Message 
       
JM70-990:Modify the line color of the Polygon annotation
    Draw a Polygon Annotation
    Verify That The Annotation line Color Is    ${redColorDrawing}
    Click On Selection Icon
    Select The Drawing Tool Polygon Annotation    0   -20
    Click On Style Icon
    Choose The Color Via The Line Field    ${darkBlueColorElement}
    Click On Style Icon
    Click On The Map At Coordinates    150    30 
    #Success criterion
    Verify That The Annotation Type Is    Polygon
    Verify That The Annotation line Color Is    ${darkBlueColorDrawing}
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
        
JM70-991:Modify the fill color of the Polygon annotation
    Draw a Polygon Annotation
    Verify That The Annotation Fill Color Is    ${blueSkyColorDrawing}
    Click On Selection Icon
    Select The Drawing Tool Polygon Annotation    0    -20
    Click On Style Icon
    Choose The Color Via The Fill Field    ${yellowColorElement}
    Click On Style Icon
    Click On The Map At Coordinates    150    30 
    #Success criterion
    Verify That The Annotation Type Is    Polygon
    Verify That The Annotation Fill Color Is    ${yellowColorDrawing}
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-992:Modify the stroke width of the Polygon annotation with valid data
    Draw a Polygon Annotation
    Verify That The Annotation stroke Width Is    1
    Click On Selection Icon
    ${myList}    Create list    2    5    9    10 
    :FOR    ${i}    IN    @{myList}
    \   Select The Drawing Tool Polygon Annotation    0    -20
    \   Click On Style Icon
    \   Fill The Width Field With    ${i}
    \   Verify That The Value Of The Width Field Is    ${i}
    \   Click On Style Icon
    \   Click On The Map At Coordinates    150    30
    #Success criterion
    \   Verify That The Annotation Type Is    Polygon
    \   Verify That The Annotation stroke Width Is    ${i} 
    #Return the situation to its original state
    Click On Delete Icon  
    Confirm Message 
        
JM70-993:Modify the stroke width of the Polygon annotation with invalid data    #Update it in Testlink  
    Draw a Polygon Annotation
    Verify That The Annotation stroke Width Is    1
    Click On Selection Icon
    @{InvaldValues}    Create list    0    -1    -5    -15    -50    11    15    25    50
    @{checkedValues}    Create list    1    1    1    1    1    10    10    10    10
    ${length}    Get Length    ${InvaldValues}  
    :FOR    ${i}    IN RANGE    ${length}
    \   Select The Drawing Tool Polygon Annotation    -20   -10
    \   Verify That The Drawn Annotation Is Selected
    \   Click On Style Icon
    \   Fill The Width Field With    ${InvaldValues[${i}]}
    \   Verify That The Value Of The Width Field Is   ${InvaldValues[${i}]}
    \   Click On Style Icon
    \   Click On The Map At Coordinates    150    30
    #Success criterion
    \   Verify That The Annotation Type Is    Polygon
    \   Verify That The Annotation stroke Width Is    ${checkedValues[${i}]} 
    #Return the situation to its original state
    Click On Delete Icon  
    Confirm Message
         
JM70-994:Modify the line style of the Polygon annotation   
    Draw a Polygon Annotation
    Verify That The Line Type Is    ${Normal} 
    Click On Selection Icon
    @{myList}    Create list    Line dash    Normal 
    @{myCheckList}    Create list    ${Linedash}    ${Normal} 
    :FOR    ${i}    IN RANGE    0    2 
    \   Select The Drawing Tool Polygon Annotation    0    -20
    \   Click On Style Icon
    \   Select The Data in the Style drop-down list    ${myList[${i}]}
    \   Click On Style Icon
    \   Click On The Map At Coordinates    150    30
    #Success criterion
    \   Verify That The Annotation Type Is    Polygon
    \   Verify That The Line Type Is    ${myCheckList[${i}]} 
    #Return the situation to its original state
    Click On Delete Icon  
    Confirm Message
    
JM70-995:Modify the line color of the Circle annotation
    Draw a Circle Annotation
    Verify That The Annotation line Color Is    ${redColorDrawing}
    Click On Selection Icon
    Select The Drawing Tool Circle Annotation    -30   30
    Click On Style Icon
    Choose The Color Via The Line Field    ${darkBlueColorElement}
    Click On Style Icon
    Click On The Map At Coordinates    150    30 
    #Success criterion
    Verify That The Annotation Type Is    Circle
    Verify That The Annotation line Color Is    ${darkBlueColorDrawing}
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-996:Modify the fill color of the Circle annotation
    Draw a Circle Annotation
    Verify That The Annotation Fill Color Is    ${blueSkyColorDrawing}
    Click On Selection Icon
    Select The Drawing Tool Circle Annotation    -30   30
    Click On Style Icon
    Choose The Color Via The Fill Field    ${yellowColorElement}
    Click On Style Icon
    Click On The Map At Coordinates    150    30 
    #Success criterion
    Verify That The Annotation Type Is    Circle
    Verify That The Annotation Fill Color Is    ${yellowColorDrawing}
    #Return the situation to its original state
    Click On Delete Icon
    Confirm Message
    
JM70-997:Modify the stroke width of the Circle annotation with valid data
    Draw a Circle Annotation
    Verify That The Annotation stroke Width Is    1
    Click On Selection Icon
    ${myList}    Create list    2    5    9    10 
    :FOR    ${i}    IN    @{myList}
    \   Select The Drawing Tool Circle Annotation    -30   30
    \   Verify That The Drawn Annotation Is Selected
    \   Click On Style Icon
    \   Fill The Width Field With    ${i}
    \   Verify That The Value Of The Width Field Is    ${i}
    \   Click On Style Icon
    \   Click On The Map At Coordinates    150    30
    #Success criterion
    \   Verify That The Annotation Type Is    Circle
    \   Verify That The Annotation stroke Width Is    ${i} 
    #Return the situation to its original state
    Click On Delete Icon  
    Confirm Message
    
JM70-998:Modify the stroke width of the Circle annotation with invalid data    #Update it in Testlink  
    Draw a Circle Annotation
    Verify That The Annotation stroke Width Is    1
    Click On Selection Icon
    @{InvaldValues}    Create list    0    -1    -5    -15    -50    11    15    25    50
    @{checkedValues}    Create list    1    1    1    1    1    10    10    10    10
    ${length}    Get Length    ${InvaldValues}  
    :FOR    ${i}    IN RANGE    ${length}
    \   Select The Drawing Tool Circle Annotation    -30   30
    \   Verify That The Drawn Annotation Is Selected
    \   Click On Style Icon
    \   Fill The Width Field With    ${InvaldValues[${i}]}
    \   Verify That The Value Of The Width Field Is    ${InvaldValues[${i}]}
    \   Click On Style Icon
    \   Click On The Map At Coordinates    150    30
    #Success criterion
    \   Verify That The Annotation Type Is    Circle
    \   Verify That The Annotation stroke Width Is    ${checkedValues[${i}]} 
    #Return the situation to its original state
    Click On Delete Icon  
    Confirm Message
    
JM70-999:Modify the line style of the Circle annotation   
    Draw a Circle Annotation
    Verify That The Line Type Is    ${Normal} 
    Click On Selection Icon
    @{myList}    Create list    Line dash    Normal 
    @{myCheckList}    Create list    ${Linedash}    ${Normal} 
    :FOR    ${i}    IN RANGE    0    2 
    \   Select The Drawing Tool Circle Annotation    -30   30
    \   Click On Style Icon
    \   Select The Data in the Style drop-down list    ${myList[${i}]}
    \   Click On Style Icon
    \   Click On The Map At Coordinates    150    30
    #Success criterion
    \   Verify That The Annotation Type Is    Circle
    \   Verify That The Line Type Is    ${myCheckList[${i}]} 
    #Return the situation to its original state
    Click On Delete Icon  
    Confirm Message
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
*** Keywords ***
