# Employee Management System Using PL/SQL

## Group Members
1. Full Name:Umwariwase INEZA ANGE  
   Student ID:28278

2. Full Name:KABATESI SYLVIE 
   Student ID:28407

## Project Description
This project is an Employee Management System developed using Oracle PL/SQL. It demonstrates how PL/SQL can be used to manage employee records and perform database operations.

The system uses procedures, functions, records, collections, implicit cursors, explicit cursors, bulk processing, and exception handling.

## Database Structure
The project uses two main tables:

- EMP_DEPARTMENTS: Stores department information, including department ID and department name.
- EMPLOYEE_RECORDS: Stores employee information such as employee ID, first name, last name, email, job title, salary, hire date, and department ID.

The employee table is connected to the department table through a foreign key.

## Project Features

### 1. Records
- Uses a user-defined PL/SQL record to store employee information.
- Uses `%ROWTYPE` to retrieve a complete employee record.
- Displays employee details using a stored procedure.

### 2. Collections
- Uses an associative array to store multiple employee records.
- Processes and displays employee information.

### 3. Implicit Cursors
- Uses INSERT, UPDATE, and DELETE statements.
- Uses `SQL%ROWCOUNT`, `SQL%FOUND`, and `SQL%NOTFOUND` to check database operations.

### 4. Explicit Cursors
- Uses OPEN, FETCH, and CLOSE to retrieve and display multiple employee records.

### 5. Bulk Processing
- Uses `BULK COLLECT` to retrieve multiple employee records.
- Uses `FORALL` to update employee salaries.
- Uses `SAVE EXCEPTIONS` to handle bulk DML errors.

### 6. Stored Procedures
- Displays employee information.
- Inserts, updates, and deletes employee records.
- Checks employee salary conditions.

### 7. Functions
- Calculates and returns an employee's annual salary based on their monthly salary.

### 8. Exception Handling
- Handles predefined exceptions such as `NO_DATA_FOUND` and `TOO_MANY_ROWS`.
- Uses a user-defined exception.
- Uses `RAISE_APPLICATION_ERROR` to display meaningful error messages.

## Project Folder Structure

```text
plsql-assignment4-<studentID1>-<studentID2>/
│
├── README.md
├── .gitignore
│
├── 00_schema/
│   ├── 01_create_tables.sql
│   └── 02_insert_sample_data.sql
│
├── 01_procedures/
│   ├── employee_records.sql
│   ├── employee_collection.sql
│   ├── employee_operations.sql
│   ├── employee_explicit_cursor.sql
│   ├── employee_bulk_processing.sql
│   └── check_employee_salary.sql
│
├── 02_functions/
│   └── get_annual_salary.sql
│
├── 03_tests/
│   ├── test_success_cases.sql
│   └── test_error_cases.sql
│
├── screenshots/
│
└── docs/
    └── IMPLEMENTATION_NOTES.md
```

## How to Run the Project

1. Open Oracle SQL Developer or another Oracle SQL environment.
2. Connect to your Oracle database.
3. Open and execute `00_schema/01_create_tables.sql` to create the tables.
4. Execute `00_schema/02_insert_sample_data.sql` to insert sample records.
5. Compile the SQL files inside `01_procedures/`.
6. Compile the function inside `02_functions/`.
7. Run the test scripts inside `03_tests/`.
8. Check the output using `DBMS_OUTPUT`.

Make sure DBMS Output is enabled to see messages printed by the procedures and functions.

## Testing
The project includes test cases for successful operations and error handling.

- Successful employee retrieval and display.
- Employee insertion, salary updates, and deletion.
- Employee collection and cursor processing.
- Bulk salary updates.
- Annual salary calculation.
- Handling of missing employee records and invalid operations.

Screenshots of the execution results are available in the `screenshots` folder.

## Technologies Used
- Oracle Database
- PL/SQL
- Oracle SQL Developer
- Git and GitHub

## Conclusion
This project demonstrates the use of Oracle PL/SQL programming concepts in developing a simple Employee Management System. It applies database programming techniques to retrieve, process, update, and manage employee information while handling possible errors.