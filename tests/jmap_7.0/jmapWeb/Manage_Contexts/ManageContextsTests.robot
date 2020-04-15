*** Settings ***
Documentation     Manage Context Test cases
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
@{VALID_CONTEXTS}    c    2    ?    C2    ContextB'2!%    Context'B2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%Context    Context'B2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%-,@CON    Context'B2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%-,@CONT 
@{VALID_DESCRIPTION}    ${EMPTY}    D    3    !    d3    Description'3!%    Description'3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Descriptio    Description'3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description       
@{INVALID_CONTEXTS}    Context'B2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%-,@CONTE    Context'B2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%-,@CONTEContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%ContextB2!%-,@CONTEXT    Valid Title3    Valid Title4    
@{INVALID_DESCRIPTION}    Valid Desc1    Valid Desc2    Description'3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description!    Description'3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description3!%Description!%Description3!%Description3!%Description3!%Description3!%Description!%Description3!%Description3!%Description3!%Description3!%Description!%Description3!%Description
${FORMATED_DATE}    ${EMPTY}
#--------------------------------------------------------------------------------------------------------------------------------
*** Test Cases ***
JM70-1040:Sort Context list
    # Set Data
    @{AlphaSort}    Create List    0A_Sort_Context-${FORMATED_DATE}    0B_Sort_Context-${FORMATED_DATE}    0C_Sort_Context-${FORMATED_DATE}    0D_Sort_Context-${FORMATED_DATE}
    @{LastUsedSort}    Create List    ${AlphaSort[1]}    ${AlphaSort[0]}    ${AlphaSort[2]}    ${AlphaSort[3]}
    @{LastUpdateSort}    Create List    ${AlphaSort[2]}    ${AlphaSort[3]}    ${AlphaSort[1]}    ${AlphaSort[0]}
    ${count_of_contexts}    Get Length    ${AlphaSort}
    # Step Of test case
    :FOR    ${context}    IN    @{AlphaSort}
    \    Create New Context    ${context}    Description of ${context}
    \    Verify That The Context That Exist In The List Is    ${context}    Description of ${context}
    Select Context    ${AlphaSort[1]}
    Sort Contexts By    Last Used
    :FOR    ${i}    IN RANGE    ${count_of_contexts}
    \    Verify That Context "${LastUsedSort[${i}]}" Is In "${i+1}" st/nd Rank   
    Update The Context "${AlphaSort[2]}" Without Values
    Sort Contexts By    Last Update  
    :FOR    ${i}    IN RANGE    ${count_of_contexts}
    \    Verify That Context "${LastUpdateSort[${i}]}" Is In "${i+1}" st/nd Rank
    Sort Contexts By    Alphabetical
    :FOR    ${i}    IN RANGE    ${count_of_contexts}
    \    Verify That Context "${AlphaSort[${i}]}" Is In "${i+1}" st/nd Rank 
    # Post condition
    :FOR    ${context}    IN    @{AlphaSort}
    \    Delete Context    ${context}
        
JM70-1029:Delete Context
    Create New Context    Context-${FORMATED_DATE}    Description of delete a Context
    Verify That The Context That Exist In The List Is    Context-${FORMATED_DATE}    Description of delete a Context
    Delete Context    Context-${FORMATED_DATE}
        
JM70-1028:Update Context
    ${contextCount}    Get Length    ${VALID_CONTEXTS}
    :FOR    ${i}    IN RANGE    0    ${contextCount}
    \    Create New Context    Context-${FORMATED_DATE}    Description of update a Context
    \    Update The Context "Context-${FORMATED_DATE}" And "Description of update a Context" With The Values "${VALID_CONTEXTS[${i}]}" And "${VALID_DESCRIPTION[${i}]}" 
    \    Verify That The Context That Exist In The List Is    ${VALID_CONTEXTS[${i}]}    ${VALID_DESCRIPTION[${i}]}
    \    Verify That The Context That Does Not Exist In The List Is    Context-${FORMATED_DATE} 
    # Post condition
    \    Delete Context    ${VALID_CONTEXTS[${i}]}
    
JM70-1131:Update Context with invalid data
    [Tags]    FAILED
    ${contextCount}    Get Length    ${INVALID_CONTEXTS}
    Create New Context    xContext-${FORMATED_DATE}
    :FOR    ${i}    IN RANGE    0    ${contextCount}
    \    Update The Context "xContext-${FORMATED_DATE}" And "${EMPTY}" With The Values "${INVALID_CONTEXTS[${i}]}" And "${INVALID_DESCRIPTION[${i}]}"
    \    Verify That The Warning Massage Is    YOU CANNOT EXCEED 250 CHARACTERS    # We don't have this message (we have created a ticket for that)
    \    Dismiss Context
    # Post condition
    Delete Context    xContext-${FORMATED_DATE}
        
