*** Settings ***
Documentation     Share Context Test cases
#-----------------------------------------------------------------------------------------------------------------------------
Library    String
Library    OperatingSystem
Library    SeleniumLibrary    run_on_failure=no_operation   
Library    Dialogs
Library    BuiltIn
Library    DateTime
Library    RequestsLibrary
#------------------------------------------------------------------------------------------------------------------------------
Resource    ../../../../common/admin/CommonKeywords.robot
Resource    ../../../../common/CommonLogin.robot
Resource    ../../../../common/jmapWeb/CommonWeb.robot
Resource    ../../../../common/jmapWeb/CommonContextWeb.robot
#-------------------------------------------------------------------------------------------------------------------------------- 
Test Setup   Run Keywords    
             ...    Open Browser On JMap Web    ${URLWebApp}    ${RESOLUTION_X}    ${RESOLUTION_Y}    AND
             ...    Login To JMap Web    ${UserName}    ${Password}    AND
             ...    Get Formated Current Date And Time
Test Teardown    LogOut 
Metadata    author    Mordjane Boussad
#-------------------------------------------------------------------------------------------------------------------------------- 
*** Variable ***
${FORMATED_DATE}    ${EMPTY}

#--------------------------------------------------------------------------------------------------------------------------------
*** Test Cases ***
JM70-1141:Share Context With A Normal Page
    Share Context With A Normal Page    Share_Context-${FORMATED_DATE}
    
JM70-1142:Share Context With Freehand Annotation
    Share Context With Freehand Annotation    Share_Freehand_Annotation-${FORMATED_DATE}
    
JM70-1143:Share Context With Line Annotation
    Share Context With Line Annotation    Share_Line_Annotation-${FORMATED_DATE}
    
JM70-1144:Share Context With Point Annotation
    Share Context With Point Annotation    Share_Point_Annotation-${FORMATED_DATE}
    
JM70-1145:Share Context With Rectangle Annotation
    Share Context With Rectangle Annotation    Share_Rectangle_Annotation-${FORMATED_DATE}
    
JM70-1146:Share Context With Polygon Annotation
    Share Context With Polygon Annotation    Share_Polygon_Annotation-${FORMATED_DATE}
    
JM70-1147:Share Context With Circle Annotation
    Share Context With Circle Annotation    Share_Circle_Annotation-${FORMATED_DATE}
    
JM70-1148:Share Context With Text Annotation
    Share Context With Text Annotation    Share_Text_Annotation-${FORMATED_DATE}
    
JM70-1149:Share Context With Distance Measurement
    Share Context With Distance Measurement    Share_Distance_Measurement-${FORMATED_DATE}
    
JM70-1150:Share Context With Surface Measurement
    Share Context With Surface Measurement    Share_Surface_Measurement-${FORMATED_DATE}
    
JM70-1151:Share Context With Circular Surface Measurement
    Share Context With Circular Surface Measurement    Share_Circular_Surface_Measurement-${FORMATED_DATE}    The Description of Share Circular Measurement
    
#JM70-1030:Share Context With Selections    # TO DO


#------------------------------------------------------------------------------------------------------------------------------------------                                                
*** Keywords ***