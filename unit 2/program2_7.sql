SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_customer IS
        SELECT *
        FROM CUSTOMER;

    v_customer CUSTOMER%ROWTYPE;

BEGIN
    OPEN c_customer;

    LOOP
        FETCH c_customer INTO v_customer;
        EXIT WHEN c_customer%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Customer ID: ' || v_customer.CUSTOMER_ID
        );

        DBMS_OUTPUT.PUT_LINE(
            'Name: ' || v_customer.NAME
        );

        DBMS_OUTPUT.PUT_LINE(
            'City: ' || v_customer.CITY
        );

        DBMS_OUTPUT.PUT_LINE('----------------------');
    END LOOP;

    CLOSE c_customer;

END;
/