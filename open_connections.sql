
--
-- Userful Azure SQL Queries
-- December 2015
-- mstuefer
--

-- Get open connections
SELECT  c.connection_id,
        s.session_id,
        s.login_name,
        s.last_request_end_time,
        s.cpu_time
  FROM  sys.dm_exec_sessions s
        INNER JOIN sys.dm_exec_connections c
                ON s.session_id = c.session_id;
