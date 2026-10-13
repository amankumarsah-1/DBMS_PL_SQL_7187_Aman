/* Q5. Write a trigger to insert the existing values of the 
EMP table into NEWEMP table when the record is 
deleted from EMP table. */


SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER TR_EMPDELETE
BEFORE DELETE ON EMP
FOR EACH ROW
BEGIN
    INSERT INTO NEWEMP (EMPNO, ENAME, SAL)
    VALUES (:OLD.EMPNO, :OLD.ENAME, :OLD.SAL);
END;
/