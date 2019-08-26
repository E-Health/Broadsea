-- remove any previously added database connection configuration data
truncate ohdsi.source_daimon;
truncate ohdsi.source cascade;

-- OHDSI CDM source
INSERT INTO ohdsi.source( source_id, source_name, source_key, source_connection, source_dialect)
VALUES (1, 'Synpuf-5p', 'OHDSI-CDMV5',
  'jdbc:postgresql://192.168.0.251:5432/beapen_db?user=beapen', 'postgresql');

-- CDM daimon
INSERT INTO ohdsi.source_daimon( source_daimon_id, source_id, daimon_type, table_qualifier, priority) VALUES (1, 1, 0, 'synpuf5', 2);

-- VOCABULARY daimon
INSERT INTO ohdsi.source_daimon( source_daimon_id, source_id, daimon_type, table_qualifier, priority) VALUES (2, 1, 1, 'vocabulary', 2);

-- RESULTS daimon
INSERT INTO ohdsi.source_daimon( source_daimon_id, source_id, daimon_type, table_qualifier, priority) VALUES (3, 1, 2, 'ohdsi', 2);

-- EVIDENCE daimon
INSERT INTO ohdsi.source_daimon( source_daimon_id, source_id, daimon_type, table_qualifier, priority) VALUES (4, 1, 3, 'ohdsi', 2);
