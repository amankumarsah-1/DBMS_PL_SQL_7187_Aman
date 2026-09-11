CREATE TABLE EMP_UPDATE (
    EID NUMBER(5),
    EName VARCHAR2(50),
    OldSal NUMBER(10,2),
    NewSal NUMBER(10,2),
    UpdateDate DATE
);
SET SERVEROUTPUT ON;

DECLARE
    CURSOR emp_cursor IS
        SELECT EID, EName, BasicSal
        FROM EMP
        WHERE Deptno = 20;

    v_eid EMP.EID%TYPE;
    v_ename EMP.EName%TYPE;
    v_salary EMP.BasicSal%TYPE;
    v_new_salary EMP.BasicSal%TYPE;

BEGIN
    OPEN emp_cursor;

    IF emp_cursor%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('Cursor is Open.');
    END IF;

    LOOP
        FETCH emp_cursor INTO v_eid, v_ename, v_salary;

        EXIT WHEN emp_cursor%NOTFOUND;

        v_new_salary := v_salary * 1.05;

        UPDATE EMP
        SET BasicSal = v_new_salary
        WHERE EID = v_eid;

        INSERT INTO EMP_UPDATE
        VALUES (
            v_eid,
            v_ename,
            v_salary,
            v_new_salary,
            SYSDATE
        );

        DBMS_OUTPUT.PUT_LINE(
            'Salary updated for ' || v_ename ||
            ' : ' || v_salary || ' -> ' || v_new_salary
        );
    END LOOP;

    IF emp_cursor%NOTFOUND THEN
        IF emp_cursor%ROWCOUNT = 0 THEN
            DBMS_OUTPUT.PUT_LINE(
                'No employee found in Department 20.'
            );
        END IF;
    END IF;

    CLOSE emp_cursor;

    IF NOT emp_cursor%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('Cursor is Closed.');
    END IF;

    COMMIT;
END;
/