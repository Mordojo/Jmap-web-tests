*** Settings ***

Documentation     Tests extension Documents 7.2 in JMap Admin 7.0
#---------------------------------------------------------------------------------------------------------------------------------------------------------------
Library		SeleniumLibrary		# Selenium framework
#---------------------------------------------------------------------------------------------------------------------------------------------------------------
Resource    ../../../common/CommonLogin.robot
Resource    ../../../common/extension_documents/CommonAdmin.robot
#---------------------------------------------------------------------------------------------------------------------------------------------------------------
Suite Setup    Login JMap Admin    administrator    ${EMPTY}    English    ${LOGIN URL}    ${DELAY}
Test Teardown    Run Keyword If Test Failed    Reload Page
Suite Teardown		Logout JMap    ${True}
#---------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Variables ***

${DELAY}    0.2
${LOGIN URL}      http://192.168.0.59:8080/jmapadmin/login.jsf
@{FILESYSLOCATION}    Users    Public    data
#---------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Test Cases ***

Configure a Datasource
    Configure a Datasource

Configure a Datasource with Empty Datasource Name
    Configure a Datasource with Empty Datasource Name
    
Configure a Datasource with Empty Attribute Name
    Configure a Datasource with Empty Attribute Name
    
Configure a Datasource with Duplicated Datasource and Attribute Name
    Configure a Datasource with Duplicated Datasource and Attribute Name
    
Delete Configured Datasource
    Delete Configured Datasource    
#-------------------------------------------------------------------------------------------------------

Create a File System Deposit
    Create a File System Deposit

Create a File System Deposit with Empty Name
    Create a File System Deposit with Empty Name

Create a File System Deposit with Empty Type
    Create a File System Deposit with Empty Type

Create a Deposit with Duplicated Name
    Create a Deposit with Duplicated Name

Create an Hyperlink Deposit with Duplicated Name
    Create an Hyperlink Deposit with Duplicated Name

Create a File System Deposit with Empty Deposit Location
    Create a File System Deposit with Empty Deposit Location

Synchronize a File System Deposit
    Synchronize a File System Deposit
    
Set Permissions to a File System Deposit
    Set Permissions to a File System Deposit

Set Permissions to a File System Deposit for the same User
    Set Permissions to a File System Deposit for the same User
    
Remove Permissions from a File System Deposit
    Remove Permissions from a File System Deposit

Create Metadata Structure to a File System Deposit
    Create Metadata Structure to a File System Deposit

Delete Metadata Attribute from a File System Deposit
    Delete Metadata Attribute from a File System Deposit

Create Metadata Attribute with Duplicated name
    Create Metadata Attribute with Duplicated name

Create Metadata Form to a File System Deposit
    Create Metadata Form to a File System Deposit

Add a Metadata Component without Attribute
    Add a Metadata Component without Attribute
    
Create Search Form to a File System Deposit
    Create Search Form to a File System Deposit

Create Search Form by Description to a File System Deposit
    Create Search Form by Description to a File System Deposit

Create a Search Form with Empty Name
    Create a Search Form with Empty Name

Edit Search Form Name
    Edit Search Form Name

Delete Search Form from a File System Deposit
    Delete Search Form from a File System Deposit
    
Edit a File System Deposit
    Edit a File System Deposit

Delete a File System Deposit
    Delete a File System Deposit
#-------------------------------------------------------------------------------------------------------

Create an Hyperlink Deposit
    Create an Hyperlink Deposit

Edit an Hyperlink Deposit
    Edit an Hyperlink Deposit

Set Permissions to an Hyperlink Deposit
    Set Permissions to an Hyperlink Deposit

Synchronize an Hyperlink Deposit
    Synchronize an Hyperlink Deposit From the List

Delete an Hyperlink Deposit
    Delete an Hyperlink Deposit
#-------------------------------------------------------------------------------------------------------

Create a Sharepoint Deposit
    Create a Sharepoint Deposit

Edit a Sharepoint Deposit
    Edit a Sharepoint Deposit

Set Permissions to a Sharepoint Deposit
    Set Permissions to a Sharepoint Deposit

Synchronize a Sharepoint Deposit
    Synchronize a Sharepoint Deposit
    
Delete a Sharepoint Deposit
    Delete a Sharepoint Deposit
#-------------------------------------------------------------------------------------------------------
*** Keywords ***

Configure a Datasource
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Go to Datasource configuration page
    Add a New Datasource Configuration    World Cities    CITY
    Page Should Contain    World Cities 
    Page Should Contain    CITY
    Save Datasource configuration
    Reload Page
    Go to Datasource configuration page
    Page Should Contain    World Cities 
    Page Should Contain    CITY
    Cancel Datasource configuration page

