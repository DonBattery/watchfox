#!/bin/bash

echo
echo "starting WatchFox ..."
echo

# Run Setup.sh if mytokens.env does not exists 
if [ ! -f mytokens.env ]; then
  echo
  echo "No service credentials has found, running Setup.sh ..."
  echo
  ./Setup.sh
fi

# Start serving the WatchFox report webpage on the 8080 PORT
echo
echo "Starting WatchFox report webserver..."
echo
if [ ! -d node_modules ]; then
  echo
  echo "Cannot find node_modules, running npm install"
  echo
  npm install
  echo
fi
nodejs ReportingServer.js &
sleep 1s
echo

# Setup environment variables
source mytokens.env
export SLACK_API_TOKEN=$SLACK_API_TOKEN
export SLACK_CHANNEL=`python3 config_parser.py slack < config.json`

# Setup msmtp Email service
cat > ~/.msmtprc <<EOF
account default
host smtp.gmail.com
port 587
from ${SERVICE_MAIL}
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
auth on
user ${SERVICE_MAIL}
password ${SERVICE_MAIL_PASS}
logfile ~/.msmtp
EOF

# Mainloop
while :
do
  python3 config_parser.py services < config.json | ./FoxSentinel.sh 2>&1 | tee -a logfile
  python3 config_parser.py services < config.json | ./FoxMessenger.sh
  python3 config_parser.py services < config.json | ./FoxReporter.sh
  sleep 1m
done