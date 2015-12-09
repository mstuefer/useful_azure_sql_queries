
--
-- Userful Azure SQL Queries
-- December 2015
-- mstuefer
--

-- Get memory grants of currently running queries
SELECT  st.text,mg.granted_memory_kb,qp.query_plan,mg.*
  FROM  sys.dm_exec_query_memory_grants AS mg
        CROSS APPLY sys.dm_exec_sql_text(mg.sql_handle) st
        CROSS APPLY sys.dm_exec_query_plan(mg.plan_handle) qp;
