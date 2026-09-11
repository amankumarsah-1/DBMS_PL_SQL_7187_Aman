SET SERVEROUTPUT ON;

DECLARE

    CURSOR dept_cursor IS
        SELECT DISTINCT Deptno
        FROM EMP
        ORDER BY Deptno;

    CURSOR emp_cursor(p_deptno EMP.Deptno%TYPE) IS
        SELECT EName, BasicSal
        FROM EMP
        WHERE Deptno = p_deptno;

    v_total_gross NUMBER;

BEGIN

    FOR dept_rec IN dept_cursor
    LOOP

        v_total_gross := 0;

        DBMS_OUTPUT.PUT_LINE(
            'Department No = ' || dept_rec.Deptno
        );

        DBMS_OUTPUT.PUT_LINE(
            '-----------------------------'
        );

        FOR emp_rec IN emp_cursor(dept_rec.Deptno)
        LOOP

            DBMS_OUTPUT.PUT_LINE(
                'Employee Name = ' || emp_rec.EName ||
                ', Basic Salary = ' || emp_rec.BasicSal
            );

            v_total_gross :=
                v_total_gross
                + (
                    emp_rec.BasicSal
                    + (emp_rec.BasicSal * 15 / 100)
                    + (emp_rec.BasicSal * 50 / 100)
                    + 500
                    - (emp_rec.BasicSal * 10 / 100)
                  );

        END LOOP;

        DBMS_OUTPUT.PUT_LINE(
            'Total Gross Salary = ' || v_total_gross
        );

        DBMS_OUTPUT.PUT_LINE(
            '============================='
        );

    END LOOP;

END;
/