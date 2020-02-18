*** Settings ***

Documentation     Tests stadistics creation in JMap Admin 7.0
#-------------------------------------------------------------------------------------------------------------------------------------------------
Library		SeleniumLibrary		# Selenium framework
#-------------------------------------------------------------------------------------------------------------------------------------------------
Resource    ../../../../common/CommonLogin.robot
Resource    ../../../../common/admin/CommonKeywords.robot
Resource    ../../../../common/rest_api/CommonRestApi.robot
Resource    ../../../../common/statistics/CommonStatistics.robot
Resource    ../../../../common/extension_documents/CommonDocuments.robot
#------------------------------------------------------------------------------------------------------------------------------------------------    
Suite Setup    Login JMap Admin    administrator    ${EMPTY}    English    ${LOGIN URL}    ${DELAY}
Suite Teardown		Logout JMap    ${True}
#------------------------------------------------------------------------------------------------------------------------------------------------
*** Variables ***

${DELAY}    0.5
${LOGIN URL}      http://192.168.0.25:8080/jmapadmin/login.jsf
${PROJECT_NAME}    The World
${PROJECT_ID}    0
${LAYER_ID}    7
${CONTEXT_ID}    1304358391980
${LAYER_NAME1}    Lakes
${LAYER_NAME2}    Countries
${LAYER_NAME3}    Cities
${CONTEXT_NAME1}    Population density 
${CONTEXT_NAME2}    Population of main cities 
${CONTEXT_NAME3}    Population growth rate 
${COUNT}    ${EMPTY}    
${USER}    administrator
#-------------------------------------------------------------------------------------------------------------------------------------------------
*** Test Cases ***

Show Project Statistics from All Users for Current Month  
    [Documentation]    User go to Usage Statistics page in JMap Admin. In the project tab user select current initial and final date, 
    ...    select all user in the filter and click Apply button.   
    Show Project Statistics from All Users for Current Month  
    
Show Project Statistics from All Users for Past Month  
    [Documentation]    User go to Usage Statistics page in JMap Admin. In the project tab user select past initial and final date, 
    ...    select all user in the filter and click Apply button.     
    Show Project Statistics from All Users for Past Month  
    
Show Project Statistics with Invalid Date  
    [Documentation]    User go to Usage Statistics page in JMap Admin. In the project tab user select past initial date bigger than final date, 
    ...   select all user in the filter and click Apply button.     
    Show Project Statistics with Invalid Date
    
Show Project Statistics from Specific User for Current Month
    [Documentation]    User go to Usage Statistics page in JMap Admin. In the project tab user select current initial and final date, 
    ...    select administrator user filter to show only the statistics from administrator user and click Apply button.        
    Show Project Statistics from Specific Users for Current Month    ${USER}

Show Project Statistics from Specific User for Past Month
    [Documentation]     User go to Usage Statistics page in JMap Admin. In the project tab user select past initial and final date, 
    ...    select administrator user filter to show only the statistics from administrator user and click Apply button.        
    Show Project Statistics from Specific Users for Past Month    ${USER}
    
Clean Project Statistics
    [Documentation]    User clik on Reset Button and Statistics get deleted
    Clean Project Statistics

Export Project Statistics to Excel
    [Documentation]    User click on Excel Button to export the project statistics to Excel file
    ${MONTH}    Get Time    format=month
    ${YEAR}    Get Time    format=year    
    Export Project Statistics to Excel    ${MONTH}    ${YEAR}
    
Export Project Statistics to PDF
    [Documentation]    User click on PDF Button to export the project statistics to PDF file
    ${MONTH}    Get Time    format=month
    ${YEAR}    Get Time    format=year
    Export Project Statistics to PDF    ${MONTH}    ${YEAR}    
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   

Show Layer Statistics from All Users for Current Month 
    [Documentation]    User go to Usage Statistics page in JMap Admin. In the layer tab user select current initial and final date, 
    ...    select all user filter and click Apply button    
    Show Layer Statistics from All Users for Current Month
    
Show Layer Statistics from All Users for Past Month 
    [Documentation]    User go to Usage Statistics page in JMap Admin. In the layer tab user select past initial and final date, 
    ...    select all user filter and click Apply button    
    Show Layer Statistics from All Users for Past Month
    
