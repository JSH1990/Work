/* 2023�� 2��15�� */
-- SUBSTR�Լ��� �ٸ� �Լ� �հ� ��� --
SELECT JOB,
    SUBSTR(JOB, -LENGTH(JOB)), -- JOB�� ���̴� 5�̰�, 5�� ���� ������ ���ϸ� �ڿ��� ���� �������� Ŀ���鼭 �о� ��
    SUBSTR(JOB, -LENGTH(JOB) ,2),
    SUBSTR(JOB, -3)
FROM EMP;

-- REPLACE : Ư�� ���ڿ� �����Ϳ� ���Ե� ���ڸ� �ٸ� ���ڷ� ��ü �� �� ��� (�ڹ��� ������ ����), ��ü�� ���ڿ��� ���� ������ ������ ȿ��
SELECT '010-5506-4146' AS ��������,
    REPLACE('010-5006-4146', '-', ' ') �������� ��������, 
    REPLACE('010-5006-4146', '-') ������ ����
    FROM DUAL;

-- LPAD / READ : ������ ĭ���� �����ϰ�, ��ĭ ��ŭ Ư�� ���ڷ� ä��� ���
SELECT LPAD('ORACLE', 10, '+') FROM DUAL;
SELECT RPAD('ORACLE', 10, '+') FROM DUAL;
SELECT 'ORACLE',
    LPAD('ORACLE', 10, '@') AS LPAD_1,
    RPAD('ORACLE', 10, '*') AS RPAD_1,
    LPAD('ORACLE', 10) AS LPAD_2,
    RPAD('ORACLE', 10) AS RPAD_2
FROM DUAL;

--�������� ���ڸ��� * ǥ�÷� ����ϱ�
SELECT
    RPAD('971225-', 14, '*') AS RPAD_JUMIN,
    RPAD('010-5006-', 13, '*')AS RPAD_PHONE
FROM DUAL;

-- �� ���ڿ��� ��ġ�� CONCAT �Լ�
SELECT CONCAT(EMPNO, ENAME),
    CONCAT(EMPNO, CONCAT(' : ', ENAME)) -- ��ø ���
    FROM EMP
    WHERE ENAME = 'JAMES';
    
-- TRIM/LTRIM/RTRIM : ���ڿ� ������ Ư�� ���ڸ� ����� ���� ���
SELECT '[' || TRIM(' _ ORACLE_ ') || ']' AS TRIM,
    '[' || LTRIM(' _ ORACLE_ ') || ']' AS LTRIM,
    '[' || LTRIM('<_ ORACLE_>', '_<') || ']' AS LTRIM_2, -- ���ڿ��� ���ڸ� ����� ������ ������ ���� �ʾƵ� ������
    '[' || RTRIM(' _ ORACLE_ ') || ']' AS RTRIM,
    '[' || RTRIM('<_ ORACLE_>', '_>') || ']' AS RTRIM_2
FROM DUAL;

SELECT TRIM('     JKS2024    ') AS TRIM FROM DUAL;

SELECT SYSDATE AS NOW,
    SYSDATE-1 AS YESTERDAY, -- �ü������ �о�� �ð��������� 1���� ��
    SYSDATE+1 AS TOMORROW -- �ü������ �о�� �ð��������� 1���� ����
FROM DUAL;

/* �� ���� ������ ��¥�� ���ϴ� ADD_MONTHS �Լ� */
-- Ư�� ��¥�� ������ ���� �� ���� ��¥ �����͸� ��ȯ�ϴ� �Լ�
-- ADD_MONTHS (��¥ ������, ���� ���� ��)

SELECT SYSDATE,
    ADD_MONTHS(SYSDATE, 3)
    FROM DUAL;
    
 /* �ǽ� ���� : ����� ���� �����ȣ, �̸�, �Ի���, 10�ֳ� ����� ��¥�� ����ϱ� */
SELECT EMPNO, ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 120) AS WORK10YEAR FROM EMP;

/* ���� �ð��� 8���� ���� �ð� ��� 
SELECT SYSDATE ����ð�,
    ADD_MONTHS(SYSDATE, 8) AS "8���� �����" 
FROM EMP;*/

