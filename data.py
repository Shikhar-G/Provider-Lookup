#***************************************************************************************#
#										        #
# FILE: data.py								       	        #
#										        #
# USAGE: python data.py [-h] [-c <filename>] [-f] 					#
#										        #
# DESCRIPTION: Downloads NPI data files from NPPES onto the local machine.		#
#											#
# OPTIONS: List options for the script [-h]						#
#											#
#											#
# DEVELOPER: Shikhar Gupta								#
# DEVELOPER EMAIL: shikhar.gupta.tx@gmail.com 						#
#											#
# VERSION: 1.0										#
# CREATED DATE-TIME: 2021-5-10-07:00 Central Time Zone USA				#
#											#
#***************************************************************************************#
import requests
from bs4 import BeautifulSoup
import zipfile
import os
import shutil
from re import match
import argparse

# Function to get urls from a webpage, returns the length of the url received as well
def getFile(url, filestart=''):
    # From https://stackoverflow.com/questions/15517483/how-to-extract-urls-from-an-html-page-in-python
    try:
        response = requests.get(url, allow_redirects=True)
    except:
        raise Exception("Couldn't access URL.")
    # parse html
    page = str(BeautifulSoup(response.content, "html.parser"))
    start_link = page.find(r'a href="'+ filestart) # Find urls starting with an optional string
    if start_link == -1:
        return None
    start_quote = page.find('"', start_link)
    end_quote = page.find('"', start_quote + 1)
    return page[start_quote + 1: end_quote][len(filestart):]


# Read input arguments
parser = argparse.ArgumentParser()
parser.add_argument("-f", "--force", help="force update of csv files", action="store_true")
parser.add_argument("-c", "--curr", help="filename for current version file (default: curr.txt)", default="curr.txt")
args = parser.parse_args()

curr = ''
# create the file if doesn't exist
if not os.path.exists(args.curr):
    open(args.curr, 'w').close()
# read current filename
else:
    f = open(args.curr, 'r')
    curr = f.read()
    f.close()

filename = getFile("https://download.cms.gov/nppes/NPI_Files.html", './')

url = "https://download.cms.gov/nppes/"

if filename:
    # update filename if it is not already up to date
    print("Found", filename)
    if curr == filename and not args.force:
        print("Already up to date. No further action needed.")
    else:
        # From https://www.tutorialspoint.com/downloading-files-from-web-using-python
        # Download the file from the server
        url += filename
        print('Downloading', url)
        r = requests.get(url, allow_redirects=True)
        if r.ok:
            # If url is not found, will print 'not found'
            if int(r.headers['Content-Length']) > 10:
                # Create folder if doesn't exist
                if not os.path.exists('data'):
                    os.makedirs('data')

                # Write the zip file
                print("Writing zip file..")
                open('data/npi.zip', 'wb').write(r.content)

                # Extract zip
                print("Unzipping..")
                with zipfile.ZipFile('data/npi.zip', 'r') as zip_ref:
                    zip_ref.extractall('data/npi_data')
                os.remove("data/npi.zip")

                # Find the npi and pl data files from the folder
                cwd = os.getcwd()
                path = cwd + "/data/npi_data/"
                files = os.listdir(path)

                found_npi = False
                found_pl = False
                for file in files:
                    # Found the data file
                    if match("npidata_pfile_(\d+)-(\d+).csv", file):
                        print("Found npi data file, moving..")
                        os.rename(path + file, cwd + "/data/npi.csv")
                        found_npi = True
                    # Found the pl file
                    elif match("pl_pfile_(\d+)-(\d+).csv", file):
                        print("Found pl data file, moving..")
                        os.rename(path + file, cwd + "/data/pl.csv")
                        found_pl = True
                shutil.rmtree(path)

                # write the updated filename to the current version file
                if found_npi and found_pl:
                    print("Successfully retrieved files!")
                    f = open(args.curr, 'w')
                    f.write(filename)
                    f.close()
                else:
                    raise FileNotFoundError("Couldn't find both pl and npi files")
            else:
                raise FileNotFoundError("File not found on server.")
        else:
            raise Exception("GET request failed.")
else:
    raise FileNotFoundError("No matching files found on page.")
