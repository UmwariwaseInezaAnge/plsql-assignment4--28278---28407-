
SET SERVEROUTPUT ON;

-- Test UPDATE
BEGIN
    update_employee_salary(101, 950000);
END;
/

-- Test INSERT
BEGIN
    insert_employee(
        106,
        'Alice',
        'Uwimana',
        'alice@gmail.com',
        'System Analyst',
        700000,
        1
    );
END;
/

-- Test DELETE
BEGIN
    delete_employee(106);
END;
/

-- Test employee not found
BEGIN
    update_employee_salary(999, 500000);
END;
/
