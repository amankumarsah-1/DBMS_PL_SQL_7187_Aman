-- Q8. Search whether the given employee number
-- is present or not using IN and OUT parameters

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

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(
            -20002,
            'Employee ID ' || P_EID || ' not found.'
        );
END;
/

DECLARE
    V_NAME VARCHAR2(30);
BEGIN
    SEARCH_EMP(102, V_NAME);
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || V_NAME);
END;
/