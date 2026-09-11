SET SERVEROUTPUT ON;

DECLARE
    pname VARCHAR2(50) := '&pname';
    qty NUMBER := &qty;
    price NUMBER := &price;
    discount_per NUMBER := &discount_per;
    
    total NUMBER;
    discount NUMBER;
    net_amount NUMBER;
BEGIN
    total := qty * price;
    discount := total * discount_per / 100;
    net_amount := total - discount;

    DBMS_OUTPUT.PUT_LINE('Product Name = ' || pname);
    DBMS_OUTPUT.PUT_LINE('Quantity = ' || qty);
    DBMS_OUTPUT.PUT_LINE('Price = ' || price);
    DBMS_OUTPUT.PUT_LINE('Total Amount = ' || total);
    DBMS_OUTPUT.PUT_LINE('Discount = ' || discount);
    DBMS_OUTPUT.PUT_LINE('Net Amount = ' || net_amount);
END;
/