
CREATE OR REPLACE PROCEDURE display_all_employees
IS
    -- Define a record
    TYPE employee_rec IS RECORD (
        emp_id NUMBER,
        emp_name VARCHAR2(100),
        emp_salary NUMBER(10,2),
        emp_job VARCHAR2(100)
    );

    -- Define an associative array
    TYPE employee_array IS TABLE OF employee_rec
    INDEX BY PLS_INTEGER;

    v_employees employee_array;

    v_count NUMBER := 0;

BEGIN
    -- Retrieve employees and store them in the collection
    FOR emp IN (
        SELECT employee_id, first_name, last_name,
               salary, job_title
        FROM EMPLOYEE_RECORDS
    )
    LOOP
        v_count := v_count + 1;

        v_employees(v_count).emp_id := emp.employee_id;

        v_employees(v_count).emp_name :=
            emp.first_name || ' ' || emp.last_name;

        v_employees(v_count).emp_salary := emp.salary;

        v_employees(v_count).emp_job := emp.job_title;
    END LOOP;

    -- Process and display collection
    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No employees found.');
    ELSE
        FOR i IN 1..v_count
        LOOP
            DBMS_OUTPUT.PUT_LINE('----------------------');

            DBMS_OUTPUT.PUT_LINE(
                'Employee ID: ' || v_employees(i).emp_id
            );

            DBMS_OUTPUT.PUT_LINE(
                'Name: ' || v_employees(i).emp_name
            );

            DBMS_OUTPUT.PUT_LINE(
                'Salary: ' || v_employees(i).emp_salary
            );

            DBMS_OUTPUT.PUT_LINE(
                'Job: ' || v_employees(i).emp_job
            );
        END LOOP;

        DBMS_OUTPUT.PUT_LINE('----------------------');
        DBMS_OUTPUT.PUT_LINE('Total employees: ' || v_count);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RAISE;
END;
/
