
CREATE OR REPLACE PROCEDURE display_employee(
    p_employee_id IN NUMBER
)
IS
    -- User-defined record
    TYPE employee_record_type IS RECORD (
        emp_id NUMBER,
        emp_name VARCHAR2(100),
        emp_salary NUMBER(10,2)
    );

    v_employee_info employee_record_type;

    -- Record based on the table structure
    v_employee EMPLOYEE_RECORDS%ROWTYPE;

BEGIN
    -- Retrieve the complete employee row
    SELECT *
    INTO v_employee
    FROM EMPLOYEE_RECORDS
    WHERE employee_id = p_employee_id;

    -- Store selected information in user-defined record
    v_employee_info.emp_id := v_employee.employee_id;

    v_employee_info.emp_name :=
        v_employee.first_name || ' ' || v_employee.last_name;

    v_employee_info.emp_salary := v_employee.salary;

    -- Display user-defined record
    DBMS_OUTPUT.PUT_LINE('USER-DEFINED RECORD');
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_employee_info.emp_id);
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_employee_info.emp_name);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || v_employee_info.emp_salary);

    -- Display %ROWTYPE record
    DBMS_OUTPUT.PUT_LINE('----------------------');
    DBMS_OUTPUT.PUT_LINE('%ROWTYPE RECORD');
    DBMS_OUTPUT.PUT_LINE('Job Title: ' || v_employee.job_title);
    DBMS_OUTPUT.PUT_LINE('Email: ' || v_employee.email);
    DBMS_OUTPUT.PUT_LINE('Department ID: ' || v_employee.department_id);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Employee not found.');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
        RAISE;
END;
/
