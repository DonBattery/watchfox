#!/bin/bash

while read HOST

do

  STATUSFILE=(./services/$(echo $HOST | sed 's/[:/]//g'))

  # If statusfile exists 
  if [ -f $STATUSFILE ]; then
    # and longer than 1 line
    if [ $(wc -l < $STATUSFILE) -gt 1 ]; then

      # Previous status of service
      PRE_STATUS=$(tail -2 ${STATUSFILE} | head -n 1)
    
      if [[ $PRE_STATUS = *"Server OK"* ]]; then
        PRE_SERVER="OK"
      else
        PRE_SERVER="Error"
      fi

      if [[ $PRE_STATUS = *"APP OK"* ]]; then
        PRE_APP="OK"
      else
        PRE_APP="Error"
      fi

      if [[ $PRE_STATUS = *"Database OK"* ]]; then
        PRE_DB="OK"
      else
        PRE_DB="Error"
      fi

      # Actual status of service
      ACT_STATUS=$(tail -1 ${STATUSFILE})

      if [[ $ACT_STATUS = *"Server OK"* ]]; then
        ACT_SERVER="OK"
      else
        ACT_SERVER="Error"
      fi

      if [[ $ACT_STATUS = *"APP OK"* ]]; then
        ACT_APP="OK"
      else
        ACT_APP="Error"
      fi

      if [[ $ACT_STATUS = *"Database OK"* ]]; then
        ACT_DB="OK"
      else
        ACT_DB="Error"
      fi

      ALLERTING=`python3 config_parser.py allert $HOST < config.json`
      SERVER_ALLERT=""
      APP_ALLERT=""
      DB_ALLERT=""

      # Detect changes in status
      if [ "$PRE_SERVER" != "$ACT_SERVER" ]; then
        if [ "$ACT_SERVER" == "OK" ]; then
          SERVER_ALLERT="Server is back again! :)"
        else
          SERVER_ALLERT="Server went down! :("
        fi
      fi

      if [ "$PRE_APP" != "$ACT_APP" ]; then
        if [ "$ACT_APP" == "OK" ]; then
          APP_ALLERT="APP is back again! :)"
        else
          APP_ALLERT="APP went down! :("
        fi
      fi

      if [ "$PRE_DB" != "$ACT_DB" ]; then
        if [ "$ACT_DB" == "OK" ]; then
          DB_ALLERT="Database is back again! :)"
        else
          DB_ALLERT="Database went down! :("
        fi
      fi

      # Do allerting if change(s) detected and allert is required on the service
      if [ "$SERVER_ALLERT" != "" ] || [ "$APP_ALLERT" != "" ] || [ "$DB_ALLERT" != "" ]; then
        if [[ "$ALLERTING" == *"Email Y"* ]]; then
          ./SendEmail.sh `python3 config_parser.py email < config.json` "`python3 config_parser.py name $HOST < config.json`" "$HOST" "$SERVER_ALLERT" "$APP_ALLERT" "$DB_ALLERT"
        fi
        if [[ "$ALLERTING" == *"Slack Y"* ]]; then          
          ALLERT_TEXT=$"${SERVER_ALLERT}"$'\n'"$APP_ALLERT"$'\n'"$DB_ALLERT"
          if [[ $ALLERT_TEXT = *":("* ]]; then
            ALLERT_COLOR="-r"
          else
            ALLERT_COLOR="-g"
          fi

echo "Allert Text"
echo $ALLERT_TEXT

read -r -d '' SLACK_MESSAGE << OEM
Service `python3 config_parser.py name "$HOST" < config.json`
URL      $HOST
$ALLERT_TEXT
OEM
          echo ------------------------SLACK--------------------------
          echo "SLACK MESSAGE"
          echo "$SLACK_MESSAGE"
          echo "$SLACK_MESSAGE" > slack_message
          sed -i -- 's/:)/:grin:/g' slack_message
          sed -i -- 's/:(/:sweat:/g' slack_message
          echo "After SED"
          cat slack_message
          . setslack.sh
          python bot_say.py "$ALLERT_COLOR" "`cat slack_message`"
          echo > slack_message
          rm slack_message
        fi
      fi

    fi    
  fi

done
