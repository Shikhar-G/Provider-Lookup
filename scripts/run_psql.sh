#!/bin/bash
#***************************************************************************************#
#										        #
# FILE: run_psql.sh								        #
#										        #
# USAGE: run_psql.sh [-h] [-d <database_name>] [-c] [-e] -u <username> -f <path>   #
#										        #
# DESCRIPTION: Runs a SQL file or all SQL file from a folder.				#
#											#
# OPTIONS: List options for the script [-h]						#
#											#
# ERROR CONDITIONS: exit 1 ---- Invalid option						#
#                   exit 2 ----	PostgreSQL not installed		              	#
#                   exit 3 ----	Invalid file or folder given				#
#                   exit 4 ----	Tried to create database that already exists		#
#                   exit 5 ----	Error in parsing SQL file				#
#                   exit 99 ---	killed by external forces				#
#											#
# DEVELOPER: Shikhar Gupta								#
# DEVELOPER EMAIL: shikhar.gupta.tx@gmail.com 						#
#											#
# VERSION: 1.0										#
# CREATED DATE-TIME: 2020-10-28-07:00 Central Time Zone USA				#
#											#
#***************************************************************************************#


# Define the shell functions
usage(){
	echo "
	Usage: $0 [-h] [-d <database_name>] [-c] [-e] -u <username> -f <path>

	Options:
		-h 	Display help message.
		-d	Specify a database name (Default is \"test\").
		-c	Create the database (should not already exist).
		-e 	Stop on error messages in the psql script.
		-u	Specify a postgres username to connect as.
		-f	Specify a folder or .sql filename (Required).
	" >&2
	exit 0
}

die()
{
	echo $1 >&2
	# Print number of files read
	echo "$count files read."
	exit $2
}

parse_file()
{
	# Go into containing directory and get pure filename
	cd $(dirname $1)
	file=$(basename $1)
	# Increment number of files parsed
	((count++))
	# Run a single sql file
	echo -e "\n*****  Processing $file *****\n"
	toRun="${cmd} -U ${username} -f ${file}"
	eval " $toRun"
	# check status within the script
	if [[ $? != 0 ]]; then
		die "Error in file $file." 5
	fi
	# successfully finished
	echo -e "\n***** Finished $file *****\n"
}

parse_directory()
{
	# Run all sql files in the folder
	for filename in $fname/*; do
		if [[ $filename == *.sql ]]; then
			parse_file $filename
		fi
	done
}

# Scripts

# Check that there is at least one argument passed
if [ $# -lt 2 ]; then
    usage
fi

# Initialize variables, default database name is 'test'
fname=""
username=""
database="test"
create=false
directory=false
cmd="psql"
count=0


# Parse command line arguments
while getopts "hcf:d:u:e" opt; do
	  case $opt in
	          h) usage
			 ;;
              f) fname=$OPTARG
             ;;
			  d) database=$OPTARG
			 ;;
			  u) username=$OPTARG
			 ;;
			  c) create=true
			 ;;
			  e) cmd="${cmd} -v ON_ERROR_STOP=ON "
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

# Check if username was given
if [ -z "$username" ]
then
	die "Error----> Please enter a username." 3
fi

# Check if it's a directory
if [ -d "$fname" ]
then
	directory=true
# Check if it's a file
elif [ -f "$fname" ]
then
	# Make sure it's a valid sql file
	if [[ $fname != *.sql ]]
	then
		die "Error----> Not a .sql file." 3
	fi
else
	die "Error----> Please enter a valid file or folder name." 3
fi

# Create database
if [ "$create" = true ]
then
	createdb $database -U $username
	if [[ $? != 0 ]]; then
		die "Error ----> database already exists." 4
	fi
fi

# Set database name
cmd="${cmd} ${database}"

# Run sql files
if [ "$directory" = true ]; then
	echo "Parsing directory."
	parse_directory
else
	parse_file $fname
fi

# Finished successfully
echo "All done!"

echo "$count files read."

exit 0