JM70-1036:Update Context without name 
    Create New Context    MyContext-${FORMATED_DATE}
    Update The Context "MyContext-${FORMATED_DATE}" And "${EMPTY}" With The Values "${EMPTY}" And "Description to create Context without name-${FORMATED_DATE}"
    Verify That The Warning Massage Is    No title provided for the map
    Dismiss Context
    Verify That The Context That Does Not Exist In The List Is    ${EMPTY}
    # Post condition
    Delete Context    MyContext-${FORMATED_DATE}
    
JM70-1039:See Context image preview
    Create New Context    Context_image_preview-${FORMATED_DATE}    Description of image preview
    Verify That The Context That Exist In The List Is    Context_image_preview-${FORMATED_DATE}    Description of image preview
    Verify That The Image Preview Is Visible In The Context    Context_image_preview-${FORMATED_DATE}
    # Post condition
    Delete Context    Context_image_preview-${FORMATED_DATE}

JM70-1032:Open Context
    Check The Initial Map View
    Pan The Map    50    -50
    Check The New Map View
    Create New Context    Open_Context-${FORMATED_DATE}    Description of open context
    Verify That The Context That Exist In The List Is    Open_Context-${FORMATED_DATE}    Description of open context
    Reload Page
    Verify That The "Initial Map" Is Displayed
    Select Context    Open_Context-${FORMATED_DATE}
    Close Inner Tab Menu Panel  
    Verify That The "New Map" Is Displayed
    # Post condition
    Delete Context    Open_Context-${FORMATED_DATE}
    
JM70-1031:Filter Context
    # Set Data
    @{filterContext}    Create List    0AD_Filter_Context-${FORMATED_DATE}    0B_Filter_Context-${FORMATED_DATE}    0C_Filter_Context-${FORMATED_DATE}    D_Filter_Context
    # Step Of test case
    :FOR    ${context}    IN    @{filterContext}
    \    Run Keyword If    "${context}"=="${filterContext[1]}"    Create New Context    ${context}    Description of ${context}-D_    ELSE    Create New Context    ${context}    Description of ${context}
    \    Run Keyword If    "${context}"=="${filterContext[1]}"    Verify That The Context That Exist In The List Is    ${context}    Description of ${context}-D_    ELSE    Verify That The Context That Exist In The List Is    ${context}    Description of ${context}    
    Filter Contexts By    0  
    Verify That The Context That Exist In The List Is    ${filterContext[0]}    Description of ${filterContext[0]}
    Verify That The Context That Exist In The List Is    ${filterContext[1]}    Description of ${filterContext[1]}-D_
    Verify That The Context That Exist In The List Is    ${filterContext[2]}    Description of ${filterContext[2]}
    Verify That The Context That Does Not Exist In The List Is    ${filterContext[3]}  
    Filter Contexts By    d_ 
    Verify That The Context That Exist In The List Is    ${filterContext[0]}    Description of ${filterContext[0]}
    Verify That The Context That Exist In The List Is    ${filterContext[1]}    Description of ${filterContext[1]}-D_
    Verify That The Context That Exist In The List Is    ${filterContext[3]}    Description of ${filterContext[3]}
    Verify That The Context That Does Not Exist In The List Is    ${filterContext[2]}
    Filter Contexts By    ${filterContext[0]}
    :FOR    ${context}    IN    @{filterContext}
    \    Run Keyword If    "${context}"=="${filterContext[0]}"    Verify That The Context That Exist In The List Is    ${context}    Description of ${context}    ELSE    Verify That The Context That Does Not Exist In The List Is    ${context}
    Filter Contexts By    ${EMPTY}
    :FOR    ${context}    IN    @{filterContext}
    \    Run Keyword If    "${context}"=="${filterContext[1]}"    Verify That The Context That Exist In The List Is    ${context}    Description of ${context}-D_    ELSE    Verify That The Context That Exist In The List Is    ${context}    Description of ${context}
    # Post condition
    :FOR    ${context}    IN    @{filterContext}
    \    Delete Context    ${context}
    





  

#------------------------------------------------------------------------------------------------------------------------------------------                                                
*** Keywords ***

                   