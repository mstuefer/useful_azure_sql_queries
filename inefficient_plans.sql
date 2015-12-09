
--
-- Userful Azure SQL Queries
-- December 2015
-- mstuefer
--

-- Find inefficient plans
SELECT  highest_cpu_queries.plan_handle,
        highest_cpu_queries.total_worker_time,
        st.dbid,
        st.objectid,
        st.number,
        st.encrypted,
        st.text AS query
  FROM  (
          SELECT  TOP 50 qs.plan_handle, qs.total_worker_time
            FROM  sys.dm_exec_query_stats qs
            ORDER BY qs.total_worker_time DESC
        ) AS highest_cpu_queries
        CROSS APPLY sys.dm_exec_sql_text(plan_handle) AS st
 ORDER  BY highest_cpu_queries.total_worker_time DESC;
