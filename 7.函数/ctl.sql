-- 流程控制函数
SELECT IF(TRUE,'真','假') FROM DUAL

SELECT IFNULL(NULL,'空') FROM DUAL

SELECT CASE 
	WHEN FALSE THEN 'nothing'
	WHEN TRUE THEN 'nice'
	ELSE 'defualt'
END FROM DUAL;

SELECT ename, IFNULL(comm, 0.0) FROM emp

SELECT ename, CASE
								WHEN job = 'CLERK' THEN '职员'
								WHEN job = 'MANAGER' THEN '经理'
								WHEN job = 'SALESMAN' THEN '销售人员'
								ELSE job END AS 'job'
FROM emp
