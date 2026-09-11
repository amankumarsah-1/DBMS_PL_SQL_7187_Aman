CREATE TABLE EMP (
    EID NUMBER(5) PRIMARY KEY,
    EName VARCHAR2(50),
    Deptno NUMBER(5),
    Deptname VARCHAR2(30),
    Gender VARCHAR2(10),
    Age NUMBER(3),
    BasicSal NUMBER(10,2)
);

INSERT INTO EMP
VALUES (101, 'Ronak', 10, 'HR', 'Male', 20, 30000);

COMMIT;

SET SERVEROUTPUT ON;

DECLARE
    eid NUMBER := &eid;
    ename EMP.EName%TYPE;
    basic_sal EMP.BasicSal%TYPE;
    hra NUMBER;
    da NUMBER;
    medical NUMBER := 500;
    pf NUMBER;
    gross_sal NUMBER;
BEGIN
    SELECT EName, BasicSal
    INTO ename, basic_sal
    FROM EMP
    WHERE EID = eid;

    hra := basic_sal * 15 / 100;
    da := basic_sal * 50 / 100;
    pf := basic_sal * 10 / 100;

    gross_sal := basic_sal + (da + hra + medical) - pf;

    DBMS_OUTPUT.PUT_LINE('Employee ID = ' || eid);
    DBMS_OUTPUT.PUT_LINE('Employee Name = ' || ename);
    DBMS_OUTPUT.PUT_LINE('Basic Salary = ' || basic_sal);
    DBMS_OUTPUT.PUT_LINE('HRA = ' || hra);
    DBMS_OUTPUT.PUT_LINE('DA = ' || da);
    DBMS_OUTPUT.PUT_LINE('Medical = ' || medical);
    DBMS_OUTPUT.PUT_LINE('PF = ' || pf);
    DBMS_OUTPUT.PUT_LINE('Gross Salary = ' || gross_sal);
END;
/