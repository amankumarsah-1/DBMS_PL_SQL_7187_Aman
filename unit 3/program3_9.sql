SET SERVEROUTPUT ON;

DECLARE
    v_comm EMP.COMM%TYPE;
    v_empno EMP.EMPNO%TYPE := &EMPNO;

    NULL_COMMISSION EXCEPTION;

BEGIN

    SELECT COMM
    INTO v_comm
    FROM EMP
    WHERE EMPNO = v_empno;

    IF v_comm IS NULL THEN
        RAISE NULL_COMMISSION;
END
IF;

    DBMS_OUTPUT.PUT_LINE
(
        'Employee No: ' || v_empno
    );

    DBMS_OUTPUT.PUT_LINE
(
        'Commission: ' || v_comm
    );

EXCEPTION

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE
(
            'Employee not found.'
        );

    WHEN NULL_COMMISSION THEN
        DBMS_OUTPUT.PUT_LINE
(
            'NULL_COMMISSION: Commission is NULL.'
        );

END;
/