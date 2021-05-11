# Provider Lookup

Provider Lookup is a web application allowing users to search for individual medical providers in the United States registered under the National Plan and Provider Enumeration System (NPPES). This application is adapted from the NPPES National Provider Identifier (NPI) Registry Website (https://npiregistry.cms.hhs.gov/).

This application is implemented using Python 3 and HTML with the Django framework, and it also uses PostgreSQL for the database.

The data sources for this application come from the NPPES official website and the National Uniform Claim Committee: 

https://download.cms.gov/nppes/NPI_Files.html

https://www.nucc.org/index.php/code-sets-mainmenu-41/provider-taxonomy-mainmenu-40/csv-mainmenu-57

## Requirements

This application requires Python3, pip, and [PostgreSQL](
https://www.postgresql.org/download) to be installed on the host machine prior to installation of the application software. About 10GB of free space is also required.

## Installation
Run all commands from the root directory. It is highly recommended to set up the application in a Python 3 Virtual Environment.

### Installing Python Dependencies
```commandline
pip install -r requirements.txt
```

### Pulling Data

```commandline
python data.py
```
This will pull the latest dataset from the NPPES website into the ```data``` directory and store the latest filename in ```curr.txt```.

If you would like to store the latest version in another file, specify the filename by running the above command with the ``-c`` flag. To force update the dataset, even if the version stored in
```curr.txt``` matches the version on the NPPES website, run the above command with the ```-f``` flag.

### Inserting Data into PostgreSQL

Specify a database name in the corresponding field in the ```config.json``` file of the root directory (default is "test"), then run the following commands.


```commandline
./scripts/run_psql.sh -d DATABASE_NAME -e -f sql/all.sql
```
If the database specified does not yet exist, include the ```-c``` flag in the call to the ```run_psql.sh``` command to create the database.

Note: This may take a long time to run as the data file to process is more than 8 GB in size.

### Django Setup

A unique Django secret key must be generated with the following command.
```commandline
python generate_secret.py
```

Then, necessary migrations from PostgreSQL to Django need to be made for the server to use the PostgreSQL database.

```commandline
python web/manage.py migrate
```

## Running

Once installation is complete, run the following command.
The server will run on port 8000 by default on localhost.

```commandline
python web/manage.py runserver
```







 