Configure a Datasource with Duplicated Datasource and Attribute Name
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Go to Datasource configuration page
    Add a New Datasource Configuration    World Countries    COUNTRY
    Page Should Contain the Error Message    Duplicated name
    Cancel Datasource Configuration Dialog
    Cancel Datasource configuration page

Configure a Datasource with Empty Datasource Name
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Go to Datasource configuration page
    Add a New Datasource Configuration    ${EMPTY}    ${EMPTY}
    Page Should Contain the Error Message    Required value
    Cancel Datasource Configuration Dialog
    Cancel Datasource configuration page
    
Configure a Datasource with Empty Attribute Name
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Go to Datasource configuration page
    Add a New Datasource Configuration    World Lakes    ${EMPTY}
    Page Should Contain the Error Message    Required value
    Cancel Datasource Configuration Dialog
    Cancel Datasource configuration page
    
Delete Configured Datasource
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Go to Datasource configuration page
    Delete a Configured Datasource    World Cities
    Page Should Not Have    World Cities 
    Page Should Not Have    CITY
    Save Datasource configuration
    Reload Page
    Go to Datasource configuration page
    Page Should Not Have    World Cities 
    Page Should Not Have    CITY
    Cancel Datasource configuration page

Create a File System Deposit
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Click on Create Button
    Fill the Identification Step    File system depot    Depot desc    File system    CREATION
    Click Next
    Fill File system Step    ${True}    ${True}    @{FILESYSLOCATION}
    Finish the Wizard
    Page Should Contain    File system depot

Create an Hyperlink Deposit
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Click on Create Button
    Fill the Identification Step    Hyperlink depot    Depot desc    Hyperlink    CREATION
    Finish the Wizard
    Page Should Contain    Hyperlink depot

Create a File System Deposit with Empty Name
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Click on Create Button
    Fill the Identification Step    ${EMPTY}    ${EMPTY}    Blank    CREATION
    Click Next
    Page Should Contain the Error Message    Required value
    Cancel the Wizard
    
Create a File System Deposit with Empty Type
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Click on Create Button
    Fill the Identification Step    Test deposit    ${EMPTY}    Blank    CREATION
    Click Next
    Page Should Contain the Error Message    Required value
    Cancel the Wizard
    
Create a Deposit with Duplicated Name
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Click on Create Button
    Fill the Identification Step    File system depot    ${EMPTY}    File system    CREATION
    Click Next
    Page Should Contain the Error Message    Duplicated name
    Cancel the Wizard
    
Create an Hyperlink Deposit with Duplicated Name
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Click on Create Button
    Fill the Identification Step    File system depot    ${EMPTY}    Hyperlink    CREATION
    Finish the Wizard
    Page Should Contain the Error Message    Duplicated name
    Cancel the Wizard

Create a File System Deposit with Empty Deposit Location
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Click on Create Button
    Fill the Identification Step    Test deposit    Depot desc    File system    CREATION
    Click Next
    Finish the Wizard
    Page Should Contain the Error Message    Required value
    Cancel the Wizard
    
Edit a File System Deposit
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Go to Deposit Page	File system depot
    Click on Edit
    Fill the Identification Step    File system depot edited    ${EMPTY}    File system    EDITION
    Click Next
    Fill File system Step    ${True}    ${False}    Users    Public
    Finish the Wizard
    Page Should Contain    File system depot edited
    Deposit Page Should Contain Path    Users    Public

Edit an Hyperlink Deposit
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Go to Deposit Page	Hyperlink depot
    Click on Edit
    Fill the Identification Step    Hyperlink depot edited   Hyperlink desc    Hyperlink    EDITION
    Finish the Wizard
    Page Should Contain    Hyperlink depot edited
    Page Should Contain    Hyperlink desc
    
Synchronize a File System Deposit
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Go to Deposit Page    File system depot
    Click on Synchronize
    Last Synchronization Time Should Be Now
    
Synchronize an Hyperlink Deposit From the List
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Select the Deposit    Hyperlink depot edited
    Click on Synchronize
    Go to Deposit Page    Hyperlink depot edited
    Last Synchronization Time Should Be Now

Synchronize a Sharepoint Deposit
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Select the Deposit    Sharepoint depot
    Click on Synchronize
    Go to Deposit Page    Sharepoint depot
    Last Synchronization Time Should Be Now

Set Permissions to a File System Deposit
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Go to Deposit Page	File system depot
    Click Sections
    Go to Permissions Page
    Add Permissions to a User    administrator    Read    Register documents    Delete    Associate
    Click on Save
    Go to Extensions Page
    Go to Deposits List Page
    Go to Deposit Page	File system depot
    Click Sections
    Go to Permissions Page
    Page Should Contain    administrator    

