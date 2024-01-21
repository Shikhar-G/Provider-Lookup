DO $$
BEGIN
    IF EXISTS (SELECT * FROM information_schema.tables WHERE table_name = 'taxonomy')
    THEN
        DROP INDEX IF EXISTS idx_code;
        TRUNCATE taxonomy CASCADE;
    ELSE
        CREATE TABLE taxonomy(
            id                   serial PRIMARY KEY NOT NULL,
            code                 varchar UNIQUE,
            grouping             varchar,
            classification       varchar,
            specialization       varchar,
            definition           varchar,
            notes                varchar,
            display_name         varchar,
            section              varchar
        );
    END IF;
END $$;

----------------------------------------------------------------------------------

\copy taxonomy(code, grouping, classification, specialization, definition, notes, display_name, section) FROM '../data/taxonomy.csv' DELIMITER ',' CSV HEADER

----------------------------------------------------------------------------------

-- Create an index on the taxonomy code
CREATE INDEX IF NOT EXISTS idx_code ON taxonomy(code);

----------------------------------------------------------------------------------

-- Test that info was imported correctly into the tables
--SELECT * FROM taxonomy LIMIT 5;
--SELECT COUNT(*) from taxonomy;

----------------------------------------------------------------------------------




