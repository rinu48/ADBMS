CREATE TABLE EMP
(	
empno INT,
ename VARCHAR(25),
job VARCHAR(12),
salary INT,
commission INT,
deptno INT
);

DESCRIBE EMP;

INSERT INTO EMP(empno,ename,job,salary,deptno) VALUES(7369,'SMITH','CLERK',800,20);

INSERT INTO EMP(empno,ename,job,salary,commission,deptno) VALUES(7499,'ALLEN','SALESMAN',1600,300,30),(7521,'WARD','SALESMAN',1250,500,30),(7654,'MARTIN','SALESMAN',1250,1400,30);
INSERT INTO EMP(empno,ename,job,salary,deptno) VALUES(7566,'JONES','MANAGER',2975,20),(7698 ,'BLAKE','MANAGER',2850,30),(7782,'CLARK','MANAGER',2450,10),(7788 ,'SCOTT','ANALYST',3000,20),(7839,'KING','PRESIDENT',5000,10),(7844,'TURNER','SALESMAN',1500,30),(7876,'ADAMS','CLERK',1100,20),(7900 ,'JAMES','NULL',950,30),(7902,'FORD','ANALYST',3000,20),(7934,'MILLER','CLERK',1300,10);
SELECT * FROM EMP;

UPDATE EMP
SET job='CLERK'WHERE job='NULL';
SELECT * FROM EMP;

ALTER TABLE EMP
ADD COLUMN date_join varchar(50);
SELECT * FROM EMP;
UPDATE EMP 
SET date_join='17-DEC-80' WHERE empno='7369';
SELECT * FROM EMP;
UPDATE EMP 
SET date_join='20-FEB-81' WHERE empno='7499';
UPDATE EMP 
SET date_join='22-FEB-81' WHERE empno='7521';
UPDATE EMP 
SET date_join='02-APR-81' WHERE empno='7566';
UPDATE EMP 
SET date_join='28-SEP-81' WHERE empno='7654';
UPDATE EMP 
SET date_join='01-MAY-81' WHERE empno='7698';
UPDATE EMP 
SET date_join='09-JUN-81' WHERE empno='7782';
UPDATE EMP 
SET date_join='19-APR-87' WHERE empno='7788';
UPDATE EMP 
SET date_join='17-NOV-81' WHERE empno='7839';
UPDATE EMP 
SET date_join='08-SEP-81' WHERE empno='7844';
UPDATE EMP 
SET date_join='23-MAY-87' WHERE empno='7876';
UPDATE EMP 
SET date_join='03-DEC-81' WHERE empno='7900';
UPDATE EMP 
SET date_join='03-DEC-81' WHERE empno='7902';
UPDATE EMP 
SET date_join='23-JAN-82' WHERE empno='7934';
SELECT * FROM EMP;

SELECT DISTINCT job FROM EMP;

SELECT ename,deptno FROM EMP WHERE deptno IN (20,30);

SELECT ename,(salary + IFNULL(commission,0)) AS total_salary FROM EMP;

SELECT ENAME,SALARY*12 AS ANNUAL_SALARY FROM EMP;

SELECT ENAME FROM EMP WHERE DATE_JOIN='03-DEC-81';

SELECT  (salary + IFNULL( commission,0)) AS total_salary FROM EMP WHERE ename='MILLER';

DELETE FROM EMP WHERE ename='MILLER';
SELECT * FROM EMP;

SELECT ename, deptno FROM EMP;

ALTER TABLE EMP ADD COLUMN total_salary numeric;
UPDATE EMP SET total_salary=(salary+ IFNULL(commission,0));
ALTER TABLE EMP DROP COLUMN commission;
SELECT * FROM EMP;

SELECT E.empno,E.salary FROM EMP E INNER JOIN EMP B ON E.salary AND E.empno<>B.empno;

SELECT ename AS name,empno AS emp_id FROM EMP;

RENAME TABLE EMP to EMPLOYEE;
DESCRIBE EMPLOYEE;

CREATE TABLE EMPTABLE AS SELECT * FROM EMPLOYEE;
DESCRIBE EMPTABLE;

SELECT DISTINCT E.empno,E.ename,E.job,E.salary,E.deptno,E.date_join,E.total_salary,B.empno,B.ename,B.job,B.salary,B.deptno,B.date_join,B.total_salary FROM EMPTABLE E JOIN EMPLOYEE B WHERE E.empno=B.empno;

TRUNCATE TABLE EMPLOYEE;
SELECT * FROM EMPLOYEE;

DROP TABLE EMPLOYEE;