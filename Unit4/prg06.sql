-- Q6. Procedure without parameter to update values in U4EMP
-- Increase basic salary of all employees by 10%


CREATE OR REPLACE PROCEDURE UPDATE_EMP
IS
BEGIN
    UPDATE U4EMP
    SET BASICSAL = BASICSAL + (BASICSAL * 10 / 100);

    DBMS_OUTPUT.PUT_LINE(
        SQL%ROWCOUNT || ' employee(s) salary updated.'
    );

    COMMIT;
END;
/
