/* Q4. Write a trigger to insert the existing values of the 
EMP table into NEWEMP table when the record is 
updated in EMP table. */


SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER TR_EMPUPDATE
BEFORE UPDATE ON EMP
FOR EACH ROW
BEGIN
    INSERT INTO NEWEMP (EMPNO, ENAME, SAL)
    VALUES (:OLD.EMPNO, :OLD.ENAME, :OLD.SAL);
END;
/