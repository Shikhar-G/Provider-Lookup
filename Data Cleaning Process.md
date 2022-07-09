# Data Cleaning Process

[TOC]

## 1. Overview

The data sources for this application come from the [NPPES official website](https://download.cms.gov/nppes/NPI_Files.html), which provides monthly replaced NPI Files in ZIP format. In the download bundle, the *Data Dissemination File – Code Values* document provides the descriptions of the various reference codes used in the Data file. Based on the code values, this documentation is designed to identify, delete and/or replace inconsistent or incorrect information from the database.

## 2. Implementation

### 2.1 Delete records where entity type code is `null`

The field `entity_type` contains the Entity type code in integer type which has two valid values: 1(individual) and 2(organization). However, there are a lot of records whose entity_type is `null`.

|           | Entity Type Code | Entity Type Description |
| --------: | :--------------: | :---------------------: |
|         1 |     5540092      |       Individual        |
|         2 |     1549790      |      Organization       |
|      NULL |     7089882      |                         |
| **Total** |     7311378      |                         |

> **Note:** you need to modify foreign key constraint in the tables including *core_npi,* *addresses*, *npi_taxonomy*, and *taxonomy* before executing the deletion operation, they are the child tables to the table *npi*. Otherwise, your deletion operation will be rejected by PostgreSQL in order to maintain the referential integrity of data between the child and parent tables.

- Example of modifying foreign key constraint in *core_npi*

  ```sql
  ALTER TABLE core_npi DROP CONSTRAINT core_npi_id;
  ALTER TABLE core_npi ADD CONSTRAINT core_npi_id FOREIGN KEY (npi) REFERENCES npi(npi) ON UPDATE CASCADE ON DELETE CASCADE;
  ```

- Delete records where entity_type is null from all tables in the database

  ```sql
  DELETE FROM npi WHERE entity_type IS NULL;
  ```

### 2.2 Delete records where state code is invalid

- Display different values exsites for the field 

  ```sql
  SELECT addr_practice_state, COUNT(*) as COUNT from npi GROUP BY addr_practice_state;
  ```

- Create a state table which contain valid information of state code and state name

  ```sql
  CREATE TABLE state (
      state_code           char(2) PRIMARY KEY,
      state_name           varchar NOT NULL,
      display_order        integer default nextval('state_display_order_seq')
  ); 
  
  COPY state(state_code,state_name) FROM stdin DELIMITER ':';
  AL:ALABAMA
  AK:ALASKA
  AS:AMERICAN SAMOA
  AZ:ARIZONA
  AR:ARKANSAS
  CA:CALIFORNIA
  CO:COLORADO
  CT:CONNECTICUT
  DE:DELAWARE
  DC:DISTRICT OF COLUMBIA
  FM:FEDERATED STATES OF MICRONESIA
  FL:FLORIDA
  GA:GEORGIA
  GU:GUAM
  HI:HAWAII
  ID:IDAHO
  IL:ILLINOIS
  IN:INDIANA
  IA:IOWA
  KS:KANSAS
  LA:LOUISIANA
  ME:MAINE
  MH:MARSHALL ISLANDS
  MD:MARYLAND
  MA:MASSACHUSETTS
  MI:MICHIGAN
  MN:MINNESOTA
  MS:MISSISSIPPI
  MO:MISSOURI
  MT:MONTANA
  NE:NEBRASKA
  NV:NEVADA
  NH:NEW HAMPSHIRE
  NJ:NEW JERSEY
  NM:NEW MEXICO
  NY:NEW YORK
  NC:NORTH CAROLINA
  ND:NORTH DAKOTA
  MP:NORTHERN MARIANA ISLANDS
  OH:OHIO
  OK:OKLAHOMA
  OR:OREGON
  PW:PALAU
  PA:PENNSYLVANIA
  PR:PUERTO RICO
  RI:RHODE ISLAND
  SC:SOUTH CAROLINA
  SD:SOUTH DAKOTA
  TN:TENNESSEE
  TX:TEXAS
  UT:UTAH
  VT:VERMONT
  VI:VIRGIN ISLANDS
  VA:VIRGINIA
  WA:WASHINGTON
  WV:WEST VIRGINIA
  WI:WISCONSIN
  WY:WYOMING
  \.
  ```
  
- Delete records in the database whose state code cannot be found in the state table

  ```sql
  DELETE FROM npi WHERE npi.addr_practice_state NOT IN (SELECT DISTINCT(state_code) FROM state); 
  ```

  [1]: https://stackoverflow.com/questions/15959061/delete-records-which-do-not-have-a-match-in-another-
  [2]: https://stackoverflow.com/questions/21426630/different-between-not-in-and-not-exists-in-postgres-sql
  [3]: https://linuxhint.com/count-unique-values-postgresql/

- Checj=k the number of different values in *address_practice_state* after deletion 

  ```sql
  SELECT COUNT(*) FROM (SELECT addr_practice_state FROM npi) AS COUNTS;
  ```

  [1]: https://linuxhint.com/count-unique-values-postgresql/

  

## 3. Future Work