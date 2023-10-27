*** Settings ***
Library       DatabaseLibrary
Library       OperatingSystem
Library       BuiltIn
Suite Setup   Connect To Database  pymssql  ${Database}  ${Username}  ${Password}  ${Host}  ${Port}

*** Variables ***
${Driver}    {SQL Server Native Client RDA 11.0}
${Server}    EPPLKRAW0462\\SQLEXPRESS
${Database}  TRN
${Username}  vaish_tester
${Password}  automateitnow1!
${Host}      192.168.0.116
${Port}      1433

*** Test Cases ***

Test Case 1
	[Documentation]    Validate the minimum salary for all the jobs
    [Tags]             DataAssertion
    ${result}  Query   select MIN(min_salary) from hr.jobs
    ${result_as_string}  Convert To String  ${result[0][0]}
    Should Be Equal     ${result_as_string}   2000.00  Assertion failed for Test Case 1

Test Case 2
    [Documentation]      Validate the maximum salary among all the employees
    [Tags]               DataAssertion
    ${result}  Query     select MAX(salary) from hr.employees
    ${result_as_string}  Convert To String  ${result[0][0]}
    Should Be Equal      ${result_as_string}  24000.00   Assertion failed for Test Case 2

Test Case 3
    [Documentation]      Verify the job role that has the highest maximum salary
    [Tags]               DataAssertion
    ${result}  Query     select job_title from hr.jobs where max_salary in (select MAX(max_salary) from hr.jobs)
    Should Be Equal      ${result[0][0]}  President   Assertion failed for Test Case 2

Test Case 4
    [Documentation]     Validate that the country ID of India is IN
    [Tags]              DataAssertion
    ${result}  Query    select country_id from hr.countries where country_name='India'
    Should Be Equal     ${result[0][0]}  IN   Assertion failed for Test Case 2

*** Keywords ***
Assertion failed for Test Case 1
    Log   Expected result for Test Case 1 not met

Assertion failed for Test Case 2
    Log   Expected result for Test Case 2 not met

Assertion failed for Test Case 3
    Log   Expected result for Test Case 3 not met

Assertion failed for Test Case 4
    Log   Expected result for Test Case 4 not met
