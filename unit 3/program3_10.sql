SET SERVEROUTPUT ON;

DECLARE
    v_num1 NUMBER := 10;
    v_num2 NUMBER := 0;
    v_result NUMBER;

BEGIN

    v_result := v_num1 / v_num2;

    DBMS_OUTPUT.PUT_LINE
(
        'Result = ' || v_result
    );

EXCEPTION
    WHEN OTHERS THEN

        DBMS_OUTPUT.PUT_LINE
(
            'Error Code: ' || SQLCODE
        );

        DBMS_OUTPUT.PUT_LINE
(
            'Error Message: ' || SQLERRM
        );

END;
/