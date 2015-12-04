
--
-- Userful Azure SQL Queries
-- December 2015
-- mstuefer
--

-- Get row counts per table
SELECT  OBJECT_NAME(OBJECT_ID) AS object_name, row_count, object_id, index_id
  FROM  sys.dm_db_partition_stats
 WHERE  index_id < 2
 ORDER  BY row_count DESC;
