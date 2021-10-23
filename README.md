Two bash scripts to do everything

# Import data for a given country code

Downloads
```sh
# downlaods all data from the geocodes website and puts into sqlite3 db
./get.sh <iso-2_country_coude>
```

Example
```
./get.sh CA
```
would download all data for Canada

First download a csv from the transation website
and place it in the root directory of the project

For example: `THA-th-translations.csv`

# Parse csv
```sh
./scrape.sh THA-th-translations.csv
```

This will produce a THA-th-transalations.csv-final.csv file

