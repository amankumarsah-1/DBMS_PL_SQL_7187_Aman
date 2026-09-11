SET SERVEROUTPUT ON;

DECLARE
    p NUMBER := &p;
    r NUMBER := &r;
    n NUMBER := &n;
    si NUMBER;
BEGIN
    si := (p * r * n) / 100;

    DBMS_OUTPUT.PUT_LINE('Principal Amount = ' || p);
    DBMS_OUTPUT.PUT_LINE('Rate of Interest = ' || r);
    DBMS_OUTPUT.PUT_LINE('Number of Years = ' || n);
    DBMS_OUTPUT.PUT_LINE('Simple Interest = ' || si);
END;
/