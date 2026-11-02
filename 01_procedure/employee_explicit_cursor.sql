
CREATE OR REPLACE PROCEDURE display_employees_cursor
IS
    -- Declare cursor
    CURSOR emp_cursor IS
        SELECT employee_id, first_name, last_name,
               job_title, salary
        FROM EMPLOYEE_RECORDS
        ORDER BY employee_id;

    -- Variables to store fetched values
    v_employee_id EMPLOYEE_RECORDS.employee_id%TYPE;
    v_first_name EMPLOYEE_RECORDS.first_name%TYPE;
    v_last_name EMPLOYEE_RECORDS.last_name%TYPE;
    v_job_title EMPLOYEE_RECORDS.job_title%TYPE;
    v_salary EMPLOYEE_RECORDS.salary%TYPE;

BEGIN
    -- Open cursor
    OPEN emp_cursor;

    LOOP
        -- Fetch employee information
        FETCH emp_cursor INTO
            v_employee_id,
            v_first_name,
            v_last_name,
            v_job_title,
            v_salary;

        -- Exit when no more records
        EXIT WHEN emp_cursor%NOTFOUND;

        -- Display employee information
        DBMS_OUTPUT.PUT_LINE('----------------------');
        DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_employee_id);
        DBMS_OUTPUT.PUT_LINE('Name: ' || v_first_name || ' ' || v_last_name);
        DBMS_OUTPUT.PUT_LINE('Job: ' || v_job_title);
        DBMS_OUTPUT.PUT_LINE('Salary: ' || v_salary);

    END LOOP;

    -- Close cursor
    CLOSE emp_cursor;

EXCEPTION
    WHEN OTHERS THEN
        IF emp_cursor%ISOPEN THEN
            CLOSE emp_cursor;
        END IF;

        DBMS_OUTPUT.PUT_LINE('Cursor error: ' || SQLERRM);
        RAISE;
END;
/
