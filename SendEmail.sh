#!/bin/bash

echo "To:"$1 > allert_email
echo "Subject: Automatic WatchFox Allert" >> allert_email
echo >> allert_email
echo "Service name :" $2 >> allert_email
echo "Service URL  :" $3 >> allert_email
echo >> allert_email
if [[ $4 != "" ]]; then
  echo $4 >> allert_email
fi
if [[ $5 != "" ]]; then
  echo $5 >> allert_email
fi
if [[ $6 != "" ]]; then
  echo $6 >> allert_email
fi
echo >> allert_email
echo Visit the WatchFox Status site at `python3 config_parser.py site < config.json` >> allert_email
echo >> allert_email

msmtp -t < allert_email

# Cleanup
echo "" > allert_email
rm allert_email
