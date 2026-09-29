-- Q10. Function to return balance for a given account number


CREATE OR REPLACE FUNCTION ACCOUNT_BALANCE
(
    P_ACNO IN NUMBER
)
RETURN NUMBER
IS
    V_BALANCE NUMBER;
BEGIN
    SELECT BALANCE
    INTO V_BALANCE
    FROM ACCOUNT
    WHERE ACNO = P_ACNO;

    RETURN V_BALANCE;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(
            -20003,
            'Account number ' || P_ACNO || ' does not exist.'
        );
END;
/