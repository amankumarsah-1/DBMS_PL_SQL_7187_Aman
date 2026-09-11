SET SERVEROUTPUT ON;

DECLARE

    CURSOR c_emp IS
        SELECT EMPNO, ENAME, JOB, SAL
        FROM EMP
        ORDER BY SAL ASC;

BEGIN

    FOR emp_rec IN c_emp
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Emp No: ' || emp_rec.EMPNO ||
            '  Name: ' || emp_rec.ENAME ||
            '  Job: ' || emp_rec.JOB ||
            '  Salary: ' || emp_rec.SAL
        );
    END LOOP;

END;
/