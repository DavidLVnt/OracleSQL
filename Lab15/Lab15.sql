/* Dung Luong
Lab15
*/

---------------------1
CREATE TABLE EMPLOYEE_COPY AS
SELECT *
FROM STUDENT.EMPLOYEE;
/

CREATE OR REPLACE TRIGGER Lab15Trigger1
AFTER DELETE
ON EMPLOYEE_COPY
BEGIN
    INSERT INTO EMPLOYEE_COPY
    (EMPLOYEE_ID, NAME, SALARY, TITLE)
    VALUES( 5, 'David', 1500, 'Staff');
END;
/

DELETE FROM EMPLOYEE_COPY
WHERE EMPLOYEE_ID = 2;

---------------------2
ALTER TRIGGER Lab15Trigger1 DISABLE; 

---------------------3
CREATE OR REPLACE TRIGGER Lab15Trigger2
BEFORE DELETE 
ON EMPLOYEE_COPY
DECLARE 
    COUNT_ROW   NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO COUNT_ROW
    FROM EMPLOYEE_COPY;
    IF ( COUNT_ROW < 20 ) THEN
    RAISE_APPLICATION_ERROR(-20101, 'At least 20 rows in employee_copy table.');
    END IF;
END;
/

SHOW ERROR TRIGGER Lab15Trigger1;







