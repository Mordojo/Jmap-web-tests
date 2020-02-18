*** Settings ***

Documentation    Tests for extention documents in JMap 7
#---------------------------------------------------------------------------------------------------------------------------------------------------------
Library    SeleniumLibrary
Library    BuiltIn
#---------------------------------------------------------------------------------------------------------------------------------------------------------
Resource    ../../../common/CommonLogin.robot
Resource    ../../../common/extension_documents/CommonDocuments.robot
#---------------------------------------------------------------------------------------------------------------------------------------------------------
Suite Setup    Login JMap Web    administrator    ${EMPTY}     ${LOGIN URL}    ${DELAY}
Test Teardown    Run Keyword If Test Failed    Reload Page
Suite Teardown    Logout JMap Web    administrator    ${True}
#---------------------------------------------------------------------------------------------------------------------------------------------------------
*** Variable ***

${LOGIN URL}      http://192.168.0.59:8080/World_Web/login.jsp
${JMAP URL}      http://192.168.0.59:8080/World_Web/index.jsp
${DELAY}		0.4
@{CANADA}    Create List    -103.14287979423278    59.7193554942328
@{AUSTRALIA}    Create List    116.19696181    -25.49939236
@{GREENLAND}    Create List    -45.873350689999995    72.58654514
${CANADA_ELEMENTS}    3
${GREENLAND_ELEMENTS}    2
${GREENLAND_DOCUMENTS}    1
${GREENLAND_HYPERLINKS}    1
${FILESYSTEMDEPOT}    1
${FILESYSTEMNAME}    JFS
${HYPERLINKDEPOT}    2
${HYPERLINKNAME}    Hyperlink
${PDFID}    1    #LOTUS-ILMFS60_61.PDF
${TXTID}    4
${PPSID}    3
${HYPERLINKID}    1    #https://translate.google.com/
${HYPERLINKURL}    https://translate.google.com/
#---------------------------------------------------------------------------------------------------------------------------------------------------------
*** Test Cases ***

Show Document(s) and Hyperlink(s) in mouseover
    [Documentation]     1.- User click on an spatial element on the map that have associated documents or hyperlinks
    ...    2.- Mouseover is showed with the icon of the documents indicating the amount of documents or hyperlinks
    Show Document(s) and Hyperlink(s) in mouseover    ${CANADA_ELEMENTS}    @{CANADA}
    Close Mouseover Bubble

List Document or Hyperlink summary in the layer list
    [Documentation]     1.- User click on an spatial element on the map that have associated documents
    ...    2.- Mouseover is showed with the icon of the documents indicating the amount of documents
    ...    3.- User click on the icon in the mouseover and a summarized list of the associated documents show in the layer list 
    List Document or Hyperlink summary in the layer list

List Document or Hyperlink descriptions in the layer list
    [Documentation]     User click over the document or hyperlink summary in the layer list
    ...    The entire description of the document or hyperlink appear
    List Document or Hyperlink descriptions in the layer list

Download document after Listing
    [Documentation]     1.- User click on download icon in the document list
    ...    2.- The document can be download
    Download document after Listing

Navigate to Hyperlink
    [Documentation]     User click on the link in the hyperlink
    ...    A new window or tab show up with the link page
    Navigate to Hyperlink
    
Perform Documents Quick Search
    [Documentation]    Returns the documents that title or description match the search criteria
    Perform Documents Quick Search

Perform Documents Quick Search in Current Extent
    [Documentation]    Returns the documents that title or description match the search criteria and are visibles in the current extent
    Perform Documents Quick Search in Current Extent
    
Perform Documents Quick Search in Current Selection
    [Documentation]    Returns the documents that title or description match the search criteria and are visibles in the current selection
    Perform Documents Quick Search in Current Selection

Perform Documents Quick Search by Deposit
    Perform Documents Quick Search by Deposit

Clear Quick Search Result and Filters
    Clear Quick Search Result and Filters
    
Zoom and Select the Document's Spatial Associations
    [Documentation]    Zoom and select the spatial elements related to a document
    Zoom and Select the Document's Spatial Associations

Show Documents Metadata in Document List
    [Documentation]    Explore the document metadata values after perfomr a list documents from a spatial selection
    Show Documents Metadata in Document List

Show Documents Metadata in Search Result List
    [Documentation]    Explore the document metadata values after perfomr a quick search
    Show Documents Metadata in Search Result List
    
