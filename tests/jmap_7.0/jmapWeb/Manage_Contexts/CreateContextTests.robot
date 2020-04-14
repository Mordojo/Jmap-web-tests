*** Settings ***
Documentation     Create Context With Annotations Test cases
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
             ...    Get Formated Current Date And Time
Test Teardown    Close JMap Web 
Metadata    author    Mordjane Boussad
#-------------------------------------------------------------------------------------------------------------------------------- 
*** Variable ***
@{VALID_CONTEXTS}    c    2    ?    C2    ContextB'2!%    Context'B2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%Context    Context'B2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%-,@CON    Context'B2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%-,@CONT 
@{VALID_DESCRIPTION}    ${EMPTY}    D    3    !    d3    Description'3!%    Description'3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Descriptio    Description'3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description       
@{INVALID_CONTEXTS}    Context'B2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%-,@CONTE    Context'B2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%-,@CONTEContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%-,@CONTEXT    Valid Title3    Valid Title4    
@{INVALID_DESCRIPTION}    Valid Desc1    Valid Desc2    Description'3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description!    Description'3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description!%Description3!%Description3!%Description3!%Description3!%Description!%Description3!%Description3!%Description3!%Description3!%Description!%Description3!%Description
${FORMATED_DATE}    ${EMPTY}

#--------------------------------------------------------------------------------------------------------------------------------
*** Test Cases ***
JM70-1027:Create Context With Valid Data
    ${contextCount}    Get Length    ${VALID_CONTEXTS}
    Login To JMap Web    ${UserName}    ${Password}
    :FOR    ${i}    IN RANGE    0    ${contextCount}
    \    Create New Context    ${VALID_CONTEXTS[${i}]}    ${VALID_DESCRIPTION[${i}]}
    \    Verify That The Context That Exist In The List Is    ${VALID_CONTEXTS[${i}]}    ${VALID_DESCRIPTION[${i}]}
    # Post condition
    \    Delete Context    ${VALID_CONTEXTS[${i}]}
    Click On Logout
    
JM70-1130:Create Context with invalid data    # To be continued with another steps
    [Tags]    FAILED
    ${contextCount}    Get Length    ${INVALID_CONTEXTS}
    Login To JMap Web    ${UserName}    ${Password}
    :FOR    ${i}    IN RANGE    0    ${contextCount}
    \    Create New Context    ${INVALID_CONTEXTS[${i}]}    ${INVALID_DESCRIPTION[${i}]}
    \    Verify That The Warning Massage Is    YOU CANNOT EXCEED 250 CHARACTERS    # We don't have this message (we have created a ticket for that)
    \    Dismiss Context
    Create New Context    zContext-${FORMATED_DATE}
    Create New Context    zContext-${FORMATED_DATE}    Duplicated zContext
    Verify That The Warning Massage Is    This title already exist
    # Post condition
    Dismiss Context
    Delete Context    zContext-${FORMATED_DATE}
    Click On Logout
    
JM70-1037:Create Context without name
    Login To JMap Web    ${UserName}    ${Password}
    Create New Context    ${EMPTY}    Description to create Context without name
    Verify That The Warning Massage Is    No title provided for the map
    Dismiss Context
    Verify That The Context That Does Not Exist In The List Is    ${EMPTY}
    # Post Condition
    Click On Logout
    
JM70-1042:Create Context with Anonymous user
    Login JMap Admin    Administrator    ${EMPTY}    English    http://${localhost}:${internPort}    0.1
    Go To Add User In The Project With All Permisions    Everyone    WorldTest 
    Switch Between Browser    JMap Web    # Swich to JMap Web
    Click On Logout
    Login To JMap Web    anonymous    ${EMPTY}
    Open Inner Tab Menu Panel
    Verify That The "My Maps" Does Not Exist In The Page
    # Post Condition
    Switch Between Browser    JMap Admin    # Swich to JMap Admin
    Go To Close Specific Session    anonymous    WorldTest    JMap Web
    Logout From JMap Admin
    Switch Between Browser    JMap Web    # Swich to JMap Web
    
JM70-1133:Create Context With Freehand Annotation 
    Login To JMap Web    ${UserName}    ${Password}
    Create Context With Freehand Annotation    Freehand_Annotation_Context-${FORMATED_DATE} 
    Verify That The Freehand Annotation Appears In The Context    Freehand_Annotation_Context-${FORMATED_DATE}    ${EMPTY}  
    # Post condition 
    Delete Context    Freehand_Annotation_Context-${FORMATED_DATE} 
    Click On Logout

JM70-1134:Create Context With Line Annotation    
    Login To JMap Web    ${UserName}    ${Password}
    Create Context With Line Annotation    Line_Annotation_Context-${FORMATED_DATE}
    Verify That The Line Annotation Appears In The Context    Line_Annotation_Context-${FORMATED_DATE}    ${EMPTY}
    # Post condition
    Delete Context    Line_Annotation_Context-${FORMATED_DATE} 
    Click On Logout
    
