# Robot Framework Data Validation Project

This project uses Robot Framework to perform data assertion tests on a sample dataset. It demonstrates how to set up, run test cases, and understand the assertions made on the data.

## Prerequisites

Before running the tests, make sure you have the following prerequisites installed on your system:

- Python (3.x recommended): https://www.python.org/downloads/
- Robot Framework: https://robotframework.org/
- Robot Framework Database Library: https://github.com/MarketSquare/Robotframework-Database-Library/blob/master/README.md
- Robot Framework BuiltIn Library: https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
- A database with sample data (e.g., MySQL, SQLite, or any database of your choice).

## Setup

1. Clone the repository to your local machine:

git clone https://github.com/ptvaishnavi91/test-automation.git
cd test_automation1


2. Install the required dependencies:

pip install -r requirements.txt


3. Configure the database connection in the `config.robot` file. Update the database connection settings to match your environment.
    Alternately, add connection variables under ***Variables***


## Running Test Cases

You can run the test cases by using the `robot` command. For example, to run all test cases:

robot test_cases.robot

### Test cases:

This project is to execute test cases to validate data assertions in the TRN database.
Below are the test cases covered:
Test case 1: Validate the minimum salary for all the jobs
Test case 2: Validate the maximum salary among all the employees
Test case 3: Verify the job role that has the highest maximum salary
Test case 4: Validate that the country ID of India is IN