Perform Documents Advanced Search
    Perform Documents Advanced Search

Perform Documents Advanced Search in Current Extent
    Perform Documents Advanced Search in Current Extent
    
Perform Documents Advanced Search in Current Selection
    Perform Documents Advanced Search in Current Selection

Clear Advanced Search Result and Filters
    Clear Advanced Search Result and Filters
    
Clear Advanced Search Result
    Clear Advanced Search Result
#----------------------------------------------------------------------------------------------------------------------------------------------------------
*** Keyword ***

Show Document(s) and Hyperlink(s) in mouseover    [Arguments]    ${ELEMENTS_COUNT}    @{COORDINATES}
    Open Element Mouseover Bubble Over    @{COORDINATES}
    Check that Documents Count is    ${ELEMENTS_COUNT}

List Document or Hyperlink summary in the layer list
    Show Document(s) and Hyperlink(s) in mouseover    ${GREENLAND_ELEMENTS}    @{GREENLAND}    
    Open Documents Association List
    The Documents ammount Should Be    ${GREENLAND_DOCUMENTS}
    The Hyperlinks ammount Should Be    ${GREENLAND_HYPERLINKS}
    The Document Title Should be    LOTUS-ILMFS60_61.PDF
    The Hyperlink Title Should Be    Google Translate
    Close Mouseover Bubble
    Open / Close Tab Menu

List Document or Hyperlink descriptions in the layer list
    Open Element Mouseover Bubble Over    @{GREENLAND}
    Open Documents Association List
    Expand / Collapse Document Description    ${FILESYSTEMDEPOT}    ${PDFID}
    File System Deposit Name Should be    ${FILESYSTEMNAME}
    Expand / Collapse Document Description    ${FILESYSTEMDEPOT}    ${PDFID}
    Expand / Collapse Hyperlink Description    ${HYPERLINKDEPOT}    ${HYPERLINKID}
    Hyperlink Deposit Name Should be    ${HYPERLINKNAME}
    Expand / Collapse Hyperlink Description    ${HYPERLINKDEPOT}    ${HYPERLINKID}
    Close Mouseover Bubble
    Open / Close Tab Menu

Download document after Listing
    Open Element Mouseover Bubble Over    @{CANADA}
    Open Documents Association List
    The Document Title Should be    agua_o_cola.pps
    Start the Download of the Document    agua_o_cola.pps
    Check that the Document was downloaded    agua_o_cola.pps
    Close Mouseover Bubble
    Open / Close Tab Menu

Navigate to Hyperlink
    Open Element Mouseover Bubble Over    @{GREENLAND}
    Open Documents Association List
    Expand / Collapse Hyperlink Description    ${HYPERLINKDEPOT}    ${HYPERLINKID}
    Hyperlink Deposit Name Should be    ${HYPERLINKNAME}
    Click on Hyperlink Title    ${HYPERLINKURL}
    Move to Browser's Tab with URL    https://translate.google.com/
    Title Should Be      Google Translate 
    Close Window
    Move to Browser's Tab with URL    ${JMAP URL}
    Title Should Be    World Web    
    Expand / Collapse Hyperlink Description    ${HYPERLINKDEPOT}    ${HYPERLINKID}
    Go Back to the Main Menu
    Close Mouseover Bubble
    Go to Layers tab
    Open / Close Tab Menu

Perform Documents Quick Search
    Open / Close Tab Menu
    Go to Documents tab
    Type Keywords to Perform a Quick Search by Title or Description    o    ${False}
    Click on Button OK
    Check That the Document Property Exist in Document List    LOTUS-ILMFS60_61.PDF
    Check That the Document Property Exist in Document List    Layer forms.docx
    Check That the Document Property Exist in Document List    agua_o_cola.pps
    Clear Quick Search
    Go Back to the Main Menu
    Go to Layers tab
    Open / Close Tab Menu

Perform Documents Quick Search in Current Extent
    Open / Close Tab Menu
    Go to Documents tab
    Expand Quick Search
    Check the Box Search Only in Displayed Extent
    Type Keywords to Perform a Quick Search by Title or Description    l    ${True}
    Zoom in
    Zoom in
    Zoom in
    Pan The Map    @{CANADA}
    Perform Quick Search
    Check That the Document Property Exist in Document List    Layer forms.docx
    Check That the Document Property Exist in Document List    agua_o_cola.pps
    Clear Quick Search
    Go Back to the Main Menu
    Zoom to Initial View
    Go to Layers tab
    Open / Close Tab Menu

