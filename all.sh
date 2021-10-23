#!/bin/bash
FILES=( $(ls -1a *-translations.csv ) )
# echo $FILES
for i in "${FILES[@]}"
do 
./scrape.sh "$i"
done