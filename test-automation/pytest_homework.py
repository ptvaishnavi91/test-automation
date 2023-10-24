import pytest
import pyodbc

@pytest.fixture
def db_connection():
    connection = pyodbc.connect("Driver={SQL Server Native Client RDA 11.0};"
                      r"Server=EPPLKRAW0462\SQLEXPRESS;"
                      "Database=TRN;"
                      "UID=vaish_tester;"
                      "PWD=automateitnow1!;"
                      )
    yield connection
    connection.close()


def test_min_salary(db_connection):
    #Validate the  minimum salary for all the jobs
    cursor = db_connection.cursor()
    cursor.execute("select MIN(min_salary) from hr.jobs ")
    result = cursor.fetchone()[0]
    actual_result = result
    expected_result = 2000.00
    assert actual_result == expected_result

def test_total_max_salary(db_connection):
    #Validate the maximum salary among all the employees
    cursor = db_connection.cursor()
    cursor.execute("select MAX(salary) from hr.employees")
    result = cursor.fetchone()[0]
    actual_result = result
    expected_result = 24000
    assert actual_result == expected_result

def test_job_max_salary(db_connection):
    #Verify the job role that has the highest maximum salary
    cursor = db_connection.cursor()
    cursor.execute( f"select job_title from hr.jobs where max_salary in ("\
                    f"select MAX(max_salary)"\
                    f"from hr.jobs)")
    result = cursor.fetchone()[0]
    actual_result = result
    expected_result = 'President'
    assert actual_result == expected_result

def test_country_id(db_connection):
    #Validate that the country ID of India is IN
    try:
        cursor = db_connection.cursor()
        cursor.execute( f"select country_id from hr.countries where country_name='India'")
        result = cursor.fetchone()[0]
        actual_result = result
        expected_result = 'IN'
        assert actual_result == expected_result
    except pyodbc.Error as e:
        # Print the error details for debugging
        print("SQL Error:", e)
        assert False  # Mark the test as failed

def test_total_regions(db_connection):
    #Find the total number of regions
    cursor = db_connection.cursor()
    cursor.execute( f"select count(*) from hr.regions")
    result = cursor.fetchone()[0]
    actual_result = result
    expected_result = 4
    assert actual_result == expected_result

def test_locations_uk(db_connection):
    # Find the total number of locations in UK
    cursor = db_connection.cursor()
    cursor.execute( f"select count(*) from hr.locations where country_id='UK'")
    result = cursor.fetchone()[0]
    actual_result = result
    expected_result = 2
    assert actual_result == expected_result

if __name__ == '__main__':
    pytest.main(['-v'])

