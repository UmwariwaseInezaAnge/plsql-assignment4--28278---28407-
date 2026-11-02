
CREATE OR REPLACE PROCEDURE bulk_update_employees(
    p_increase_percent IN NUMBER
)
IS
    -- Define collections
    TYPE employee_id_list IS TABLE OF NUMBER;
    TYPE salary_list IS TABLE OF NUMBER;

    v_employee_ids employee_id_list;
    v_salaries salary_list;

    -- Define bulk exception
    e_bulk_errors EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_bulk_errors, -24381);

BEGIN
    -- Retrieve multiple employees at once
    SELECT employee_id, salary
    BULK COLLECT INTO v_employee_ids, v_salaries
    FROM EMPLOYEE_RECORDS;

    DBMS_OUTPUT.PUT_LINE(
        'Employees retrieved: ' || v_employee_ids.COUNT
    );

    IF v_employee_ids.COUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No employees found.');
        RETURN;
    END IF;

    -- Calculate new salaries
    FOR i IN 1..v_employee_ids.COUNT
    LOOP
        v_salaries(i) :=
            v_salaries(i) * (1 + p_increase_percent / 100);
    END LOOP;

    -- Update multiple employees at once
    FORALL i IN 1..v_employee_ids.COUNT SAVE EXCEPTIONS
        UPDATE EMPLOYEE_RECORDS
        SET salary = v_salaries(i)
        WHERE employee_id = v_employee_ids(i);

    DBMS_OUTPUT.PUT_LINE(
        'Employees successfully updated: ' || SQL%ROWCOUNT
    );

EXCEPTION
    WHEN e_bulk_errors THEN
        DBMS_OUTPUT.PUT_LINE(
            'Number of bulk errors: ' || SQL%BULK_EXCEPTIONS.COUNT
        );

        FOR i IN 1..SQL%BULK_EXCEPTIONS.COUNT
        LOOP
            DBMS_OUTPUT.PUT_LINE(
                'Employee ID: ' ||
                v_employee_ids(SQL%BULK_EXCEPTIONS(i).ERROR_INDEX)
            );

            DBMS_OUTPUT.PUT_LINE(
                'Error: ' ||
                SQLERRM(-SQL%BULK_EXCEPTIONS(i).ERROR_CODE)
            );
        END LOOP;

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
        RAISE;
END;
/
