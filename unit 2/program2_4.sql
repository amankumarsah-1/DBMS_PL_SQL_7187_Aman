SET SERVEROUTPUT ON;

DECLARE
    v_count NUMBER := 0;
BEGIN
    FOR emp_rec IN (
        SELECT EName, BasicSal
        FROM EMP
        ORDER BY BasicSal DESC
    )
    LOOP
        v_count := v_count + 1;

        DBMS_OUTPUT.PUT_LINE(
            'Name = ' || emp_rec.EName ||
            ', Basic Salary = ' || emp_rec.BasicSal
        );

        EXIT WHEN v_count = 3;
    END LOOP;
END;
/