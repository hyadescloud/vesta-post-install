#!/bin/bash

source common/functions.sh;


DATE=$(date +%F +%T)
FILES=$(find $1 -name "*$DATE.tar")

for f in $FILES
do
        restore_user $f
done
exit 0

