#!/bin/bash
#***************************************************************************************#
#										        #
# FILE: verify_table.sh							        #
#										        #
# USAGE: verify_table.sh [-h] [-d <database_name>] -t <table_name> -f <path>  #
#										        #
# DESCRIPTION: Verifies that a PostgreSQL table imported all data from a CSV file.	#
#											#
# OPTIONS: List options for the script [-h]						#
#											#
# ERROR CONDITIONS: exit 1 ---- Invalid option						#
#                   exit 2 ----	PostgreSQL not installed		              	#
#                   exit 3 ----	Invalid file or folder given				#
#                   exit 4 ----	Error in psql		#
#                   exit 5 ----	Error in parsing csv				#
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
	Usage: $0 [-h] [-v] [-d <database_name>] [-c <number>] [-r <number>] -t <table_name> -f <path>

	Options:
		-h 	Display help message.
		-d	Specify a database name (Default is \"test\").
                -t      Specify a table name (Required).
		-f	Specify a csv filename (Required).
		-v  Verify csv file
		-c  (Recommended if there are primary keys) Number of expected columns in the table (Defaults to number of columns in CSV)
		-r 	Number of expected rows in the table (Defaults to number of rows in CSV)
	" >&2
	exit 0
}

die()
{
	echo $1 >&2
	echo "Passed ${passed}/${tests} tests."
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
testcsv=false
tablename=""
tests=2
passed=0
rows=0
cols=0

# Parse command line arguments
while getopts "hvf:d:t:c:r:" opt; do
	  case $opt in
	          h) usage
			 ;;
              f) fname=$OPTARG
             ;;
			  d) database=$OPTARG
			 ;;
			  t) tablename=$OPTARG
			 ;;
			  c) cols=$OPTARG
			 ;;
			  r) rows=$OPTARG
			 ;;
			  v) testcsv=true
				 tests=3
			 ;;
		 \?) die "Error ----> Invalid option: $OPTARG" 1
		     ;;
	  esac
done

# Verify keys is a numerical value (From https://stackoverflow.com/questions/806906/how-do-i-test-if-a-variable-is-a-number-in-bash)
re='^[0-9]+$'
if ! [[ $cols =~ $re ]] || ! [[ $rows =~ $re ]] ; then
   die "Error ----> Must specify a numerical value for columns" 1
fi

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


# Get num rows in the csv (-1 for header)
csvlines=$(($(cat $fname | wc -l) - 1))
if [[ $? != 0 ]]; then
	echo "** FAILED **"
fi

if [[ $rows = 0 ]]; then
	rows=$csvlines
fi

# Returns num commas in the first row + 1 (For newline) and returns count (num commas + 1 = num cols)
csvcols=$(($(sed -n "1p" $fname | tr -d -c ',' | wc -c) + 1)) # times 1 to strip whitespace
if [[ $? != 0 ]]; then
	echo "** FAILED **"
	die "Error in csv file." 5
fi
if [[ $cols = 0 ]]; then
	cols=$csvcols
fi


# i=$(($csvlines + 1))
# hitdata=false
# lines=$csvlines
# while [ $i -ge 0 ] && [ "$hitdata" = false ]
# do
# 	lastLineChars=$(($(sed -n "$(($csvlines + 1))p" $fname | wc -c) * 1))
# 	if [ $lastLineChars -ge 0 ]
# done


# Loop through csv and make sure each row has an equal number of commas
if [[ "$testcsv" = "true" ]]; then
	csvpass=true
	echo "*** Test: CSV Formatting ***"
	for ((i=1;i<=csvlines;i++)); do
		linecols=$(($(sed -n ${i}p $fname | tr -d -c ',' | wc -c) + 1))
		#sed 's/[^,]//g'
		if [[ $csvcols != $linecols ]]; then 
			echo "** FAILED on line ${i}**"
			csvpass=false
			break
		fi
	done
	if [[ "$csvpass" = "true" ]]; then
		echo "** PASSED **"
		((passed++))
	fi
fi



# Test Two: Check number of rows in csv and psql table
echo
echo "*** Test: Number of Rows ***"

# Get rows in postgres table
count=`psql -A -t -v ON_ERROR_STOP=1 -d ${database} -c "SELECT COUNT(*) from $tablename;"`
if [[ $? != 0 ]]; then
	die "Error in psql." 4
fi
count=${count[0]}

echo "Rows in table: ${count}"
echo "Rows expected: ${rows}"

# Check for equality
if [ "$count" = "$rows" ]; then
    echo "** PASSED **"
    ((passed++))
else
    echo "** FAILED **"
fi  

# Test Three: Check number of cols in csv and psql table
echo
echo "*** Test: Number of Columns ***"

# Get cols in postgres table
count=`psql -A -t -v ON_ERROR_STOP=1 -d ${database} -c "SELECT COUNT(*) from information_schema.columns
where table_name='$tablename';"`
if [[ $? != 0 ]]; then
	die "Error in psql." 4
fi

echo "Columns in table: ${count}"
echo "Columns expected: ${cols}"

# Check for equality
if [ "$count" = "$cols" ]; then
    echo "** PASSED **"
    ((passed++))
else
    echo "** FAILED **"
fi  


echo
echo "Passed ${passed}/${tests} tests."
echo "All done!"

exit 0


