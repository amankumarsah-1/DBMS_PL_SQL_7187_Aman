SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_emp IS
        SELECT *
        FROM EMP
        WHERE DEPTNO = &DEPT_NO;

    v_emp EMP%ROWTYPE;
    
    NO_DEPT_FOUND EXCEPTION;
    v_count NUMBER := 0;

BEGIN
    OPEN c_emp;

    LOOP
        FETCH c_emp INTO v_emp;
        EXIT WHEN c_emp%NOTFOUND;

        INSERT INTO EMP_BACKUP
        VALUES (
            v_emp.EMPNO,
            v_emp.ENAME,
            v_emp.JOB,
            v_emp.MGR,
            v_emp.HIREDATE,
            v_emp.SAL,
            v_emp.COMM,
            v_emp.DEPTNO
        );

        v_count := v_count + 1;
    END LOOP;

    CLOSE c_emp;

    IF v_count = 0 THEN
        RAISE NO_DEPT_FOUND;
    END IF;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE(v_count || ' record(s) inserted successfully.');

EXCEPTION
    WHEN NO_DEPT_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('NO_DEPT_FOUND: No employees found for this department.');

END;
/