Show Layer Statistics from Specific User for Current Month
    [Documentation]    User go to Usage Statistics page in JMap Admin. In the layer tab user select current initial and final date, 
    ...    select given user in filter and click Apply button   
    Show Layer Statistics from Specific Users for Current Month    ${USER}

Show Layer Statistics from Specific User for Past Month
    [Documentation]    User go to Usage Statistics page in JMap Admin. In the layer tab user select past initial and final date, 
    ...    select given user in filter and click Apply button  
    Show Layer Statistics from Specific Users for Past Month    ${USER}
    
Clean Layer Statistics
    [Documentation]    User clik on Reset Button and Statistics get deleted
    Clean Layer Statistics

Export Layer Statistics to Excel
    [Documentation]    User click on Excel Button to export the layers statistics to Excel file
    ${MONTH}    Get Time    format=month
    ${YEAR}    Get Time    format=year
    Export Layer Statistics to Excel    ${MONTH}    ${YEAR}
    
Export Layer Statistics to PDF
    [Documentation]    User click on PDF Button to export the layers statistics to PDF file
    ${MONTH}    Get Time    format=month
    ${YEAR}    Get Time    format=year
    Export Layer Statistics to PDF    ${MONTH}    ${YEAR}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    

Show Context Statistics Created by Users for Current Month 
    [Documentation]    User go to Usage Statistics page in JMap Admin. In the context tab user select current initial and final date, 
    ...    select given user in filter and click Apply button
    Show Context Statistics Created by Users for Current Month    ${USER}
    
Show Context Statistics Used by Project for Current Month 
    [Documentation]    User go to Usage Statistics page in JMap Admin. In the context tab user select current initial and final date,
    ...    select used by project filter to show only the context statistics
    ...    used by that project and click Apply button    
    Show Context Statistics Used by Project for Current Month        

Show Context Statistics Used by Project and User for Current Month 
    [Documentation]    User go to Usage Statistics page in JMap Admin. In the context tab user select current initial and final date,
    ...    select used by project and user filter to show only the context statistics
    ...    used by that project and user and  click Apply button    
    Show Context Statistics Used by Project and User for Current Month    ${USER}

Show Context Statistics Created by Users for Past Month 
    [Documentation]    User go to Usage Statistics page in JMap Admin. In the context tab user select past initial and final date, 
    ...    select given user in filter and click Apply button
    Show Context Statistics Created by Users for Past Month    ${USER}
    
Show Context Statistics Used by Project for Past Month 
    [Documentation]    User go to Usage Statistics page in JMap Admin. In the context tab user select past initial and final date,
    ...    select used by project filter to show only the context statistics
    ...    used by that project and click Apply button            
    Show Context Statistics Used by Project for Past Month             

Show Context Statistics Used by Project and User for Past Month 
    [Documentation]   User go to Usage Statistics page in JMap Admin. In the context tab user select past initial and final date,
    ...    select used by project and user filter to show only the context statistics
    ...    used by that project and user and  click Apply button            
    Show Context Statistics Used by Project and User for Past Month     ${USER}
        
Clean Context Statistics
    [Documentation]    User clik on Reset Button and Statistics get deleted
    Clean Context Statistics

Export Context Created by User Statistics to Excel
    [Documentation]    User click on Excel Button to export the layers statistics to Excel file
    ${MONTH}    Get Time    format=month
    ${YEAR}    Get Time    format=year
    Export Context Created by User Statistics to Excel    ${MONTH}    ${YEAR}
    
Export Context Created by User Statistics to PDF
    [Documentation]    User click on PDF Button to export the layers statistics to PDF file
    ${MONTH}    Get Time    format=month
    ${YEAR}    Get Time    format=year
    Export Context Created by User Statistics to PDF    ${MONTH}    ${YEAR}

Export Context Used by Project Statistics to Excel
    [Documentation]    User click on Excel Button to export the layers statistics to Excel file
    ${MONTH}    Get Time    format=month
    ${YEAR}    Get Time    format=year
    Export Context Used by Project Statistics to Excel    ${MONTH}    ${YEAR}
    
Export Context Used by Project Statistics to PDF
    [Documentation]    User click on PDF Button to export the layers statistics to PDF file
    ${MONTH}    Get Time    format=month
    ${YEAR}    Get Time    format=year
    Export Context Used by Project Statistics to PDF    ${MONTH}    ${YEAR}

