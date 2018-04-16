#!/bin/bash

python3 config_parser.py services < config.json | ./FoxSentinel.sh 2>&1 | tee -a logfile
python3 config_parser.py services < config.json | ./FoxMessenger.sh
python3 config_parser.py services < config.json | ./FoxReporter.sh