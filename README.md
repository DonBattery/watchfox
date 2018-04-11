# WatchFox

web-application monitoring with bash script

In this repo you will find linux bash tools to monitor web-apps,
especially node.js Express apps using the huli-hb package.

## FoxSentinel

This script accepts a list of servers on stdin and runs three tests on them:
first **ping** the host (as a side effect a dump file named "ping" will be created)
then it tries to call **curl** on host:port (as a side effect a dump file named "app" will be created)
finally it tries to call **curl** on host:port/heartbeat

The scrpit will display a report with timestamp and the result of every test.

### Usage

```SHELL
./FoxSentinel < server.ls 2>&1 | tee logfile
```
