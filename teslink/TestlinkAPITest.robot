*** Settings ***

Documentation    Smoke tests for Library TestlinkAPILibrary. TestlinkAPILibrary is a wrapper for calling.
...     Testlink XMLRPC api methods via *Testlink-API-Python-client* classes _TestlinkAPIClient_ and _TestlinkAPIGeneric_.
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Library    TestlinkAPILibrary    
Library    Collections
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Variables ***

${TL_URL}    http://192.168.0.42/testlink2/lib/api/xmlrpc/v1/xmlrpc.php
${DEV_KEY}    9767da9f33effb3baf11a8fa337bd7cd
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*** Test Cases ***

Init Api Class TestLinkAPIClient
    ${tlapi_client}=    Create Api Client    TestlinkAPIClient    server_url=${TL_URL}    devkey=${DEV_KEY}
    ${method_args}=    Call Method    ${tlapi_client}    whatArgs    repeat
    Should Contain    ${method_args}    Repeats a message back
    Should Be Equal As Strings    ${tlapi_client.__class__.__name__}    TestlinkAPIClient

Init Api Class TestlinkAPIGeneric
    ${tlapi_client}=    Create Api Client    TestlinkAPIGeneric
    ${method_args}=    Call Method    ${tlapi_client}    whatArgs    repeat
    Should Contain    ${method_args}    Repeats a message back
    Should Be Equal As Strings    ${tlapi_client.__class__.__name__}    TestlinkAPIGeneric

Call Api Method with optional arguments
    [Tags]    devexample
    ${tlapi_client}=    Create Api Client    TestlinkAPIClient    server_url=${TL_URL}    devkey=${DEV_KEY}
    
    @{projects}=    Call Api Method    getProjects
    ${length}=     Get Length    ${projects} 
    Should Not Be Empty    ${projects}
    
    @{testplan}=    Call Api Method    getTestPlanByName    testplanname=Full test    testprojectname=Jmap 7.0
    Should Not Be Empty    ${testplan}
    ${testplan}    Set Variable    ${testplan}[0]
    ${testplanid}    Set Variable    ${testplan['id']}
    
    # ${build}=    Call Api Method    getBuildsForTestPlan    ${testplanid}
    # Should Not Be Empty    ${build}
    
    ${latestbuild}=    Call Api Method    getLatestBuildForTestPlan    ${testplanid}
    Should Not Be Empty    ${latestbuild}
    ${buildname}    Set Variable    ${latestbuild['name']}
    
    @{testcase}=    Call Api Method    getTestCaseIDByName    Change server port    testprojectname=Jmap 7.0
    Should Not Be Empty    ${testcase}
    ${testcase}    Set Variable    ${testcase}[0]
    ${testcaseid}    Set Variable    ${testcase['id']}
    
    @{execution}=    Call Api Method    getLastExecutionResult    ${testplanid}    ${testcaseid}
    Should Not Be Empty    ${execution}
    ${execution}    Set Variable    ${execution}[0]
    ${biuldid}    Set Variable    ${execution['build_id']}
    ${executionnotes}    Set Variable    ${execution['notes']}
    ${status}    Set Variable    ${execution['status']}    #f    p    
    ${testerid}    Set Variable    ${execution['tester_id']}
    
    ${notes}=    Catenate    AUTOMATED TEST FAILED AND LAST EXECUTION TEST FAILED\nKnown Associated Issues:    ${executionnotes}
    ${resultprojectid}=    Call Api Method    reportTCResult    ${testcaseid}    ${testplanid}    ${buildname}    f    ${notes}    
    