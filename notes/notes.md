* https://github.com/OHDSI/ETL-CMS/blob/master/python_etl/README.md

module load postgresql
SET search_path TO synpuf5,cdm,ohdsi,public;
ALTER DATABASE beapen_db SET search_path TO synpuf5,cdm,ohdsi,public;


If you already logged in to database then you can use meta commands like

db=# \i or \include filename


psql -h cedar-pgsql-vm -d beapen_db

\i create_CDMv5_tables.sql
\i load_CDMv5_synpuf2.sql

```

/*********************************************************************************
# Copyright 2016 Observational Health Data Sciences and Informatics
#
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
********************************************************************************/

DELETE FROM synpuf5.CARE_SITE;
DELETE FROM synpuf5.CONDITION_OCCURRENCE;
DELETE FROM synpuf5.DEATH;
DELETE FROM synpuf5.DEVICE_COST;
DELETE FROM synpuf5.DRUG_COST;
DELETE FROM synpuf5.DRUG_EXPOSURE;
DELETE FROM synpuf5.DEVICE_EXPOSURE;
DELETE FROM synpuf5.LOCATION;
DELETE FROM synpuf5.MEASUREMENT;
DELETE FROM synpuf5.OBSERVATION;
DELETE FROM synpuf5.PERSON;
DELETE FROM synpuf5.PROCEDURE_OCCURRENCE;
DELETE FROM synpuf5.PROCEDURE_COST;
DELETE FROM synpuf5.PROVIDER;
DELETE FROM synpuf5.SPECIMEN;
DELETE FROM synpuf5.VISIT_COST;
DELETE FROM synpuf5.VISIT_OCCURRENCE;
DELETE FROM synpuf5.OBSERVATION_PERIOD;
DELETE FROM synpuf5.PAYER_PLAN_PERIOD;


\COPY synpuf5.CARE_SITE FROM '/home/beapen/scratch/synpuf/care_site_1.csv' DELIMITERS ',' CSV HEADER QUOTE E'\b';
\COPY synpuf5.CONDITION_OCCURRENCE FROM '/home/beapen/scratch/synpuf/condition_occurrence_1.csv' DELIMITERS ',' CSV HEADER QUOTE E'\b';
\COPY synpuf5.DEATH FROM '/home/beapen/scratch/synpuf/death_1.csv' DELIMITERS ',' CSV HEADER QUOTE E'\b';
\COPY synpuf5.DEVICE_COST FROM '/home/beapen/scratch/synpuf/device_cost_1.csv' DELIMITERS ',' CSV HEADER QUOTE E'\b';
\COPY synpuf5.DRUG_COST FROM '/home/beapen/scratch/synpuf/drug_cost_1.csv' DELIMITERS ',' CSV HEADER QUOTE E'\b';
\COPY synpuf5.DRUG_EXPOSURE FROM '/home/beapen/scratch/synpuf/drug_exposure_1.csv' DELIMITERS ',' CSV HEADER QUOTE E'\b';
\COPY synpuf5.DEVICE_EXPOSURE FROM '/home/beapen/scratch/synpuf/device_exposure_1.csv' DELIMITERS ',' CSV HEADER QUOTE E'\b';
\COPY synpuf5.LOCATION FROM '/home/beapen/scratch/synpuf/location_1.csv' DELIMITERS ',' CSV HEADER QUOTE E'\b';
\COPY synpuf5.MEASUREMENT FROM '/home/beapen/scratch/synpuf/measurement_occurrence_1.csv' DELIMITERS ',' CSV HEADER QUOTE E'\b';
\COPY synpuf5.OBSERVATION FROM '/home/beapen/scratch/synpuf/observation_1.csv' DELIMITERS ',' CSV HEADER QUOTE E'\b';
\COPY synpuf5.PERSON FROM '/home/beapen/scratch/synpuf/person_1.csv' DELIMITERS ',' CSV HEADER QUOTE E'\b';
\COPY synpuf5.PROCEDURE_OCCURRENCE FROM '/home/beapen/scratch/synpuf/procedure_occurrence_1.csv' DELIMITERS ',' CSV HEADER QUOTE E'\b';
\COPY synpuf5.PROCEDURE_COST FROM '/home/beapen/scratch/synpuf/procedure_cost_1.csv' DELIMITERS ',' CSV HEADER QUOTE E'\b';
\COPY synpuf5.PROVIDER FROM '/home/beapen/scratch/synpuf/provider_1.csv' DELIMITERS ',' CSV HEADER QUOTE E'\b';
\COPY synpuf5.SPECIMEN FROM '/home/beapen/scratch/synpuf/specimen_1.csv' DELIMITERS ',' CSV HEADER QUOTE E'\b';
\COPY synpuf5.VISIT_COST FROM '/home/beapen/scratch/synpuf/visit_cost_1.csv' DELIMITERS ',' CSV HEADER QUOTE E'\b';
\COPY synpuf5.VISIT_OCCURRENCE FROM '/home/beapen/scratch/synpuf/visit_occurrence_1.csv' DELIMITERS ',' CSV HEADER QUOTE E'\b';
\COPY synpuf5.OBSERVATION_PERIOD FROM '/home/beapen/scratch/synpuf/observation_period_1.csv' DELIMITERS ',' CSV HEADER QUOTE E'\b';
\COPY synpuf5.PAYER_PLAN_PERIOD FROM '/home/beapen/scratch/synpuf/payer_plan_period_1.csv' DELIMITERS ',' CSV HEADER QUOTE E'\b';

```

## setup sources

```
-- remove any previously added database connection configuration data
truncate ohdsi.source_daimon cascade;
truncate ohdsi.source cascade;

-- OHDSI CDM source
INSERT INTO ohdsi.source( source_id, source_name, source_key, source_connection, source_dialect)
VALUES (1, 'OHDSI CDM V5 Database', 'OHDSI-CDMV5',
  'jdbc:postgresql://192.168.0.251:5432/beapen_db?user=beapen', 'postgresql');

-- CDM daimon
INSERT INTO ohdsi.source_daimon( source_daimon_id, source_id, daimon_type, table_qualifier, priority) VALUES (1, 1, 0, '', 2);

-- VOCABULARY daimon
INSERT INTO ohdsi.source_daimon( source_daimon_id, source_id, daimon_type, table_qualifier, priority) VALUES (2, 1, 1, '', 2);

-- RESULTS daimon
INSERT INTO ohdsi.source_daimon( source_daimon_id, source_id, daimon_type, table_qualifier, priority) VALUES (3, 1, 2, 'ohdsi', 2);

-- EVIDENCE daimon
INSERT INTO ohdsi.source_daimon( source_daimon_id, source_id, daimon_type, table_qualifier, priority) VALUES (4, 1, 3, 'ohdsi', 2);

```


## Copy tables from one schema to another

```

create table synpuf5.vocabulary (like cdm.vocabulary including all);
insert into synpuf5.vocabulary select * from cdm.vocabulary;

```

## Setting up Broadsea methods library


# Terminal R version
docker run --rm -it ohdsi/development /usr/bin/R

# Or run Rstudio on http://192.168.59.103:8787 and RServe on 192.168.59.103:6311
docker run -d -p 8787:8787 -p 6311:6311 -e USER=ohdsi -e PASSWORD=ohdsi ohdsi/development

boot2docker stop
Testing RServe from R on localhost
library(RSclient)
c <- RS.connect("192.168.59.103")
RS.eval(c, library(Cyclops))
RS.close(c)


