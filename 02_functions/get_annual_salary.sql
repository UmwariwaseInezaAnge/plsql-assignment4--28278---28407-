
CREATE OR REPLACE FUNCTION get_annual_salary(
    p_employee_id IN NUMBER
)
RETURN NUMBER
IS
    v_monthly_salary NUMBER(10,2);
    v_annual_salary NUMBER(12,2);

BEGIN
    -- Retrieve employee monthly salary
    SELECT salary
    INTO v_monthly_salary
    FROM EMPLOYEE_RECORDS
    WHERE employee_id = p_employee_id;

    -- Calculate annual salary
    v_annual_salary := v_monthly_salary * 12;

    RETURN v_annual_salary;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Employee ID ' || p_employee_id || ' does not exist.'
        );

    WHEN TOO_MANY_ROWS THEN
        RAISE_APPLICATION_ERROR(
            -20002,
            'Multiple employees found for this ID.'
        );

    WHEN OTHERS THEN
        RAISE;
END;
/
