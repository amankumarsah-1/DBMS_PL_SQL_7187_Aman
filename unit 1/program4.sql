SET SERVEROUTPUT ON;

DECLARE
    feet NUMBER := &feet;
    cm NUMBER;
    inch NUMBER;
    meter NUMBER;
BEGIN
    cm := feet * 30.48;
    inch := feet * 12;
    meter := feet * 0.3048;

    DBMS_OUTPUT.PUT_LINE('Feet = ' || feet);
    DBMS_OUTPUT.PUT_LINE('Centimeter = ' || cm);
    DBMS_OUTPUT.PUT_LINE('Inch = ' || inch);
    DBMS_OUTPUT.PUT_LINE('Meter = ' || meter);
END;
/