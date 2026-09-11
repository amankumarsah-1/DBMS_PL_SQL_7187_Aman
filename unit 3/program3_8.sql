SET SERVEROUTPUT ON;

DECLARE
    v_num1 NUMBER := &NUM1;
    v_num2 NUMBER := &NUM2;
    v_result NUMBER;

BEGIN

    v_result := v_num1 / v_num2;

    DBMS_OUTPUT.PUT_LINE
(
        'Result = ' || v_result
    );

EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE
(
            'ZERO_DIVIDE: Cannot divide by zero.'
        );

END;
/