Set Permissions to an Hyperlink Deposit
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Go to Deposit Page	Hyperlink depot edited
    Click Sections
    Go to Permissions Page
    Add Permissions to a User    anonymous    Read    Delete    Associate
    Click on Save
    Go to Extensions Page
    Go to Deposits List Page
    Go to Deposit Page	Hyperlink depot edited
    Click Sections
    Go to Permissions Page
    Page Should Contain    anonymous

Set Permissions to a Sharepoint Deposit
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Go to Deposit Page	Sharepoint depot
    Click Sections
    Go to Permissions Page
    Add Permissions to a User    administrator    Read
    Click on Save
    Go to Extensions Page
    Go to Deposits List Page
    Go to Deposit Page	Sharepoint depot
    Click Sections
    Go to Permissions Page
    Page Should Contain    administrator

Set Permissions to a File System Deposit for the same User
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Go to Deposit Page	File system depot
    Click Sections
    Go to Permissions Page
    Add Permissions to a User that was Already Setted    administrator
    Click on Cancel

Remove Permissions from a File System Deposit
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Go to Deposit Page	File system depot
    Click Sections
    Go to Permissions Page
    Select User on Permissions Page    administrator
    Remove the Selected User
    Click on Save
    Go to Extensions Page
    Go to Deposits List Page
    Go to Deposit Page	File system depot
    Click Sections
    Go to Permissions Page
    Page Should Not Contain    administrator

Create Metadata Structure to a File System Deposit
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Go to Deposit Page	File system depot
    Click Sections
    Go to Metadata Structure Page
    Add Metadata    META_1    VARCHAR    ${False}
    Add Metadata    META_2    BIGINT    ${False}
    Add Metadata    META_3    BOOLEAN    ${False}
    Add Metadata    META_4    DATE    ${False}
    Add Metadata    META_5    DOUBLE    ${False}
    Add Metadata    META_6    FLOAT    ${False}
    Add Metadata    META_7    INTEGER    ${False}
    Add Metadata    META_8    SMALLINT    ${False}
    Add Metadata    META_9    TIME    ${False}
    Add Metadata    META_10    TIMESTAMP    ${False}
    Add Metadata    META_DEL    VARCHAR    ${True}
    Save Metadata Structure
    Click Sections
    Go to Metadata Structure Page
    Page Should Contain Metadata    META_1
    Page Should Contain Metadata    META_2
    Page Should Contain Metadata    META_3
    Page Should Contain Metadata    META_4
    Page Should Contain Metadata    META_5
    Page Should Contain Metadata    META_6
    Page Should Contain Metadata    META_7
    Page Should Contain Metadata    META_8
    Page Should Contain Metadata    META_9
    Page Should Contain Metadata    META_10
    Page Should Contain Metadata    META_DEL
    Save Metadata Structure

Create Metadata Attribute with Duplicated name
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Go to Deposit Page	File system depot
    Click Sections
    Go to Metadata Structure Page
    Add Metadata    META_1    VARCHAR    ${False}
    Save Metadata Structure
    Page Should Contain the Error Message    Duplicated name
    
Delete Metadata Attribute from a File System Deposit
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Go to Deposit Page	File system depot
    Click Sections
    Go to Metadata Structure Page
    Delete Metadata    META_DEL
    Save Metadata Structure
    Click Sections
    Go to Metadata Structure Page
    Page Not Should Contain Metadata    META_DEL
    Save Metadata Structure

Create Metadata Form to a File System Deposit
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Go to Deposit Page	File system depot
    Click Sections
    Go to Metadata Form Page
    Set Configuration Layout    3    2
    Add Metadata Component for an Attribute    META_5    INPUT_TEXT    0    0    ${True}    ${False}
    Add Metadata Component for an Attribute    META_2    SELECT_ONE    0    1    ${False}    ${False}
    Add Metadata Component for an Attribute    META_3    SELECT_BOOLEAN    0    2    ${False}    ${True}
    Add Metadata Component for an Attribute    META_1    SELECT_MANY    1    0    ${True}    ${False}
    Add Metadata Component for an Attribute    META_4    INPUT_DATE    1    1    ${True}    ${False}
    Add Metadata Component for an Attribute    META_6    TREE    1    2    ${True}    ${False}
    Save Metadata Form Layout
    Page Should Contain    META_1
    Page Should Contain    META_2
    Page Should Contain    META_3
    Page Should Contain    META_4
    Page Should Contain    META_5
    Page Should Contain    META_6

