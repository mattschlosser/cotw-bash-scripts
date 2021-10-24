Two bash scripts to do everything

The first script downloads data from the geocodes.org website and imports it into a local database

Required tools:
- `sqlite3`
- `bash`

# Import data for a given country code

Downloads
```sh
# downlaods all data from the geocodes website and puts into sqlite3 db
./get.sh <country_coude>
```

Example
```
./get.sh TH
```
would download all data for Thailand from geonames.org
and then import it into a local sqlite3 database. 

You can run this multiple times to import all the different countries. 


# Parse csv
The second script will parse the empty csv from the [website](https://translator-client-qa.taethni.com/), getting the geonames id
from the key column, cross referencing it with the data in sqlite3, and producing a NEW csv file. 

First download a csv from the translation website
and place it in the root directory of the project

For example: `THA-th-translations.csv`

Then run
```sh
./scrape.sh THA-th-translations.csv
```

This will produce a THA-th-transalations.csv-final.csv file
with the translation column filled with data if it exists in geonames. 

# power scripts

Two scripts that make the whole hackathon challenge easy

## db generator

This downloads data for the 23 languages from geonames.org and populates the sqlite3 db

```
./get-all
```

## csv filler

For all files that match the pattern `<3-digit-country>-<2-digit-lang-code>-translations.csv`,
looks up if there is an alternate name for the country in the geonames sqlite3 database created above. 

It generates a `<3-digit-country>-<2-digit-lang-code>-translations.csv-final.csv` file. 

```
./all
```
