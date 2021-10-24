#!/bin/bash
# downloads all 23 countries geonames data into a local sqlite3 db

COUNTRIES=("AZ" "BD" "BT" "KH" "EC" "EG" "ET" "IN" "LA" "ID" "JO" "KZ" "KG" "NP" "PK" "ES" "LK" "SD" "TZ" "TH" "TG" "UG" "VN")

for i in "${COUNTRIES[@]}"
do  ./get.sh "$i"
done    

# THe resulting DB is ~628 MB