SET SERVEROUTPUT ON;

DECLARE
    a NUMBER := 10;
    b NUMBER := 0;
    result NUMBER;
BEGIN
    result := a / b;

    DBMS_OUTPUT.PUT_LINE('Result = ' || result);

EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Error: Cannot divide by zero.');
END;
/