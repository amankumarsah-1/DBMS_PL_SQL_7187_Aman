SET SERVEROUTPUT ON;

DECLARE
    v_ename EMP.ENAME%TYPE;
    v_empno EMP.EMPNO%TYPE := &EMPNO;

BEGIN

    SELECT ENAME
    INTO v_ename
    FROM EMP
    WHERE EMPNO = v_empno;

    DBMS_OUTPUT.PUT_LINE
    (
        'Employee Name: ' || v_ename
    );

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE
(
            'NO_DATA_FOUND: Employee record not found.'
        );

END;
/