/* 2023.02.20 */
/* NATURAL JOIN : ���� ���ΰ� ��������� WHERE ���������� �����ϴ� ��� */
-- �� ���̺��� ������ �̸�(�÷� �Ǵ� ��)�� ���� �÷��� ��� ���� ��
-- DEPTNO ���� ���� ���̺� ��� ������

SELECT EMPNO, ENAME, DNAME
    FROM EMP NATURAL JOIN DEPT;

-- �Ϲ����� ���������� ���� �Ʒ��� �������� ������ �߻� �մϴ�. DEPTNO�� ���Ҽ����� ��ȣ���� �߻���
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, DNAME, LOC
    FROM EMP NATURAL JOIN DEPT
    ORDER BY DEPTNO, EMPNO;

/* JOIN ~ USING : ������ � ������ ����ϴ� ���� ��� �Դϴ�. */
-- FROM TABLE1 JOIN TABLE2 USING(���ؿ�)
SELECT EMPNO, ENANE, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, DNAME, LOC
    FROM EMP JOIN DEPT USING(DEPTNO)
    WHERE SAL >= 3000
    ORDER BY DEPTNO, EMPNO;
    
 /* JOIN ~ ON : ���� ���뼺 �ִ� JOIN ~ ON Ű���带 ����� ���ι�� */
 -- FROM TABLE1 JOIN TABLE2 ON(���� ���ǽ�)
 
 /* ���� ���� : SQL�� �ȿ� �ۼ��ϴ� ���� SELECT ���� �ǹ��մϴ�. �ַ� WHERE���� ��� */
 -- ���������� �ݵ�� ��ȣ(���� ����) �ȿ� �־� ǥ���մϴ�.
 -- ����� �̸����� ����� ���� �μ� ��ȣ�� ã��
 -- ���� �������� �μ��̸��� �μ���ȣ�� ���ؼ� ���ϴ� ����� ã��
 SELECT DNAME
    FROM DEPT
    WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'KING')
    
/* ���� ������ �̿��� 'JONES'�� �޿����� ���� �޿��� �޴� ��� ���� ���
SELECT *
    FROM EMP
    WHERE SAL > (SELECT SAL
                FROM EMP
                WHERE ENAME = 'JONES');
/* ���� ������ Ư¡ */
-- ��ȸ ����� �����ʿ� ���̸� () ��� ���
-- ��κ��� ��� ORDER BY ���� ����Ҽ� ����
-- ���� ������ ���� ���������� ����� ���� �ڷ����̰ų� ���� ������ ����
-- ���������� ���������� �����ڿ� �Բ� ��ȣ �ۿ��ϴ� ��Ŀ� ���� ������ ���� ������ ������ ���� ����

SELECT *
    FROM EMP
    WHERE HIREDATE < (SELECT HIREDATE
                            FROM EMP
                            WHERE ENAME = 'JAMES');
                            
SELECT EMPNO, ENAME, JOB, SAL, D.DEPTNO, D.NAME, D.LOC
    FROM EMP E JOIN DEPT D
    ON E.DEPTNO = D.DEPTNO
    WHERE E.DEPTNO = 20
    AND E.SAL > (SELECT AVG(SAL)
                    FROM EMP)
                    
/* �������� �������� ������ �������� */
-- IN ������ : ���� ������ �����Ͱ� ���������� ��� �� �ϳ��� ��ġ�� �����Ͱ� �ִٸ� TRUE
SELECT * 
    FROM EMP
    WHERE SAL IN (SELECT MAX(SAL)
                    FROM EMP
                    GROUP BY DEPTNO);

-- ANY ������ : ���������� �� ������ ���������� ���� �˻� ��� �� �ϳ� �̻� �����Ǹ� TRUE ��ȯ               
SELECT * 
    FROM EMP
    WHERE SAL = ANY (SELECT MAX(SAL)
                    FROM EMP
                    GROUP BY DEPTNO);
                    
SELECT SAL FROM EMP WHERE DEPTNO = 30;

//ALL ������ : ���� ������ �� ������ ���������� ���� �˻� ����� ��� ��ġ�ϸ� ��ȯ

SELECT EMPNO, ENAME, SAL
    FROM EMP  
    WHERE SAL < ALL(SELECT SAL FROM EMP WHERE JOB = 'MANAGER');
    
/* FROM ���� ����ϴ� �������� */
-- ���� ������ FROM���� ���� ������ �̿��ϴ� ������� �ٸ� ���δ� �ζ��κ��� �մϴ�.
-- ���̺��� �ʹ�Ŀ�� �Ϻκи� ����ϰ��� �ϴ� ���
-- ���Ȼ� ���� �ְ� ���� ���� ���� �ؾ� �ϴ� ���

-- ���� �����ϰ� �ش� ������ ���� ����
-- ROWNUM : ����Ŭ���� �Ϸù�ȣ�� �ο��ϱ� ���ؼ� ���Ǵ� ����� (��, ���ȣ �ű��)
SELECT ROWNUM, ENAME, SAL
    FROM(SELECT * FROM EMP ORDER BY SAL DESC)
    WHERE ROWNUM <= 3;

-- SELECT ���� ����ϴ� ���� ����
-- SELECT�� ����ϴ� ������ ���� ������ ��Į�� ���� ����
SELECT EMPNO, ENAME, JOB, SAL,
    (SELECT GRADE FROM SALGRADE
                WHERE E.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE,
                DEPTNO,
                (SELECT DNAME FROM DEPT
                                WHERE E.DEPTNO = DEPT.DEPTNO) AS DNAME
                 FROM EMP E;     

SELECT ENAME, DEPTNO, SAL, (SELECT TRUNC(AVG(SAL)) FROM EMP   
                            WHERE DEPTNO = E.DEPTNO) AS "�μ���ձ޿�"
                            FROM EMP E;
                            
* �μ� ��ġ�� NEWYORK �� ��쿡 ����, �ƴϸ� �������� ��ȯ �ϱ� */
SELECT EMPNO, ENAME, 
        CASE WHEN DEPTNO = (SELECT DEPTNO
                            FROM DEPT
                            WHERE LOC = 'NEW YORK')
                THEN '����'
                ELSE '����'
                END AS �Ҽ�
                FROM EMP
                ORDER BY �Ҽ� DESC;