-- Q9. Function that returns the square of a given number

CREATE OR REPLACE FUNCTION FIND_SQUARE
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
    V_RESULT := FIND_SQUARE(10);
    DBMS_OUTPUT.PUT_LINE('Square = ' || V_RESULT);
END;
/
