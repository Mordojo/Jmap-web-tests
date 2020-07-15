*** Settings ***

Documentation     Common keywords for JMap Web
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
Library    SeleniumLibrary		# Selenium framework
Library    OperatingSystem
Library    Collections     
#Library    SeleniumLibraryHeadlessChromeDownload
#-----------------------------------------------------------------------------------------------------------------------------------------------------------  
Resource    ../admin/CommonKeywords.robot
Resource    ../CommonLogin.robot
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
*** Variables ***

#------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Keywords ***

Click On Annotation Down List Arrow
    [Documentation]    Click on annotation tool   
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Enabled    xpath://div[@id='smallTrigger_freehandSet']    timeout=2s    
    Click Element    xpath://div[@id='smallTrigger_freehandSet']

Click On Freehand Annotation
    [Documentation]    Click on freehand annotation tool
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Enabled    xpath://div[@id='dropdownPanel_freehandSet']//div[@class='freelinestringDrawing CustomButtons btn btn-default']    timeout=2s    
    Click Element    xpath://div[@id='dropdownPanel_freehandSet']//div[@class='freelinestringDrawing CustomButtons btn btn-default'] 
       
Click On Text Annotation
    [Documentation]    Click on text annotation tool
     Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Enabled    xpath://div[@class='textAnnotation CustomButtons btn btn-default']    timeout=2s    
    Click Element    xpath://div[@class='textAnnotation CustomButtons btn btn-default']
    
Click On Point Annotation
    [Documentation]    Click on point annotation tool
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Enabled    xpath://div[@id='point_FreeDrawingTrigger']    timeout=2s    
    Click Element    xpath://div[@id='point_FreeDrawingTrigger'] 
    
Click On Line Annotation
    [Documentation]    Click on line annotation tool
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Enabled    xpath://div[@id='linestring_FreeDrawingTrigger']    timeout=2s    
    Click Element    xpath://div[@id='linestring_FreeDrawingTrigger'] 
    
Click On Rectangle Annotation
    [Documentation]    Click on rectangle annotation tool
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Visible    xpath://div[@id='rectangle_FreeDrawingTrigger']    timeout=2s    
    Click Element    xpath://div[@id='rectangle_FreeDrawingTrigger']
    
Click On Polygon Annotation
    [Documentation]    Click on polygon annotation tool
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Visible    xpath://div[@id='polygon_FreeDrawingTrigger']    timeout=2s    
    Click Element    xpath://div[@id='polygon_FreeDrawingTrigger']
    
Click On Circle Annotation
    [Documentation]    Click on circle annotation tool
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Visible    xpath://div[@id='circle_FreeDrawingTrigger']    timeout=2s    
    Click Element    xpath://div[@id='circle_FreeDrawingTrigger'] 
    
Click On Selection Icon
    [Documentation]    Click on annotation selection tool
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Visible    xpath://div[@class='SelectionTool CustomButtons btn btn-default']    timeout=2s    
    Click Element    xpath://div[@class='SelectionTool CustomButtons btn btn-default']
    
Click On Modification Icon
    [Documentation]    Click on annotation modification tool
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Visible    xpath://div[@class='ModifyTool CustomButtons btn btn-default']    timeout=2s    
    Click Element    xpath://div[@class='ModifyTool CustomButtons btn btn-default'] 
    
Click On Delete Icon
    [Documentation]    Click on annotation delete tool
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Visible    xpath://div[@class='ClearTool CustomButtons btn btn-default']//i    timeout=2s    
    Click Element    xpath://div[@class='ClearTool CustomButtons btn btn-default']//i
    
Click On Style Icon
    [Documentation]    Click on annotation style tool
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Visible    xpath://div[@id='AnnotationStyleTrigger']    timeout=2s    
    Click Element    xpath://div[@id='AnnotationStyleTrigger'] 
    
Click On The Bold Checkbox
    [Documentation]    Click on annotation bold style checkbox
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Visible    xpath://label[contains(text(),'Bold')]//preceding::input[1]  
    Click Element    xpath://label[contains(text(),'Bold')]//preceding::input[1]
    
