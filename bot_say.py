#!/usr/bin/env python

import os
import sys

try:
    slack_token = os.environ['SLACK_API_TOKEN']
    from slackclient import SlackClient
    sc = SlackClient(slack_token)
except Exception as e:
    print('Slack error\n', e)
    sys.exit(1)

red = "#f7520c"
green = "#52f23a"

def slack_allert(color, message):
    sc.api_call(
        'chat.postMessage',
        channel=os.environ['SLACK_CHANNEL'],
        attachments= [{
            "color": color,
            "title": ":watchfox: WatchFox Allert",
            "text": message }])

if sys.argv[1] in ['-r', '-R']:
    color = red

if sys.argv[1] in ['-g', '-G']:
    color = green

slack_allert(color, sys.argv[2])
sys.exit(0)