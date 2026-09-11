SET SERVEROUTPUT ON;

DECLARE
    v_deptno NUMBER := &DEPT_NO;

BEGIN

    UPDATE EMPLOYEE
    SET SALARY = SALARY + (SALARY * 10 / 100)
    WHERE DEPT_NO = v_deptno;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE(
            'No employee found in department ' || v_deptno
        );
    ELSE
        DBMS_OUTPUT.PUT_LINE(
            SQL%ROWCOUNT || ' employee(s) salary updated successfully.'
        );
    END IF;

    COMMIT;

END;
/