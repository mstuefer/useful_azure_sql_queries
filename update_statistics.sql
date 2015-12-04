
--
-- Userful Azure SQL Queries
-- December 2015
-- mstuefer
--

-- Update statistics
UPDATE STATISTICS schema.table_name;

-- Update statistics scanning all rows in the table or indexed_view
UPDATE STATISTICS schema.table_name
  WITH FULLSCAN;

-- Run UPDATE STATISTICS against all user-defined and internal tables
-- in the current database
EXEC  sp_updatestats;
