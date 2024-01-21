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

Additionally, this application requires a **Google Maps API key**. Instructions for obtaining a free API key can be found here: https://developers.google.com/maps/documentation/embed/cloud-setup. Follow the "Set up your Google Cloud Project" section and the "Create API Keys" subsection under "Use your API Keys".

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

#### (Optional) *Create a Postgres User for the Application*
Follow these steps if you need to configure a new postgres user for use in the application.

To create a new user for use with the application, follow the below instructions *(note: you must have access to the postgres superuser to create another user)*.

<pre>
createuser <b>username</b> -d -P
</pre>

This command will create a new postgres user with the ability to create databases (the ```-d``` flag), and the command will also prompt you to create a password for the new user (the ```-P``` flag). 

More options can be found at https://www.postgresql.org/docs/current/app-createuser.html

#### Configure options for the database

Modify the ```"NAME"```, ```"USER'```, and ```"PASSWORD"``` fields in the ```config.json``` file of the root directory with the respective database name, postgres username, and postgres password (if set), then run the following command.
```
./scripts/run_psql.sh -c -d DATABASE_NAME -U USERNAME -e -f sql/all.sql
```
If the database specified already exists, omit the ```-c``` flag in the call to the ```run_psql.sh``` command to create the database. However, if this is the case, make sure the postgres user specified has all necessary permissions in the database specified.

*Note: this script may take a few hours to run due to the large amount of data. Only run this step if there is ample time for the script to run. If the script is interrupted, it is safe to run it again, but run it without the ```-c``` flag as the database will have already been created.*

### Django Setup

#### Generate Secret

A unique Django secret key must be generated with the following command.
```commandline
python3 scripts/generate_secret.py
```

#### Add Google Maps API Key
Navigate to ```web/.env``` (which was created in the previous step).

Append this line to the end of the file:
```
GOOGLE_MAPS_API_KEY = YOUR_API_KEY
```

#### Migrate
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

## Notes
- For any issues, feel free to post an issue on the GitHub page.
- Make sure not to commit the ```config.json``` file. It is not ignored by default so that there is a template file to use for the application, but any information stored here about the database connection should be kept confidential.
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










 
