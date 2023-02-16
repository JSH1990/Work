--1
SELECT EMPLOYEE_ID, FIRST_NAME || ' '||LAST_NAME AS 성명, LOWER(JOB_ID), DEPARTMENT_ID
    FROM employees
    WHERE LOWER(LAST_NAME) = 'king';
    
--2
SELECT EMPLOYEE_ID, FIRST_NAME || ' '||LAST_NAME AS 성명, LOWER(JOB_ID), DEPARTMENT_ID
    FROM employees
    WHERE UPPER(LAST_NAME) = 'KING';
    
--3
SELECT DEPARTMENT_ID || ' ' || DEPARTMENT_NAME || ' ' || LOCATION_ID AS "부서정보"
    FROM DEPARTMENTS;

--4
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY, DEPARTMENT_ID
    FROM employees
    WHERE SUBSTR(FIRST_NAME, 1, 1) > 'K' AND SUBSTR(FIRST_NAME, 1, 1) < 'Y'
    ORDER BY FIRST_NAME;
    
--5
SELECT EMPLOYEE_ID, FIRST_NAME, LENGTH(FIRST_NAME), SALARY, LENGTH(SALARY)
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID = 20;
    
--6
SELECT FIRST_NAME, INSTR(FIRST_NAME, 'e', 1)
    FROM EMPLOYEES;
    
--7
SELECT FIRST_NAME, SALARY, MOD(SALARY, 30)
    FROM EMPLOYEES;
    
--8
SELECT FIRST_NAME, HIRE_DATE, 
    TRUNC((SYSDATE - HIRE_DATE) / 7)||'주'||
    TRUNC(MOD(SYSDATE - HIRE_DATE),7)) || '일' AS "근무 주/일"
    FROM EMPLOYEES
    ORDER BY HIRE_DATE;

SELECT * FROM EMP;
SELECT ENAME, SAL FROM EMP;
SELECT SUM(SAL) FROM EMP;

SELECT * FROM EMP;
SELECT ENAME, SAL FROM EMP;

SELECT ENAME, SUM(SAL) FROM EMP;

SELECT DEPNO, SUM(SAL)
    FROM EMP;
    
SELECT DEPTNO, SUM(SAL)
    FROM EMP
    GROUP BY DEPTNO;
    
SELECT JOB, AVG(SAL)
FROM EMP
GROUP BY JOB;

SELECT JOB, COUNT(*)
FROM EMP
GROUP BY JOB;

SELECT JOB, MAX(SAL)
FROM EMP
GROUP BY JOB;
/* 합계 구하는 SUM 함수 */
-- DISTTNCT : 중복 제거
-- ALL : 사용하지 않아도 기본적으로 ALL 특성을 가집니다.
SELECT SUM(DISTINCT SAL) AS 중복제거 , SUM(ALL SAL) AS 전부, SUM(SAL) AS 기본
FROM EMP;

SELECT COUNT(*) FROM EMP;
SELECT COUNT(COMM) FROM EMP; -- COMM 이 NULL이 아닌 사원의 수
SELECT COUNT(COMM)
    FROM EMP
    WHERE COMM IS NOT NULL;
    
-- 부서 번호가 20인 사원 중 입사일이 가장 최근인 사원 출력
SELECT MAX(HIREDATE)
    FROM EMP
    WHERE DEPTNO = 20;

/* GROUP BY : 하나의 결과를 특정 열을 묶어서 출력하는 것을 그룹화한다고 합니다.
-- 이때 출력해야 할 대상열을 지정을 GROUP BY 수행 합니다.
SELECT TRUNC(AVG(SAL)), DEPTNO
    FROM EMP
    GROUP BY DEPTNO;
    
SELECT TRUNC(AVG(SAL))
    FROM EMP
    WHERE DEPTNO = 10;
    
/* 부서 번호 및 직책별 평균 급여로 정렬하기 */
SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
    GROUP BY DEPTNO, JOB
    DRDER BY DEPTNO, JOB;

/* GROUP BY절을 사용하여 부서 번호별 평균 추가 수당을 출력 */
SELECT NVL(AVG(COMM), 0), DEPTNO
    FROM EMP
    GROUP BY DEPTNO;
/* 부서 코드, 급여 합계, 부서 평균, 부서 코드 순 정렬 */
SELECT DEPTNO 부서코드,
    SUM(SAL) 합계,
    FLOOR(AVG(SAL)) 평균,
    COUNT(*) 인원수
FROM EMP
GROUP BY DEPTNO;

SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
    --WHERE AVG(SAL) >= 2000
    GROUP BY DEPTNO, JOB
    ORDER BY DEPTNO, JOB;
    
/* WHERE절과 HAVING절을 모두 사용하는 경우 */
SELECT DEPTNO, JOB, AVG(SAL) 
    FROM EMP --첫번째 수행 : 12~ 13개 행이 있음
    WHERE SAL <= 2500
    GROUP BY DEPTNO, JOB
        HAVING AVG(SAL) >= 2000
    ORDER BY DEPTNO, JOB;
    
SELECT * FROM EMP;

SELECT DEPTNO, TRUNC(AVG(SAL)), MAX(SAL), MIN(SAL), COUNT(*)
    FROM EMP
    GROUP BY DEPTNO;

SELECT JOB, COUNT(*)
    FROM EMP
    GROUP BY JOB
    HAVING COUNT(*) >=3;
    
SELECT TO_CHAR(HIREDATE, 'YYYY') AS  "입사일",
    DEPTNO,
    COUNT(*) AS "사원수"
    FROM EMP
    GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO;

SELECT NVL2(COMM, 'O', 'X'), COUNT(*) 
    FROM EMP
    GROUP BY NVL2(COMM, 'O', 'X');
    
SELECT DEPTNO , TO_CHAR(HIREDATE, 'YYYY'), COUNT(*), MAX(SAL), TRUNC(AVG(SAL)),SUM(SAL)
    FROM EMP
    GROUP BY DEPTNO, TO_CHAR(HIREDATE, 'YYYY')
    ORDER BY TO_CHAR(HIREDATE, 'YYYY');
    
    
    
    