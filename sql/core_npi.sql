DO $$
BEGIN
    IF EXISTS (SELECT * FROM information_schema.tables WHERE table_name = 'core_npi')
    THEN
        DROP INDEX IF EXISTS core_npi_main;
        DROP INDEX IF EXISTS core_lname;
        DROP INDEX IF EXISTS core_fullname;
        DROP INDEX IF EXISTS core_citystate;
        DROP INDEX IF EXISTS core_zip;
        DROP INDEX IF EXISTS coredescription;
        DROP INDEX IF EXISTS description_citystate;
        DROP INDEX IF EXISTS description_zip;
        DROP INDEX IF EXISTS description_firstlast;
        TRUNCATE core_npi CASCADE;
    ELSE
        CREATE TABLE core_npi(
            id                              serial primary key,
            npi                             integer NOT NULL,
            last_name                       varchar,
            first_name                      varchar,
            description                     varchar,
            state                           varchar,
            city                            varchar,
            zip                             varchar,
            addr_first                      varchar,
            addr_last                       varchar,
            phone                           varchar,

            CONSTRAINT core_npi_id
              FOREIGN KEY(npi)
              REFERENCES npi(npi)
        );
    END IF;
END $$;

-- Insert data into core_npi table
INSERT INTO core_npi(npi, last_name, first_name, description, state, city, zip, addr_first, addr_last, phone)
SELECT npi.npi, npi.last_name, npi.first_name, upper(npi_taxonomy.taxonomy_classification), upper(addresses.state), upper(addresses.city),
       LEFT(addresses.postal, 5), upper(addresses.line_1), upper(addresses.line_2), addresses.phone
FROM npi
INNER JOIN addresses
ON npi.npi = addresses.npi
INNER JOIN npi_taxonomy
ON npi.npi = npi_taxonomy.npi
WHERE npi.last_name IS NOT NULL AND npi_taxonomy.taxonomy_switch = 'Y';


-- Index on core_npi
CREATE INDEX IF NOT EXISTS core_npi_main on core_npi(npi);
CREATE INDEX IF NOT EXISTS core_lname ON core_npi(last_name);
CREATE INDEX IF NOT EXISTS core_fullname on core_npi(last_name, first_name);
CREATE INDEX IF NOT EXISTS core_citystate on core_npi(city, state);
CREATE INDEX IF NOT EXISTS core_zip on core_npi(zip);
CREATE INDEX IF NOT EXISTS coredescription on core_npi(description);
CREATE INDEX IF NOT EXISTS description_citystate on core_npi(description, city, state);
CREATE INDEX IF NOT EXISTS description_zip on core_npi(description, zip);
CREATE INDEX IF NOT EXISTS description_firstlast on core_npi(description, first_name, last_name);

---- Selects
--SELECT * from core_npi LIMIT 5;
--SELECT COUNT(id) as core_count from core_npi;

