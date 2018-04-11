#!/bin/bash

python3 config_parser.py -s < config.json | ./FoxSentinel.sh 2>&1 | tee -a logfile
python3 config_parser.py -s < config.json | ./FoxMessenger.sh