#!/bin/bash
#***************************************************************************************#
#										        #
# FILE: verify_table.sh								        #
#										        #
# USAGE: verify_table.sh [-h] [-d <database_name>] -t <table_name> -f <path>  		#
#										        #
# DESCRIPTION: Verifies that a PostgreSQL table imported all data from a CSV file.	#
#											#
# OPTIONS: List options for the script [-h]						#
#											#
# ERROR CONDITIONS: exit 1 ---- Invalid option						#
#                   exit 2 ----	PostgreSQL not installed		              	#
#                   exit 3 ----	Invalid file or folder given				#
#                   exit 4 ----	Error in psql						#
#                   exit 5 ----	Error in parsing csv					#
#                   exit 99 ---	killed by external forces				#
#											#
# DEVELOPER: Shikhar Gupta								#
# DEVELOPER EMAIL: shikhar.gupta.tx@gmail.com 						#
#											#
# VERSION: 1.0										#
# CREATED DATE-TIME: 2020-11-18-07:00 Central Time Zone USA				#
#											#
#***************************************************************************************#

# Define the shell functions
usage(){
	echo "
	Usage: $0 [-h] [-d <database_name>] -t <table_name> -f <path>

	Options:
		-h 	Display help message.
		-d	Specify a database name (Default is \"test\").
                -t      Specify a table name (Required).
		-f	Specify a csv filename (Required).
	" >&2
	exit 0
}

die()
{
	echo $1 >&2
	exit $2
}

# Scripts

# Check that there is at least 1 arguments passed
if [ $# -lt 1 ]; then
    usage
fi

# Initialize variables, default database name is 'test'
fname=""
database="test"
tablename=""
tests=1
passed=0

# Parse command line arguments
while getopts "hf:d:t:" opt; do
	  case $opt in
	          h) usage
			 ;;
              f) fname=$OPTARG
             ;;
			  d) database=$OPTARG
			 ;;
			  t) tablename=$OPTARG
			 ;;
		 \?) die "Error---->Invalid option: -$OPTARG" 1
		     ;;
	  esac
done

# Verify psql installation exists
psql --version
if [[ $? != 0 ]]; then
	die "Error ----> postgresql not installed." 2
fi

# Check if it's a file
if [ -f "$fname" ]
then
	# Make sure it's a valid csv file
	if [[ $fname != *.csv ]]
	then
		die "Error----> Not a .csv file." 3
	fi
else
	die "Error----> Please enter a valid .csv file name." 3
fi

# Test One: Check number of rows in csv and psql table
echo
echo "*** Test One: Number of Rows ***"

# Get rows in table
count=`psql -A -t -v ON_ERROR_STOP=1 -d ${database} -c "SELECT COUNT(*) from $tablename;"`
if [[ $? != 0 ]]; then
	die "Error in psql." 4
fi
count=${count[0]}

# Get rows in csv
csvlines=$(($(cat $fname | wc -l) - 1))
if [[ $? != 0 ]]; then
	die "Error in csv file." 5
fi


echo "Rows in table: ${count}"
echo "Rows in CSV (excluding header row): ${csvlines}"

# Check for equality
if [ "$count" = "$csvlines" ]; then
    echo "PASSED"
    ((passed++))
else
    echo "FAILED"
fi  

echo
echo "Passed ${passed}/${tests} tests."
echo "All done!"

exit 0


