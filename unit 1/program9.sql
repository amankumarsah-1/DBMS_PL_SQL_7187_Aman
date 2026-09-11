SET SERVEROUTPUT ON;

DECLARE
    found_count NUMBER := 0;
BEGIN
    FOR emp_rec IN (
        SELECT EID, EName, Deptno, Deptname, Gender, Age, BasicSal
        FROM EMP
        WHERE Gender = 'Male'
        AND Deptname = 'HR'
    )
    LOOP
        found_count := found_count + 1;

        DBMS_OUTPUT.PUT_LINE('EID = ' || emp_rec.EID);
        DBMS_OUTPUT.PUT_LINE('Name = ' || emp_rec.EName);
        DBMS_OUTPUT.PUT_LINE('Dept No = ' || emp_rec.Deptno);
        DBMS_OUTPUT.PUT_LINE('Department = ' || emp_rec.Deptname);
        DBMS_OUTPUT.PUT_LINE('Gender = ' || emp_rec.Gender);
        DBMS_OUTPUT.PUT_LINE('Age = ' || emp_rec.Age);
        DBMS_OUTPUT.PUT_LINE('Basic Salary = ' || emp_rec.BasicSal);
        DBMS_OUTPUT.PUT_LINE('---------------------------');
    END LOOP;

    IF found_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No Male Employee Found in HR Department');
    END IF;
END;
/