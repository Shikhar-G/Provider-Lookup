DROP TABLE IF EXISTS addresses;
DROP TABLE IF EXISTS raw_pl;
----------------------------------------------------------------------------------

CREATE TABLE raw_pl(
    npi                              integer NOT NULL,
    second_add_1                     varchar,
    second_add_2                     varchar,
    second_city                      varchar,
    second_state                     varchar,
    postal_code                      varchar,
    country_code                     varchar,
    phone                            varchar,
    extension                        varchar,
    fax                              varchar 
);

CREATE TABLE addresses(
    id                              serial primary key,
    npi                             integer NOT NULL,
    line_1                          varchar(55),
    line_2                          varchar(55),
    city                            varchar(40),
    state                           varchar(40),
    postal                          varchar(20),
    country                         varchar(2),
    phone                           varchar(20),
    fax                             varchar(20),
    CONSTRAINT addr_npi
      FOREIGN KEY(npi)
	  REFERENCES npi(npi)
);

----------------------------------------------------------------------------------

\copy raw_pl FROM '../data/pl.csv' DELIMITER ',' CSV HEADER

INSERT INTO addresses(npi,line_1,line_2,city,state,postal,country,phone,fax)
SELECT npi,addr_practice_first,addr_practice_second,addr_practice_city,addr_practice_state,addr_practice_postal,addr_practice_country,addr_practice_phone,addr_practice_fax
FROM npi
WHERE addr_practice_first IS NOT NULL;

INSERT INTO addresses(npi,line_1,line_2,city,state,postal,country,phone,fax)
SELECT npi,second_add_1,second_add_2,second_city,second_state,postal_code,country_code,phone,fax
FROM raw_pl;

----------------------------------------------------------------------------------

-- Create an index on the taxonomy code
CREATE INDEX npi_address ON addresses(npi);

----------------------------------------------------------------------------------

-- Test that info was imported correctly into the tables
--SELECT * FROM raw_pl LIMIT 5;
--SELECT COUNT(*) from raw_pl;
--
--SELECT * FROM addresses LIMIT 5;
--SELECT COUNT(*) from addresses;

----------------------------------------------------------------------------------




