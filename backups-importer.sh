#!/bin/bash

DATE=$(date +%F %T)
FILES=$(find $1 -name "*$DATE.tar")
for f in $FILES
do
                FILE=$(basename $f)
                USER=$(echo $FILE | cut -f1 -d".")
                echo "v-restore-user $USER $FILE"
                #v-restore-user $USER $FILE
done
exit 0