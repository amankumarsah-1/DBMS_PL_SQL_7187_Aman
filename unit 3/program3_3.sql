SET SERVEROUTPUT ON;

DECLARE
    e_name EMP.ename%TYPE := '&e_name';
    salary EMP.sal%TYPE;
BEGIN
    SELECT sal
    INTO salary
    FROM EMP 
    WHERE UPPER(ename) = UPPER(e_name);

    DBMS_OUTPUT.PUT_LINE('Employee Name : ' || e_name);
    DBMS_OUTPUT.PUT_LINE('Basic Salary  : ' || salary);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found.');

    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Multiple employees found with this name.');
END;
/