Export Context Used by Project and User Statistics to Excel
    [Documentation]    User click on Excel Button to export the layers statistics to Excel file
    ${MONTH}    Get Time    format=month
    ${YEAR}    Get Time    format=year
    Export Context Used by Project and User Statistics to Excel    ${MONTH}    ${YEAR}
    
Export Context Used by Project and User Statistics to PDF
    [Documentation]    User click on PDF Button to export the layers statistics to PDF file
    ${MONTH}    Get Time    format=month
    ${YEAR}    Get Time    format=year
    Export Context Used by Project and User Statistics to PDF    ${MONTH}    ${YEAR}
#------------------------------------------------------------------------------------------------------------------------------------------------------    
*** Keywords ***

Show Project Statistics from All Users for Current Month
    ${INITIALMONTH}=    Get Current Month
    ${YEAR}=    Get Current Year 
    ${CRITERIA}    Catenate    {"projectId": ${PROJECT_ID}, "targetId": ${PROJECT_ID}, "targetType": "PROJECT", "action": "OPEN", "year": ${YEAR} , "month": ${INITIALMONTH}}
    Open Admin Session    administrator    ${EMPTY}
    ${COUNT}=    Get Counter Statistics in Monthly    ${CRITERIA}
    Show Project Statistics    All    ${INITIALMONTH}    ${INITIALMONTH}    ${YEAR}
    Check Project Statistics Exist    ${PROJECT_NAME}    ${COUNT}        
    Close Session    ${ADMINSESSIONID}

Show Project Statistics from All Users for Past Month
    ${PASTMONTH}=    Get Past Month    
    ${YEAR}=    Get Past Year                 
    ${CRITERIA}    Catenate    {"projectId": ${PROJECT_ID}, "targetId": ${PROJECT_ID}, "targetType": "PROJECT", "action": "OPEN", "year": ${YEAR}, "month": ${PASTMONTH}}
    Open Admin Session    administrator    ${EMPTY}
    ${COUNT}=    Get Counter Statistics in Monthly    ${CRITERIA}
    Show Project Statistics    All    ${PASTMONTH}    ${PASTMONTH}    ${YEAR}
    Check Project Statistics Exist    ${PROJECT_NAME}    ${COUNT}        
    Close Session    ${ADMINSESSIONID}
    
Show Project Statistics with Invalid date
    ${INITIALMONTH}=    Get Current Month
    ${PASTMONTH}=    Get Past Month    
    ${YEAR}=    Get Current Year                 
    Show Project Statistics    All    ${INITIALMONTH}    ${PASTMONTH}    ${YEAR}
    Wait Until Element Is Visible    xpath://span[@id='theForm:tabView:usageStatisticProjectDateFromError_error-detail']    timeout=5s
    Element Should Be Visible    xpath://span[@id='theForm:tabView:usageStatisticProjectDateFromError_error-detail']               
    
Show Project Statistics from Specific Users for Current Month    [Arguments]    ${USER}
    ${INITIALMONTH}=    Get Current Month
    ${YEAR}=    Get Current Year
    ${CRITERIA}    Catenate    {"userId": "${USER}","projectId": ${PROJECT_ID}, "targetId": ${PROJECT_ID}, "targetType": "PROJECT", "action": "OPEN", "year": ${YEAR}, "month": ${INITIALMONTH}}
    Open Admin Session    administrator    ${EMPTY}
    ${COUNT}=    Get Counter Statistics in Monthly    ${CRITERIA}    
    Show Project Statistics    ${USER}    ${INITIALMONTH}    ${INITIALMONTH}    ${YEAR}    
    Check Project Statistics Exist    ${PROJECT_NAME}    ${COUNT}
    Close Session    ${ADMINSESSIONID}

