*** Settings ***
Documentation     Sample Robot Framework Test Suite with ODBC
Library           OperatingSystem

*** Variables ***
${ODBC Connection String}   Driver={SQL Server Native Client RDA 11.0};Server=EPPLKRAW0462\SQLEXPRESS;Database=TRN;UID=vaish_tester;PWD=automateitnow1!;

*** Test Cases ***
Connect to Database
    [Documentation]  Connect to the ODBC database
    Connect to Database  ${ODBC Connection String}

Test Case 1
    [Tags]     ODBC
    ${result}  Query     select MIN(min_salary) from hr.jobs
    Should Be 2000.00   ${result}  Assertion failed for Test Case 1

Test Case 2
    [Tags]     ODBC
    ${result}  Query     select MAX(salary) from hr.employees
    Should Be 24000   ${result}  Assertion failed for Test Case 2

*** Keywords ***
Assertion failed for Test Case 1
    Should Be True   ${result}   Expected result for Test Case 1 not met

Assertion failed for Test Case 2
    Should Be True   ${result}   Expected result for Test Case 2 not met
