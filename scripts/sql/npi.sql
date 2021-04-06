DROP TABLE IF EXISTS npi CASCADE;
DROP TABLE IF EXISTS npi_taxonomy;
--------------------------------------------------------------------------------------

CREATE TABLE npi(
    id                               serial PRIMARY KEY,
    npi                              integer NOT NULL UNIQUE,
    entity_type                      integer,
    repl_npi                         integer,
    ein                              varchar(9),
    org_name                         varchar(70),
    last_name                        varchar(35),
    first_name                       varchar(20),
    middle_name                      varchar(20),
    name_prefix                      varchar(5),
    name_suffix                      varchar(5),
    credentials                      varchar(20),
    other_org_name                   varchar(70),
    other_org_name_type              varchar(1),
    other_last_name                  varchar(35),
    other_first_name                 varchar(20),
    other_middle_name                varchar(20),
    other_name_prefix                varchar(5),
    other_name_suffix                varchar(5),
    other_credential                 varchar(20),
    other_last_name_code             varchar,
    addr_mail_first                  varchar(55),
    addr_mail_second                 varchar(55),
    addr_mail_city                   varchar(40),
    addr_mail_state                  varchar(40),
    addr_mail_postal                 varchar(20),
    addr_mail_country                varchar(2),
    addr_mail_phone                  varchar(20),
    addr_mail_fax                    varchar(20),
    addr_practice_first              varchar(55),
    addr_practice_second             varchar(55),
    addr_practice_city               varchar(40),
    addr_practice_state              varchar(40),
    addr_practice_postal             varchar(20),
    addr_practice_country            varchar(2),
    addr_practice_phone              varchar(20),
    addr_practice_fax                varchar(20),
    enumeration_date                 date,
    last_update                      date,
    deactivate_reason                varchar(2),
    deactivate_date                  date,
    reactivate_date                  date,
    gender                           varchar(1),
    off_last_name                    varchar(35),
    off_first_name                   varchar(20),
    off_middle_name                  varchar(20),
    off_title                        varchar(35),
    off_phone                        varchar(20),
    taxonomy_1                       varchar(10),
    license_num_1                    varchar(20),
    license_state_1                  varchar(2),
    taxonomy_switch_1                varchar(1),
    taxonomy_2                       varchar(10),
    license_num_2                    varchar(20),
    license_state_2                  varchar(2),
    taxonomy_switch_2                varchar(1),
    taxonomy_3                       varchar(10),
    license_num_3                    varchar(20),
    license_state_3                  varchar(2),
    taxonomy_switch_3                varchar(1),
    taxonomy_4                       varchar(10),
    license_num_4                    varchar(20),
    license_state_4                  varchar(2),
    taxonomy_switch_4                varchar(1),
    taxonomy_5                       varchar(10),
    license_num_5                    varchar(20),
    license_state_5                  varchar(2),
    taxonomy_switch_5                varchar(1),
    taxonomy_6                       varchar(10),
    license_num_6                    varchar(20),
    license_state_6                  varchar(2),
    taxonomy_switch_6                varchar(1),
    taxonomy_7                       varchar(10),
    license_num_7                    varchar(20),
    license_state_7                  varchar(2),
    taxonomy_switch_7                varchar(1),
    taxonomy_8                       varchar(10),
    license_num_8                    varchar(20),
    license_state_8                  varchar(2),
    taxonomy_switch_8                varchar(1),
    taxonomy_9                       varchar(10),
    license_num_9                    varchar(20),
    license_state_9                  varchar(2),
    taxonomy_switch_9                varchar(1),
    taxonomy_10                      varchar(10),
    license_num_10                   varchar(20),
    license_state_10                 varchar(2),
    taxonomy_switch_10               varchar(1),
    taxonomy_11                      varchar(10),
    license_num_11                   varchar(20),
    license_state_11                 varchar(2),
    taxonomy_switch_11               varchar(1),
    taxonomy_12                      varchar(10),
    license_num_12                   varchar(20),
    license_state_12                 varchar(2),
    taxonomy_switch_12               varchar(1),
    taxonomy_13                      varchar(10),
    license_num_13                   varchar(20),
    license_state_13                 varchar(2),
    taxonomy_switch_13               varchar(1),
    taxonomy_14                      varchar(10),
    license_num_14                   varchar(20),
    license_state_14                 varchar(2),
    taxonomy_switch_14               varchar(1),
    taxonomy_15                      varchar(10),
    license_num_15                   varchar(20),
    license_state_15                 varchar(2),
    taxonomy_switch_15               varchar(1),
    other_identifier_1               varchar(20),
    other_identifier_type_1          varchar(2),
    other_identifier_state_1         varchar(2),
    other_identifier_issuer_1        varchar(80),
    other_identifier_2               varchar(20),
    other_identifier_type_2          varchar(2),
    other_identifier_state_2         varchar(2),
    other_identifier_issuer_2        varchar(80),
    other_identifier_3               varchar(20),
    other_identifier_type_3          varchar(2),
    other_identifier_state_3         varchar(2),
    other_identifier_issuer_3        varchar(80),
    other_identifier_4               varchar(20),
    other_identifier_type_4          varchar(2),
    other_identifier_state_4         varchar(2),
    other_identifier_issuer_4        varchar(80),
    other_identifier_5               varchar(20),
    other_identifier_type_5          varchar(2),
    other_identifier_state_5         varchar(2),
    other_identifier_issuer_5        varchar(80),
    other_identifier_6               varchar(20),
    other_identifier_type_6          varchar(2),
    other_identifier_state_6         varchar(2),
    other_identifier_issuer_6        varchar(80),
    other_identifier_7               varchar(20),
    other_identifier_type_7          varchar(2),
    other_identifier_state_7         varchar(2),
    other_identifier_issuer_7        varchar(80),
    other_identifier_8               varchar(20),
    other_identifier_type_8          varchar(2),
    other_identifier_state_8         varchar(2),
    other_identifier_issuer_8        varchar(80),
    other_identifier_9               varchar(20),
    other_identifier_type_9          varchar(2),
    other_identifier_state_9         varchar(2),
    other_identifier_issuer_9        varchar(80),
    other_identifier_10              varchar(20),
    other_identifier_type_10         varchar(2),
    other_identifier_state_10        varchar(2),
    other_identifier_issuer_10       varchar(80),
    other_identifier_11              varchar(20),
    other_identifier_type_11         varchar(2),
    other_identifier_state_11        varchar(2),
    other_identifier_issuer_11       varchar(80),
    other_identifier_12              varchar(20),
    other_identifier_type_12         varchar(2),
    other_identifier_state_12        varchar(2),
    other_identifier_issuer_12       varchar(80),
    other_identifier_13              varchar(20),
    other_identifier_type_13         varchar(2),
    other_identifier_state_13        varchar(2),
    other_identifier_issuer_13       varchar(80),
    other_identifier_14              varchar(20),
    other_identifier_type_14         varchar(2),
    other_identifier_state_14        varchar(2),
    other_identifier_issuer_14       varchar(80),
    other_identifier_15              varchar(20),
    other_identifier_type_15         varchar(2),
    other_identifier_state_15        varchar(2),
    other_identifier_issuer_15       varchar(80),
    other_identifier_16              varchar(20),
    other_identifier_type_16         varchar(2),
    other_identifier_state_16        varchar(2),
    other_identifier_issuer_16       varchar(80),
    other_identifier_17              varchar(20),
    other_identifier_type_17         varchar(2),
    other_identifier_state_17        varchar(2),
    other_identifier_issuer_17       varchar(80),
    other_identifier_18              varchar(20),
    other_identifier_type_18         varchar(2),
    other_identifier_state_18        varchar(2),
    other_identifier_issuer_18       varchar(80),
    other_identifier_19              varchar(20),
    other_identifier_type_19         varchar(2),
    other_identifier_state_19        varchar(2),
    other_identifier_issuer_19       varchar(80),
    other_identifier_20              varchar(20),
    other_identifier_type_20         varchar(2),
    other_identifier_state_20        varchar(2),
    other_identifier_issuer_20       varchar(80),
    other_identifier_21              varchar(20),
    other_identifier_type_21         varchar(2),
    other_identifier_state_21        varchar(2),
    other_identifier_issuer_21       varchar(80),
    other_identifier_22              varchar(20),
    other_identifier_type_22         varchar(2),
    other_identifier_state_22        varchar(2),
    other_identifier_issuer_22       varchar(80),
    other_identifier_23              varchar(20),
    other_identifier_type_23         varchar(2),
    other_identifier_state_23        varchar(2),
    other_identifier_issuer_23       varchar(80),
    other_identifier_24              varchar(20),
    other_identifier_type_24         varchar(2),
    other_identifier_state_24        varchar(2),
    other_identifier_issuer_24       varchar(80),
    other_identifier_25              varchar(20),
    other_identifier_type_25         varchar(2),
    other_identifier_state_25        varchar(2),
    other_identifier_issuer_25       varchar(80),
    other_identifier_26              varchar(20),
    other_identifier_type_26         varchar(2),
    other_identifier_state_26        varchar(2),
    other_identifier_issuer_26       varchar(80),
    other_identifier_27              varchar(20),
    other_identifier_type_27         varchar(2),
    other_identifier_state_27        varchar(2),
    other_identifier_issuer_27       varchar(80),
    other_identifier_28              varchar(20),
    other_identifier_type_28         varchar(2),
    other_identifier_state_28        varchar(2),
    other_identifier_issuer_28       varchar(80),
    other_identifier_29              varchar(20),
    other_identifier_type_29         varchar(2),
    other_identifier_state_29        varchar(2),
    other_identifier_issuer_29       varchar(80),
    other_identifier_30              varchar(20),
    other_identifier_type_30         varchar(2),
    other_identifier_state_30        varchar(2),
    other_identifier_issuer_30       varchar(80),
    other_identifier_31              varchar(20),
    other_identifier_type_31         varchar(2),
    other_identifier_state_31        varchar(2),
    other_identifier_issuer_31       varchar(80),
    other_identifier_32              varchar(20),
    other_identifier_type_32         varchar(2),
    other_identifier_state_32        varchar(2),
    other_identifier_issuer_32       varchar(80),
    other_identifier_33              varchar(20),
    other_identifier_type_33         varchar(2),
    other_identifier_state_33        varchar(2),
    other_identifier_issuer_33       varchar(80),
    other_identifier_34              varchar(20),
    other_identifier_type_34         varchar(2),
    other_identifier_state_34        varchar(2),
    other_identifier_issuer_34       varchar(80),
    other_identifier_35              varchar(20),
    other_identifier_type_35         varchar(2),
    other_identifier_state_35        varchar(2),
    other_identifier_issuer_35       varchar(80),
    other_identifier_36              varchar(20),
    other_identifier_type_36         varchar(2),
    other_identifier_state_36        varchar(2),
    other_identifier_issuer_36       varchar(80),
    other_identifier_37              varchar(20),
    other_identifier_type_37         varchar(2),
    other_identifier_state_37        varchar(2),
    other_identifier_issuer_37       varchar(80),
    other_identifier_38              varchar(20),
    other_identifier_type_38         varchar(2),
    other_identifier_state_38        varchar(2),
    other_identifier_issuer_38       varchar(80),
    other_identifier_39              varchar(20),
    other_identifier_type_39         varchar(2),
    other_identifier_state_39        varchar(2),
    other_identifier_issuer_39       varchar(80),
    other_identifier_40              varchar(20),
    other_identifier_type_40         varchar(2),
    other_identifier_state_40        varchar(2),
    other_identifier_issuer_40       varchar(80),
    other_identifier_41              varchar(20),
    other_identifier_type_41         varchar(2),
    other_identifier_state_41        varchar(2),
    other_identifier_issuer_41       varchar(80),
    other_identifier_42              varchar(20),
    other_identifier_type_42         varchar(2),
    other_identifier_state_42        varchar(2),
    other_identifier_issuer_42       varchar(80),
    other_identifier_43              varchar(20),
    other_identifier_type_43         varchar(2),
    other_identifier_state_43        varchar(2),
    other_identifier_issuer_43       varchar(80),
    other_identifier_44              varchar(20),
    other_identifier_type_44         varchar(2),
    other_identifier_state_44        varchar(2),
    other_identifier_issuer_44       varchar(80),
    other_identifier_45              varchar(20),
    other_identifier_type_45         varchar(2),
    other_identifier_state_45        varchar(2),
    other_identifier_issuer_45       varchar(80),
    other_identifier_46              varchar(20),
    other_identifier_type_46         varchar(2),
    other_identifier_state_46        varchar(2),
    other_identifier_issuer_46       varchar(80),
    other_identifier_47              varchar(20),
    other_identifier_type_47         varchar(2),
    other_identifier_state_47        varchar(2),
    other_identifier_issuer_47       varchar(80),
    other_identifier_48              varchar(20),
    other_identifier_type_48         varchar(2),
    other_identifier_state_48        varchar(2),
    other_identifier_issuer_48       varchar(80),
    other_identifier_49              varchar(20),
    other_identifier_type_49         varchar(2),
    other_identifier_state_49        varchar(2),
    other_identifier_issuer_49       varchar(80),
    other_identifier_50              varchar(20),
    other_identifier_type_50         varchar(2),
    other_identifier_state_50        varchar(2),
    other_identifier_issuer_50       varchar(80),
    sole_proprieter                  varchar(1),
    org_subpart                      varchar(1),
    parent_lbn                       varchar(70),
    parent_tin                       varchar(9),
    off_name_prefix                  varchar(5),
    off_name_suffix                  varchar(5),
    off_credentials                  varchar(20),
    taxonomy_group_1                 varchar,
    taxonomy_group_2                 varchar,
    taxonomy_group_3                 varchar,
    taxonomy_group_4                 varchar,
    taxonomy_group_5                 varchar,
    taxonomy_group_6                 varchar,
    taxonomy_group_7                 varchar,
    taxonomy_group_8                 varchar,
    taxonomy_group_9                 varchar,
    taxonomy_group_10                varchar,
    taxonomy_group_11                varchar,
    taxonomy_group_12                varchar,
    taxonomy_group_13                varchar,
    taxonomy_group_14                varchar,
    taxonomy_group_15                varchar,
    cert_date                        date
);

