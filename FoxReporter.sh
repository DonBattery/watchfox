#!/bin/bash

# This script populates the statusData object in www/data.js
# wich will be rendered to the FoxSentinel report webpage

function write_data {
  echo "{ name : \"$1\", url : \"$2\", server : \"$3\", app : \"$4\", db : \"$5\"}," >> ./www/data.js
}

DATE_MESSAGE="WatchFox report created on $(date '+%Y/%m/%d at %H:%M:%S')"

echo "const statusData = { timeStamp : \""$DATE_MESSAGE"\", services : [" > ./www/data.js

while read HOST

do
  
  STATUSFILE=(./services/$(echo $HOST | sed 's/[:/]//g'))
  SERVER="Server unknown"
  APP="APP unknown"
  DB="DB unknown"

  if [ -f $STATUSFILE ]; then
    if [ $(wc -l < $STATUSFILE) -gt 0 ]; then
      SERVICE_STATUS=$(tail -1 $STATUSFILE)

      if [[ $SERVICE_STATUS = *"Server OK"* ]]; then
        SERVER="Server OK"
      fi
      
      if [[ $SERVICE_STATUS = *"Server Error"* ]]; then
        SERVER="Server Error"
      fi

      if [[ $SERVICE_STATUS = *"APP OK"* ]]; then
        APP="APP OK"
      fi

      if [[ $SERVICE_STATUS = *"APP Error"* ]]; then
        APP="APP Error"
      fi

      if [[ $SERVICE_STATUS = *"Database OK"* ]]; then
        DB="Database OK"
      fi

      if [[ $SERVICE_STATUS = *"Database Error"* ]]; then
        DB="Database Error"
      fi

    fi
  fi

  write_data "`python3 config_parser.py name $HOST < config.json`" "$HOST" "$SERVER" "$APP" "$DB"

done

echo "]}" >> ./www/data.js

  