/* Q3.  Write a trigger to insert the values into the 
NEWEMP table when the records are inserted into the 
EMP table.*/

SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER TR_EMPINSERT
BEFORE INSERT ON EMP
FOR EACH ROW
BEGIN
    INSERT INTO NEWEMP (EMPNO, ENAME, SAL)
    VALUES (:NEW.EMPNO, :NEW.ENAME, :NEW.SAL);
END;
/