Add a Metadata Component without Attribute
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Go to Deposit Page	File system depot
    Click Sections
    Go to Metadata Form Page
    Set Configuration Layout    1    2    #Add new row at the end
    Add Metadata Component for an Attribute    ${EMPTY}    INPUT_TEXT    2    0    ${False}    ${False}
    Page Should Contain    Required value
    Cancel Component Properties
    Cancel Metadata Form Layout
    
Create Search Form to a File System Deposit
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Go to Deposit Page	File system depot
    Click Sections
    Go to Search Form Page
    Create a New Search Form    Advanced Search
    Set Configuration Layout    1    3
    Add Metadata Component for an Attribute    TITLE    INPUT_TEXT    0    0    ${True}    ${False}
    Add Metadata Component for an Attribute    META_2    SELECT_ONE    0    1    ${False}    ${False}
    Add Metadata Component for an Attribute    META_3    SELECT_BOOLEAN    0    2    ${False}    ${True}
    Add Metadata Component for an Attribute    META_1    SELECT_MANY    1    0    ${True}    ${False}
    Add Metadata Component for an Attribute    META_4    INPUT_DATE    1    1    ${True}    ${False}
    Add Metadata Component for an Attribute    META_6    TREE    1    2    ${True}    ${False}
    Add Metadata Component for an Attribute    META_5    INPUT_RANGE    2    0    ${True}    ${False}
    Save Metadata Form Layout
    Page Should Contain    Advanced Search

Create Search Form by Description to a File System Deposit
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Go to Deposit Page	File system depot
    Click Sections
    Go to Search Form Page
    Create a New Search Form    Search by Desc
    Set Configuration Layout    1    1
    Add Metadata Component for an Attribute    DESCRIPTION    INPUT_TEXT    0    0    ${False}    ${False}
    Save Metadata Form Layout
    Page Should Contain    Search by Desc

Edit Search Form Name
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Go to Deposit Page	File system depot
    Click Sections
    Go to Search Form Page
    Edit Search Form    Advanced Search    Advanced Search Edited
    Add Metadata Component for an Attribute    DESCRIPTION    INPUT_TEXT    2    1    ${False}    ${False}
    Save Metadata Form Layout
    Page Should Contain    Advanced Search Edited

Delete Search Form from a File System Deposit
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Go to Deposit Page	File system depot
    Click Sections
    Go to Search Form Page
    Select Search Form    Search by Desc
    Delete Search Form
    Page Should Not Contain    Search by Desc    

Create a Search Form with Empty Name
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Go to Deposit Page	File system depot
    Click Sections
    Go to Search Form Page
    Create a New Search Form    ${EMPTY}
    Page Should Contain    Required value
    Cancel Search Form Creation
 
Delete a File System Deposit
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Select the Deposit    File system depot edited
    Click on Delete
    Confirm Delete Action
    Click on Yes
    Confirm the Deletion
    Go to Extensions Page
    Go to Deposits List Page
    Page Should Not Contain   File system depot edited

Delete an Hyperlink Deposit
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Select the Deposit    Hyperlink depot edited
    Click on Delete
    Confirm Delete Action
    Click on Yes
    Confirm the Deletion
    Go to Extensions Page
    Go to Deposits List Page
    Page Should Not Contain    Hyperlink depot edited

Delete a Sharepoint Deposit
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Select the Deposit    Sharepoint depot
    Click on Delete
    Confirm Delete Action
    Click on Yes
    Confirm the Deletion
    Go to Extensions Page
    Go to Deposits List Page
    Page Should Not Contain    Sharepoint depot
    
Create a Sharepoint Deposit
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Click on Create Button
    Fill the Identification Step    Sharepoint depot    SharePoint desc    SharePoint    CREATION
    Click Next
    Fill Sharepoint Step    http://win-7mj9e398dq9:42341/DOCUMENTS_SHP2    k2\\administrator    SaralixisK2cu&    ${True}    ${False}    CREATION
    Click Next
    Fill Metadata Step    TO_RIGHT    Méta1
    Finish the Wizard
    Page Should Contain    Sharepoint depot
    
Edit a Sharepoint Deposit
    Go to Extensions Page
    Page Should Contain    Documents
    Go to Deposits List Page
    Page Should Contain    items per page
    Go to Deposit Page	Sharepoint depot
    Click on Edit
    Fill the Identification Step    Sharepoint depot    ${EMPTY}    SharePoint    EDITION
    Click Next
    Fill Sharepoint Step    http://win-7mj9e398dq9:42341/DOCUMENTS    k2\\sharepoint    SaralixisK2cu&    ${False}    ${True}    EDITION
    Click Next
    Fill Metadata Step    TO_RIGHT    COUNTRY
    Finish the Wizard
    Page Should Contain    http://win-7mj9e398dq9:42341/DOCUMENTS
    Page Should Contain    k2\\sharepoint