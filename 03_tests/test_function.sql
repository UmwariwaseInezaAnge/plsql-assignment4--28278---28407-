
SET SERVEROUTPUT ON;

DECLARE
    v_result NUMBER;
BEGIN
    v_result := get_annual_salary(101);

    DBMS_OUTPUT.PUT_LINE(
        'Annual salary: ' || v_result
    );
END;
/

SET SERVEROUTPUT ON;

DECLARE
    v_result NUMBER;
BEGIN
    v_result := get_annual_salary(101);

    DBMS_OUTPUT.PUT_LINE(
        'Annual salary: ' || v_result
    );
END;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(
        'Annual salary: ' || get_annual_salary(999)
    );

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
