SET SERVEROUTPUT ON;

DECLARE
    n NUMBER := &n;
    square NUMBER;
    cube NUMBER;
BEGIN
    square := n * n;
    cube := n * n * n;

    DBMS_OUTPUT.PUT_LINE('Given Number = ' || n);
    DBMS_OUTPUT.PUT_LINE('Square = ' || square);
    DBMS_OUTPUT.PUT_LINE('Cube = ' || cube);
END;
/