CREATE TABLE npi_taxonomy(
    tax_id                          serial primary key,
    npi                             integer NOT NULL,
    taxonomy                        varchar,
    taxonomy_group                  varchar,
    taxonomy_classification         varchar,
    license_num                     varchar(20),
    license_state                   varchar(2),
    taxonomy_switch                 varchar(1),
    CONSTRAINT tax_npi
      FOREIGN KEY(npi)
	  REFERENCES npi(npi),

	CONSTRAINT tax_code
      FOREIGN KEY(taxonomy)
	  REFERENCES taxonomy(code)
);
--
--------------------------------------------------------------------------------------
------ Copy data from npi file into main npi table
\copy npi(npi,entity_type,repl_npi,ein,org_name,last_name,first_name,middle_name,name_prefix,name_suffix,credentials,other_org_name,other_org_name_type,other_last_name,other_first_name,other_middle_name,other_name_prefix,other_name_suffix,other_credential,other_last_name_code,addr_mail_first,addr_mail_second,addr_mail_city,addr_mail_state,addr_mail_postal,addr_mail_country,addr_mail_phone,addr_mail_fax,addr_practice_first,addr_practice_second,addr_practice_city,addr_practice_state,addr_practice_postal,addr_practice_country,addr_practice_phone,addr_practice_fax,enumeration_date,last_update,deactivate_reason,deactivate_date,reactivate_date,gender,off_last_name,off_first_name,off_middle_name,off_title,off_phone,taxonomy_1,license_num_1,license_state_1,taxonomy_switch_1,taxonomy_2,license_num_2,license_state_2,taxonomy_switch_2,taxonomy_3,license_num_3,license_state_3,taxonomy_switch_3,taxonomy_4,license_num_4,license_state_4,taxonomy_switch_4,taxonomy_5,license_num_5,license_state_5,taxonomy_switch_5,taxonomy_6,license_num_6,license_state_6,taxonomy_switch_6,taxonomy_7,license_num_7,license_state_7,taxonomy_switch_7,taxonomy_8,license_num_8,license_state_8,taxonomy_switch_8,taxonomy_9,license_num_9,license_state_9,taxonomy_switch_9,taxonomy_10,license_num_10,license_state_10,taxonomy_switch_10,taxonomy_11,license_num_11,license_state_11,taxonomy_switch_11,taxonomy_12,license_num_12,license_state_12,taxonomy_switch_12,taxonomy_13,license_num_13,license_state_13,taxonomy_switch_13,taxonomy_14,license_num_14,license_state_14,taxonomy_switch_14,taxonomy_15,license_num_15,license_state_15,taxonomy_switch_15,other_identifier_1,other_identifier_type_1,other_identifier_state_1,other_identifier_issuer_1,other_identifier_2,other_identifier_type_2,other_identifier_state_2,other_identifier_issuer_2,other_identifier_3,other_identifier_type_3,other_identifier_state_3,other_identifier_issuer_3,other_identifier_4,other_identifier_type_4,other_identifier_state_4,other_identifier_issuer_4,other_identifier_5,other_identifier_type_5,other_identifier_state_5,other_identifier_issuer_5,other_identifier_6,other_identifier_type_6,other_identifier_state_6,other_identifier_issuer_6,other_identifier_7,other_identifier_type_7,other_identifier_state_7,other_identifier_issuer_7,other_identifier_8,other_identifier_type_8,other_identifier_state_8,other_identifier_issuer_8,other_identifier_9,other_identifier_type_9,other_identifier_state_9,other_identifier_issuer_9,other_identifier_10,other_identifier_type_10,other_identifier_state_10,other_identifier_issuer_10,other_identifier_11,other_identifier_type_11,other_identifier_state_11,other_identifier_issuer_11,other_identifier_12,other_identifier_type_12,other_identifier_state_12,other_identifier_issuer_12,other_identifier_13,other_identifier_type_13,other_identifier_state_13,other_identifier_issuer_13,other_identifier_14,other_identifier_type_14,other_identifier_state_14,other_identifier_issuer_14,other_identifier_15,other_identifier_type_15,other_identifier_state_15,other_identifier_issuer_15,other_identifier_16,other_identifier_type_16,other_identifier_state_16,other_identifier_issuer_16,other_identifier_17,other_identifier_type_17,other_identifier_state_17,other_identifier_issuer_17,other_identifier_18,other_identifier_type_18,other_identifier_state_18,other_identifier_issuer_18,other_identifier_19,other_identifier_type_19,other_identifier_state_19,other_identifier_issuer_19,other_identifier_20,other_identifier_type_20,other_identifier_state_20,other_identifier_issuer_20,other_identifier_21,other_identifier_type_21,other_identifier_state_21,other_identifier_issuer_21,other_identifier_22,other_identifier_type_22,other_identifier_state_22,other_identifier_issuer_22,other_identifier_23,other_identifier_type_23,other_identifier_state_23,other_identifier_issuer_23,other_identifier_24,other_identifier_type_24,other_identifier_state_24,other_identifier_issuer_24,other_identifier_25,other_identifier_type_25,other_identifier_state_25,other_identifier_issuer_25,other_identifier_26,other_identifier_type_26,other_identifier_state_26,other_identifier_issuer_26,other_identifier_27,other_identifier_type_27,other_identifier_state_27,other_identifier_issuer_27,other_identifier_28,other_identifier_type_28,other_identifier_state_28,other_identifier_issuer_28,other_identifier_29,other_identifier_type_29,other_identifier_state_29,other_identifier_issuer_29,other_identifier_30,other_identifier_type_30,other_identifier_state_30,other_identifier_issuer_30,other_identifier_31,other_identifier_type_31,other_identifier_state_31,other_identifier_issuer_31,other_identifier_32,other_identifier_type_32,other_identifier_state_32,other_identifier_issuer_32,other_identifier_33,other_identifier_type_33,other_identifier_state_33,other_identifier_issuer_33,other_identifier_34,other_identifier_type_34,other_identifier_state_34,other_identifier_issuer_34,other_identifier_35,other_identifier_type_35,other_identifier_state_35,other_identifier_issuer_35,other_identifier_36,other_identifier_type_36,other_identifier_state_36,other_identifier_issuer_36,other_identifier_37,other_identifier_type_37,other_identifier_state_37,other_identifier_issuer_37,other_identifier_38,other_identifier_type_38,other_identifier_state_38,other_identifier_issuer_38,other_identifier_39,other_identifier_type_39,other_identifier_state_39,other_identifier_issuer_39,other_identifier_40,other_identifier_type_40,other_identifier_state_40,other_identifier_issuer_40,other_identifier_41,other_identifier_type_41,other_identifier_state_41,other_identifier_issuer_41,other_identifier_42,other_identifier_type_42,other_identifier_state_42,other_identifier_issuer_42,other_identifier_43,other_identifier_type_43,other_identifier_state_43,other_identifier_issuer_43,other_identifier_44,other_identifier_type_44,other_identifier_state_44,other_identifier_issuer_44,other_identifier_45,other_identifier_type_45,other_identifier_state_45,other_identifier_issuer_45,other_identifier_46,other_identifier_type_46,other_identifier_state_46,other_identifier_issuer_46,other_identifier_47,other_identifier_type_47,other_identifier_state_47,other_identifier_issuer_47,other_identifier_48,other_identifier_type_48,other_identifier_state_48,other_identifier_issuer_48,other_identifier_49,other_identifier_type_49,other_identifier_state_49,other_identifier_issuer_49,other_identifier_50,other_identifier_type_50,other_identifier_state_50,other_identifier_issuer_50,sole_proprieter,org_subpart,parent_lbn,parent_tin,off_name_prefix,off_name_suffix,off_credentials,taxonomy_group_1,taxonomy_group_2,taxonomy_group_3,taxonomy_group_4,taxonomy_group_5,taxonomy_group_6,taxonomy_group_7,taxonomy_group_8,taxonomy_group_9,taxonomy_group_10,taxonomy_group_11,taxonomy_group_12,taxonomy_group_13,taxonomy_group_14,taxonomy_group_15,cert_date) FROM '../../data/NPPES_Data_Dissemination_February_2021/npidata_pfile_20050523-20210207.csv' DELIMITER ',' CSV HEADER FORCE NULL last_name, first_name, repl_npi, deactivate_date, reactivate_date, cert_date, entity_type, enumeration_date, last_update,addr_practice_first,taxonomy_1,taxonomy_2,taxonomy_3,taxonomy_4,taxonomy_5,taxonomy_6,taxonomy_7,taxonomy_8,taxonomy_9,taxonomy_10,taxonomy_11,taxonomy_12,taxonomy_13,taxonomy_14,taxonomy_15