Click On The Italic Checkbox
    [Documentation]    Click on annotation italic style checkbox
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Visible    xpath://label[contains(text(),'Italic')]//preceding::input[1]  
    Click Element    xpath://label[contains(text(),'Italic')]//preceding::input[1] 
    
Choose The Color Via The Line Field    [Arguments]    ${colorElement}
    [Documentation]    Choose border color for annotations
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Visible    xpath://div[@class='headerContainer']//div[2]//div[1]//div[1]//div[1]  
    Click Element    xpath://div[@class='headerContainer']//div[2]//div[1]//div[1]//div[1]
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Visible    xpath:${colorElement}   
    Click Element    xpath:${colorElement}
    
Choose The Color Via The Fill Field    [Arguments]    ${colorElement}
    [Documentation]    Choose fill color for annotations
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Visible    xpath://div[@class='col_div']//div[1]//div[1]//div[1]//div[1]    
    Click Element    xpath://div[@class='col_div']//div[1]//div[1]//div[1]//div[1] 
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Visible    xpath:${colorElement}       
    Click Element    xpath:${colorElement}
    
Choose The Color Via The Text Field    [Arguments]    ${colorElement}
    [Documentation]    Choose text color for annotations
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Visible    xpath://div[@class='AnnotationStylePanel']//div[5]//div[1]//div[1]//div[1]    timeout=2s   
    Click Element    xpath://div[@class='AnnotationStylePanel']//div[5]//div[1]//div[1]//div[1]
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Visible    xpath:${colorElement}    timeout=2s
    Sleep    0.5s           
    Click Element    xpath:${colorElement}    
    
Get Annotation Attribute    [Arguments]    ${attribute}
    [Documentation]    Get annotation attributes
    Set Selenium Speed    0.1s 
    ${getAttribute}=    Execute Javascript   return window.JMap.Html5Core.Util.getAnnotationConfig()[0].${attribute}   
    [Return]    ${getAttribute} 
    
Type In Text Annotation Field    [Arguments]    ${text}
    [Documentation]    Type given text to Text Annotation  
    Type    //div[@class='textAnnotationInputDiv']//input    ${text}
    Sleep    1
    
Fill The Width Field With    [Arguments]    ${value}
    [Documentation]    Type fill with for line annotation 
    Type    //input[@class='annotationLineWidthInput']    ${value}
    
Fill The Font Size Field With    [Arguments]    ${value}
    [Documentation]    Type font size for text annotation  
    Type    //input[@class='annotationTextSizeInput']    ${value}
    Sleep    1     

Verify That Text Of Freehand Annotation Icon Is    [Arguments]    ${iconText}
    [Documentation]    Check freehand annotation is enable
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Visible    xpath://div[@id='dropdownPanel_freehandSet']//div[@class='freelinestringDrawing CustomButtons btn btn-default']    2s    
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //div[@id='dropdownPanel_freehandSet']//div[@class='freelinestringDrawing CustomButtons btn btn-default']    data-original-title    ${iconText}
    Sleep    1
    
Verify That Text Of Text Annotation Icon Is    [Arguments]    ${iconText} 
    [Documentation]    Check text annotation is enable
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Visible    xpath://div[@class='textAnnotation CustomButtons btn btn-default']    timeout=2s       
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //div[@class='textAnnotation CustomButtons btn btn-default']    data-original-title    ${iconText}
       
Verify That Text Of Point Annotation Icon Is    [Arguments]    ${iconText}
    [Documentation]    Check point annotation is enable    
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Visible    xpath://div[@id='point_FreeDrawingTrigger']    timeout=2s
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //div[@id='point_FreeDrawingTrigger']    data-original-title    ${iconText}
    
Verify That Text Of Line Annotation Icon Is    [Arguments]    ${iconText}
    [Documentation]    Check line annotation is enable   
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Visible    xpath://div[@id='linestring_FreeDrawingTrigger']    timeout=2s
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //div[@id='linestring_FreeDrawingTrigger']    data-original-title    ${iconText}
    
