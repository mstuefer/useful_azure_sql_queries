
--
-- Userful Azure SQL Queries
-- December 2015
-- mstuefer
--

-- Database size
SELECT  (SUM(reserved_page_count) * 8192) / 1024 / 1024 AS db_size_in_MB
  FROM  sys.dm_db_partition_stats;
