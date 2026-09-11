SET SERVEROUTPUT ON;

DECLARE
    CURSOR emp_cursor IS
        SELECT EName, Deptno, BasicSal
        FROM EMP
        ORDER BY BasicSal DESC;

    v_ename EMP.EName%TYPE;
    v_deptno EMP.Deptno%TYPE;
    v_salary EMP.BasicSal%TYPE;

BEGIN
    OPEN emp_cursor;

    LOOP
        FETCH emp_cursor INTO v_ename, v_deptno, v_salary;

        EXIT WHEN emp_cursor%NOTFOUND OR emp_cursor%ROWCOUNT > 5;

        DBMS_OUTPUT.PUT_LINE(
            'Name = ' || v_ename ||
            ', Department = ' || v_deptno ||
            ', Basic Salary = ' || v_salary
        );
    END LOOP;

    CLOSE emp_cursor;
END;
/