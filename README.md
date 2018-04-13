# WatchFox

web-application monitoring with bash scripts

This collection of bash (and Python) scripts function as a webpage monitoring system.

Its main focus is to monitor node.js Express applications using the **huli-hb** npm package which is a part of Malachite's dependency-injection project, and responsible for reporting the app's connection to its database.

WatchFox not just logs the status of the services, but also can allert via Email or Slack, and generates HTML report

## WatchFox.sh

This is the main "app" wich wrapps **FoxSentinel.sh**, **FoxMessenger.sh** and **FoxReporter.sh**

(FoxSentinel)\
When executed it echoes the report on services found in **config.json** to the screen and a **logfile** and generates a **statusfile** for every observed service (under the ./services/ folder).

(FoxMessenger)\
Then it checks the statusefiles for status changes and reports them if configured (in config.json)

(FoxReporter)\
Then generates a custom html file based on the services actual status (this file will be hosted with Python's SimpleHTTPServer).

**Usage**

(sudo needed because of the msmtp email-command)

```SHELL
sudo ./WatchFox.sh
```

## FoxSentinel.sh

This script accepts a list of servers (normally provided by the config_parser.py script) on the standard input and runs three tests on them:

first **ping** the host (if possible)

then it tries to call **curl** on host:port (looking for 200-399 HTTP Status)

finally it tries to call **curl** on host:port/heartbeat (looking for "Database: OK" in response)

The scrpit will display a report with timestamp and the result of every test. (by default WatchFox channels this report to the **logfile**) For every service also an individual file will be created under the **./services/** folder containing the timestamp and the status reports associated with the service. Other scrits (FoxMessenger, FoxReporter) can work with these files.

### Usage

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


## FoxMessenger.sh

This script accepts a list of servers (normally provided by the config_parser.py script) on the standard input and checks their **statusfile** under the **./services/** folder. If change is detected in the status of Server, APP or Database and allert is required (based on config.json), FoxMessenger will execute either the **SendEmail.sh** and/or **SendSlack.sh** script.


## FoxReporter.sh

creates HTML report

## SendEmail.sh

this small script accepts 5 parameters:\
$1 recipiant email addres\
$2 service
$3 Server status
$4 APP status
$5 Database status

creats an **allert_email** file and sends it with **msmtp**