Verify That Text Of Rectangle Annotation Icon Is    [Arguments]    ${iconText}
    [Documentation]    Check rectangle annotation is enable
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Visible    xpath://div[@id='rectangle_FreeDrawingTrigger']    timeout=2s     
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //div[@id='rectangle_FreeDrawingTrigger']    data-original-title    ${iconText}
    
Verify That Text Of Polygon Annotation Icon Is    [Arguments]    ${iconText}
    [Documentation]    Check polygon annotation is enable
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Visible    xpath://div[@id='polygon_FreeDrawingTrigger']    timeout=2s   
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //div[@id='polygon_FreeDrawingTrigger']    data-original-title    ${iconText}
    
Verify That Text Of Circle Annotation Icon Is    [Arguments]    ${iconText}
    [Documentation]    Check circle annotation is enable
    Wait Until Element Is Visible    xpath://div[@id='circle_FreeDrawingTrigger']    timeout=2s    
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //div[@id='circle_FreeDrawingTrigger']    data-original-title    ${iconText}
    
Verify Text Annotation Field Is Exist
    [Documentation]    Check text annotation exist
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Visible    xpath://div[@class='textAnnotationInputDiv']//input    5s
    Run Keyword And Continue On Failure    Element Should Be Visible    //div[@class='textAnnotationInputDiv']//input
    
Verify value of Text Annotation Field    [Arguments]    ${value}
    [Documentation]    Check text annotation value from the given value
    Verify Value    //div[@class='textAnnotationInputDiv']//input    ${value}
    
Element Annotation Should Be Selected    [Arguments]    ${text}
    [Documentation]    Check that element annotation is selected
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Enabled    xpath://div[@id='dropdownButton_freehandSet']    timeout=2s       
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //div[@id='dropdownButton_freehandSet']    data-original-title    ${text}
    
Verify That The Annotation Type Is    [Arguments]    ${annotationType}
    [Documentation]    Check annotation type by the given type value
    ${getAnnotationType}    Get Annotation Attribute    annotationType    
    Run Keyword And Continue On Failure    Should Be Equal    ${getAnnotationType}    ${annotationType}    
    
Verify That The Annotation Resolution Is    [Arguments]    ${annotationResolution}
    [Documentation]    Check annotation resolution by the given resolution value
    ${getAnnotation}    Get Annotation Attribute    annotationResolution    
    Run Keyword And Continue On Failure    Should Be Equal    ${getAnnotation}    ${annotationResolution}  
    Sleep    1
       
Verify That The Annotation Extent Resolution Is    [Arguments]    ${annotationExtentResolution}
    [Documentation]    Check annotation extent resolution by the given extent resolution value
    ${getAnnotation}    Get Annotation Attribute    extentResolution    
    Run Keyword And Continue On Failure    Should Be Equal    ${getAnnotation}    ${annotationExtentResolution}
    Sleep    1
    
Verify That The Annotation Text Is     [Arguments]    ${annotationText}
    [Documentation]    Check annotation text by the given text value
    ${getAnnotation}    Get Annotation Attribute    text    
    Run Keyword And Continue On Failure    Should Be Equal    ${getAnnotation}    ${annotationText}
    Sleep    1
    
Verify That The Annotation Text Bold Is    [Arguments]    ${annotationTextBold}
    [Documentation]    Check annotation bold text by the given bold text value
    ${getAnnotation}    Get Annotation Attribute    textBold
    ${getTextBold}    Convert To String    ${getAnnotation}    
    Run Keyword And Continue On Failure    Should Be Equal    ${getTextBold}    ${annotationTextBold}
    Sleep    1
    
Verify That The Annotation Text Italic Is    [Arguments]    ${annotationTextItalic}
    [Documentation]    Check annotation italic text by the given italic text value
    ${getAnnotation}    Get Annotation Attribute    textItalic
    ${getTextItalic}    Convert To String    ${getAnnotation}    
    Run Keyword And Continue On Failure    Should Be Equal    ${getTextItalic}    ${annotationTextItalic}
    Sleep    1
    