Show Project Statistics from Specific Users for Past Month    [Arguments]    ${USER}
    ${PASTMONTH}=    Get Past Month    
    ${YEAR}=    Get Past Year
    ${CRITERIA}    Catenate    {"userId": "${USER}","projectId": ${PROJECT_ID}, "targetId": ${PROJECT_ID}, "targetType": "PROJECT", "action": "OPEN", "year": ${YEAR}, "month": ${PASTMONTH}}
    Open Admin Session    administrator    ${EMPTY}
    ${COUNT}=    Get Counter Statistics in Monthly    ${CRITERIA}    
    Show Project Statistics    ${USER}    ${PASTMONTH}    ${PASTMONTH}    ${YEAR}    
    Check Project Statistics Exist    ${PROJECT_NAME}    ${COUNT}
    Close Session    ${ADMINSESSIONID}
    
Clean Project Statistics
    ${INITIALMONTH}=    Get Current Month
    ${YEAR}=    Get Current Year
    Show Project Statistics    All    ${INITIALMONTH}    ${INITIALMONTH}    ${YEAR}
    Reset Statistics
    Check if Statistics are Empty     

Export Project Statistics to Excel    [Arguments]    ${MONTH}    ${YEAR}
    Show Project Statistics    All    ${MONTH}    ${MONTH}    ${YEAR}
    Download Statistics    Excel
    Check that the Document was downloaded    Project_opened_by_allUsers_${MONTH}-${YEAR}_${MONTH}-${YEAR}.xls    

Export Project Statistics to PDF    [Arguments]    ${MONTH}    ${YEAR}
    Show Project Statistics    All    ${MONTH}    ${MONTH}    ${YEAR}
    Download Statistics    PDF
    Check that the Document was downloaded    Project_opened_by_allUsers_${MONTH}-${YEAR}_${MONTH}-${YEAR}.pdf            

Show Layer Statistics from All Users for Current Month
    ${INITIALMONTH}=    Get Current Month
    ${YEAR}=    Get Current Year
    ${CRITERIA}    Catenate    {"projectId": ${PROJECT_ID}, "targetId": ${LAYER_ID}, "targetType": "LAYER", "action": "VIEW", "year": ${YEAR} , "month": ${INITIALMONTH}}
    Open Admin Session    administrator    ${EMPTY}
    ${COUNT}=    Get Counter Statistics in Monthly    ${CRITERIA}    
    Show Layer Statistics    All    ${PROJECT_NAME}    ${INITIALMONTH}    ${INITIALMONTH}    ${YEAR}    
    Check Layer Statistics Exist    ${LAYER_NAME1}    ${COUNT}
    Check Layer Statistics Exist    ${LAYER_NAME2}    ${COUNT}
    Check Layer Statistics Exist    ${LAYER_NAME3}    ${COUNT}
    Close Session    ${ADMINSESSIONID}

Show Layer Statistics from All Users for Past Month
    ${PASTMONTH}=    Get Past Month    
    ${YEAR}=    Get Past Year
    ${CRITERIA}    Catenate    {"projectId": ${PROJECT_ID}, "targetId": ${LAYER_ID}, "targetType": "LAYER", "action": "VIEW", "year": ${YEAR} , "month": ${PASTMONTH}}
    Open Admin Session    administrator    ${EMPTY}
    ${COUNT}=    Get Counter Statistics in Monthly    ${CRITERIA}    
    Show Layer Statistics    All    ${PROJECT_NAME}    ${PASTMONTH}    ${PASTMONTH}    ${YEAR}    
    Check Layer Statistics Exist    ${LAYER_NAME1}    ${COUNT}
    Check Layer Statistics Exist    ${LAYER_NAME2}    ${COUNT}
    Check Layer Statistics Exist    ${LAYER_NAME3}    ${COUNT}
    Close Session    ${ADMINSESSIONID}

Show Layer Statistics from Specific Users for Current Month    [Arguments]    ${USER}
    ${INITIALMONTH}=    Get Current Month
    ${YEAR}=    Get Current Year
    ${CRITERIA}    Catenate    {"userId": "${USER}","projectId": ${PROJECT_ID}, "targetId": ${LAYER_ID}, "targetType": "LAYER", "action": "VIEW", "year": ${YEAR} , "month": ${INITIALMONTH}}
    Open Admin Session    administrator    ${EMPTY}
    ${COUNT}=    Get Counter Statistics in Monthly    ${CRITERIA}    
    Show Layer Statistics    ${USER}    ${PROJECT_NAME}    ${INITIALMONTH}    ${INITIALMONTH}    ${YEAR}    
    Check Layer Statistics Exist    ${LAYER_NAME1}    ${COUNT}
    Check Layer Statistics Exist    ${LAYER_NAME2}    ${COUNT}
    Check Layer Statistics Exist    ${LAYER_NAME3}    ${COUNT}
    Close Session    ${ADMINSESSIONID}

