#!/bin/bash

echo WatchFox report created on $(date '+%Y/%m/%d at %H:%M:%S')

echo

while read HOST
do

  ping -c 1 `echo $HOST | cut -f1 -d":" | cut -f1 -d"/"` &> dump
  if [ $? = 0 ]; then
    SERVER="Server OK"
  else
    SERVER="Server Error"
  fi

  curl -I -s $HOST | head -1 | grep -E "[23][0-9][0-9]" &> dump
  if [ $? = 0 ]; then
    APP="APP OK"
  else
    APP="APP Error"
  fi

  HB=$(curl -s $HOST/heartbeat)
  if [[ $HB = *"Database Status\":\"OK"* ]]; then
    HEART="Database OK"
  else
    HEART="Database Error"
  fi

  echo "Hostname:port/route ${HOST}"
  echo $SERVER
  echo $APP
  echo $HEART
  echo

  # Appending statusfile of the service
  echo $(date '+%Y/%m/%d %H:%M:%S') $SERVER $APP $HEART >> ./services/$(echo $HOST | sed 's/[:/]//g')

done
