*** Settings ***

Documentation     Delete Annotation Test cases
#------------------------------------------------------------------------------------------------------------------------------
Library    String
Library    OperatingSystem
Library    SeleniumLibrary    run_on_failure=No Operation   
Library    Dialogs
Library    BuiltIn
Library    DateTime
#-------------------------------------------------------------------------------------------------------------------------------
Resource    ../../../../common/admin/CommonKeywords.robot
Resource    ../../../../common/CommonLogin.robot
Resource    ../../../../common/jmapWeb/CommonAnnotationWeb.robot
Resource    ../../../../common/jmapWeb/CommonWeb.robot 
#-------------------------------------------------------------------------------------------------------------------------------
Test Setup   Run Keywords    
             ...    Open Browser On JMap Web    ${URLWebApp}    ${RESOLUTION_X}    ${RESOLUTION_Y}    AND
             ...    Login To JMap Web
Test Teardown    LogOut 
Metadata    author    Mordjane Boussad
#-------------------------------------------------------------------------------------------------------------------------------
*** Variable ***
${textAnnotationField}    //div[@class='textAnnotationInputDiv']//input
${mapElement}    //div[@id='map']   
#-------------------------------------------------------------------------------------------------------------------------------
*** Test Cases ***

JM70-914:Delete a Freehand annotation
    Draw a Freehand Annotation With Coordinates    -175    130
    Click On Modification Icon
    Select The Drawing Tool Freehand Annotation    -175   130
    The Icone Rotate Right Should be Exist
    The Icone Rotate left Should be Exist
    Click On The Map At Coordinates    150    100
    Click On Delete Icon 
    Verify Alert Text And Cancel    Erase all annotations?
    Select The Drawing Tool Freehand Annotation    -175   130
    The Icone Rotate Right Should be Exist
    The Icone Rotate left Should be Exist
    Click On The Map At Coordinates    150    100
    Click On Delete Icon    
    Verify Alert Text And Accept    Erase all annotations?
    Select The Drawing Tool Freehand Annotation    -175   130
    #Success criterion        
    The Icone Rotate Right Should Be Not Exist
    The Icone Rotate Left Should Be Not Exist
    #Logout 
JM70-915:Delete a Text annotation
    Draw a Text Annotation With Text And Coordinates    Argentina    -175   130
    Click On Modification Icon
    Select The Text Annotation On The Map    -175   130
    The Icone Rotate Right Should be Exist
    The Icone Rotate left Should be Exist
    Click On The Map At Coordinates    150    100
    Click On Delete Icon 
    Verify Alert Text And Cancel    Erase all annotations?
    Select The Text Annotation On The Map    -175   130
    The Icone Rotate Right Should be Exist
    The Icone Rotate left Should be Exist
    Click On The Map At Coordinates    150    100
    Click On Delete Icon    
    Verify Alert Text And Accept    Erase all annotations?
    Select The Text Annotation On The Map    -175   130
    #Success criterion        
    The Icone Rotate Right Should Be Not Exist
    The Icone Rotate Left Should Be Not Exist
    #Logout
JM70-916:Delete a Point annotation 
    Draw a Point Annotation With Coordinates    -175   130
    Click On Modification Icon
    Select The Drawing Tool Point Annotation    -175   130
    The Icone Rotate Right Should be Exist
    The Icone Rotate left Should be Exist
    Click On The Map At Coordinates    150    100
    Click On Delete Icon 
    Verify Alert Text And Cancel    Erase all annotations?
    Select The Drawing Tool Point Annotation    -175   130
    The Icone Rotate Right Should be Exist
    The Icone Rotate left Should be Exist
    Click On The Map At Coordinates    150    100
    Click On Delete Icon    
    Verify Alert Text And Accept    Erase all annotations?
    Select The Drawing Tool Point Annotation    -175   130
    #Success criterion        
    The Icone Rotate Right Should Be Not Exist
    The Icone Rotate Left Should Be Not Exist
    #Logout  
JM70-917:Delete a Line annotation 
    Draw a Line Annotation
    Click On Modification Icon
    Select The Drawing Tool Line Annotation    -175   130
    The Icone Rotate Right Should be Exist
    The Icone Rotate left Should be Exist
    Click On The Map At Coordinates    150    100
    Click On Delete Icon 
    Verify Alert Text And Cancel    Erase all annotations?
    Select The Drawing Tool Line Annotation    -175   130
    The Icone Rotate Right Should be Exist
    The Icone Rotate left Should be Exist
    Click On The Map At Coordinates    150    100
    Click On Delete Icon    
    Verify Alert Text And Accept    Erase all annotations?
    Select The Drawing Tool Line Annotation    -175   130
    #Success criterion        
    The Icone Rotate Right Should Be Not Exist
    The Icone Rotate Left Should Be Not Exist
    #Logout
JM70-918:Delete a Rectangle annotation
    Draw a Rectangle annotation
    Click On Modification Icon
    Select The Drawing Tool Rectangle Annotation    115   -70
    The Icone Rotate Right Should be Exist
    The Icone Rotate left Should be Exist
    Click On The Map At Coordinates    150    100
    Click On Delete Icon 
    Verify Alert Text And Cancel    Erase all annotations?
    Select The Drawing Tool Rectangle Annotation    115   -70
    The Icone Rotate Right Should be Exist
    The Icone Rotate left Should be Exist
    Click On The Map At Coordinates    150    100
    Click On Delete Icon    
    Verify Alert Text And Accept    Erase all annotations?
    Select The Drawing Tool Rectangle Annotation    115   -70
    #Success criterion        
    The Icone Rotate Right Should Be Not Exist
    The Icone Rotate Left Should Be Not Exist
    #Logout
JM70-919:Delete a Polygon annotation 
    Draw a Polygon annotation
    Click On Modification Icon
    Select The Drawing Tool Polygon Annotation    -20   -10
    The Icone Rotate Right Should be Exist
    The Icone Rotate left Should be Exist
    Click On The Map At Coordinates    150    100
    Click On Delete Icon 
    Verify Alert Text And Cancel    Erase all annotations?
    Select The Drawing Tool Polygon Annotation    -20   -10
    The Icone Rotate Right Should be Exist
    The Icone Rotate left Should be Exist
    Click On The Map At Coordinates    150    100
    Click On Delete Icon    
    Verify Alert Text And Accept    Erase all annotations?
    Select The Drawing Tool Polygon Annotation    -20   -10
    #Success criterion        
    The Icone Rotate Right Should Be Not Exist
    The Icone Rotate Left Should Be Not Exist
    #Logout  
JM70-920:Delete a Circle annotation
    Draw a Circle annotation
    Click On Modification Icon
    Select The Drawing Tool Circle Annotation    -30   25
    The Icone Rotate Right Should be Exist
    The Icone Rotate left Should be Exist
    Click On The Map At Coordinates    150    100
    Click On Delete Icon 
    Verify Alert Text And Cancel    Erase all annotations?
    Select The Drawing Tool Circle Annotation    -30   25
    The Icone Rotate Right Should be Exist
    The Icone Rotate left Should be Exist
    Click On The Map At Coordinates    150    100
    Click On Delete Icon    
    Verify Alert Text And Accept    Erase all annotations?
    Select The Drawing Tool Circle Annotation    -30   25
    #Success criterion        
    The Icone Rotate Right Should Be Not Exist
    The Icone Rotate Left Should Be Not Exist
    #Logout 
#----------------------------------------------------------------------------------------------------------------------------------------------------------
*** Keywords ***