Perform Documents Quick Search in Current Selection
    Activate / Deactivate Selection Tool    PUNCTUAL
    Select Spatial Elements    Canada    Australia
    Open / Close Tab Menu
    Go to Documents tab
    Expand Quick Search
    Type Keywords to Perform a Quick Search by Title or Description    l    ${True}
    Check the Box Search Only in Current Selection
    Perform Quick Search
    Check That the Document Property Exist in Document List    RLS client ID.txt
    Check That the Document Property Exist in Document List    agua_o_cola.pps
    Check That the Document Property Exist in Document List    Layer forms.docx
    Clear Quick Search
    # Close Elements Attribute Table
    Activate / Deactivate Selection Tool    PUNCTUAL
    Go Back to the Main Menu
    Go to Layers tab
    Open / Close Tab Menu
    
Perform Documents Quick Search by Deposit
    Open / Close Tab Menu
    Go to Documents tab
    Expand Quick Search
    Type Keywords to Perform a Quick Search by Title or Description    txt    ${True}
    Select the Deposit on the List    JFS
    Perform Quick Search
    Check That the Document Property Exist in Document List    RLS client ID.txt
    Clear Quick Search
    Clear Deposits List
    Go Back to the Main Menu
    Go to Layers tab
    Open / Close Tab Menu

Clear Quick Search Result and Filters
    Open / Close Tab Menu
    Go to Documents tab
    Expand Quick Search
    Search Button Should be Disabled
    Clear Button Should be Disabled
    Activate / Deactivate Selection Tool    PUNCTUAL
    Select Spatial Elements    Canada
    Type Keywords to Perform a Quick Search by Title or Description    l    ${True}
    Search Button Should be Enabled
    Check the Box Search Only in Displayed Extent
    Check the Box Search Only in Current Selection
    Select the Deposit on the List    JFS
    Perform Quick Search
    Check That the Document Property Exist in Document List    agua_o_cola.pps
    Check That the Document Property Exist in Document List    Layer forms.docx
    Clear Quick Search
    Is Search Only in Displayed Extent Unselected
    Is Search Only in Current Selection Unselected
    Is the Deposit Selected    JFS
    # Close Elements Attribute Table
    Activate / Deactivate Selection Tool    PUNCTUAL
    Go Back to the Main Menu
    Go to Layers tab
    Open / Close Tab Menu

Zoom and Select the Document's Spatial Associations
    Open / Close Tab Menu
    Go to Documents tab
    Type Keywords to Perform a Quick Search by Title or Description    l    ${False}
    Click on Button OK
    Zoom and Select the Element    ${FILESYSTEMDEPOT}    ${PDFID}
    Exist Element on Elements Attribute Table    Greenland
    Close Elements Attribute Table
    Clear Quick Search
    Go Back to the Main Menu
    Zoom to Initial View
    Go to Layers tab
    Open / Close Tab Menu
    
Show Documents Metadata in Document List
    Open Element Mouseover Bubble Over    @{AUSTRALIA}
    Open Documents Association List
    Expand / Collapse Document Description    ${FILESYSTEMDEPOT}    ${TXTID}
    Check That the Document Property Exist in Document List    AUSTRALIA
    Check That the Document Property Exist in Document List    175
    Check That the Document Property Exist in Document List    0
    Check That the Document Property Exist in Document List    07-Mar-2019
    Check That the Document Property Exist in Document List    14-Mar-2019
    Check That the Document Property Exist in Document List    20
    Check That the Document Property Exist in Document List    value one, value two
    Expand / Collapse Document Description    ${FILESYSTEMDEPOT}    ${TXTID}
    Zoom to Initial View
    Close Mouseover Bubble
    Go Back to the Main Menu
    Go to Layers tab
    Open / Close Tab Menu

Show Documents Metadata in Search Result List    
    Open / Close Tab Menu
    Go to Documents tab
    Type Keywords to Perform a Quick Search by Title or Description    agua    ${False}
    Click on Button OK
    Expand / Collapse Document Description    ${FILESYSTEMDEPOT}    ${PPSID}
    Check That the Document Property Exist in Document List    CANADA
    Check That the Document Property Exist in Document List    75
    Check That the Document Property Exist in Document List    1
    Check That the Document Property Exist in Document List    06-Mar-2019
    Check That the Document Property Exist in Document List    13-Mar-2019
    Check That the Document Property Exist in Document List    15
    Check That the Document Property Exist in Document List    value three
    Expand / Collapse Document Description    ${FILESYSTEMDEPOT}    ${PPSID}
    Clear Quick Search
    Go Back to the Main Menu
    Go to Layers tab
    Open / Close Tab Menu
    
