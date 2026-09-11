SET SERVEROUTPUT ON;

DECLARE
    v_num NUMBER;
    v_value VARCHAR2
(20) := '&VALUE';

BEGIN

    v_num := TO_NUMBER
(v_value);

    DBMS_OUTPUT.PUT_LINE
(
        'Number is: ' || v_num
    );

EXCEPTION
    WHEN INVALID_NUMBER THEN
        DBMS_OUTPUT.PUT_LINE
(
            'INVALID_NUMBER: Entered value is not a valid number.'
        );

END;
/