Show Layer Statistics from Specific Users for Past Month    [Arguments]    ${USER}
    ${PASTMONTH}=    Get Past Month    
    ${YEAR}=    Get Past Year
    ${CRITERIA}    Catenate    {"userId": "${USER}","projectId": ${PROJECT_ID}, "targetId": ${LAYER_ID}, "targetType": "LAYER", "action": "VIEW", "year": ${YEAR} , "month": ${PASTMONTH}}
    Open Admin Session    administrator    ${EMPTY}
    ${COUNT}=    Get Counter Statistics in Monthly    ${CRITERIA}    
    Show Layer Statistics    ${USER}    ${PROJECT_NAME}    ${PASTMONTH}    ${PASTMONTH}    ${YEAR}    
    Check Layer Statistics Exist    ${LAYER_NAME1}    ${COUNT}
    Check Layer Statistics Exist    ${LAYER_NAME2}    ${COUNT}
    Check Layer Statistics Exist    ${LAYER_NAME3}    ${COUNT}
    Close Session    ${ADMINSESSIONID}

Clean Layer Statistics
    ${INITIALMONTH}=    Get Current Month
    ${YEAR}=    Get Current Year
    Show Layer Statistics    All    ${PROJECT_NAME}    ${INITIALMONTH}    ${INITIALMONTH}    ${YEAR}
    Reset Statistics
    Check if Statistics are Empty     

Export Layer Statistics to Excel    [Arguments]    ${MONTH}    ${YEAR}   
    Show Layer Statistics    All    ${PROJECT_NAME}    ${MONTH}    ${MONTH}    ${YEAR}
    Download Statistics    Excel
    Check that the Document was downloaded    Layer_viewed_by_allUsers_${MONTH}-${YEAR}_${MONTH}-${YEAR}.xls    

Export Layer Statistics to PDF    [Arguments]    ${MONTH}    ${YEAR}   
    Show Layer Statistics    All    ${PROJECT_NAME}    ${MONTH}    ${MONTH}    ${YEAR}
    Download Statistics    PDF
    Check that the Document was downloaded    Layer_viewed_by_allUsers_${MONTH}-${YEAR}_${MONTH}-${YEAR}.pdf   

Show Context Statistics Created by Users for Current Month     [Arguments]    ${USER}
    ${INITIALMONTH}=    Get Current Month
    ${YEAR}=    Get Current Year
    ${CRITERIA}    Catenate    {"userId": "${USER}","projectId": ${PROJECT_ID}, "targetType": "CONTEXT", "action": "CREATE", "year": ${YEAR}, "month": ${INITIALMONTH}}    
    Open Admin Session    administrator    ${EMPTY}
    ${COUNT}=    Get Counter Statistics in Monthly    ${CRITERIA}    
    Show Context Statistics    ${USER}    Created by user    ${INITIALMONTH}    ${INITIALMONTH}    ${YEAR}    
    Check Context Statistics Exist by User    ${PROJECT_NAME}    ${COUNT}
    Close Session    ${ADMINSESSIONID}

Show Context Statistics Used by Project for Current Month
    ${INITIALMONTH}=    Get Current Month
    ${YEAR}=    Get Current Year
    ${CRITERIA}    Catenate    {"projectId": ${PROJECT_ID}, "targetId": ${CONTEXT_ID}, "targetType": "CONTEXT", "action": "VIEW", "year": ${YEAR}, "month": ${INITIALMONTH}} 
    Open Admin Session    administrator    ${EMPTY}
    ${COUNT}=    Get Counter Statistics in Monthly    ${CRITERIA}    
    Show Context Statistics by Project    Public context used, by project    ${INITIALMONTH}    ${INITIALMONTH}    ${YEAR}    
    Check Context Statistics Exist    ${PROJECT_NAME}    ${CONTEXT_NAME1}    ${COUNT}
    Check Context Statistics Exist    ${PROJECT_NAME}    ${CONTEXT_NAME2}    ${COUNT} 
    Check Context Statistics Exist    ${PROJECT_NAME}    ${CONTEXT_NAME3}    ${COUNT}     
    Close Session    ${ADMINSESSIONID}
    
