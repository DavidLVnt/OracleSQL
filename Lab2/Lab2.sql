/* Dung Luong
Lab2
*/

--1 WHERE clause is used to filter the rows in the base table so that only those rows match the search condition are included in the result set. This iss optional clause.

--2
SELECT INVOICE_ID, VENDOR_ID, INVOICE_NUMBER, INVOICE_DATE, INVOICE_TOTAL, PAYMENT_TOTAL, CREDIT_TOTAL, TERMS_ID, INVOICE_DUE_DATE, PAYMENT_DATE
FROM AP.INVOICES
WHERE VENDOR_ID = 34;

--3
SELECT *
FROM AP.INVOICES
WHERE INVOICE_TOTAL = 356.48;

--4
SELECT *
FROM AP.INVOICES
WHERE INVOICE_ID IN (81, 82, 90);

--5
SELECT *
FROM AP.INVOICES
WHERE VENDOR_ID <= 44;

--6
SELECT *
FROM AP.INVOICES
WHERE CREDIT_TOTAL != 0;

--7
SELECT *
FROM AP.INVOICES
WHERE INVOICE_DATE = '1-MAY-2014';

--8
SELECT *
FROM AP.INVOICES
WHERE PAYMENT_TOTAL BETWEEN 100 AND 115;

--9
SELECT *
FROM AP.INVOICES    
WHERE INVOICE_DATE BETWEEN '1-MAY-2014' AND '8-MAY-2014';

--10
SELECT *
FROM AP.INVOICES
WHERE INVOICE_NUMBER LIKE 'P%';

--11
SELECT *
FROM AP.INVOICES
WHERE INVOICE_NUMBER LIKE 'P-3%';

--12
SELECT *
FROM AP.INVOICES
WHERE INVOICE_NUMBER LIKE '%-X';

--13
SELECT *
FROM AP.INVOICES
WHERE INVOICE_NUMBER LIKE '%11%';

--14
SELECT *
FROM AP.INVOICES
WHERE INVOICE_NUMBER LIKE '%0-3%';

--15
SELECT *
FROM AP.INVOICES
WHERE PAYMENT_DATE IS NULL;

--16
SELECT *
FROM AP.INVOICES
WHERE PAYMENT_DATE IS NOT NULL;

--17
SELECT *
FROM AP.INVOICES
WHERE PAYMENT_TOTAL = 0 AND INVOICE_TOTAL > 100;

--18
SELECT *
FROM AP.INVOICES
WHERE PAYMENT_TOTAL BETWEEN 0 AND 25 OR INVOICE_TOTAL > 100;

--19
SELECT *
FROM AP.INVOICES
WHERE TERMS_ID NOT IN (1, 2, 3, 4);

--20
SELECT *
FROM AP.INVOICES
WHERE INVOICE_DATE = '1-MAY-2014' OR INVOICE_DATE = '17-MAY-2014'
 AND PAYMENT_TOTAL = 0;


















