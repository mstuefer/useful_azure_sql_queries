
--
-- Userful Azure SQL Queries
-- December 2015
-- mstuefer
--

-- Get index usage stats
SELECT  *
  FROM  sys.dm_db_index_usage_stats;

-- Get all unused indexes
SELECT  object_name(i.OBJECT_ID) AS 'table',
	      i.name,
        u.*
  FROM  sys.indexes i
        INNER JOIN  sys.objects o
                ON  i.OBJECT_ID = o.OBJECT_ID
         LEFT JOIN  sys.dm_db_index_usage_stats u
                ON  i.OBJECT_ID = u.OBJECT_ID
			         AND  i.index_id = u.index_id
               AND  u.database_id = DB_ID()
 WHERE  o.type <> 'S' --shouldn't be a system base table
   AND  i.type_desc <> 'HEAP'
   AND  u.user_seeks + u.user_scans + u.user_lookups = 0
   AND  u.last_system_scan IS NOT NULL
 ORDER  BY 1 ASC;