Show Context Statistics Used by Project and User for Current Month    [Arguments]    ${USER}
    ${INITIALMONTH}=    Get Current Month
    ${YEAR}=    Get Current Year
    ${CRITERIA}    Catenate    {"userId": "${USER}","projectId": ${PROJECT_ID}, "targetId": ${CONTEXT_ID}, "targetType": "CONTEXT", "action": "VIEW", "year": ${YEAR}, "month": ${INITIALMONTH}} 
    Open Admin Session    administrator    ${EMPTY}
    ${COUNT}=    Get Counter Statistics in Monthly    ${CRITERIA}        
    Show Context Statistics    ${USER}    Public context used, by project and user    ${INITIALMONTH}    ${INITIALMONTH}    ${YEAR}    
    Check Context Statistics Exist    ${PROJECT_NAME}    ${CONTEXT_NAME1}    ${COUNT}
    Check Context Statistics Exist    ${PROJECT_NAME}    ${EMPTY}    ${COUNT} 
    Check Context Statistics Exist    ${PROJECT_NAME}    ${EMPTY}    ${COUNT}
    Close Session    ${ADMINSESSIONID}

Show Context Statistics Created by Users for Past Month     [Arguments]    ${USER}
    ${PASTMONTH}=    Get Past Month    
    ${YEAR}=    Get Past Year
    ${CRITERIA}    Catenate    {"userId": "${USER}","projectId": ${PROJECT_ID}, "targetType": "CONTEXT", "action": "CREATE", "year": ${YEAR}, "month": ${PASTMONTH}}    
    Open Admin Session    administrator    ${EMPTY}
    ${COUNT}=    Get Counter Statistics in Monthly    ${CRITERIA}    
    Show Context Statistics    ${USER}    Created by user    ${PASTMONTH}    ${PASTMONTH}    ${YEAR}    
    Check Context Statistics Exist by User    ${PROJECT_NAME}    ${COUNT}
    Close Session    ${ADMINSESSIONID}

Show Context Statistics Used by Project for Past Month
    ${PASTMONTH}=    Get Past Month    
    ${YEAR}=    Get Past Year
    ${CRITERIA}    Catenate    {"projectId": ${PROJECT_ID}, "targetId": ${CONTEXT_ID}, "targetType": "CONTEXT", "action": "VIEW", "year": ${YEAR}, "month": ${PASTMONTH}} 
    Open Admin Session    administrator    ${EMPTY}
    ${COUNT}=    Get Counter Statistics in Monthly    ${CRITERIA}    
    Show Context Statistics by Project    Public context used, by project    ${PASTMONTH}    ${PASTMONTH}    ${YEAR}    
    Check Context Statistics Exist    ${PROJECT_NAME}    ${CONTEXT_NAME1}    ${COUNT}
    Check Context Statistics Exist    ${PROJECT_NAME}    ${CONTEXT_NAME2}    ${COUNT} 
    Check Context Statistics Exist    ${PROJECT_NAME}    ${CONTEXT_NAME3}    ${COUNT}     
    Close Session    ${ADMINSESSIONID}
    
Show Context Statistics Used by Project and User for Past Month    [Arguments]    ${USER}
    ${PASTMONTH}=    Get Past Month    
    ${YEAR}=    Get Past Year
    ${CRITERIA}    Catenate    {"userId": "${USER}","projectId": ${PROJECT_ID}, "targetId": ${CONTEXT_ID}, "targetType": "CONTEXT", "action": "VIEW", "year": ${YEAR}, "month": ${PASTMONTH}} 
    Open Admin Session    administrator    ${EMPTY}
    ${COUNT}=    Get Counter Statistics in Monthly    ${CRITERIA}        
    Show Context Statistics    ${USER}    Public context used, by project and user    ${PASTMONTH}    ${PASTMONTH}    ${YEAR}    
    Check Context Statistics Exist    ${PROJECT_NAME}    ${CONTEXT_NAME1}    ${COUNT}
    Check Context Statistics Exist    ${PROJECT_NAME}    ${CONTEXT_NAME2}    ${COUNT} 
    Check Context Statistics Exist    ${PROJECT_NAME}    ${CONTEXT_NAME3}    ${COUNT}
    Close Session    ${ADMINSESSIONID}

