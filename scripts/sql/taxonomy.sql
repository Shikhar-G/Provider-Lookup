DROP TABLE IF EXISTS taxonomy CASCADE;
DROP TABLE IF EXISTS taxonomy_def;
----------------------------------------------------------------------------------
-- Create a temporary table to import all the data to

CREATE TEMP TABLE temp_tax(
    code                 char(10) NOT NULL,
    grouping             varchar,
    classification       varchar,
    specialization       varchar,
    definition           varchar,
    notes                varchar
);

-- Primary taxonomy table keeps track of all the code, grouping, classification, and specialization info
CREATE TABLE taxonomy(
    id                   serial PRIMARY KEY NOT NULL,
    code                 char(10) NOT NULL,
    grouping             varchar,
    classification       varchar,
    specialization       varchar
);

-- Secondary definition table maps to IDs in the taxonomy table and stores definitions of the taxonomies
CREATE TABLE taxonomy_def(
    id                   serial PRIMARY KEY NOT NULL,                       
    definition           varchar,
    CONSTRAINT fk_tax_id FOREIGN KEY (id) REFERENCES taxonomy (id)
);

----------------------------------------------------------------------------------

\copy temp_tax(code, grouping, classification, specialization, definition, notes) FROM '../../data/nucc_taxonomy_201.csv' DELIMITER ',' CSV HEADER

----------------------------------------------------------------------------------

INSERT INTO taxonomy(code, grouping, classification, specialization)
SELECT code, grouping, classification, specialization
FROM temp_tax;

INSERT INTO taxonomy_def(definition)
SELECT definition
FROM temp_tax;

DROP TABLE temp_tax;

----------------------------------------------------------------------------------

-- Create an index on the taxonomy code
CREATE INDEX idx_code ON taxonomy(code);

----------------------------------------------------------------------------------

-- Test that info was imported correctly into the tables
SELECT * FROM taxonomy LIMIT 5;
SELECT COUNT(*) from taxonomy;

SELECT * FROM taxonomy_def LIMIT 5;
SELECT COUNT(*) from taxonomy_def;

----------------------------------------------------------------------------------




