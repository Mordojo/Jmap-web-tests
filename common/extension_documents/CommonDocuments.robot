*** Settings ***

Documentation     Common keywords for Extension Documents
#---------------------------------------------------------------------------------------------------------------------------------------------
Library		SeleniumLibrary		# Selenium framework
Library    Collections 
Library    BuiltIn
Library    OperatingSystem
#---------------------------------------------------------------------------------------------------------------------------------------------
Resource    ../admin/CommonKeywords.robot
#---------------------------------------------------------------------------------------------------------------------------------------------
*** Keywords ***

Expand Quick Search    
    Click Element    xpath://span[text()='Quick search']

Expand Advanced Search
    Click Element    xpath://span[text()='Advanced search']    

Go Back to the Main Menu
    Click Element    xpath://i[@title='Back to the main menu']

Exist Element on Elements Attribute Table    [Arguments]    ${ELEMENTTEXT}
    Element Text Should Be    xpath://td[text()='${ELEMENTTEXT}']    ${ELEMENTTEXT}

Check that Documents Count is    [Arguments]    ${COUNT}
    Wait Until Element Is Visible    xpath://span[@class='ext-document-icon-count']    
    Element Text Should Be    xpath://span[@class='ext-document-icon-count']    ${COUNT}

Close Mouseover Bubble
    Wait Until Element Is Visible    xpath://a[text()='close']
    Click Element    xpath://a[text()='close']

Open Documents Association List
    Wait Until Element Is Visible    xpath://span[@class='ext-document-icon-count']
    Click Element    xpath://span[@class='ext-document-icon-count']    

The Documents ammount Should Be    [Arguments]    ${COUNT}
    Locator Should Match X Times    xpath://div[@class='ext-doc-list']/div[@class='ext-doc-document']    ${COUNT}
    
The Document Title Should be    [Arguments]    ${TITLE}
    Element Text Should Be    xpath://div[@title='${TITLE}']    ${TITLE}    
    
The Hyperlinks ammount Should Be    [Arguments]    ${COUNT}
    Locator Should Match X Times    //div[@class='ext-doc-list']/div[@class='ext-doc-hyperlink']    ${COUNT}
    
The Hyperlink Title Should Be    [Arguments]    ${TITLE}
    Wait Until Element Is Visible    xpath://a[text()='${TITLE}']    
    Element Text Should Be    xpath://a[text()='${TITLE}']    ${TITLE}    

Start the Download of the Document    [Arguments]    ${DOCUMENT_TITLE}
    Click Link    xpath://a[@title="Download '${DOCUMENT_TITLE}' file"]
    
Check that the Document was downloaded    [Arguments]    ${FILENAME}
    [Documentation]    This keyword check that the given file name exists inside the default download folder of the OS.
    ...    User provide the parameter is the file name. The keyword will locate the file in USERPROFILE/Downloads/File_Name.ext.
    ...    The keyword will assert that the file exist and it's not an empty file. Ater that the file will be removed from the computer
    # ${VARIABLES}=    Get Environment Variables
    ${HOME}=    Get Environment Variable    USERPROFILE
    ${PATH}=    Catenate    SEPARATOR=${/}    ${HOME}    Downloads    ${FILENAME}
    Run Keyword If    '${HEADLESS}'=='${False}'    File Should Exist    ${PATH}
    Run Keyword If    '${HEADLESS}'=='${False}'    File Should Not Be Empty    ${PATH}    
    Run Keyword If    '${HEADLESS}'=='${False}'    Remove File    ${PATH}

Expand / Collapse Document Description    [Arguments]    ${DEPOSITID}    ${DOCUMENTID}
    [Documentation]    Keyword to expand and collapse a document's description using the owner deposit's id and the document's id itself
    Click Element    xpath://i[@id='document-${DEPOSITID}-${DOCUMENTID}-expand-button']  

File System Deposit Name Should be    [Arguments]    ${DEPOSITNAME}
    Element Text Should Be    xpath://div[@class='ext-doc-document-info-column'][text()='${DEPOSITNAME}']    ${DEPOSITNAME}
    
Expand / Collapse Hyperlink Description    [Arguments]    ${DEPOSITID}    ${HYPERLINKID}
    [Documentation]    Keyword to expand and collapse a hyperlink's description using the owner deposit's id and the hyperlink's id itself
    Click Element    xpath://i[@id='hyperlink-${DEPOSITID}-${HYPERLINKID}-expand-button']

Zoom and Select the Element    [Arguments]    ${DEPOSITID}    ${DOCUMENTID}
    [Documentation]    Zoom to the spatial elements associated to a document
    Click Element    xpath://i[@id='document-${DEPOSITID}-${DOCUMENTID}-zoom-button']

Hyperlink Deposit Name Should be    [Arguments]    ${DEPOSITNAME}
    Element Text Should Be    xpath://div[@class='ext-doc-hyperlink-info-column'][text()='${DEPOSITNAME}']    ${DEPOSITNAME}
    
Click on Hyperlink Title    [Arguments]    ${HYPERLINKURL}
    Click Link    xpath://a[@href='${HYPERLINKURL}']
    
Move to Browser's Tab with URL    [Arguments]    ${HYPERLINKURL}
    Select Window    url=${HYPERLINKURL}
    
# ===================================================================================================================================
Open / Close Tab Menu
    Wait Until Element Is Visible    xpath://*[@id='TabMenuControlTrigger']
    Click Element		xpath://*[@id='TabMenuControlTrigger']

