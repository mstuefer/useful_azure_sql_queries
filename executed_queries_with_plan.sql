
--
-- Userful Azure SQL Queries
-- December 2015
-- mstuefer
--

-- Find last 25 executed queries with query plan
SELECT  TOP 25
        query_plan,
        st.text AS query,
        (total_logical_reads/execution_count) AS avg_logical_reads,
        (total_logical_writes/execution_count) AS avg_logical_writes,
        (total_physical_reads/execution_count) AS avg_physical_reads,
        (total_elapsed_time/execution_count) AS avg_duration,
        execution_count,
        last_execution_time
  FROM  sys.dm_exec_query_stats qs
        CROSS APPLY sys.dm_exec_query_plan(qs.plan_handle)
        CROSS APPLY sys.dm_exec_sql_text(sql_handle) AS st
 ORDER  BY last_execution_time DESC;
