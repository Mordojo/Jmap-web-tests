*** Settings ***
Documentation    Smoke tests for Library TestlinkAPILibrary. TestlinkAPILibrary is a wrapper for calling. Testlink XMLRPC api methods  via *Testlink-API-Python-client* classes _TestlinkAPIClient_ and _TestlinkAPIGeneric_.

Library    TestlinkAPILibrary
Library    BuiltIn    
Library    Collections

*** Variables ***
${TL_URL}    http://192.168.0.42/testlink2/lib/api/xmlrpc/v1/xmlrpc.php
${DEV_KEY}    60d38ce14e4eedad2b02042662abf217    #9767da9f33effb3baf11a8fa337bd7cd

*** Test Cases ***


*** Keywords ***
Init Api Class TestLinkAPIClient
    [Arguments]    ${URL}    ${API_KEY}
    ${tlapi_client}=    Create Api Client    TestlinkAPIClient    server_url=${TL_URL}    devkey=${DEV_KEY}
    Log To Console    ${tlapi_client}
    Log    =================================================================================
    
Update Test Case In Testlink With Passed
    [Arguments]    ${vLastExecution_ID}    ${vTestCase_ID}    ${vTestPlan_ID}    ${vLatestBuild_NAME}    ${vStatus}    ${vNotes}        
    ${notePassedFirst}=    Set Variable    THE FIRST EXECUTION TEST PASSED
    ${notesPassed_Passed}=    Catenate    AUTOMATED TEST PASSED AND LAST EXECUTION TEST PASSED\nKnown Associated Issues:    ${vNotes}
    ${notesPassed_Failed}=    Catenate    AUTOMATED TEST PASSED AND LAST EXECUTION TEST FAILED\nKnown Associated Issues:    ${vNotes}
    
    Run Keyword If    '${vLastExecution_ID}'=='-1'
    ...    Call Api Method    reportTCResult    ${vTestCase_ID}    ${vTestPlan_ID}    ${vLatestBuild_NAME}    ${vStatus}    ${notePassedFirst} 
    
    Run Keyword If    '${vLastExecution_ID}'!='-1' AND '${vstatus}=='p'
    ...    Call Api Method    reportTCResult    ${vTestCase_ID}    ${vTestPlan_ID}    ${vLatestBuild_NAME}    ${vStatus}    ${notesPassed_Passed} 

    Run Keyword If    '${vLastExecution_ID}'!='-1' AND '${vstatus}=='f'
    ...    Call Api Method    reportTCResult    ${vTestCase_ID}    ${vTestPlan_ID}    ${vLatestBuild_NAME}    ${vStatus}    ${notesPassed_Failed}
   
Update Test Case In Testlink With Failed
    [Arguments]    ${vLastExecution_ID}    ${vTestCase_ID}    ${vTestPlan_ID}    ${vLatestBuild_NAME}    ${vStatus}    ${vNotes}
    ${noteFailedFirst}=    Set Variable    THE FIRST EXECUTION TEST FAILED
    ${notesFailed_Failed}=    Catenate    AUTOMATED TEST FAILED AND LAST EXECUTION TEST FAILED\nKnown Associated Issues:    ${vNotes}
    ${notesFailed_Passed}=    Catenate    AUTOMATED TEST PASSED AND LAST EXECUTION TEST PASSED\nKnown Associated Issues:    ${vNotes} 
    
    Run Keyword If    '${vLastExecution_ID}'=='-1'
    ...    Call Api Method    reportTCResult    ${vTestCase_ID}    ${vTestPlan_ID}    ${vLatestBuild_NAME}    ${vStatus}    ${noteFailedFirst}
    
    Run Keyword If    '${vLastExecution_ID}'!='-1' AND '${vstatus}=='f'
    ...    Call Api Method    reportTCResult    ${vTestCase_ID}    ${vTestPlan_ID}    ${vLatestBuild_NAME}    ${vStatus}    ${notesFailed_Failed} 

    Run Keyword If    '${vLastExecution_ID}'!='-1' AND '${vstatus}=='p'
    ...    Call Api Method    reportTCResult    ${vTestCase_ID}    ${vTestPlan_ID}    ${vLatestBuild_NAME}    ${vStatus}    ${notesFailed_Passed}

Go To Testlink To Update Test Case
    [Arguments]    ${projectNum}    ${CurrentTestPlan}    ${suitName}    ${caseName}
    Init Api Class TestLinkAPIClient    ${TL_URL}    ${DEV_KEY}
    @{projects}=    Call Api Method    getProjects
    ${length}=     Get Length    ${projects} 
    ${project}    Set Variable    ${projects[ProjectNum]}
    Log    ${project}
    ${projectNAME}    Set Variable    ${project['name']}
    ${projectID}    Set Variable    ${project['id']}
    Log    =================================================================================
    @{testPlans}=    Call Api Method    getTestPlanByName    testprojectname=${projectNAME}    testplanname=${CurrentTestPlan}
    ${length}=     Get Length    ${testPlans} 
    ${testPlan}    Set Variable    ${testPlans}[${length-1}]
    Log    ${testPlan}
    ${testPlanNAME}    Set Variable    ${testPlan['name']}
    ${testPlanID}    Set Variable    ${testPlan['id']}
    Log    =================================================================================
    ${latestBuild}=    Call Api Method    getLatestBuildForTestPlan    ${testPlanID}
    ${length}=     Get Length    ${latestBuild} 
    ${latestBuildNAME}    Set Variable    ${latestBuild['name']}
    ${latestBuildID}    Set Variable    ${latestBuild['id']}
    Log    ${latestBuildNAME}    
    Log    =================================================================================
    @{testCases}    Call Api Method    getTestCaseIDByName    testcasename=${caseName}    testsuitname=${suitName}    testprojectname=${projectNAME} 
    ${length}=     Get Length    ${testCases}     
    ${testCase}    Set Variable    ${testCases}[${length-1}]
    Log    ${testCase}
    ${testCaseNAME}    Set Variable    ${testCase['name']}
    ${testCaseID}    Set Variable    ${testCase['id']}
    ${testCaseExternalID}    Set Variable    ${testCase['tc_external_id']}
    Log    =================================================================================
    @{lastExecution}=    Call Api Method    getLastExecutionResult    testplanid=${testPlanID}    
                                                                      ...    testcaseid=${testCaseID}    
                                                                      ...    testCaseexternaid=${testCaseExternalID}    
                                                                      ...    buildid=${latestBuildID}    
                                                                      ...    buildname=${latestBuildNAME}
    ${lastExecution}    Set Variable    ${lastExecution[0]}
    Log    ${lastExecution}
    ${lastExecutionID}    Set Variable    ${lastExecution['id']}
    ${lastExecution}    Set Variable    ${lastExecution}[0]
    ${lastExecutionNotes}    Set Variable    ${lastExecution['notes']}
    ${status}    Set Variable    ${lastExecution['status']}    #f    p    
    ${testerid}    Set Variable    ${lastExecution['tester_id']}
    
    
    Run Keyword If Test Passed    Update Test Case In Testlink With Passed    ${lastExecutionID}    ${testCaseID}    ${testPlanID}    ${latestBuildNAME}    ${status}    ${lastExecutionNotes}    
    Run Keyword If Test Failed    Update Test Case In Testlink With Failed    ${lastExecutionID}    ${testCaseID}    ${testPlanID}    ${latestBuildNAME}    ${status}    ${lastExecutionNotes}
         