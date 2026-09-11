SET SERVEROUTPUT ON;

DECLARE
    celsius NUMBER := &celsius;
    fahrenheit NUMBER;
BEGIN
    fahrenheit := (celsius * 9 / 5) + 32;

    DBMS_OUTPUT.PUT_LINE('Celsius = ' || celsius);
    DBMS_OUTPUT.PUT_LINE('Fahrenheit = ' || fahrenheit);
END;
/