Go to Layers tab
    Click Link    xpath://*[@class='innerTabMenuPanel']//a[text()='Layers']
    
Go to Search tab
    Click Link    xpath://*[@class='innerTabMenuPanel']//a[text()='Search']
    
Go to My maps tab
    Click Link    xpath://*[@class='innerTabMenuPanel']//a[text()='My maps']
    
Go to Documents tab
    Click Link    xpath://*[@class='innerTabMenuPanel']//a[text()='Documents']

Type Keywords to Perform a Quick Search by Title or Description    [Arguments]    ${KEYWORD}    ${ISEXPANDED}
    [Documentation]    {EXPANDED}: Indicates if the Quick Search is expanded or not
    Run Keyword If    '${ISEXPANDED}'=='${False}'    Input Text    xpath://input[@placeholder='by title and description']    ${KEYWORD}
    Run Keyword If    '${ISEXPANDED}'=='${True}'    Input Text    xpath://input[@placeholder='Search by title and description']    ${KEYWORD}

Type Keywords on Textfield    [Arguments]    ${COMPONENT}    ${KEYWORD}
    [Documentation]    Method to enter keywords into input components
    Input Text    xpath://input[@placeholder='${COMPONENT}']    ${KEYWORD}

Is Textfield Value Correct    [Arguments]    ${COMPONENT}    ${VALUE}
    Textfield Value Should Be    xpath://input[@placeholder='${COMPONENT}']    ${VALUE}
    
Click on Button OK
    Wait Until Element Is Enabled    xpath://div[text()='OK']    
    Wait Until Keyword Succeeds    0.30    5    Click Element    xpath://div[text()='OK']    

Check the Box Search Only in Displayed Extent
    Click Element    xpath:(//i[@class='material-icons ext-doc-check-box '])[1]

Is Search Only in Displayed Extent Unselected
    Element Should Not Be Visible    xpath:(//i[@class='material-icons ext-doc-check-box '])[1][text()='done']
    
Check the Box Search Only in Current Selection
    Click Element    xpath:(//i[@class='material-icons ext-doc-check-box '])[2]
    
Is Search Only in Current Selection Unselected
    Element Should Not Be Visible    xpath:(//i[@class='material-icons ext-doc-check-box '])[2][text()='done']

Check That the Document Property Exist in Document List    [Arguments]    ${DOCUMENTPROPERTY}
    Wait Until Element Is Visible    xpath:(//div[@class='ext-doc-document-info-column'][text()='${DOCUMENTPROPERTY}'])[1]    timeout=10
    Element Text Should Be    xpath:(//div[@class='ext-doc-document-info-column'][text()='${DOCUMENTPROPERTY}'])[1]    ${DOCUMENTPROPERTY}    

Perform Quick Search
    Click Element    xpath://div[text()='Search']

Clear Quick Search
    [Documentation]    Clicks on clear button of the Quick search form
    Click Element    xpath://div[text()='Clear']

Search Button Should be Disabled
    Page Should Contain Element    xpath://div[@class='ext-doc-search-basic-button-search disabled']

Search Button Should be Enabled
    Page Should Contain Element    xpath://div[@class='ext-doc-search-basic-button-search ']

Clear Button Should be Disabled
    Page Should Contain Element    xpath://div[@class='ext-doc-search-basic-button-clear disabled']
    
Perform Advanced Search
    Click Button    xpath://button[text()='Search']

Advanced Search Button Should be Enabled
    Element Should Be Enabled    xpath://button[text()='Search']
    
Clear Advanced Search
    [Documentation]    Clicks on clear button of the Advanced search form
    Click Button    xpath://button[text()='Clear']

Advanced Clear Button Should be Disabled
    Element Should Be Disabled    xpath://button[text()='Clear']

Advanced Clear Button Should be Enabled
    Element Should Be Enabled    xpath://button[text()='Clear']

Select the Deposit on the List    [Arguments]    ${DEPOSIT}
    [Documentation]    Select the deposit provided as parameter in the deposits list
    Click Element    xpath://div[text()='Search in all deposits']
    Click Element    xpath://div[text()='${DEPOSIT}']

Select a Deposit on the List    [Arguments]    ${DEPOSIT}
    [Documentation]    Select the deposit provided as parameter in the deposits list
    Click Element    xpath://div[text()='Select a deposit']
    Click Element    xpath://div[text()='${DEPOSIT}']

Select the Form    [Arguments]    ${FORM}
    [Documentation]    Select the advanced form to perform an advanced search
    Click Element    xpath://div[text()='Select a form']
    Click Element    xpath://div[text()='${FORM}']

Clear Deposits List
    [Documentation]    Remove the selected deposit on the list
    Click Element    xpath://div[@aria-hidden='true'][1]

Clear the Deposits List
    Click Element    xpath:/html/body/div/div[2]/div[1]/div/div/div[2]/div[4]/div/div/div[2]/div[3]/div/div[2]/div[1]    

Deposit List Should be Empty
    Element Should Be Visible    xpath://div[text()='Select a deposit']

Clear Forms List
    Click Element    xpath:/html/body/div/div[2]/div[1]/div/div/div[2]/div[4]/div/div/div[2]/div[4]/div/div[2]/div[1]
    
Is the Deposit Selected    [Arguments]    ${DEPOSIT}
    Element Should Not Be Visible    xpath://div[text()='${DEPOSIT}']

Is the Advanced Form Selected    [Arguments]    ${FORM}
    Element Should Not Be Visible    xpath://div[text()='${FORM}']
    