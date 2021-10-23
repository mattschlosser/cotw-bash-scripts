#!/bin/bash
COUNTRY=$1
echo $COUNTRY
wget -O "$COUNTRY.zip" "http://download.geonames.org/export/dump/$COUNTRY.zip"
wget -O "$COUNTRY-alt.zip" "http://download.geonames.org/export/dump/alternatenames/$COUNTRY.zip"
unzip "$COUNTRY-alt.zip" "$COUNTRY.txt"
mv "$COUNTRY.txt" "$COUNTRY-alt.txt"
unzip "$COUNTRY.zip" "$COUNTRY.txt"
sed 's/"/\\"/g' "$COUNTRY.txt" >> "$COUNTRY-escaped.txt"
sed 's/"/\\"/g' "$COUNTRY-alt.txt" >> "$COUNTRY-escaped-alt.txt"
sqlite3 data.db < db-schema.sql
sqlite3 data.db <<EOF
.mode tabs
.import $COUNTRY-escaped.txt places
.import $COUNTRY-escaped-alt.txt alternatePlaces
EOF