Clean Context Statistics
    ${INITIALMONTH}=    Get Current Month
    ${YEAR}=    Get Current Year   
    Show Context Statistics    ${USER}    Created by user    ${INITIALMONTH}    ${INITIALMONTH}    ${YEAR}
    Reset Statistics
    Check if Statistics are Empty     

Export Context Created by User Statistics to Excel    [Arguments]    ${MONTH}    ${YEAR}   
    Show Context Statistics    ${USER}    Created by user    ${MONTH}    ${MONTH}    ${YEAR}
    Download Statistics    Excel
    ${DOC}=    Catenate    Context_created_by_${USER}_${MONTH}-${YEAR}_${MONTH}-${YEAR}.xls    
    Check that the Document was downloaded    ${DOC}   

Export Context Created by User Statistics to PDF    [Arguments]    ${MONTH}    ${YEAR}   
    Show Context Statistics    ${USER}    Created by user    ${MONTH}    ${MONTH}    ${YEAR}
    Download Statistics    PDF
    ${DOC}=    Catenate    Context_created_by_${USER}_${MONTH}-${YEAR}_${MONTH}-${YEAR}.pdf    
    Check that the Document was downloaded    ${DOC}
    
Export Context Used by Project Statistics to Excel    [Arguments]    ${MONTH}    ${YEAR}   
    Show Context Statistics by Project    Public context used, by project    ${MONTH}    ${MONTH}    ${YEAR}
    Download Statistics    Excel        
    Check that the Document was downloaded    Context_used_by_project_${MONTH}-${YEAR}_${MONTH}-${YEAR}.xls   

Export Context Used by Project Statistics to PDF    [Arguments]    ${MONTH}    ${YEAR}   
    Show Context Statistics by Project    Public context used, by project    ${MONTH}    ${MONTH}    ${YEAR}
    Download Statistics    PDF        
    Check that the Document was downloaded    Context_used_by_project_${MONTH}-${YEAR}_${MONTH}-${YEAR}.pdf
    
Export Context Used by Project and User Statistics to Excel    [Arguments]    ${MONTH}    ${YEAR}   
    Show Context Statistics    ${USER}    Public context used, by project and user    ${MONTH}    ${MONTH}    ${YEAR}
    Download Statistics    Excel        
    Check that the Document was downloaded    Context_used_by_${MONTH}-${YEAR}_${MONTH}-${YEAR}.xls   

Export Context Used by Project and User Statistics to PDF    [Arguments]    ${MONTH}    ${YEAR}   
    Show Context Statistics    ${USER}    Public context used, by project and user    ${MONTH}    ${MONTH}    ${YEAR}
    Download Statistics    PDF       
    ${DOC}=    Catenate    Context_used_by_${USER}_${MONTH}-${YEAR}_${MONTH}-${YEAR}.pdf    
    Check that the Document was downloaded    ${DOC}
    
Get Current Month
    [Documentation]    TC to obtain the current mounth
    ${INITIALMONTH}    Get Time    format=month
    ${INITIALMONTH}=    Convert To Integer    ${INITIALMONTH}
    [Return]    ${INITIALMONTH}
    
Get Current Year
    [Documentation]    TC to obtain the current year
    ${YEAR}    Get Time    format=year
    ${YEAR}=    Convert To Integer    ${YEAR}
    [Return]    ${YEAR}     
    
Get Past Month
    [Documentation]    TC to obtain the previous mounth
    ${MONTH}    Get Time    format=month
    ${INITIALMONTH}=    Convert To Integer    ${MONTH}           
    ${PASTMONTH}=    Set Variable If    ${INITIALMONTH}!=1    ${INITIALMONTH-1}    12
    [Return]    ${PASTMONTH}
    
Get Past Year
    [Documentation]    TC to obtain the previous year
    ${LASTMONTH}=    Get Current Month    
    ${ACTUALYEAR}    Get Time    format=year
    ${ACTUALYEAR}=    Convert To Integer    ${ACTUALYEAR}
    ${YEAR}=    Set Variable If    ${LASTMONTH}==1    ${ACTUALYEAR-1}    ${ACTUALYEAR}            
    [Return]    ${YEAR}         