##2025_Exam##
library(RPostgres)
library(DBI)
library(tidyverse)
library(httr2)
library(lubridate)

# Load credentials
source("//home/rstudio/Integration 1/credentials.R")
# Load functions to communicate with Postgres
source("//home/rstudio/Integration 2/psql_queries.R")

# Create a new schema in Postgres on docker
psql_manipulate(cred = cred_psql_docker, 
                query_string = "CREATE SCHEMA SCHEMA-NAME;")

# Create table
psql_manipulate(cred = cred_psql_docker, 
                query_string = 
                  "create table SCHEMA-NAME.TABLE_NAME (
	campaign_id serial primary key,
	campaign_name varchar(50),
	budget decimal(6,1),
	start_date timestamp(0) without time zone,
	is_active boolean);")

df <- data.frame(
  campaign_name = "Holiday Sale Campaign",
  budget = 5000,
  start_date = "2024-12-01 08:00:00.000",
  is_active = 1
)

campaign <- psql_append_df(cred = cred_psql_docker, 
                          schema_name = "SCHEMA-NAME", 
                          tab_name = "TABLE-NAME", 
                          df = df)

