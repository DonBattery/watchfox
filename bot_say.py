#!/usr/bin/env python

import os
import sys
from slackclient import SlackClient

slack_token = os.environ['SLACK_API_TOKEN']
sc = SlackClient(slack_token)

red = "#f7520c"
green = "#52f23a"

def slack_allert(color, message):
    sc.api_call(
        'chat.postMessage',
        channel="cli_bot_channel",
        attachments= [{
            "color": color,
            "title": ":watchfox: WatchFox Allert",
            "text": message }])

if sys.argv[1] in ['-r', '-R']:
    color = red

if sys.argv[1] in ['-g', '-G']:
    color = green

slack_allert(color, sys.argv[2])