Perform Documents Advanced Search
    Open / Close Tab Menu
    Go to Documents tab
    Expand Advanced Search
    Select a Deposit on the List    JFS
    Select the Form    Search by Title
    Type Keywords on Textfield    TITLE    Layer forms.docx
    Perform Advanced Search
    Check That the Document Property Exist in Document List    Layer forms.docx
    Clear Advanced Search
    Deposit List Should be Empty
    Go Back to the Main Menu
    Go to Layers tab
    Open / Close Tab Menu

Perform Documents Advanced Search in Current Extent
    Open / Close Tab Menu
    Go to Documents tab
    Expand Advanced Search
    Select a Deposit on the List    JFS
    Select the Form    Search by Desc
    Check the Box Search Only in Displayed Extent
    Type Keywords on Textfield    DESCRIPTION    RLS client ID.txt
    Zoom in
    Zoom in
    Pan The Map    @{AUSTRALIA}
    Perform Advanced Search
    Check That the Document Property Exist in Document List    RLS client ID.txt
    Clear Advanced Search
    Deposit List Should be Empty
    Zoom to Initial View
    Go Back to the Main Menu
    Go to Layers tab
    Open / Close Tab Menu

Perform Documents Advanced Search in Current Selection
    Open / Close Tab Menu
    Go to Documents tab
    Expand Advanced Search
    Select a Deposit on the List    JFS
    Select the Form    Search by Location
    Activate / Deactivate Selection Tool    PUNCTUAL
    Select Spatial Elements    Canada    Greenland
    Type Keywords on Textfield    LOCATION    Green
    Check the Box Search Only in Current Selection
    Perform Advanced Search
    Check That the Document Property Exist in Document List    LOTUS-ILMFS60_61.PDF
    Clear Advanced Search
    Deposit List Should be Empty
    # Close Elements Attribute Table
    Activate / Deactivate Selection Tool    PUNCTUAL
    Go Back to the Main Menu
    Go to Layers tab
    Open / Close Tab Menu

Clear Advanced Search Result and Filters
    Open / Close Tab Menu
    Go to Documents tab
    Expand Advanced Search
    Select a Deposit on the List    JFS
    Select the Form    Search by Location
    Advanced Search Button Should be Enabled
    Advanced Clear Button Should be Enabled
    Activate / Deactivate Selection Tool    PUNCTUAL
    Select Spatial Elements    Canada    Greenland
    Check the Box Search Only in Current Selection
    Check the Box Search Only in Displayed Extent
    Type Keywords on Textfield    LOCATION    Can
    Pan The Map    @{CANADA}
    Perform Advanced Search
    Check That the Document Property Exist in Document List    agua_o_cola.pps
    Check That the Document Property Exist in Document List    Layer forms.docx
    Clear Advanced Search
    Deposit List Should be Empty
    Is the Deposit Selected    JFS
    Is Search Only in Current Selection Unselected
    Is Search Only in Displayed Extent Unselected
    # Close Elements Attribute Table
    Activate / Deactivate Selection Tool    PUNCTUAL
    Zoom to Initial View
    Go Back to the Main Menu
    Go to Layers tab
    Open / Close Tab Menu

Clear Advanced Search Result
    Open / Close Tab Menu
    Go to Documents tab
    Expand Advanced Search
    Select a Deposit on the List    JFS
    Select the Form    Search by Title
    Advanced Search Button Should be Enabled
    Advanced Clear Button Should be Enabled
    Perform Advanced Search
    Check That the Document Property Exist in Document List    RLS client ID.txt
    Check That the Document Property Exist in Document List    agua_o_cola.pps
    Check That the Document Property Exist in Document List    Layer forms.docx
    Check That the Document Property Exist in Document List    LOTUS-ILMFS60_61.PDF
    Advanced Clear Button Should be Enabled
    Clear Advanced Search
    Is the Deposit Selected    JFS
    Go Back to the Main Menu
    Go to Layers tab
    Open / Close Tab Menu    
    