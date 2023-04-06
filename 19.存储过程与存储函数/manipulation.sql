-- 存储过程和存储函数的操作
-- 查看创建信息
SHOW CREATE PROCEDURE show_min_sal;
SHOW CREATE FUNCTION show_job;

SHOW PROCEDURE STATUS;
SHOW FUNCTION STATUS;
SHOW PROCEDURE STATUS LIKE 'show_min_sal';
SHOW FUNCTION STATUS LIKE 'show_job';

SELECT * FROM information_schema.Routines
WHERE ROUTINE_NAME = 'show_min_sal';
SELECT * FROM information_schema.Routines
WHERE ROUTINE_NAME = 'show_job' AND ROUTINE_TYPE = 'FUNCTION';

-- 修改特性
ALTER PROCEDURE show_min_sal
	SQL SECURITY INVOKER
	COMMENT 'query minimal salary';
ALTER FUNCTION show_job
	COMMENT 'query the job title with emp name';
	
-- 删除存储过程或存储函数
DROP PROCEDURE IF EXISTS select_all_data;
DROP FUNCTION IF EXISTS show_job_name;