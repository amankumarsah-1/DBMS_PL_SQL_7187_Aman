/* Q2. Write a trigger that restricts the entry of records in 
the EMP table if the salary is greater than Rs 50000. */

SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER TR_CHECK_SALARY
BEFORE INSERT OR UPDATE OF SAL ON EMP
FOR EACH ROW
BEGIN
    IF :NEW.SAL > 50000 THEN
        RAISE_APPLICATION_ERROR(
            -20002,
            'Salary cannot be greater than Rs. 50000.'
        );
    END IF;
END;
/