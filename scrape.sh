#!/bin/bash
INPUT_FILE=$1
COTW_LANG=$(echo "$1" | awk -F- '{print $2}')
# echo "Detected lang code: $COTW_LANG";

# COTW_LANG=th
# create a file with just geonames id
tail -n +2 "$1" |  awk -F, '{print $1}' | awk -F- '{print $NF}' | tr -d \" > missing.csv
# put geonames ids into ssqlite
sqlite3 data.db <<EOF
.mode csv 
delete from missing;
.import missing.csv missing
EOF
# do a join and find if alternate names exist
echo "\"$COTW_LANG\"" > new-out.csv
sqlite3 data.db >> new-out.csv <<EOF
.mode csv
select k.\`alternate name\` from missing m left join (select m.id, a.\`alternate name\` as \`alternate name\`  from missing m left join alternatePlaces a on a.geonameid = m.id and a.isoLanguage = '$COTW_LANG' group by m.id) k on k.id = m.id;
EOF
EMPTY=$(cat new-out.csv | sed '/^\s*$/d' | wc -l)
TOTAL=$(cat new-out.csv | wc -l)
#echo "Translations found for $EMPTY of $TOTAL places"
PERCENT=$(echo "scale=2; $EMPTY/$TOTAL*100" | bc)
#echo "That's $PERCENT%!"
#echo ""
echo "$1,$EMPTY,$TOTAL,$PERCENT"
# output format into standard csv
cat "$1" | awk -F, '{print $1 FS $2}' > data-key.csv
paste -d, data-key.csv new-out.csv > "$1-final.csv";
# displays a preview of the final file
#echo "Here's a quick preview..."
# head "$1-final.csv"
