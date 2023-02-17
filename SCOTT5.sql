--1
SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
    GROUP BY DEPTNO, JOB
        HAVING AVG(SAL) >= 500 -- �׷����� ���� �࿡ ���ؼ� ���������� �ο��Ϸ��� HAVING���� ���
    ORDER BY DEPTNO, JOB;
--2
SELECT DEPTNO, TRUNC(AVG(SAL)) AS "��� �޿�",
    MAX(SAL) AS "�ְ� �޿�",
    MIN(SAL) AS "���� �޿�",
    COUNT(*) AS "��� ��"
    FROM EMP
    GROUP BY DEPTNO;
--3
SELECT JOB AS "��å", COUNT(*) AS "�����"
    FROM EMP
    GROUP BY JOB
    HAVING COUNT(*) >= 3;
--4
SELECT TO_CHAR(HIREDATE, 'YYYY') AS "�Ի���",
    DEPTNO,
    COUNT(*) AS "�����"
    FROM EMP
    GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO;
--5
SELECT NVL2(COMM, 'O', 'X') AS "�߰�����",
    COUNT(*) AS "�����"
    FROM EMP
    GROUP BY NVL2(COMM, 'O', 'X');
SELECT DEPTNO,
    TO_CHAR(HIREDATE, 'YYYY') AS "�Ի�⵵",
    COUNT(*) AS "�����",
    MAX(SAL) AS "�ְ�޿�",
    TRUNC(AVG(SAL)) AS "��ձ޿�",
    SUM(SAL) AS "�հ�"
    FROM EMP
    GROUP BY DEPTNO, TO_CHAR(HIREDATE, 'YYYY')
    ORDER BY DEPTNO;

SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
    FROM EMP
    GROUP BY ROLLUP(DEPTNO, JOB);

SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
UNION ALL
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE ENAME = 'FORD';

-- INTERSECT : ������ : �ΰ��� �������� ��� ���ԵǾ� �ִ� �����͸� ǥ��    
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE SAL > 1000
INTERSECT
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE SAL < 2000;
    
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE SAL > 1000;
MINUS
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE SAL > 2000;

-- JOIN�� �� �� �̻��� ���̺��� �����͸� �����ͼ� �����ϴµ� ���Ǵ� SQL�� ���
-- ���̺��� �ĺ� ���� PRIMARY KEY�� ���̺� �� ���� ���� FOREIGN KEY ���� ����Ͽ� ����
-- INNER JOIN : ���� ���̺��� ��� �����Ϳ� ������ �����Ϳ��� ��ġ�ϴ� �����͸� ����
-- RIGHT JOIN : ������ ���̺��� ��� �����Ϳ� ���� ���̺��� ��ġ�ϴ� ������ ����

-- �ΰ��� ���̺��� ��� ����
SELECT * 
    FROM EMP , DEPT
    ORDER BY EMPNO;    
    
SELECT *
    FROM EMP, DEPT;

SELECT *
    FROM EMP, DEPT
    WHERE EMP.DEPTNO = DEPT.DEPTNO

/* ���̺��� ��Ī �ֱ� : ���� ���̺� ��ο� �����ϴ� ���� ���ؼ��� ���̺� �̸��� ����ؾ� ��
SELECT EMPNO, ENAME, JOB, D.DEPTNO, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO;
    
/* � ����(equi join) */
-- ���̺��� ������ �Ŀ� ��� ���� �� ���̺��� Ư�� ���� ��ġ�� �����͸� �������� �����ϴ� ���
-- ANSI ���� ������� �����ϱ�
-- ����Ŭ9i ������ ����Ŭ ���θ� ��� �� �� �־�����, ����Ŭ 10g���ʹ� ANSI ������ �߰��� ��� ����

SELECT EMPNO, ENAME, E.DEPTNO DNAME
    FROM EMP E JOIN DEPT D
    ON E.DEPTNO = D.DEPTNO
    WHERE E.JOB = 'MANAGER';
    
--EMP�� DEPT���̺��� �����ϰ� �޿��� 3000�̻��� ��� ���� ���(�����ȣ, �̸�, �޿�, �Ի���, �μ���ȣ, �μ��̸�)
--����Ŭ ��İ� ANSI �������

SELECT EMPNO, ENAME, SAL, HIREDATE, D.DEPTNO, DNAME
 FROM EMP E JOIN DEPT D
 ON E.DEPTNO = D.DEPTNO
 WHERE SAL >= 3000;
 /* EMP ���̺� ��Ī�� E��, DEPT ���̺� ��Ī�� D�� �Ͽ� ������ ���� � ������ ������, 
 �޿��� 2500 ���ϰ� �����ȣ�� 9999 ������ ����� ������ ��µǵ��� �ۼ� : 

����Ŭ ���, ANSI ������� *
SELECT EMPNO, ENAME, SAL, HIREDATE, D.DEPTNO, DNAME 
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE SAL BETWEEN 2500 AND 9999;

SELECT EMPNO, ENAME, SAL, HIREDATE, D.DEPTNO, DNAME
    FROM EMP E JOIN DEPT D
    ON E.DEPTNO = D.DEPTNO
    WHERE SAL BETWEEN 2500 AND 9999;
    
    
/* �޿��� ���� ����� ǥ���ϱ����ؼ��� �޿��� �ݾ��� ��ġ �� �� �����Ƿ� �ּҿ� �ִ� �޿��� ���̿� �־����
�̷���� BETWEEN A AND B �����ڸ� ����ϸ� ó�� ����*/
SELECT ENAME, SAL, GRADE
    FROM EMP E JOIN SALGRADE S
    ON SAL BETWEEN LOSAL AND HISAL;

