/* Dung Luong
Lab13
*/

--------------------------------------------------------1
SET SERVEROUTPUT ON;

DECLARE
    NUM NUMBER := 10;    
BEGIN
    DBMS_OUTPUT.PUT_LINE('The value of num is: ' || NUM);
END;

---------------------------------------------------------2
SET SERVEROUTPUT ON;

DECLARE
    COUNT_STUDENT NUMBER;    
BEGIN
    SELECT COUNT (*)
    INTO COUNT_STUDENT
    FROM STUDENT.STUDENT;
    
    DBMS_OUTPUT.PUT_LINE('Total student is: ' || COUNT_STUDENT);
END;

----------------------------------------------------------3
SET SERVEROUTPUT ON;

DECLARE
    NAME_VAR STUDENT.EMPLOYEE.NAME%TYPE;
    SAL_VAR STUDENT.EMPLOYEE.SALARY%TYPE;
    TIL_VAR STUDENT.EMPLOYEE.TITLE%TYPE;
BEGIN
    SELECT NAME, SALARY, TITLE
    INTO NAME_VAR, SAL_VAR, TIL_VAR
    FROM STUDENT.EMPLOYEE
    WHERE NAME = 'Stella';
    
    DBMS_OUTPUT.PUT_LINE('Name: ' || NAME_VAR || ', ' || 'Salary: ' || SAL_VAR || ', ' || 'Title: ' || TIL_VAR);
END;

-----------------------------------------------------------4
DECLARE
    MAX_INVOICE_TOTAL   VARCHAR2(20);
    MIN_INVOICE_TOTAL   VARCHAR2(20);
    
BEGIN
    SELECT TO_CHAR(MAX(INVOICE_TOTAL),'$99,999.99'), TO_CHAR(MIN(INVOICE_TOTAL),'$99,999.99')
    INTO MAX_INVOICE_TOTAL, MIN_INVOICE_TOTAL
    FROM AP.INVOICES;
    
    DBMS_OUTPUT.PUT_LINE('HIGHEST INVOICE TOTAL IS: ' || MAX_INVOICE_TOTAL); 
    DBMS_OUTPUT.PUT_LINE('LOWEST INVOICE TOTAL IS: ' || MIN_INVOICE_TOTAL);
END;

-----------------------------------------------------------5
DECLARE
    LASTEST_INVOICE_DUE_DATE AP.INVOICES.INVOICE_DUE_DATE%TYPE;
BEGIN
    SELECT MAX(INVOICE_DUE_DATE)
    INTO LASTEST_INVOICE_DUE_DATE
    FROM AP.INVOICES;
    
    DBMS_OUTPUT.PUT_LINE('LASTEST INVOICE DUE DATE IS: ' || LASTEST_INVOICE_DUE_DATE);
    IF LASTEST_INVOICE_DUE_DATE < '19-JUL-08' THEN
        DBMS_OUTPUT.PUT_LINE('OVERDUE!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('OK!');
    END IF;
END;

---------------------------------------------------------6
DECLARE
    CUSTOMER_STATE_VAR    VARCHAR2(20);
BEGIN
    SELECT CUSTOMER_STATE
    INTO CUSTOMER_STATE_VAR
    FROM OM.CUSTOMERS
     WHERE CUSTOMER_ID = 15;   
    
    CASE CUSTOMER_STATE_VAR
        WHEN 'WI' THEN
            DBMS_OUTPUT.PUT_LINE('Cold Winters! ');
        WHEN 'CA' THEN
            DBMS_OUTPUT.PUT_LINE('Modarate Winters! ');
        ELSE
            DBMS_OUTPUT.PUT_LINE(' No Information on type of Winters! ');
    END CASE;
END;

------------------------------------------------------7
BEGIN
    FOR i IN 1..3 LOOP
        DBMS_OUTPUT.PUT_LINE('i: ' || i);
    END LOOP;
END;
---

DECLARE
    i NUMBER:= 1;
BEGIN    
    WHILE i < 4 LOOP
        DBMS_OUTPUT.PUT_LINE('i: ' || i);
        i := i + 1;
    END LOOP;
END;
---

DECLARE
    i NUMBER:= 1;
BEGIN    
    LOOP
        DBMS_OUTPUT.PUT_LINE('i: ' || i);
        i := i + 1;
        EXIT WHEN i >=4;
    END LOOP;
END;

--------------------------------------------------------8
DECLARE
    NAME_VAR STUDENT.EMPLOYEE.NAME%TYPE;
    SAL_VAR STUDENT.EMPLOYEE.SALARY%TYPE;
    TIL_VAR STUDENT.EMPLOYEE.TITLE%TYPE;
BEGIN
    SELECT NAME, SALARY, TITLE
    INTO NAME_VAR, SAL_VAR, TIL_VAR
    FROM STUDENT.EMPLOYEE
    WHERE NAME = 'Sally';
    
    DBMS_OUTPUT.PUT_LINE('Name: ' || NAME_VAR || ', ' || 'Salary: ' || SAL_VAR || ', ' || 'Title: ' || TIL_VAR);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('WE CAN NOT FIND NAME ');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('AN UNEXPECTED EXCEPTION OCCURRED.');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;













