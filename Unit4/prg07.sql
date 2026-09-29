-- Q7. Increase salary of employees of a given department
-- by an amount using IN parameter

CREATE OR REPLACE PROCEDURE INCREASE_SALARY_AMOUNT
(
    P_DEPTNO IN NUMBER,
    P_AMOUNT IN NUMBER
)
IS
BEGIN
    UPDATE U4EMP
    SET BASICSAL = BASICSAL + P_AMOUNT
    WHERE DEPTNO = P_DEPTNO;

    DBMS_OUTPUT.PUT_LINE(
        SQL%ROWCOUNT || ' employee(s) salary updated.'
    );

    COMMIT;
END;
/