Verify That The Annotation Text Color Is    [Arguments]    ${annotationTextColor}
    [Documentation]    Check annotation text color by the given text color value
    ${getAnnotation}    Get Annotation Attribute    textColor  
    ${getTextColor}    Convert To String    ${getAnnotation} 
    Run Keyword And Continue On Failure    Should Be Equal    ${getTextColor}    ${annotationTextColor}   
    Sleep    1
    
Verify That The Annotation Text Rotation Is    [Arguments]    ${annotationTextRotation}
    [Documentation]    Check annotation text rotation by the given text rotation value
    ${getAnnotation}    Get Annotation Attribute    textRotation 
    ${getTextRotation}    Convert To String    ${getAnnotation}  
    Run Keyword And Continue On Failure    Should Be Equal    ${getTextRotation}    ${annotationTextRotation} 
    Sleep    1
     
Verify That The Annotation Text Font Size Is    [Arguments]    ${annotationTextSize}
    [Documentation]    Check annotation text font size by the given text font size value
    ${getAnnotation}    Get Annotation Attribute    textSize 
    ${getTextSize}    Convert To String    ${getAnnotation}  
    Run Keyword And Continue On Failure    Should Be Equal    ${getTextSize}    ${annotationTextSize} 
    
    Run Keyword If    '${getTextSize}' == '${annotationTextSize}'
    ...    Log    \n***** The Text Size "${annotationTextSize}" is a valid data. So, we can write with it *****    console=yes
    ...    ELSE
    ...    Log    \n***** The Text Size "${annotationTextSize}" is not between [10 - 40] to write a text annotation.\nSo, You must choose a value from the allowed interval *****    WARN           
    Sleep    1
    
Verify That The Annotation line Color Is    [Arguments]    ${Color}
    [Documentation]    Check annotation line color by the given line color value
    ${getlineColor}    Get Annotation Attribute    lineColor    
    Run Keyword And Continue On Failure    Should Be Equal    ${getlineColor}    ${Color}
    Sleep    1
    
Verify That The Annotation Fill Color Is    [Arguments]    ${Color}
    [Documentation]    Check annotation fill color by the given fill color value
    ${getlineColor}    Get Annotation Attribute    fillColor    
    Run Keyword And Continue On Failure    Should Be Equal    ${getlineColor}    ${Color}
    Sleep    1
    
Verify That The Annotation stroke Width Is    [Arguments]    ${width}
    [Documentation]    Check annotation stroke width by the given stroke width value
    ${getWidth}    Get Annotation Attribute    strokeWidth
    ${getWidth}    Convert To String    ${getWidth}        
    Run Keyword And Continue On Failure    Should Be Equal    ${getWidth}    ${width}
    
    Run Keyword If    '${getWidth}' == '${width}'
    ...    Log    \n***** The width "${width}" is a valid data. So, we can draw with it *****    console=yes
    ...    ELSE
    ...    Log    \n***** The width "${width}" is not between [1 - 10] to draw an annotation.\nSo, You must choose a value from the allowed interval *****    WARN           
    
Verify That The Line Type Is    [Arguments]    ${shape}
    [Documentation]    Check annotation line type by the given line type value 
    ${getShape}    Get Annotation Attribute    lineDash 
    ${getShape}    Convert To String    ${getShape}     
    Run Keyword And Continue On Failure    Should Be Equal    ${getShape}    ${shape}   
    
Verify The Background Color Of The Line Field    [Arguments]    ${color}
    [Documentation]    Check annotation line background color by the given line background color value
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Enabled    xpath://div[@class='headerContainer']//div[2]//div[1]//div[1]//div[1]    timeout=2s    
    Verify Background Color    //div[@class='headerContainer']//div[2]//div[1]//div[1]//div[1]    ${color}
    
Verify The Background Color Of The Fill Field    [Arguments]    ${color}
    [Documentation]    Check annotation fill background color by the given fill background color value
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Enabled    xpath://div[@class='col_div']//div[1]//div[1]//div[1]//div[1]    timeout=2s    
    Verify Background Color    //div[@class='col_div']//div[1]//div[1]//div[1]//div[1]    ${color}
    
