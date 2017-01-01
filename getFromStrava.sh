#! /bin/bash
# run with command ./getFromStrava.sh (in same folder as this script)
# needs jsonv installed: https://github.com/archan937/jsonv.sh

# access token varies for each person, to get it, go to:
# https://www.strava.com/settings/api
ACCESS_TOKEN=get-your-access-token-from-link-on-line-above
JSON_FILE="output.json"
CSV_FILE="output.csv"
# comma separate the required fields with no spaces
FIELDS=start_date_local,distance,moving_time,average_speed,average_heartrate,total_elevation_gain,type

# get the json formatted information
# maximum number of results per page is 200. Increase page from 1 to get older results
curl -X GET https://www.strava.com/api/v3/athlete/activities -d access_token=$ACCESS_TOKEN -d page=1 -d per_page=200 -o $JSON_FILE

# select the fields which you are interested in and output them to a .csv file
# form more information on the fields available: 
# http://strava.github.io/api/v3/activities/#get-details
cat $JSON_FILE | jsonv $FIELDS > $CSV_FILE
