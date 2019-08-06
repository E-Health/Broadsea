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
