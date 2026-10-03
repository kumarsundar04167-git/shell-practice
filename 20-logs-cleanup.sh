#!/bin/bash
SOURCE_DIR=$1
days=${2:-14}

if [ -z $SOURCE_DIR ]; then
   echo "error :: missing parameters"
   echo "usage : $0 <source_dir> (days)"
   exit 1
fi

if [ ! -d $SOURCE_DIR ]; then
   echo "error :: directory: $SOURCE_DIR does not exist"
   exit 1
fi

   echo "scanning $SOURCE_DIR for logs more thsn 14 days old"
   FILES=(find $SOURCE_DIR -name "*.log" -type f -mtime +$days)

if [ -z $FILES ]
   echo "no log files older than 14 day found"
   exit 0
fi

while IFS= read -r FILE
do
   rm -rf $FILE
   echo "file $FILE deleted"
done <<< "$FILES"

