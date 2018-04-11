#!/bin/bash

while read HOST
do
  STATUSFILE=(./services/$(echo $HOST | sed 's/[:/]//g'))
  echo Statusfile $STATUSFILE
  if [ $(wc -l < $STATUSFILE) -gt 1 ]; then
    echo $HOST processable
  else
    echo $HOST UNprocessable
  fi
done