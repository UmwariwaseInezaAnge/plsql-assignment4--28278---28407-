
SET SERVEROUTPUT ON;

-- Test valid salary
BEGIN
    check_employee_salary(101);
END;
/

-- Test low salary
BEGIN
    check_employee_salary(105);
END;
/

-- Test employee not found
BEGIN
    check_employee_salary(999);
END;
/
