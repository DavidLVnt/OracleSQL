/* Dung Luong
Lab7
*/

--1
SELECT COURSE.COURSE_NO, DESCRIPTION, NVL((COURSE_FEE * NUM_ENROLLED), '0') AS "Total Revenue per Course"
FROM STUDENT.COURSE LEFT JOIN STUDENT.COURSE_REVENUE
    ON COURSE.COURSE_NO = COURSE_REVENUE.COURSE_NO
ORDER BY 3 ;

--2
SELECT COURSE.COURSE_NO, DESCRIPTION, NVL((COURSE_FEE * NUM_ENROLLED), '0') AS "Total Revenue per Course"
FROM  STUDENT.COURSE_REVENUE  RIGHT JOIN STUDENT.COURSE
    ON COURSE.COURSE_NO = COURSE_REVENUE.COURSE_NO
ORDER BY 3 ;

--3
SELECT COURSE.COURSE_NO, DESCRIPTION, (COURSE_FEE * NUM_ENROLLED) AS "Total Revenue per Course"
FROM  STUDENT.COURSE_REVENUE  FULL JOIN STUDENT.COURSE
    ON COURSE.COURSE_NO = COURSE_REVENUE.COURSE_NO
    WHERE (COURSE_FEE * NUM_ENROLLED) IS NOT NULL
ORDER BY 3 DESC ;

--4
SELECT INSTRUCTOR.INSTRUCTOR_ID  AS "Instructors Not Teaching"
FROM STUDENT.INSTRUCTOR 
    MINUS
SELECT SECTION.INSTRUCTOR_ID
FROM STUDENT.SECTION;

--5
SELECT DESCRIPTION, COST, PREREQUISITE
FROM STUDENT.COURSE
WHERE COST > 1000 AND DESCRIPTION LIKE '%s' AND PREREQUISITE BETWEEN 25 AND 80;

--6
SELECT DISTINCT COST, COUNT(*) AS "Total Course"
FROM STUDENT.COURSE
GROUP BY COST
ORDER BY COUNT(*) DESC;

--7
SELECT COURSE_NO, DESCRIPTION
FROM STUDENT.COURSE
WHERE LENGTH(DESCRIPTION) >= 10 AND LENGTH(DESCRIPTION) <= 16
ORDER BY 1;

--8
SELECT TO_CHAR((CURRENT_DATE), 'MM/DD/YYYY') AS "Formatted Today's Date"
FROM DUAL;

--9
SELECT TO_CHAR(CURRENT_DATE, 'DD-MON-YYYY HH:MM:SS') "Formatted Today's Date"
FROM DUAL;

--10
SELECT TO_CHAR(CURRENT_DATE, 'Dy Mon DD, YYYY') "Formatted Today's Date"
FROM DUAL;

--11
SELECT MAX(COST) AS "Highest Cost"
FROM STUDENT.COURSE;

--12
SELECT TO_CHAR((MAX(COST)), '$999,999') AS "Highest Cost"
FROM STUDENT.COURSE;

--13
SELECT MIN(SALARY) AS "Minimum", MAX(SALARY) AS "Maximum", AVG(SALARY) AS "Average", MEDIAN(SALARY) AS "Median"
FROM STUDENT.EMPLOYEE;

--14
SELECT MIN(SALARY) + MAX(SALARY) AS " Min plus Max"
FROM STUDENT.EMPLOYEE;

--15
SELECT EMPLOYEE_ID, NAME, TITLE
FROM STUDENT.EMPLOYEE
WHERE TITLE IN ('Manager','Analyst')
ORDER BY 1 DESC;

--16
SELECT LAST_NAME
FROM STUDENT.STUDENT
WHERE SOUNDEX(LAST_NAME) = SOUNDEX('Archer')
ORDER BY 1 ;

--17
SELECT DISTINCT EMPLOYER, COUNT(*) AS "Number of Students Employed by"
FROM STUDENT.STUDENT
GROUP BY EMPLOYER
ORDER BY 2 DESC;

--18
SELECT DISTINCT EMPLOYER, COUNT(*) AS "Number of Students Employed by"
FROM STUDENT.STUDENT
GROUP BY EMPLOYER
HAVING COUNT(*) > 7
ORDER BY 2 DESC;

--19
SELECT STUDENT_ID, LAST_NAME || ', ' || FIRST_NAME AS "Last, First"
FROM STUDENT.STUDENT
ORDER BY 1
FETCH FIRST 10 ROWS ONLY; 

--20
SELECT MIDTERM_GRADE, FINALEXAM_GRADE, QUIZ_GRADE, COALESCE(MIDTERM_GRADE, FINALEXAM_GRADE, QUIZ_GRADE, TO_NUMBER('0')) AS "Default of 0"
FROM STUDENT.GRADE_SUMMARY;



