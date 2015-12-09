
--
-- Userful Azure SQL Queries
-- December 2015
-- mstuefer
--

-- Find blocking queries
SELECT  st.text AS query,
        session_id,
        blocking_Session_id,
        database_id,
        user_id,
        transaction_id
  FROM  sys.dm_exec_requests
        CROSS APPLY sys.dm_exec_sql_text(sql_handle) AS st
 WHERE  blocking_session_id <> 0
        AND blocking_Session_ID <> session_ID;
