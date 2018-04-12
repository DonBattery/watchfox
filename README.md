# WatchFox

web-application monitoring with bash scripts

In this repo you will find linux bash tools to monitor web-apps,
especially node.js Express apps using the huli-hb package.

## WatchFox.sh

This is a wrapper-script for **FoxSentinel.sh**, **FoxMessenger.sh** and **FoxReporter.sh**
When executed it echoes the report on services found in **config.json** to the screen and a **logfile**
and generates **statusfiles** for every observed service (under the ./services/ folder).
Then it checks the statusefiles for status changes and reports them if configured (in config.json)
Then generates a custom html file based on the services actual status (this file will be hosted with
Python's SimpleHTTPServer). 

## FoxSentinel.sh

This script accepts a list of servers on stdin and runs three tests on them:
first **ping** the host (as a side effect a dump file named "dump" will be created)
then it tries to call **curl** on host:port (as a side effect the dump file will be rewriten)
finally it tries to call **curl** on host:port/heartbeat

The scrpit will display a report with timestamp and the result of every test.

For every service an individual file will be created under the **./services/** folder
containing the status reports associated with the service. Other scrits can work with
these files.


### Usage

```SHELL
./FoxSentinel < server.ls
```

## FoxMessenger.sh

alert user on services status changes

## FoxReporter.sh

creates HTML report