Verify The Background Color Of The Text Field    [Arguments]    ${color}
    [Documentation]    Check annotation text background color by the given text background color value
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Enabled    xpath://div[@class='AnnotationStylePanel']//div[5]//div[1]//div[1]//div[1]    timeout=2s    
    Verify Background Color    //div[@class='AnnotationStylePanel']//div[5]//div[1]//div[1]//div[1]    ${color}  
    
Verify That The Value Of The Width Field Is    [Arguments]    ${value}
    [Documentation]    Check annotation width by the given width value
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Enabled    xpath://input[@class='annotationLineWidthInput']    timeout=2s    
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //input[@class='annotationLineWidthInput']    value    ${value}
        
Verify The Data Of The Font Size Field    [Arguments]    ${value}
    [Documentation]    Check annotation font size by the given font size value
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Enabled    xpath://input[@class='annotationTextSizeInput']    timeout=2s    
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    //input[@class='annotationTextSizeInput']    value    ${value}
    
Verify That The Data Of The Style Field Is    [Arguments]    ${value}
    [Documentation]    Check annotation style by the given style value
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Enabled    xpath://select[@class='annotationLineStyleSelect']    timeout=2s    
    ${getValue}    Get Selected List Label    //select[@class='annotationLineStyleSelect']
    Should Be Equal    ${getValue}    ${value}
    
The Icone Rotate Right Should Be Exist
    [Documentation]    Check for the Rotate right icon to be present
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Visible    xpath://div[@name='rotateRight']    timeout=2s    
    Run Keyword And Continue On Failure    Element Should Be Visible    //div[@name='rotateRight']    
    
The Icone Rotate left Should be Exist
    [Documentation]    Check for the Rotate left icon to be present
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Visible    xpath://div[@name='rotateLeft']    timeout=2s    
    Run Keyword And Continue On Failure    Element Should Be Visible    //div[@name='rotateLeft'] 
    
The Icone Rotate Right Should Be Not Exist
    [Documentation]    Check for the Rotate right icon not to be present 
    Run Keyword And Ignore Error    Wait Until Element Is Visible    xpath://div[@name='rotateRight']    timeout=3s    
    Run Keyword And Continue On Failure    Element Should Not Be Visible    //div[@name='rotateRight']  
    
The Icone Rotate left Should be Not Exist
    [Documentation]    Check for the Rotate left icon not to be present
    Run Keyword And Ignore Error    Wait Until Element Is Visible    xpath://div[@name='rotateLeft']    timeout=3s    
    Run Keyword And Continue On Failure    Element Should Not Be Visible    //div[@name='rotateLeft']
    
The Bold CheckBox Should Be Selected
    [Documentation]    Check for the bold checkbox to be selected
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Visible    xpath://label[contains(text(),'Bold')]//preceding::input[1]    timeout=2s    
    Checkbox Should Be Selected    //label[contains(text(),'Bold')]//preceding::input[1]
    
The Italic CheckBox Should Be Selected
    [Documentation]    Check for the italic checkbox to be selected
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Visible    xpath://label[contains(text(),'Italic')]//preceding::input[1]    timeout=2s    
    Checkbox Should Be Selected    //label[contains(text(),'Italic')]//preceding::input[1]
    
The Bold CheckBox Should Not Be Selected
    [Documentation]    Check for the bold checkbox not to be selected
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Visible    xpath://label[contains(text(),'Bold')]//preceding::input[1]    timeout=2s    
    Checkbox Should Not Be Selected    //label[contains(text(),'Bold')]//preceding::input[1]
    
The Italic CheckBox Should Not Be Selected
    [Documentation]    Check for the italic checkbox not to be selected
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Visible    xpath://label[contains(text(),'Italic')]//preceding::input[1]    timeout=2s    
    Checkbox Should Not Be Selected    //label[contains(text(),'Italic')]//preceding::input[1]   
    
