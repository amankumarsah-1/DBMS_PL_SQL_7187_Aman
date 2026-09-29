-- Q3. Search whether the given employee ID is present or not
-- Using IN and OUT parameters

CREATE OR REPLACE PROCEDURE SEARCH_EMP
(
    P_EID   IN NUMBER,
    P_ENAME OUT VARCHAR2
)
IS
BEGIN
    SELECT ENAME
    INTO P_ENAME
    FROM U4EMP
    WHERE EID = P_EID;

    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || P_ENAME);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Employee ID ' || P_EID || ' not found.'
        );
END;
/

DECLARE
    V_NAME VARCHAR2(30);
BEGIN
    SEARCH_EMP(101, V_NAME);
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || V_NAME);
END;
/