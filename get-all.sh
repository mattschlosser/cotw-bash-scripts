#!/bin/bash
COUNTRIES=("AZ" "BD" "BT" "KH" "EC" "EG" "ET" "IN" "LA" "ID" "JO" "KZ" "TH")

for i in "${COUNTRIES[@]}"
do  ./get.sh "$i"
done