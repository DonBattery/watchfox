#!/bin/bash

echo "To:"$1 > allert_email
echo "Subject: Automatic WatchFox Allert" >> allert_email
echo "" >> allert_email
echo "Service "$2 >> allert_email

if [[ $3 != "" ]]; then
  echo $3 >> allert_email
fi

if [[ $4 != "" ]]; then
  echo $4 >> allert_email
fi

if [[ $5 != "" ]]; then
  echo $5 >> allert_email
fi   

msmtp -t < allert_email

# Cleanup
echo "" > allert_email
rm allert_email
