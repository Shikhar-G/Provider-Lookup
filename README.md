# Provider Lookup

Provider Lookup is a web application allowing users to search for individual medical providers in the United States registered under the National Plan and Provider Enumeration System (NPPES). This application is adapted from the NPPES National Provider Identifier (NPI) Registry Website (https://npiregistry.cms.hhs.gov/).

This application is implemented using Python 3 and HTML with the Django framework, and it also uses PostgreSQL for the database.

The data sources for this application come from the NPPES official website and the National Uniform Claim Committee: 

https://download.cms.gov/nppes/NPI_Files.html

https://www.nucc.org/index.php/code-sets-mainmenu-41/provider-taxonomy-mainmenu-40/csv-mainmenu-57

*Note: This build is optimized for development purposes only.*

## Requirements

This application requires Python3, pip, and [PostgreSQL](
https://www.postgresql.org/download) to be installed on the host machine prior to installation of the application software. About 10GB of free space is also required.

## Installation
Run all commands from the root directory. It is highly recommended to set up the application in a Python 3 Virtual Environment.

### Installing Python Dependencies
```commandline
pip3 install -r requirements.txt
```

### Pulling Data

```commandline
python3 scripts/data.py -d DATA_DIR
```
This will pull the latest NPI and taxonomy datasets  into the ```DATA_DIR``` directory and store the latest filenames in ```curr_npi.txt``` and ```curr_taxonomy.txt``` by default, respectively, to check for updates. 

If you would like to store the latest version in another file, specify the filename by running the above command with the ``--currnpi`` flag for the NPI dataset and ```--currtaxonomy``` flag for the taxonomy dataset. To force update the datasets, run the above command with the ```-f``` flag.

### Inserting Data into PostgreSQL

Modify the ```"NAME"```, ```"USER'```, and ```"PASSWORD"``` fields in the ```config.json``` file of the root directory with the respective database name, postgres username, and postgres password, then run the following commands. If you would like to use the postgres user by default, delete the ```"USER"``` and ```"PASSWORD"``` fields entirely.
```commandline
./scripts/run_psql.sh -d DATABASE_NAME -e -f sql/all.sql
```
If the database name specified does not yet exist, include the ```-c``` flag in the call to the ```run_psql.sh``` command to create the database.

#### Postgres User Configuration

To create a new user for use with the application or grant an existing user permissions to the database, follow the below instructions.

```commandline
psql <DATABASE_NAME>
```
To create a user *(optional, if user doesn't already exist)*:
```commandline
CREATE USER <NAME> with PASSWORD <PASSWORD>;
```
To grant access to the tables for the database.
```commandline
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO <USERNAME>;
```
The last command can be modified if the database used contains other tables not included in this application.

### Django Setup

A unique Django secret key must be generated with the following command.
```commandline
python3 scripts/generate_secret.py
```

Then, necessary migrations from PostgreSQL to Django need to be made for the server to use the PostgreSQL database.

```commandline
python3 web/manage.py migrate
```

## Running

Once installation is complete, run the following command.
The server will run on port 8000 by default on localhost.

```commandline
python3 web/manage.py runserver
```
## Screenshots
<p align="center">
<img width="650" alt="Screen Shot 2020-09-16 at 9 06 11 PM" src="https://user-images.githubusercontent.com/29441672/127089060-90563990-8e2e-4e3a-ae81-f2bf90978496.png">
</p>

<p align="center">
<img width="650" alt="Screen Shot 2020-09-16 at 9 06 11 PM" src="https://user-images.githubusercontent.com/29441672/127089139-2e485a86-359b-49f9-9b07-52dcf717b4c4.png">
</p>

<p align="center">
<img width="650" alt="Screen Shot 2020-09-16 at 9 06 11 PM" src="https://user-images.githubusercontent.com/29441672/127089186-588cbc11-adfd-491b-aaa6-9b6322d683e1.png">
</p>










 
