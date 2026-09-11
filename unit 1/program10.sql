SET SERVEROUTPUT ON;

DECLARE
    eid_input NUMBER := &eid;
BEGIN
    DELETE FROM EMP
    WHERE EID = eid_input;

    IF SQL%ROWCOUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Employee record deleted successfully.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Employee with EID ' || eid_input || ' not found.');
    END IF;

    COMMIT;
END;
/