JM70-1135:Create Context With Point Annotation
    Login To JMap Web    ${UserName}    ${Password}
    Create Context With Point Annotation    Point_Annotation_Context-${FORMATED_DATE}
    Verify That The Point Annotation Appears In The Context    Point_Annotation_Context-${FORMATED_DATE}    ${EMPTY}
    # Post condition
    Delete Context    Point_Annotation_Context-${FORMATED_DATE} 
    Click On Logout
    
JM70-1138:Create Context With Text Annotation
    Login To JMap Web    ${UserName}    ${Password}
    Create Context With Text Annotation    Text_Annotation_Context-${FORMATED_DATE}
    Verify That The Text Annotation Appears In The Context    Text_Annotation_Context-${FORMATED_DATE}    ${EMPTY}
    # Post condition
    Delete Context    Text_Annotation_Context-${FORMATED_DATE}
    Click On Logout
    
JM70-1136:Create Context With Rectangle Annotation
    Login To JMap Web    ${UserName}    ${Password}
    Create Context With Rectangle Annotation    Rectangle_Annotation_Context-${FORMATED_DATE}
    Verify That The Rectangle Annotation Appears In The Context    Rectangle_Annotation_Context-${FORMATED_DATE}    ${EMPTY}
    # Post condition
    Delete Context    Rectangle_Annotation_Context-${FORMATED_DATE} 
    Click On Logout
    
JM70-1137:Create Context With Polygon Annotation
    Login To JMap Web    ${UserName}    ${Password}
    Create Context With Polygon Annotation    Polygone_Annotation_Context-${FORMATED_DATE}
    Verify That The Polygon Annotation Appears In The Context    Polygone_Annotation_Context-${FORMATED_DATE}    ${EMPTY}
    # Post condition
    Delete Context    Polygone_Annotation_Context-${FORMATED_DATE} 
    Click On Logout
    
JM70-1133:Create Context With Circle Annotation
    Login To JMap Web    ${UserName}    ${Password}
    Create Context With Circle Annotation    Circle_Annotation_Context-${FORMATED_DATE}
    Verify That The Circle Annotation Appears In The Context    Circle_Annotation_Context-${FORMATED_DATE}    ${EMPTY}
    # Post condition
    Delete Context    Circle_Annotation_Context-${FORMATED_DATE} 
    Click On Logout
    
JM70-1139:Create Context With Distance Measurement
    Login To JMap Web    ${UserName}    ${Password}
    Create Context With Distance Measurement    Context of Distance-${FORMATED_DATE}    The Description of Distance Measurement
    Verify That The Distance Measurement Appears In The Context    Context of Distance-${FORMATED_DATE}    The Description of Distance Measurement
    Delete Context    Context of Distance-${FORMATED_DATE} 
    Verify That Geometry Type And Its Value Are    LineString    Length: 3,068,383.65 meters
    Reload Page
    Verify That The Measure Is Deleted
    # Post Condition
    Click On Logout

JM70-1140:Create Context With Surface Measurement
    Login To JMap Web    ${UserName}    ${Password}
    Create Context With Surface Measurement    Context of Surface-${FORMATED_DATE}    The Description of Surface Measurement 
    Verify That The Surface Measurement Appears In The Context    Context of Surface-${FORMATED_DATE}    The Description of Surface Measurement
    Delete Context    Context of Surface-${FORMATED_DATE}
    Verify That Geometry Type And Its Value Are    Polygon    Perimeter: 6,674,465.48 meters\nArea: 1,360,467,310,043.09 meters2 
    Reload Page
    Verify That The Measure Is Deleted
    # Post Condition
    Click On Logout
    
JM70-1035:Create Context With Circular Surface Measurement
    [Tags]    FAILED
    Login To JMap Web    ${UserName}    ${Password}
    Create Context With Circular Surface Measurement    Context of Circular-${FORMATED_DATE}    The Description of Circular Measurement
    Verify That The Circular Surface Measurement Appears In The Context    Context of Circular-${FORMATED_DATE}    The Description of Circular Measurement
    Delete Context    Context of Circular-${FORMATED_DATE}
    Verify That Geometry Type And Its Value Are    Circle    Radius: 985,894.97 meters\nCircumference: 6,160,249.64 meters\nArea: 3,027,973,794,596.89 meters2 
    Reload Page
    Verify That The Measure Is Deleted
    # Post Condition
    Click On Logout
    
#JM70-1034:Create Context with Selections
    #@{Countries}    Create List    Algeria    Italy
    #Login To JMap Web    ${UserName}    ${Password} 
    #Activate / Deactivate Selection Tool    PUNCTUAL
    #Verify That The Punctual Selection Is Selected
    #Select Spatial Elements    @{Countries}
    #Activate / Deactivate Selection Tool    PUNCTUAL

#------------------------------------------------------------------------------------------------------------------------------------------                                                
*** Keywords ***
