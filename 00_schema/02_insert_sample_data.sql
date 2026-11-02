

INSERT INTO EMP_DEPARTMENTS
VALUES (1, 'Information Technology');

INSERT INTO EMP_DEPARTMENTS
VALUES (2, 'Human Resources');

INSERT INTO EMP_DEPARTMENTS
VALUES (3, 'Finance');

INSERT INTO EMP_DEPARTMENTS
VALUES (4, 'Marketing');

INSERT INTO EMPLOYEE_RECORDS
VALUES (101, 'Eric', 'Maniraguha',
        'eric@gmail.com', 'Database Administrator',
        850000, DATE '2024-01-15', 1);

INSERT INTO EMPLOYEE_RECORDS
VALUES (102, 'Ange', 'Uwamariya',
        'ange@gmail.com', 'HR Officer',
        650000, DATE '2023-06-10', 2);

INSERT INTO EMPLOYEE_RECORDS
VALUES (103, 'David', 'Mugisha',
        'david@gmail.com', 'Accountant',
        750000, DATE '2022-03-20', 3);

INSERT INTO EMPLOYEE_RECORDS
VALUES (104, 'Grace', 'Uwase',
        'grace@gmail.com', 'Software Developer',
        900000, DATE '2024-05-12', 1);

INSERT INTO EMPLOYEE_RECORDS
VALUES (105, 'Peter', 'Niyonzima',
        'peter@gmail.com', 'Marketing Officer',
        600000, DATE '2023-09-01', 4);

COMMIT;
SELECT e.employee_id,
       e.first_name,
       e.last_name,
       e.job_title,
       e.salary,
       d.department_name
FROM EMPLOYEE_RECORDS e
JOIN EMP_DEPARTMENTS d
ON e.department_id = d.department_id;