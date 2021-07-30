/* Dung Luong
Lab6
*/

--1
SELECT TO_CHAR(AVG(COST), '$999,999.99') AS "Average Cost per Course"
FROM STUDENT.COURSE;

--2
SELECT STUDENT_ID, STATE
FROM STUDENT.STUDENT JOIN STUDENT.ZIPCODE
ON STUDENT.ZIP = ZIPCODE.ZIP
ORDER BY STUDENT_ID
FETCH FIRST 10 ROWS ONLY;

--3
SELECT STUDENT_ID, STATE
FROM STUDENT.STUDENT S, STUDENT.ZIPCODE Z
WHERE S.ZIP = Z.ZIP
ORDER BY 1
FETCH FIRST 10 ROWS ONLY;

--4
SELECT STUDENT_ID, CITY ||', ' || STATE AS "City, State"
FROM STUDENT.STUDENT JOIN STUDENT.ZIPCODE
ON STUDENT.ZIP = ZIPCODE.ZIP
ORDER BY STUDENT_ID
FETCH FIRST 10 ROWS ONLY;

--5
SELECT DESCRIPTION AS "Course Description", TO_CHAR((REVENUE), '$999,999.99') AS "Total Revenue", TO_CHAR((REVENUE / NUM_OF_SECTIONS), '$999,999.99') AS "Revenue per section taught"
FROM STUDENT.COURSE JOIN STUDENT.COURSE_REVENUE
ON COURSE.COURSE_NO = COURSE_REVENUE.COURSE_NO
ORDER BY 3 DESC;

--6
SELECT  INSTRUCTOR.INSTRUCTOR_ID, FIRST_NAME, LAST_NAME, NUM_OF_CLASSES, NUM_OF_STUDENTS
FROM STUDENT.INSTRUCTOR  JOIN STUDENT.INSTRUCTOR_SUMMARY 
ON INSTRUCTOR.INSTRUCTOR_ID = INSTRUCTOR_SUMMARY.INSTRUCTOR_ID
ORDER BY 4 DESC, 5 DESC;

--7
SELECT GRADE_TYPE.GRADE_TYPE_CODE, DESCRIPTION, ROUND(AVG(NUMERIC_GRADE),2) AS "AVERAGE GRADE"
FROM STUDENT.GRADE_TYPE JOIN STUDENT.GRADE
ON GRADE_TYPE.GRADE_TYPE_CODE = GRADE.GRADE_TYPE_CODE
GROUP BY GRADE_TYPE.GRADE_TYPE_CODE, DESCRIPTION;

--8
SELECT I.INSTRUCTOR_ID, LAST_NAME, TO_CHAR((REVENUE / NUM_OF_STUDENTS), '$999,999.99') AS "Revenue per student"
FROM STUDENT.INSTRUCTOR I  JOIN STUDENT.INSTRUCTOR_SUMMARY S
ON I.INSTRUCTOR_ID = S.INSTRUCTOR_ID
WHERE REVENUE > 0
ORDER BY 3 DESC;

SELECT REVENUE / NUM_OF_SECTIONS
FROM STUDENT.COURSE_REVENUE;


--9
SELECT INVOICE_ID, VENDOR_NAME
FROM AP.INVOICES I, AP.VENDORS V
WHERE I.VENDOR_ID = V.VENDOR_ID
ORDER BY 1
FETCH FIRST 10 ROWS ONLY;

--10
SELECT DISTINCT VENDOR_NAME
FROM AP.VENDORS
FETCH FIRST 20 ROWS ONLY;

--11
SELECT INVOICE_ID, VENDOR_NAME
FROM AP.INVOICES I JOIN AP.VENDORS V
ON I.VENDOR_ID = V.VENDOR_ID
WHERE VENDOR_NAME BETWEEN 'H' AND 'M';

--12
SELECT MIN(PAYMENT_DATE) AS "Earliest Payment Date", MAX(PAYMENT_DATE) AS "Latest Payment Date", (((MAX(PAYMENT_DATE) - MIN(PAYMENT_DATE)) / 2) + MIN(PAYMENT_DATE)) AS "Date Between"
FROM AP.INVOICES;


--13
SELECT INVOICE_NUMBER, REPLACE(INVOICE_NUMBER, '-', '') AS "No Dash"
FROM AP.INVOICES
FETCH FIRST 20 ROWS ONLY;

--14
SELECT VENDOR_NAME
FROM AP.VENDORS
WHERE VENDOR_NAME LIKE '%Inc' OR VENDOR_NAME LIKE '%Inc.';

--15
SELECT VENDOR_NAME, LTRIM((REPLACE(VENDOR_ADDRESS1, 'NULL', '')) || ' ' || REPLACE(VENDOR_ADDRESS2, 'NULL', '') || ' ' || VENDOR_CITY || ', ' || VENDOR_STATE || ' ' || VENDOR_ZIP_CODE) AS "Complete Address"
FROM AP.VENDORS
WHERE VENDOR_NAME LIKE 'P%' ;