Select The Drawing Tool Freehand Annotation    [Arguments]    ${xoffset}    ${yoffset}
    [Documentation]    Select The Drawing Tool Freehand Annotation clicking over 
    Click On The Map At Coordinates    ${xoffset}    ${yoffset}
       
Select The Drawing Tool Text Annotation    [Arguments]    ${xoffset}    ${yoffset}
    [Documentation]    Select The Drawing Tool Text Annotation clicking over
    Click On The Map At Coordinates    ${xoffset}    ${yoffset}
    
Select The Drawing Tool Line Annotation    [Arguments]    ${xoffset}    ${yoffset}
    [Documentation]    Select The Drawing Tool Line Annotation clicking over
    Click On The Map At Coordinates    ${xoffset}    ${yoffset}
    
Select The Drawing Tool Point Annotation    [Arguments]    ${xoffset}    ${yoffset}
    [Documentation]    Select The Drawing Tool Point Annotation clicking over
    Click On The Map At Coordinates    ${xoffset}    ${yoffset}
    
Select The Drawing Tool Rectangle Annotation    [Arguments]    ${xoffset}    ${yoffset}
    [Documentation]    Select The Drawing Tool Rectangle Annotation clicking over
    Click On The Map At Coordinates    ${xoffset}    ${yoffset} 
    
Select The Drawing Tool Polygon Annotation    [Arguments]    ${xoffset}    ${yoffset}
    [Documentation]    Select The Drawing Tool Polygon Annotation clicking over
    Click On The Map At Coordinates    ${xoffset}    ${yoffset} 
    
Select The Drawing Tool Circle Annotation    [Arguments]    ${xoffset}    ${yoffset}
    [Documentation]    Select The Drawing Tool Circle Annotation clicking over
    Click On The Map At Coordinates    ${xoffset}    ${yoffset}
    
Select The Text Annotation On The Map    [Arguments]    ${xoffset}    ${yoffset}
    [Documentation]    Select The Text Annotation On The Map clicking over
    Click On The Map At Coordinates    ${xoffset}    ${yoffset}
    
Select The Data in the Style drop-down list    [Arguments]    ${value}
    [Documentation]    Select The Data in the Style drop-down list by given value
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Visible    xpath://select[@class='annotationLineStyleSelect']    timeout=2s    
    Select From List By Label    //select[@class='annotationLineStyleSelect']    ${value}
    
Draw With Freehand Annotation    [Arguments]    ${xoffset}    ${yoffset}
    [Documentation]    Draw a Freehand Annotation
    Wait Until Keyword Succeeds    10s    1s    Wait Until Element Is Enabled    xpath://div[@id='map']    timeout=2s    
    Drag And Drop By Offset    //div[@id='map']    ${xoffset}    ${yoffset}
    Sleep    1s
    
Create Annotation With Text    [Arguments]    ${value}
    [Documentation]    Create Text Annotation with the given text    
    Type In Text Annotation Field    ${value}
    Verify value of Text Annotation Field    ${value}
    Press Enter    //div[@class='textAnnotationInputDiv']//input 
    Sleep    1  
    
Draw With Line Annotation
    [Documentation]    Draw a Line Annotation
    Click On The Map At Coordinates    -175   130
    Drag And Drop By Offset    //div[@id='map']   0    0    #60   -50
    Click On The Map At Coordinates    0    0    #60   -50
    
Draw With Point Annotation    [Arguments]    ${xoffset}    ${yoffset}
    [Documentation]    Draw a Point Annotation 
    Click Element At Coordinates    //div[@id='map']    ${xoffset}    ${yoffset}
    
Draw With Rectangle Annotation
    [Documentation]    Draw a Rectangle Annotation
    Click On The Map At Coordinates    0   0
    Click On The Map At Coordinates    115   -70
    Double Click On The Map At Coordinates    0   0
    
Draw With Polygon Annotation
    [Documentation]    Draw a Polygon Annotation
    Click On The Map At Coordinates    0   0
    Click On The Map At Coordinates    90   -90
    Click On The Map At Coordinates    -90   -100
    Click On The Map At Coordinates    -100   10
    Click On The Map At Coordinates    -20   -10
    Click On The Map At Coordinates    0   0
    
