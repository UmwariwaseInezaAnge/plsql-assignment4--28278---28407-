
SET SERVEROUTPUT ON;

BEGIN
    display_employee(101);
END;
/

-- Test employee not found
BEGIN
    display_employee(999);
END;
/
