DROP TABLE IF EXISTS core_npi;

------------------------------------------------------------------------------------

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

-- Insert data into core_npi table
INSERT INTO core_npi(npi, last_name, first_name, description, state, city, zip, addr_first, addr_last, phone)
SELECT npi.npi, npi.last_name, npi.first_name, upper(npi_taxonomy.taxonomy_classification), addresses.state, addresses.city,
       LEFT(addresses.postal, 5), addresses.line_1, addresses.line_2, addresses.phone
FROM npi
INNER JOIN addresses
ON npi.npi = addresses.npi
INNER JOIN npi_taxonomy
ON npi.npi = npi_taxonomy.npi
WHERE npi.last_name IS NOT NULL AND npi_taxonomy.taxonomy_switch = 'Y';


-- Index on core_npi
CREATE INDEX core_npi_main on core_npi(npi);
CREATE INDEX core_lname ON core_npi(last_name);
CREATE INDEX core_fullname on core_npi(last_name, first_name);
CREATE INDEX core_citystate on core_npi(city, state);
CREATE INDEX core_zip on core_npi(zip);
CREATE INDEX coredescription on core_npi(description);
CREATE INDEX description_citystate on core_npi(description, city, state);
CREATE INDEX description_zip on core_npi(description, zip);
CREATE INDEX description_firstlast on core_npi(description, first_name, last_name);

-- Selects
SELECT * from core_npi LIMIT 5;
SELECT COUNT(id) as core_count from core_npi;

