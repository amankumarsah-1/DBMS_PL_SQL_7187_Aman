SET SERVEROUTPUT ON;

DECLARE
    s_name RESULT.name%TYPE := '&s_name';
    r RESULT%ROWTYPE;
BEGIN
    SELECT *
    INTO r
    FROM RESULT
    WHERE UPPER(name) = UPPER(s_name);

    DBMS_OUTPUT.PUT_LINE('Student Name : ' || r.name);
    DBMS_OUTPUT.PUT_LINE('Roll No      : ' || r.roll_no);
    DBMS_OUTPUT.PUT_LINE('Subject 1    : ' || r.sub1);
    DBMS_OUTPUT.PUT_LINE('Subject 2    : ' || r.sub2);
    DBMS_OUTPUT.PUT_LINE('Subject 3    : ' || r.sub3);
    DBMS_OUTPUT.PUT_LINE('Subject 4    : ' || r.sub4);
    DBMS_OUTPUT.PUT_LINE('Subject 5    : ' || r.sub5);
    DBMS_OUTPUT.PUT_LINE('Total        : ' || r.total);
    DBMS_OUTPUT.PUT_LINE('Percentage   : ' || r.per);
    DBMS_OUTPUT.PUT_LINE('Grade        : ' || r.grade);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Student not found.');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Multiple students found with this name.');
END;
/ 