-- 海量数据索引

SELECT count(*) FROM emp

-- if no index created how long will do to query a record
SELECT * FROM emp
		WHERE empno = 1234567

-- with index optimization
-- create index
CREATE INDEX empno_index ON emp(empno)
-- use it
SELECT * FROM emp
		WHERE empno = 1234578
-- use it on other column
-- there is no index on this column
SELECT * FROM emp
		WHERE ename = 'pYXUFt'