
--
-- Userful Azure SQL Queries
-- December 2015
-- mstuefer
--

-- Find 25 executed queries with most recompiles
SELECT  TOP 25
        st.text AS query,
        sql_handle,
        plan_generation_num,
        execution_count,
        dbid,
        objectid
  FROM  sys.dm_exec_query_stats AS qs
        CROSS APPLY sys.dm_exec_sql_text(sql_handle) AS st
 WHERE  plan_generation_num > 1
 ORDER  BY plan_generation_num DESC;