Draw With Circle Annotation
    [Documentation]    Draw a Circle Annotation
    Click On The Map At Coordinates    -30   30
    Click On The Map At Coordinates    0    0
    Double Click On The Map At Coordinates    0   0
    
Draw a Freehand Annotation With Coordinates    [Arguments]    ${xoffset}    ${yoffset}
    [Documentation]    This is a precondition for all test cases to "Select, Modify, Delete and Style" a freehand annotation 
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Freehand Annotation
    Element Annotation Should Be Selected    Freehand
    Draw With Freehand Annotation    ${xoffset}    ${yoffset}
    
Draw a Text Annotation With Text And Coordinates    [Arguments]    ${value}    ${xoffset}    ${yoffset}
    [Documentation]    This is a precondition for all test cases to "Select, Modify, Delete and Style" a text annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Text Annotation
    Element Annotation Should Be Selected    Text
    Double Click On The Map At Coordinates    ${xoffset}    ${yoffset}
    Verify Text Annotation Field Is Exist
    Create annotation with text     ${value}
    
Draw a Point Annotation With Coordinates    [Arguments]    ${xoffset}    ${yoffset}
    [Documentation]    This is a precondition for all test cases to "Select, Modify, Delete and Style" a point annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Point Annotation
    Element Annotation Should Be Selected    Point      
    Draw With Point Annotation    ${xoffset}    ${yoffset}
    
Draw a Line Annotation
    [Documentation]    This is a precondition for all test cases to "Select, Modify, Delete and Style" a line annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Line Annotation
    Element Annotation Should Be Selected    Line
    Draw With Line Annotation
    
Draw a Rectangle annotation
    [Documentation]    This is a precondition for all test cases to "Select, Modify, Delete and Style" a line annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Rectangle Annotation
    Element Annotation Should Be Selected    Rectangle
    Draw With Rectangle Annotation 
    
Draw a Polygon annotation
    [Documentation]    This is a precondition for all test cases to "Select, Modify, Delete and Style" a polygon annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Polygon Annotation
    Element Annotation Should Be Selected    Polygon
    Draw With Polygon Annotation  
    
Draw a Circle annotation
    [Documentation]    This is a precondition for all test cases to "Select, Modify, Delete and Style" a circle annotation
    Verify That Title Of The Cover Page Is    ${Title}
    Click On Annotation Down List Arrow
    Click On Circle Annotation
    Element Annotation Should Be Selected    Circle
    Draw With Circle Annotation  

Verify That The Drawn Annotation Is Selected
    Sleep    1s    reason=Wait until the Annotation be selectable
    ${isSelectedAnnotation}=    Execute Javascript   return window.JMap.app.clickToolManager.getSelectionTool().interaction.getFeatures().getArray()[0].L.selected   
    Run Keyword And Continue On Failure    Should Be Equal    ${isSelectedAnnotation}    ${True}    msg=The current annotation does not selected. But, it should be selected !!! 
    Sleep    1

Verify That The Drawn Annotation Is Selected To Modify It
    Sleep    1s    reason=Wait until the annotation is ready to be changed   
    ${isSelectedAnnotation}=    Execute Javascript   return window.JMap.app.clickToolManager.getModifyTool().interaction.getFeatures().getArray()[0].L.selected   
    Run Keyword And Continue On Failure    Should Be Equal    ${isSelectedAnnotation}    ${True}    msg=The current annotation does not selected to be changed. But, it should be to be changed!!! 
    Sleep    1
          
Verify That The Drawn Annotation Is Erased 
    Sleep    1s    reason=Wait until the Annotation is erased 
    ${undefined}=    Execute Javascript   return window.JMap.Html5Core.Util.getAnnotationConfig()[0]
    ${undefined}    Convert To String    ${undefined}    
    Run Keyword And Continue On Failure    Should Be Equal    ${undefined}    None    msg=The current annotation does not erased. But, it should be erased !!!
    Sleep    1
   
