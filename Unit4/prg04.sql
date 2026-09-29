-- Q4. Function to return the square of a given number

CREATE OR REPLACE FUNCTION SQUARE_NUMBER
(
    P_NUM IN NUMBER
)
RETURN NUMBER
IS
BEGIN
    RETURN P_NUM * P_NUM;
END;
/

DECLARE
    V_RESULT NUMBER;
BEGIN
    V_RESULT := SQUARE_NUMBER(5);
    DBMS_OUTPUT.PUT_LINE('Square = ' || V_RESULT);
END;
/