SELECT EMPNO, ENAME, HIREDATE, SYSDATE,
    MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MOTHS1,
    MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MOTHS2,
    TRUNC (MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONHS3
FROM EMP;

FROM EMP;
/* ���ƿ��� ����, ���� ������ ��¥�� ���ϴ� NEXT_DAY, LAST_DAY �Լ� */

SELECT SYSDATE,
    NEXT_DAY(SYSDATE, '�����'),
    LAST_DAY(SYSDATE)
FROM DUAL;

SELECT EXTRACT(YEAR FROM DATE '1998-03-07')
FROM DUAL;

SELECT EXTRACT(MONTH FROM SYSDATE) FROM DUAL; -- ���� ������� ����

/* �ڷ����� ��ȯ�ϴ� �� ��ȯ �Լ� */
-- ����Ŭ�� �ڹٿ� ���������� ����� ����ȯ�� ������ ����ȯ�� �ֽ��ϴ�.
-- �ڵ�(������) ����ȯ : ���ڿ� ���� �ڷ����� ������ �ڵ����� ���ڸ� ��ȯ(�ڹٿ� �ٸ���)

SELECT EMPNO, ENAME, EMPNO + '500'
FROM EMP;

/*��¥, ���ڸ� ���ڷ� ��ȯ�ϴ� TO_CHAR �Լ� */
-- TO_CHAR �Լ��� ��¥, ���ڵ����͸� ���� �����ͷ� ��ȯ���ִ� �Լ��Դϴ�.
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS "���� ��¥�� �ð�"
FROM DUAL;

-- �پ��� �������� ����ϱ�
SELECT SYSDATE,
    TO_CHAR(SYSDATE, 'CC') AS ����,
    TO_CHAR(SYSDATE, 'YY') AS ����,
    TO_CHAR(SYSDATE, 'YYYY/MM/DD PM HH:MI:SS') AS "��/��/�� ��:��:��",
    TO_CHAR(SYSDATE, 'Q') AS ����,
    TO_CHAR(SYSDATE, 'DD') AS ��,
    TO_CHAR(SYSDATE, 'DDD') AS �����,
    TO_CHAR(SYSDATE, 'HH') AS "12�ð���",
    TO_CHAR(SYSDATE, 'HH12') AS "12�ð���",
    TO_CHAR(SYSDATE, 'HH24') AS "24�ð���",
    TO_CHAR(SYSDATE, 'W') AS ������
FROM DUAL;

-- Ư�� �� ���缭 ��¥ ����ϱ�
SELECT SYSDATE,
    TO_CHAR(SYSDATE, 'MM') AS MM,
    TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = KOREAN') AS MON_KOR,
    TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_JPN,
FROM DUAL;

SELECT SYSDATE,
     TO_CHAR(SYSDATE, 'MM') AS MM,
     TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = KOREAN' ) AS MON_KOR,
     TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_JPN,
     TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS MON_ENG,
     TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = KOREAN' ) AS MONTH_KOR,
     TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = JAPANESE') AS MONTH_JPN,
     TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS MONTH_ENG
FROM DUAL;

-- ���� ������ ������ �����Ͽ� ����ϱ�
-- 9 : ������ �� �ڸ��� �ǹ��ϰ� �� �ڸ��� ä���� ����
-- 0 : �� �ڸ��� 0���� ä��
-- $ : �޷� ǥ�ø� ����
-- L : ���� ȭ�� ������ ǥ��
-- . : �Ҽ��� ǥ��
-- , : õ ���� ǥ��

/* 1981�� 6�� 1�� ���Ŀ� �Ի��� ��� ���� ����ϱ� */
SELECT * FROM EMP WHERE HIREDATE > TO_DATE('1981/06/01' , 'YYYY/MM/DD');

/* NVL �Լ��� ���� */
-- NVL(�����Ϳ�, ���� �����Ͱ� NULL�� ��� ��ȯ �� ������)
SELECT EMPNO, ENAME, SAL ,COMM,
    NVL(COMM,0), 
    SAL*12+NVL (COMM,0)
FROM EMP;

--NVL2(�˻��� �����Ϳ�, NULL�� �ƴ� ��쿡 ���� ����, NULL�� ��쿡 ���� ����)
SELECT EMPNO, ENAME, COMM,
    NVL2(COMM, 'O', 'X') AS "NULL ���� ǥ��",
    NVL2(COMM, SAL*12+COMM, SAL*12) AS "���� ���"
FROM EMP;

SELECT EMPNO, ENAME, JOB, SAL,
     DECODE(JOB,
     'MANAGER' , SAL*1.1,
     'SALESMAN', SAL*1.05,
     'ANALYST' , SAL,
     SAL*1.03) AS UPSAL
 FROM EMP;
 
 SELECT EMPNO, ENAME, COMM,
    CASE
        WHEN COMM IS NULL THEN '�ش� ���� ����'
        WHEN COMM = 0 THEN '�������'
        WHEN COMM > 0 THEN '���� : ' || COMM
    END AS ����ǥ��
 FROM EMP;    
 
 /* ������ �ǽ� ���� 
 ��ǿ� �ִ� 4�� ����
 --1
SELECT EMPNO,
    RPAD(SUBSTR(EMPNO, 1, 2), 4, '*') AS MASKING_EMPNO,
       ENAME,
    RPAD(SUBSTR(EMNAME, 1, 1), LENGTH(ENAME), '*') AS MASKING_ENAME
    FROM EMP
    WHERE LENGTH(ENAME) >= 5
    AND LENGTH(ENAME) < 6;

--2
SELECT EMPNO, ENAME, SAL,
    TRUNC(SAL/21.5, 2) AS DAY_PAY,
    ROUND(SAL/21.5/8, 1) AS TIME_PAY
FROM EMP;
 
--3
SELECT EMPNO, ENAME, HIREDATE,
    TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE, 3),'������'), 'YYYY-MM-DD' AS R_JOB,
    NVL(TO_CHAR(COMM), 'N/A') AS COMM
FROM EMP;

--4
SELECT EMPNO, ENAME, MGR,
    CASE
        WHEN MGR IS NULL THEN '0000'
        WHEN SUBSTR(MGR, 1, 2) = '78' THEN '8888'
        ELSE TO_CHAR(MGR)
    END AS CHG_MGR
   FROM EMP; 



 SCOTT ���� ����
 --1
 SELECT SYSDATE NOW FROM DUAL;
 
 --2
 SELECT * FROM EMP;
 SELECT EMPNO, ENAME, SAL FROM EMP ORDER BY SAL DESC;
 
 --3
 SELECT * F
 