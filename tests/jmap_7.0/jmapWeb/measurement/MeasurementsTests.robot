*** Settings ***

Documentation     Draw Measurement Test cases
#--------------------------------------------------------------------------------------------------------------------------------
Library    String
Library    OperatingSystem
Library    SeleniumLibrary    run_on_failure=no_operation   
Library    Dialogs
Library    BuiltIn
Library    DateTime
#--------------------------------------------------------------------------------------------------------------------------------
Resource    ../../../../common/admin/CommonKeywords.robot
Resource    ../../../../common/CommonLogin.robot
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
JM70-295:Measure distance
    Create A Distance Measurement    -185   115    0    0
    Verify That Geometry Type And Its Value Are    LineString    Length: 3,068,383.65 meters
    
JM70-296:Measure area  
    Create A Surface Measurement    0   0    145   -90    190    10    -130    190
    Verify That Geometry Type And Its Value Are    Polygon    Perimeter: 12,200,488.37 meters\nArea: 5,530,887,290,776.81 meters2
    
JM70-1132:Measure Circle
    Create A Circular Surface Measurement    -50   115    0    0
    Verify That Geometry Type And Its Value Are    Circle    Radius: 1,986,219.43 meters\nCircumference: 12,261,181.11 meters\nArea: 12,215,116,760,522.39 meters2    

JM70-751:Delete Measure
    Delete A Distance Measurement
    Delete A Surface Measurement
    Delete A Circular Surface Measurement
    
    
#----------------------------------------------------------------------------------------------------------------------------------------
*** Keywords ***
#Sub Test cases
Delete A Distance Measurement
    Create A Distance Measurement    -185   115    0    0
    Verify That Geometry Type And Its Value Are    LineString    Length: 3,068,383.65 meters
    Click On Erase Icon 
    Verify Alert Text And Cancel    Erase all measurments?    # To check!!!
    Delete Measure
    
Delete A Surface Measurement
    Create A Surface Measurement    0   0    125   -90    120    10    -75    50
    Verify That Geometry Type And Its Value Are    Polygon    Perimeter: 6,674,465.48 meters\nArea: 1,360,467,310,043.09 meters2
    Click On Erase Icon 
    Verify Alert Text And Cancel    Erase all measurments?    # To check!!!
    Delete Measure
    
Delete A Circular Surface Measurement
    Create A Circular Surface Measurement    -50   50    0    0
    Verify That Geometry Type And Its Value Are    Circle    Radius: 985,894.97 meters\nCircumference: 6,160,249.64 meters\nArea: 3,027,973,794,596.89 meters2
    Click On Erase Icon 
    Verify Alert Text And Cancel    Erase all measurments?    # To check!!!
    Delete Measure

    


