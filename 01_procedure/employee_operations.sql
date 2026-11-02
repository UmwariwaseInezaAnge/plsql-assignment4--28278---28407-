
-- 1. UPDATE EMPLOYEE SALARY

CREATE OR REPLACE PROCEDURE update_employee_salary(
    p_employee_id IN NUMBER,
    p_new_salary IN NUMBER
)
IS
BEGIN
    UPDATE EMPLOYEE_RECORDS
    SET salary = p_new_salary
    WHERE employee_id = p_employee_id;

    DBMS_OUTPUT.PUT_LINE('Rows affected: ' || SQL%ROWCOUNT);

    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee salary updated successfully.');
    ELSIF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found.');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Update error: ' || SQLERRM);
        RAISE;
END;
/

-- 2. INSERT NEW EMPLOYEE

CREATE OR REPLACE PROCEDURE insert_employee(
    p_employee_id IN NUMBER,
    p_first_name IN VARCHAR2,
    p_last_name IN VARCHAR2,
    p_email IN VARCHAR2,
    p_job_title IN VARCHAR2,
    p_salary IN NUMBER,
    p_department_id IN NUMBER
)
IS
BEGIN
    INSERT INTO EMPLOYEE_RECORDS (
        employee_id, first_name, last_name,
        email, job_title, salary, hire_date, department_id
    )
    VALUES (
        p_employee_id, p_first_name, p_last_name,
        p_email, p_job_title, p_salary, SYSDATE, p_department_id
    );

    DBMS_OUTPUT.PUT_LINE('Rows inserted: ' || SQL%ROWCOUNT);

    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee inserted successfully.');
    END IF;

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Error: Employee ID or email already exists.');
        RAISE;

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Insert error: ' || SQLERRM);
        RAISE;
END;
/

-- 3. DELETE EMPLOYEE

CREATE OR REPLACE PROCEDURE delete_employee(
    p_employee_id IN NUMBER
)
IS
BEGIN
    DELETE FROM EMPLOYEE_RECORDS
    WHERE employee_id = p_employee_id;

    DBMS_OUTPUT.PUT_LINE('Rows deleted: ' || SQL%ROWCOUNT);

    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee deleted successfully.');
    ELSIF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found.');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Delete error: ' || SQLERRM);
        RAISE;
END;
/
