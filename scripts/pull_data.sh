#!/bin/bash
#***************************************************************************************#
#										        #
# FILE: pull_data.sh							        #
#										        #
# USAGE: pull_data.sh  #
#										        #
# DESCRIPTION: Pulls data from the NPPES website for use with the provider lookup application			#
#											#
#											#
# ERROR CONDITIONS: exit 1 ---- Error pulling data			#
#											#
# DEVELOPER: Shikhar Gupta								#
# DEVELOPER EMAIL: shikhar.gupta.tx@gmail.com 						#
#											#
# VERSION: 1.0										#
# CREATED DATE-TIME: 2020-10-28-07:00 Central Time Zone USA				#
#											#
#***************************************************************************************#

# Define the shell functions
die()
{
	echo $1 >&2
	exit $2
}

# Get data files
echo "Pulling data..."
python3 scripts/data.py
if [[ $? != 0 ]]; then
	die "Error ----> Error pulling data from NPPES." 1
fi

# Create the configuration file for Django
echo "Creating config.json"
cat << EOF | cat > config.json
{
  "default": {
    "ENGINE": "django.db.backends.postgresql",
    "NAME": "test"
  }
}
EOF