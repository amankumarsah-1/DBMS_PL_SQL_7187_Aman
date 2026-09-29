-- Q2. Increase salary of employees of given department by percentage

CREATE OR REPLACE PROCEDURE INCREASE_SALARY
(
    P_DEPTNO  IN NUMBER,
    P_PERCENT IN NUMBER
)
IS
BEGIN
    UPDATE U4EMP
    SET BASICSAL = BASICSAL + (BASICSAL * P_PERCENT / 100)
    WHERE DEPTNO = P_DEPTNO;

    DBMS_OUTPUT.PUT_LINE(
        SQL%ROWCOUNT || ' employee(s) salary updated.'
    );

    COMMIT;
END;
/
