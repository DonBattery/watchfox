#!/bin/bash

echo
echo -e "\e[1m\e[96mWelcome to WatchFox Setup\e[0m"
echo
echo "Please provide the credentials for the"
echo "Email and Slack service accounts, so WatchFox"
echo "can use those channels to allert you, when"
echo "changes occure in the status of monitored WebApps"
echo
echo -e "Your settings are stored in \e[1mmytokens.env\e[0m"
echo "it can be edited manually or by running Setup.sh"
echo
read -p "Service Email address >" SERVICE_MAIL
read -p "Service Email password >" SERVICE_MAIL_PASS
read -p "Slack API token >" SLACK_API_TOKEN

echo "SERVICE_MAIL=\"$SERVICE_MAIL\"" > mytokens.env
echo "SERVICE_MAIL_PASS=\"$SERVICE_MAIL_PASS\"" >> mytokens.env
echo "SLACK_API_TOKEN=\"$SLACK_API_TOKEN\"" >> mytokens.env
