
CREATE OR REPLACE PROCEDURE check_employee_salary(
    p_employee_id IN NUMBER
)
IS
    v_salary NUMBER(10,2);

    -- User-defined exception
    e_low_salary EXCEPTION;

BEGIN
    SELECT salary
    INTO v_salary
    FROM EMPLOYEE_RECORDS
    WHERE employee_id = p_employee_id;

    IF v_salary < 500000 THEN
        RAISE e_low_salary;
    END IF;

    DBMS_OUTPUT.PUT_LINE(
        'Employee salary is acceptable: ' || v_salary
    );

EXCEPTION
    WHEN e_low_salary THEN
        RAISE_APPLICATION_ERROR(
            -20003,
            'Employee salary is below the minimum required salary.'
        );

    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(
            -20004,
            'Employee does not exist.'
        );

    WHEN OTHERS THEN
        RAISE;
END;
/
