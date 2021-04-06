DROP TABLE IF EXISTS taxonomy;
----------------------------------------------------------------------------------

CREATE TABLE taxonomy(
    id                   serial PRIMARY KEY NOT NULL,
    code                 varchar UNIQUE,
    grouping             varchar,
    classification       varchar,
    specialization       varchar,
    definition           varchar,
    effective_date       varchar,
    deactivation_date    varchar,
    last_mod_date        varchar,
    notes                varchar,
    display_name         varchar
);

----------------------------------------------------------------------------------

\copy taxonomy(code, grouping, classification, specialization, definition, effective_date, deactivation_date, last_mod_date, notes, display_name) FROM '../../data/nucc_taxonomy_210.csv' DELIMITER ',' CSV HEADER

----------------------------------------------------------------------------------

-- Create an index on the taxonomy code
CREATE INDEX idx_code ON taxonomy(code);

----------------------------------------------------------------------------------

-- Test that info was imported correctly into the tables
SELECT * FROM taxonomy LIMIT 5;
SELECT COUNT(*) from taxonomy;

----------------------------------------------------------------------------------



