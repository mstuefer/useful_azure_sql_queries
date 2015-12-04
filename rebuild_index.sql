
--
-- Userful Azure SQL Queries
-- December 2015
-- mstuefer
--

-- Rebuild index
ALTER  INDEX index_name
   ON  schema.table_name
       REBUILD;

-- Rebuild index online
--
-- The ONLINE option allows concurrent user access to the
-- underlying table or clustered index data and any associated
-- nonclustered indexes during the rebuild
-- MAXDOP = maximal degree of parallelism
ALTER  INDEX index_name
   ON  schema.table_name
       REBUILD WITH (ONLINE=ON, MAXDOP=1);
