CREATE TABLE RESULT (
    Rollno NUMBER(5) PRIMARY KEY,
    Name VARCHAR2(50),
    Sub1 NUMBER(3) CHECK (Sub1 BETWEEN 0 AND 100),
    Sub2 NUMBER(3) CHECK (Sub2 BETWEEN 0 AND 100),
    Sub3 NUMBER(3) CHECK (Sub3 BETWEEN 0 AND 100),
    Sub4 NUMBER(3) CHECK (Sub4 BETWEEN 0 AND 100),
    Sub5 NUMBER(3) CHECK (Sub5 BETWEEN 0 AND 100),
    Total NUMBER(3),
    Per NUMBER(5,2),
    Grade VARCHAR2(2)
);
INSERT INTO RESULT (Rollno, Name, Sub1, Sub2, Sub3, Sub4, Sub5)
VALUES (101, 'Ronak', 80, 75, 90, 85, 70);

COMMIT;

SET SERVEROUTPUT ON;

DECLARE
    rno RESULT.Rollno%TYPE := &rno;
    total RESULT.Total%TYPE;
    per RESULT.Per%TYPE;
    grade RESULT.Grade%TYPE;
BEGIN
    SELECT Sub1 + Sub2 + Sub3 + Sub4 + Sub5
    INTO total
    FROM RESULT
    WHERE Rollno = rno;

    per := total / 5;

    IF per >= 90 THEN
        grade := 'A+';
    ELSIF per >= 80 THEN
        grade := 'A';
    ELSIF per >= 70 THEN
        grade := 'B';
    ELSIF per >= 60 THEN
        grade := 'C';
    ELSIF per >= 50 THEN
        grade := 'D';
    ELSE
        grade := 'F';
    END IF;

    UPDATE RESULT
    SET Total = total,
        Per = per,
        Grade = grade
    WHERE Rollno = rno;

    DBMS_OUTPUT.PUT_LINE('Roll No = ' || rno);
    DBMS_OUTPUT.PUT_LINE('Total = ' || total);
    DBMS_OUTPUT.PUT_LINE('Percentage = ' || per || '%');
    DBMS_OUTPUT.PUT_LINE('Grade = ' || grade);

    COMMIT;
END;
/