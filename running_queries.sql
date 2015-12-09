
--
-- Userful Azure SQL Queries
-- December 2015
-- mstuefer
--

-- Find running queries
SELECT  st.[text] as query,
        database_id,
        user_id,
        session_id,
        transaction_id,
        status,
        start_time
  FROM  sys.dm_exec_requests
        CROSS APPLY sys.dm_exec_sql_text(sql_handle) AS st;
