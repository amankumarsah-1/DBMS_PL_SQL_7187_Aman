-- Q1. Procedure without any parameter
-- Display a user-defined message

CREATE OR REPLACE PROCEDURE SHOW_MESSAGE
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Welcome to PL/SQL Programming');
END;
/
