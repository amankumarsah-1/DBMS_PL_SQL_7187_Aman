SET SERVEROUTPUT ON;

DECLARE
    v_count NUMBER;
BEGIN
    UPDATE EMP
    SET BasicSal = BasicSal * 1.10
    WHERE Deptno = 10;

    v_count := SQL%ROWCOUNT;

    IF v_count > 0 THEN
        DBMS_OUTPUT.PUT_LINE(v_count || ' employee salary increased by 10%.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No employee found in Department 10.');
    END IF;

    COMMIT;
END;
/