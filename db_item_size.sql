
--
-- Userful Azure SQL Queries
-- December 2015
-- mstuefer
--

-- Get whole database size
SELECT  SUM(reserved_page_count) * 8.0 / 1024
  FROM  sys.dm_db_partition_stats;

-- Get individual db-objects size
SELECT  sys.objects.name,
        SUM(reserved_page_count) * 8.0 / 1024
  FROM  sys.dm_db_partition_stats, sys.objects
 WHERE  sys.dm_db_partition_stats.object_id = sys.objects.object_id
 GROUP  BY sys.objects.name;

 -- Get indexes size
 SELECT  database_name,
         object_id,
         object_name,
         index_id,
         index_type_desc,
         CONVERT(DECIMAL(16, 1), (SUM(avg_record_size_in_bytes * record_count) / (1024.0 * 1024))) AS index_size_MB,
         stats_last_updated,
         avg_fragmentation_in_percent
   FROM  (
           SELECT  DISTINCT DB_Name(database_id) AS database_name,
                   OBJECT_ID AS object_id,
                   Object_Name(object_id) AS object_name,
 				           Index_ID AS index_id,
 				           Index_Type_Desc AS index_type_desc,
                   avg_record_size_in_bytes,
                   record_count,
                   STATS_DATE(object_id, index_id) AS stats_last_updated,
                   CONVERT([varchar](512), round(avg_fragmentation_in_percent, 3)) AS avg_fragmentation_in_percent
             FROM  sys.dm_db_index_physical_stats(db_id(), NULL, NULL, NULL, 'detailed')
            WHERE  OBJECT_ID IS NOT NULL
                   AND avg_fragmentation_in_percent <> 0
         ) T
  GROUP  BY database_name, object_id, object_name, index_id, index_type_desc, stats_last_updated, avg_fragmentation_in_percent;
