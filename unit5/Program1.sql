/* Q1.Write a trigger to restrict users from accessing the 
table on weekends.*/

SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER TR_RESTRICT_WEEKEND
BEFORE INSERT OR UPDATE OR DELETE ON EMP
BEGIN
    IF TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH')
       IN ('SAT', 'SUN') THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Access to EMP table is restricted on weekends.'
        );
    END IF;
END;
/