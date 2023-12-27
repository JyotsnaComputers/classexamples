create database orac;
use orac;

create table dept(   
  deptno     decimal(2,0),   
  dname      varchar(14),   
  loc        varchar(13),   
  constraint pk_dept primary key (deptno)   
) CHARSET=utf8 COLLATE=utf8_bin;

create table emp(   
  empno    decimal(4,0),   
  ename    varchar(10),   
  job      varchar(9),   
  mgr      decimal(4,0),   
  hiredate date,   
  sal      decimal(7,2),   
  comm     decimal(7,2),   
  deptno   decimal(2,0),   
  constraint pk_emp primary key (empno),   
  constraint fk_deptno foreign key (deptno) references dept (deptno)   
) CHARSET=utf8 COLLATE=utf8_bin;

insert into DEPT (DEPTNO, DNAME, LOC) 
values(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');

INSERT into emp
values(7839, 'KING', 'PRESIDENT', null, '1981-11-17',
 5000, null, 10),
(7698, 'BLAKE', 'MANAGER', 7839, '1981-1-5', 2850, null, 30  ),
(  
 7782, 'CLARK', 'MANAGER', 7839,  
 '1981-9-6',  
 2450, null, 10  
),
(  
 7566, 'JONES', 'MANAGER', 7839,  
 '1981-2-4',
 2975, null, 20  
),
(  
 7788, 'SCOTT', 'ANALYST', 7566,  
 '1987-7-13',
 3000, null, 20  
),
(  
 7902, 'FORD', 'ANALYST', 7566,  
 '1981-12-3',
 3000, null, 20  
),
(  
 7369, 'SMITH', 'CLERK', 7902,  
 '1980-12-17',
 800, null, 20  
),
(  
 7499, 'ALLEN', 'SALESMAN', 7698,  
 '1981-2-20',
 1600, 300, 30  
),
(  
 7521, 'WARD', 'SALESMAN', 7698,  
 '1981-2-22',
 1250, 500, 30  
),
(  
 7654, 'MARTIN', 'SALESMAN', 7698,  
 '1981-9-28',
 1250, 1400, 30  
),
(  
 7844, 'TURNER', 'SALESMAN', 7698,  
 '1981-9-8',
 1500, 0, 30  
),
(  
 7876, 'ADAMS', 'CLERK', 7788,  
 '1987-7-13', 
 1100, null, 20  
),
(  
 7900, 'JAMES', 'CLERK', 7698,  
 '1981-12-3',
 950, null, 30  
),
(  
 7934, 'MILLER', 'CLERK', 7782,  
 '1982-1-23',
 1300, null, 10  
);

SELECT * FROM EMP;

SELECT EMPNO, ENAME 
FROM
EMP;

SELECT * FROM EMP WHERE ENAME LIKE '%I%';

SELECT * FROM EMP WHERE ENAME LIKE '%i%';

SELECT * FROM EMP WHERE ENAME REGEXP 'S';

SELECT * FROM EMP WHERE ENAME LIKE 'S%';

SELECT * FROM EMP WHERE ENAME REGEXP '^S';

SELECT * FROM EMP WHERE ENAME LIKE '%S';

SELECT * FROM EMP WHERE ENAME REGEXP 'S$';

SELECT * FROM EMP WHERE ENAME REGEXP 'IN|ON';

SELECT * FROM EMP WHERE ENAME LIKE '%IN%' 
OR 
ENAME LIKE '%ON%';

SELECT * FROM EMP WHERE ENAME REGEXP 'D|K';

SELECT * FROM EMP WHERE ENAME REGEXP '[DK]';

SELECT * FROM EMP WHERE ENAME REGEXP '^[A-H]';

SELECT * FROM EMP WHERE ENAME REGEXP 'O[TR]';

SELECT * FROM EMP WHERE ENAME LIKE '%OT%'
OR
ENAME LIKE '%OR%';

SELECT * FROM EMP WHERE ENAME REGEXP '[C-J]O';

Select ENAME, SAL, DNAME from EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;

Select * from DEPT;

SELECT * FROM EMP, DEPT;

SELECT concat(ENAME,' works for ', DNAME) as Emp_Work_Details 
FROM EMP, DEPT 
WHERE EMP.DEPTNO = DEPT.DEPTNO;

SELECT concat(ENAME,' lives in ', loc) as details 
FROM EMP, DEPT 
WHERE EMP.DEPTNO = DEPT.DEPTNO;

SELECT ENAME, DNAME FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO;

SELECT min(sal)FROM EMP;

SELECT min(sal), DEPTNO FROM EMP group by DEPTNO;

SELECT SUM(sal)
FROM     emp;

SELECT SUM(sal)‏,deptno
FROM     emp
GROUP BY deptno;

SELECT AVG(sal)‏,deptno
FROM     emp
GROUP BY deptno;

select dname, count(*) count_of_employees 
from dept, emp 
where dept.deptno = emp.deptno 
group by DNAME; 


select dname, count(*) count_of_employees 
from dept, emp 
where dept.deptno = emp.deptno 
group by DNAME;


SELECT concat(ENAME,' lives in ', loc) as details 
FROM EMP JOIN DEPT 
-- ON EMP.DEPTNO = DEPT.DEPTNO;
USING (DEPTNO);


-- INNER JOIN
--  LEFT JOIN
--  LEFT OUTER JOIN
-- RIGHT JOIN
-- RIGHT OUTER JOIN
-- FULL OUTER JOIN


CREATE TABLE events(   
  event_id INT AUTO_INCREMENT PRIMARY KEY,   
  event_name varchar(75),   
  visitors varchar(25),   
  properties json,   
  browser_name json  
);  

INSERT INTO events (event_name, visitors, properties, browser_name)   
VALUES (  
  'page-view',   
   '2',  
   '{"page": "/"}',  
   '{ "name": "Google Chrome", "OS": "Windows", "resolution": {"x": 1920, "y": 1080} }'  
),  
('page-view',   
  '3',  
  '{"page": "/products"}',  
  '{ "name": "Safari", "OS": "UNIX", "resolution": {"x": 2560, "y": 1600} }'  
),  
(  
  'page-view',   
  '1',  
  '{"page": "/contacts"}',  
  '{ "name": "Mozilla Firefox", "OS": "Mac", "resolution": {"x": 1920, "y": 1080} }'  
),  
(  
  'purchase',   
   '4',  
  '{"amount": 250}',  
  '{ "name": "Google Chrome", "OS": "Windows", "resolution": {"x": 1280, "y": 800} }'  
),  
(  
  'purchase',   
   '3',  
  '{"amount": 350}',  
  '{ "name": "Safari", "OS": "Mac", "resolution": {"x": 1600, "y": 900} }'  
),  
(  
  'purchase',   
  '4',  
  '{"amount": 400}',  
  '{ "name": "Mozilla Firefox", "OS": "Windows", "resolution": {"x": 1280, "y": 800} }'  
);  

SELECT * FROM events;  

SELECT event_id, browser_name->'$.name' AS browser FROM events; 

CREATE TABLE JSON_TAB(co1_1 int,
    col_2 varchar(50), 
    col_3 json
 );

INSERT INTO JSON_TAB 
VALUES(1, "FIRST VALUE ", '{"PROPERTY1" : "ONE", "PROPERTY2" : "TWO"}');

INSERT INTO JSON_TAB 
VALUES(3, "FIRST VALUE ", '{"PROPERTY1" : "P1", "PROPERTY2" : "P2"}');

INSERT INTO JSON_TAB 
VALUES(2, "SECOND VALUE ", '{"NAME" : "ONE", "ADDRESS" : "TWO"}');

SELECT * FROM JSON_TAB;

SELECT COL_3->"$.PROPERTY1" FROM JSON_TAB;


PREPARE ST3 FROM 'SELECT * FROM EMP';
EXECUTE ST3;

PREPARE ST4 FROM 'SELECT * FROM EMP WHERE SAL > ?';
SET @SAL = 1500; 
execute ST4 USING @SAL;

PREPARE stmt1 FROM 'SELECT SQRT(POW(?,2) + POW(?,2)) AS hypotenuse';
SET @a = 3;
SET @b = 4;
EXECUTE stmt1 USING @a, @b;
EXECUTE stmt1 USING @a, @a;


PREPARE stmt2 FROM 'SELECT * FROM EMP WHERE DEPTNO = ?';
SET @DNO = 20;
EXECUTE stmt2 USING @DNO;

-- {DEALLOCATE | DROP} PREPARE stmt_name
DEALLOCATE PREPARE stmt1;
DROP PREPARE stmt2;

DROP PREPARE ST3;
DROP PREPARE ST4;



Select ENAME, SAL, DNAME from EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;

SELECT ENAME 
FROM MYVIEW 
WHERE ENAME REGEXP 'I';

DESC MYVIEW;

SELECT  DISTINCT(DEPTNO) FROM EMP;

SELECT * FROM EMP 
WHERE DEPTNO < (
SELECT DEPTNO FROM DEPT 
WHERE DEPTNO NOT IN (SELECT  DISTINCT(DEPTNO) FROM EMP));


DELIMITER $
CREATE PROCEDURE `selAll`()
BEGIN
	SELECT * FROM EMP;
END $

call selAll();

drop procedure selAll;


DELIMITER $$
CREATE PROCEDURE squre(
	OUT result INT,
    IN num1 INT
)
BEGIN
	SET result = num1 * num1;
END$$

set @result = 0;

call squre(@result, 5);

SELECT @result;


CALL selectAll();