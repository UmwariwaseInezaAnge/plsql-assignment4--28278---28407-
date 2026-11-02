
SET SERVEROUTPUT ON;

BEGIN
    bulk_update_employees(5);
END;
/

-- Verify updated salaries
SELECT employee_id, first_name, salary
FROM EMPLOYEE_RECORDS
ORDER BY employee_id;
