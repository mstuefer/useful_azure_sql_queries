--
-- Userful Azure SQL Queries
-- March 2017
-- mstuefer
--

-- Find top 5 stored procedures by average elapsed time
SELECT  TOP 5
        ps.object_id,
        ps.database_id,
        OBJECT_NAME(object_id, database_id) AS stored_procedure_name,
        ps.cached_time,
        ps.last_execution_time,
        ps.total_elapsed_time,
        (ps.total_elapsed_time/ps.execution_count) AS avg_elapsed_time,
        ps.last_elapsed_time,
        ps.execution_count
  FROM  sys.dm_exec_procedure_stats AS ps
 ORDER  BY total_worker_time DESC;
