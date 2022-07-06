# Data Cleaning Process

[TOC]



## 1. Overview

The data sources for this application come from the [NPPES official website](https://download.cms.gov/nppes/NPI_Files.html), which provides monthly replaced NPI Files in ZIP format. In the download bundle, the *Data Dissemination File – Code Values* document provides the descriptions of the various reference codes used in the Data file. Based on the code values, this documentation is designed to identify, delete and/or replace inconsistent or incorrect information from the database.

## 2. Implementation

### 2.1 Delete records where entity type code is `null`

The field `entity_type` contains the Entity type code in integer type which has two valid values: 1(individual) and 2(organization). However, there are a lot of records whose entity_type is `null`.

|       | Entity Type Code | Entity Type Description |
| ----: | :--------------: | :---------------------: |
|     1 |     5540092      |       Individual        |
|     2 |     1549790      |      Organization       |
|  NULL |     7089882      |                         |
| Total |     7311378      |                         |

> **Note:** you need to modify foreign key constraint in the tables including *core_npi,* *addresses*, *npi_taxonomy*, and *taxonomy* before executing the deletion operation, they are the child tables to the table *npi*. Otherwise, your deletion operation will be rejected by PostgreSQL in order to maintain the referential integrity of data between the child and parent tables.

- Example of modifying foreign key constraint in *core_npi*

  ```sql
  ALTER TABLE core_npi DROP CONSTRAINT core_npi_id;
  ALTER TABLE core_npi ADD CONSTRAINT core_npi_id FOREIGN KEY (npi) REFERENCES npi(npi) ON UPDATE CASCADE ON DELETE CASCADE;
  ```

- Delete records where entity_type is null from all tables in the database

  ```sql
  delete from npi where entity_type is null;
  ```

## 3. Future Work