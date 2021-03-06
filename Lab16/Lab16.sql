/* Dung Luong
Lab16
*/

---------------------------------1
CREATE OR REPLACE FUNCTION GET_BALANCE_DUE
(
    INVOICE_ID_PARAM    NUMBER
)
    RETURN NUMBER
    AS 
    BALANCE_DUE_VAR NUMBER;
BEGIN
    SELECT INVOICE_TOTAL - PAYMENT_TOTAL - CREDIT_TOTAL AS BALANCE_DUE
    INTO BALANCE_DUE_VAR
    FROM AP.INVOICES
    WHERE INVOICE_ID = INVOICE_ID_PARAM;
    
    RETURN BALANCE_DUE_VAR;
END;
/

SELECT VENDOR_ID, INVOICE_NUMBER, GET_BALANCE_DUE(INVOICE_ID) AS BALANCE_DUE
FROM AP.INVOICES
WHERE VENDOR_ID = 121;
    
------------------------------------2
CREATE OR REPLACE PROCEDURE UPDATE_EMPLOYEE
(
    EMPLOYEE_ID_PARAM   VARCHAR2,
    SALARY_PARAM    NUMBER
)
AS
BEGIN
    IF SALARY_PARAM < 0 THEN
        RAISE_APPLICATION_ERROR(-20102, 'Salary must be positive number');
    END IF;
    
    UPDATE EMPLOYEE_COPY
    SET SALARY = SALARY_PARAM
    WHERE EMPLOYEE_ID = EMPLOYEE_ID_PARAM;
    
    COMMIT;
END;
/

CALL UPDATE_EMPLOYEE ('4', -100);
CALL UPDATE_EMPLOYEE ('4', 2000);
    
    