-- Copy data from npi table into npi taxonomy table
DO $$
DECLARE counter integer := 1;
BEGIN
    WHILE ( counter <= 15 ) LOOP
        -- Insert all taxonomy columns separately into taxonomy tables
        EXECUTE format('INSERT INTO npi_taxonomy(npi,taxonomy,taxonomy_group,taxonomy_classification,license_num,license_state,taxonomy_switch)
        SELECT npi.npi, npi.taxonomy_%s, npi.taxonomy_group_%s, taxonomy.classification, npi.license_num_%s, npi.license_state_%s, npi.taxonomy_switch_%s
        FROM npi, taxonomy
        WHERE taxonomy_%s IS NOT NULL AND npi.taxonomy_%s = taxonomy.code', counter, counter, counter, counter, counter, counter, counter);
        -- Increment counter
        counter := counter + 1;
    END LOOP;
END $$;

----------------------------------------------------------------------------------

-- Create an index on the npi for both tables
CREATE INDEX npi_main ON npi(npi);
CREATE INDEX lname ON npi(last_name);
CREATE INDEX citystate ON npi(addr_practice_city,addr_practice_state);
CREATE INDEX fullname on npi(last_name, first_name);

---- Index on taxonomy
CREATE INDEX npi_tax ON npi_taxonomy(npi);




----------------------------------------------------------------------------------

-- Test that info was imported correctly into the table
SELECT * from npi LIMIT 1;
SELECT * FROM npi_taxonomy LIMIT 3;

SELECT COUNT(id) as npi_count from npi;
SELECT COUNT(tax_id) as tax_count from npi_taxonomy;


----------------------------------------------------------------------------------




