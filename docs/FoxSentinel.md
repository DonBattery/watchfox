### FoxSentinel.sh

This script accepts a list of servers (normally provided by the config_parser.py script) on the standard input and runs three tests on them:

first **ping** the host (if possible)

then it tries to call **curl** on host:port (looking for 200-399 HTTP Status)

finally it tries to call **curl** on host:port/heartbeat (looking for "Database: OK" in response)

The scrpit will display a report with timestamp and the result of every test. (by default WatchFox channels this report to the **logfile**) For every service also an individual file will be created under the **./services/** folder containing the timestamp and the status reports associated with the service. Other scrits (FoxMessenger, FoxReporter) can work with these files.

#### Usage

with custom data
```SHELL
echo "host:port/root" | ./FoxSentinel.sh
```

with the config file
```SHELL
python3 config_parser.py -s < config.json | ./FoxSentinel.sh
```

with the config file and proper logging (on screen and logfile)
```SHELL
python3 config_parser.py -s < config.json | ./FoxSentinel.sh 2>&1 | tee -a logfile
```