
--
-- Userful Azure SQL Queries
-- December 2015
-- mstuefer
--

-- Activate query store
ALTER DATABASE database_name SET QUERY_STORE = ON;

-- Clear query store
ALTER DATABASE database_name SET QUERY_STORE CLEAR;

-- Read from query store
SELECT  qsqt.query_text_id,
        qsqt.query_sql_text,
        qspl.plan_id,
        qsq.*
  FROM  sys.query_store_plan AS qspl
        JOIN sys.query_store_query AS qsq
          ON qspl.query_id = qsq.query_id
        JOIN sys.query_store_query_text AS qsqt
          ON qsq.query_text_id = qsqt.query_text_id
 ORDER  BY last_execution_time;