-1-
SELECT ENAME, HIREDATE, DEPTNO
FROM EMP
WHERE EMPNO = 7499;

-2-
SELECT * 
FROM EMP
WHERE ENAME = 'ALLEN';

-3-
SELECT *
FROM EMP
WHERE ENAME > 'K';

4
SELECT ENAME, SAL, DEPTNO, HIREDATE
FROM EMP
WHERE HIREDATE > '81/4/2' AND HIREDATE < '82/12/09';

-5-
SELECT ENAME, JOB, SAL
FROM EMP
WHERE SAL > 1600 AND SAL < 3000;

6
SELECT *
FROM EMP
WHERE EXTRACT(YEAR FROM HIREDATE) != 1981;

-7-
SELECT *
FROM EMP
WHERE JOB IN ('MANAGER' , 'SALESMAN');

-8-
SELECT * 
FROM EMP
WHERE DEPTNO NOT IN (20,30);

-9-
SELECT EMPNO, ENAME, DEPTNO
FROM EMP
WHERE ENAME LIKE('S%%');

-10-
SELECT EMPNO, ENAME, DEPTNO
FROM EMP
WHERE ENAME LIKE('_A%');

-11
SELECT *
FROM EMP
WHERE COMM IS NOT NULL;

-12-
SELECT *
FROM EMP
WHERE ENAME LIKE('J___S');

-13
SELECT *
FROM EMP
WHERE SAL > 1500 AND EMPNO = 30;

-14
SELECT ENAME, SAL, NVL(COMM,0), SAL+NVL(COMM,0) AS "�Ѿ�"
FROM EMP
ORDER BY "�Ѿ�" DESC;

-15-
SELECT ENAME, SAL, SAL*1.13, DEPTNO
FROM EMP
WHERE DEPTNO IN 10; 

-16
SELECT ENAME, HIREDATE, NEXT_DAY(HIREDATE+60, '������') DDAY
FROM EMP;

-17
SELECT LOWER(SUBSTR(ENAME,1,3))"�ҹ������"
FROM EMP
WHERE LENGTH(ENAME) >= 6;

-18
SELECT EMPNO, SAL, NVL(COMM, 0) "Ŀ�̼�", SAL*12+NVL(COMM, 0)"����"
FROM EMP
ORDER BY "����" DESC;

-19
SELECT TO_CHAR(HIREDATE, 'YYYY"��"MM"��"DD"��"') AS �Ի���
FROM EMP;

-20-
SELECT ROUND(AVG(SAL),2), MAX(SAL), MIN(SAL), COUNT(*)
FROM EMP
WHERE DEPTNO IN 10;

-21
SELECT *
FROM EMP
WHERE MOD(EMPNO, 2) = 0;

-22
SELECT DEPTNO, JOB, COUNT(*)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

-23
SELECT ENAME,SAL,D.DEPTNO,DNAME,
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

-24
SELECT D.DEPTNO, DNAME, ENAME, SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE ENAME = 'ALLEN';

SELECT D.DEPTNO, DNAME, ENAME, SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE JOB = "ALLEN �� ������ ���� ���"

SELECT D.DEPTNO, DNAME, ENAME, SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE JOB = (SELECT JOB
            FROM EMP
            WHERE ENAME = 'ALLEN');

SELECT EMPNO, ENAME
    FROM EMP
    WHERE SAL > "��ü ����� ��ձ޿�";
    
SELECT  DEPTNO, ROUND(AVG(SAL))
    FROM EMP
    GROUP BY DEPTNO
        HAVING AVG(SAL) < 2000;
        
SELECT E1.EMPNO, E1.ENAME, E1.MGR
        E2.EMPNO AS MGR_EMPNO,
        E2.EMPNO AS MGR_ENAME
        FROM EMP E1 JOIN EMP E2
        ON E1.MGR = E2.EMPNO;
/*�ܺ�����(OUTER JOIN) : ��������(INNER JOIN) �Ǵ� ���� ������ ��� ������ �÷�(��)�� ���� ���ٸ� ��ȸ ��������

--ANSI ����
SELECT ENAME, E.DEPTNO, DNAME
    FROM EMP e RIGHT OUTER JOIN DEPT d
    ON E.DEPTNO = D.DEPTNO
    ORDER BY E.DEPTNO;
--����Ŭ ����  
SELECT ENAME, E.DEPTNO, DNAME
    FROM EMP e LEFT OUTER JOIN DEPT d
    ON E.DEPTNO = D.DEPTNO
    ORDER BY E.DEPTNO;