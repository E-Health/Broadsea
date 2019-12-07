CREATE TABLE results.cohort
(
	COHORT_DEFINITION_ID int NOT NULL,
	SUBJECT_ID bigint NOT NULL,
	cohort_start_date date NOT NULL,
	cohort_end_date date NOT NULL
);
CREATE TABLE results.cohort_censor_stats(
  cohort_definition_id int NOT NULL,
  lost_count BIGINT NOT NULL
);
CREATE TABLE results.cc_results
(
  type VARCHAR(255) NOT NULL,
  fa_type VARCHAR(255) NOT NULL,
  cc_generation_id BIGINT NOT NULL,
  analysis_id INTEGER,
  analysis_name VARCHAR(1000),
  covariate_id BIGINT,
  covariate_name VARCHAR(1000),
  strata_id BIGINT,
  strata_name VARCHAR(1000),
  time_window VARCHAR(255),
  concept_id INTEGER NOT NULL,
  count_value BIGINT,
  avg_value DOUBLE PRECISION,
  stdev_value DOUBLE PRECISION,
  min_value DOUBLE PRECISION,
  p10_value DOUBLE PRECISION,
  p25_value DOUBLE PRECISION,
  median_value DOUBLE PRECISION,
  p75_value DOUBLE PRECISION,
  p90_value DOUBLE PRECISION,
  max_value DOUBLE PRECISION,
  cohort_definition_id BIGINT
);
CREATE TABLE results.cohort_features
(
  cohort_definition_id bigint,
  covariate_id bigint,
  sum_value bigint,
  average_value float
);
CREATE TABLE results.cohort_features_analysis_ref
(
  cohort_definition_id bigint,
  analysis_id int,
  analysis_name varchar(1000),
  domain_id varchar(100),
  start_day int,
  end_day int,
  is_binary char,
  missing_means_zero char
);
CREATE TABLE results.cohort_features_dist
(
  cohort_definition_id bigint,
  covariate_id bigint,
  count_value float,
  min_value float,
  max_value float,
  average_value float,
  standard_deviation float,
  median_value float,
  p10_value float,
  p25_value float,
  p75_value float,
  p90_value float
);
CREATE TABLE results.cohort_features_ref
(
  cohort_definition_id bigint,
  covariate_id bigint,
  covariate_name varchar(1000),
  analysis_id int,
  concept_id int
);
CREATE TABLE results.cohort_inclusion(
  cohort_definition_id int NOT NULL,
  rule_sequence int NOT NULL,
  name varchar(255) NULL,
  description varchar(1000) NULL
);
CREATE TABLE results.cohort_inclusion_result(
  cohort_definition_id int NOT NULL,
  mode_id int NOT NULL,
  inclusion_rule_mask bigint NOT NULL,
  person_count bigint NOT NULL
);
CREATE TABLE results.cohort_inclusion_stats(
  cohort_definition_id int NOT NULL,
  rule_sequence int NOT NULL,
  mode_id int NOT NULL,
  person_count bigint NOT NULL,
  gain_count bigint NOT NULL,
  person_total bigint NOT NULL
);
CREATE TABLE results.cohort_summary_stats(
  cohort_definition_id int NOT NULL,
  mode_id int NOT NULL,
  base_count bigint NOT NULL,
  final_count bigint NOT NULL
);
CREATE TABLE results.concept_hierarchy
(
  concept_id             INT,
  concept_name           VARCHAR(400),
  treemap                VARCHAR(20),
  concept_hierarchy_type VARCHAR(20),
  level1_concept_name    VARCHAR(255),
  level2_concept_name    VARCHAR(255),
  level3_concept_name    VARCHAR(255),
  level4_concept_name    VARCHAR(255)
);
