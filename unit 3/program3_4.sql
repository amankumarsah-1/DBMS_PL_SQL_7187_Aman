SET SERVEROUTPUT ON;

DECLARE
    e_name EMP.ename%TYPE;
    salary EMP.sal%TYPE;
BEGIN
    SELECT ename, sal
    INTO e_name, salary
    FROM EMP
    WHERE age = 50;

    DBMS_OUTPUT.PUT_LINE('Employee Name : ' || e_name);
    DBMS_OUTPUT.PUT_LINE('Salary        : ' || salary);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employee found whose age is 50.');

    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('More than one employee has age 50.');
END;
/