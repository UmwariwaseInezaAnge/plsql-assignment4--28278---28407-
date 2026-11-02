CREATE TABLE EMP_DEPARTMENTS (
    department_id NUMBER PRIMARY KEY,
    department_name VARCHAR2(100) NOT NULL UNIQUE
);
CREATE TABLE EMPLOYEE_RECORDS (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) UNIQUE,
    job_title VARCHAR2(100) NOT NULL,
    salary NUMBER(10,2) NOT NULL,
    hire_date DATE DEFAULT SYSDATE NOT NULL,
    department_id NUMBER,

    CONSTRAINT emp_rec_salary_ck
    CHECK (salary > 0),

    CONSTRAINT emp_rec_dept_fk
    FOREIGN KEY (department_id)
    REFERENCES EMP_DEPARTMENTS(department_id)
);
--SHOW TABLES
DESC EMP_DEPARTMENTS;

DESC EMPLOYEE_RECORDS;