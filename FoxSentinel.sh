#!/bin/bash

echo WatchFox report created on $(date '+%Y/%m/%d at %H:%M:%S')

echo

while read HOST
do

  # Check if the server of the service is pingable
  ping -c 1 `echo $HOST | cut -f1 -d":" | cut -f1 -d"/"` &> dump
  if [ $? = 0 ]; then
    SERVER="Server OK"
  else
    SERVER="Server Error"
  fi

  # Check if HTTP check returns with status code 200 - 399
  curl -I -s $HOST | head -1 | grep -E "[23][0-9][0-9]" &> dump
  if [ $? = 0 ]; then
    APP="APP OK"
  else
    APP="APP Error"
  fi

  # Check if Hearbeat returns with "Database : OK"
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

  # Cleaning up
  echo "" > dump; rm dump

done
