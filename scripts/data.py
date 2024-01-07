# ***************************************************************************************#
# 										        #
# FILE: data.py								       	        #
# 										        #
# USAGE: data.py [-h] [-f] [--currnpi CURRNPI] [--currtaxonomy CURRTAXONOMY] -d DATA					#
# 										        #
# DESCRIPTION: Downloads NPI data files from NPPES onto the local machine.		#
# 											#
# OPTIONS: List options for the script [-h]						#
# optional arguments:   #
# -h, --help            show this help message and exit #
#  -f, --force           force update of csv files #
#  --currnpi CURRNPI     filepath to current npi file (default: curr_npi.txt) #
#  --currtaxonomy CURRTAXONOMY #
#                        filepath to current taxonomy file (default: curr_taxonomy.txt) #
#  -d DATA, --data DATA  path to data folder to store files, will create if it does not exist #
# 											#
# 											#
# DEVELOPER: Shikhar Gupta								#
# DEVELOPER EMAIL: shikhar.gupta.tx@gmail.com 						#
# 											#
# VERSION: 1.0										#
# CREATED DATE-TIME: 2021-5-10-07:00 Central Time Zone USA				#
# 											#
# ***************************************************************************************#
import requests
from bs4 import BeautifulSoup
import zipfile
import os
import shutil
from re import match
import argparse

# Read input arguments
parser = argparse.ArgumentParser()
parser.add_argument(
    "-f", "--force", help="force update of csv files", action="store_true"
)
parser.add_argument(
    "--currnpi",
    help="filepath to current npi file (default: curr_npi.txt)",
    default="curr_npi.txt",
)
parser.add_argument(
    "--currtaxonomy",
    help="filepath to current taxonomy file (default: curr_taxonomy.txt)",
    default="curr_taxonomy.txt",
)
parser.add_argument(
    "-d",
    "--data",
    help="path to data folder to store files, will create if it does not exist",
    required=True,
)
args = parser.parse_args()


# Function to get urls from a webpage
def getFile(url, filestart="", npi=True):
    # From https://stackoverflow.com/questions/15517483/how-to-extract-urls-from-an-html-page-in-python
    try:
        response = requests.get(url, allow_redirects=True)
    except:
        raise Exception("Couldn't access URL.")
    # parse html
    page = str(BeautifulSoup(response.content, "html.parser"))
    if npi:
        # look for "Full Replacement Monthly NPI File" in the html
        page = page[page.find("Full Replacement Monthly NPI File") :]
    else:
        page = page[page.find("Health Care Provider Taxonomy Code Set CSV") :]
    start_link = page.find(
        r'a href="' + filestart
    )  # Find urls starting with an optional string
    if start_link == -1:
        return None
    start_quote = page.find('"', start_link)
    end_quote = page.find('"', start_quote + 1)
    return page[start_quote + 1 : end_quote][len(filestart) :]


def downloadFile(url, filename):
    print("Downloading", url)
    r = requests.get(url, allow_redirects=True)
    if r.ok:
        # If url is not found, will print 'not found'
        if int(r.headers["Content-Length"]) > 10:
            # Create folder if doesn't exist
            if not os.path.exists(args.data):
                os.makedirs(args.data)

            # Write the file
            print("Writing file..")
            open(os.path.join(args.data, filename), "wb").write(r.content)
        else:
            raise FileNotFoundError("File not found on server.")
    else:
        raise Exception("GET request failed.")


# create the file if doesn't exist
if not os.path.exists(args.currnpi):
    f = open(args.currnpi, "w")
    f.close()
f = open(args.currnpi, "r")
curr_npi_name = f.read()
f.close()

# create the file if doesn't exist
if not os.path.exists(args.currtaxonomy):
    f = open(args.currtaxonomy, "w")
    f.close()
f = open(args.currtaxonomy, "r")
curr_taxonomy_name = f.read()
f.close()

npi_filename = getFile("https://download.cms.gov/nppes/NPI_Files.html", "./", npi=True)
taxonomy_filename = getFile(
    "https://www.nucc.org/index.php/code-sets-mainmenu-41/provider-taxonomy-mainmenu-40/csv-mainmenu-57",
    "/images/stories/CSV/",
    npi=False,
)

npi_url = "https://download.cms.gov/nppes/"
taxonomy_url = "https://www.nucc.org/images/stories/CSV/"

if npi_filename:
    # update filename if it is not already up to date
    print("Found", npi_filename)
    if (
        curr_npi_name == npi_filename
        and os.path.exists(os.path.join(args.data, "npi.csv"))
        and os.path.exists(os.path.join(args.data, "pl.csv"))
        and not args.force
    ):
        print("Already up to date. No further action needed.")
    else:
        # From https://www.tutorialspoint.com/downloading-files-from-web-using-python
        # Download the file from the server
        downloadFile(npi_url + npi_filename, npi_filename)
        # Extract zip
        print("Unzipping..")
        with zipfile.ZipFile(os.path.join(args.data, npi_filename), "r") as zip_ref:
            zip_ref.extractall(os.path.join(args.data, "npi_data"))
        os.remove(os.path.join(args.data, npi_filename))

        # Find the npi and pl data files from the folder
        path = os.path.join(args.data, "npi_data")
        files = os.listdir(path)

        found_npi = False
        found_pl = False
        for file in files:
            # Found the data file
            if match("npidata_pfile_(\d+)-(\d+).csv", file):
                print("Found npi data file, moving..")
                os.rename(os.path.join(path, file), os.path.join(args.data, "npi.csv"))
                found_npi = True
            # Found the pl file
            elif match("pl_pfile_(\d+)-(\d+).csv", file):
                print("Found pl data file, moving..")
                os.rename(os.path.join(path, file), os.path.join(args.data, "pl.csv"))
                found_pl = True
        shutil.rmtree(path)

        # write the updated filename to the current version file
        if found_npi and found_pl:
            print("Successfully retrieved files!")
            f = open(args.currnpi, "w")
            f.write(npi_filename)
            f.close()
        else:
            raise FileNotFoundError("Couldn't find both pl and npi files")

if taxonomy_filename:
    # update filename if it is not already up to date
    print("Found", taxonomy_filename)
    if (
        curr_taxonomy_name == taxonomy_filename
        and os.path.exists(os.path.join(args.data, "taxonomy.csv"))
        and not args.force
    ):
        print("Already up to date. No further action needed.")
    else:
        # From https://www.tutorialspoint.com/downloading-files-from-web-using-python
        # Download the file from the server
        downloadFile(taxonomy_url + taxonomy_filename, taxonomy_filename)

        found_taxonomy = False
        if match("nucc_taxonomy_(\d+).csv", taxonomy_filename):
            print("Found taxonomy data file, moving..")
            os.rename(
                os.path.join(args.data, taxonomy_filename),
                os.path.join(args.data, "taxonomy.csv"),
            )
            found_taxonomy = True
            print("Successfully retrieved files!")
            f = open(args.currtaxonomy, "w")
            f.write(taxonomy_filename)
            f.close()
        else:
            raise FileNotFoundError("Couldn't find taxonomy file")
else:
    raise FileNotFoundError("No matching files found on page.")
