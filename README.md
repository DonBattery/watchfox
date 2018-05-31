# WatchFox

web-application monitoring with bash scripts

![WatchFox logo](https://i.imgur.com/3r2k27a.png "WatchFox")

This collection of bash (and Python) scripts function as a webpage monitoring system.

Its main focus is to monitor node.js Express applications using the [huli-hb](https://www.npmjs.com/package/huli-hb "Húlí Heartbeat") npm package which is a part of Malachite's [dependency-injection](docs/dependency_injection.png) project, and responsible for reporting the app's connection to its database.

[WatchFox](docs/WatchFox.png) not just logs the status of the services, but also can allert you via Email and [Slack](https://slack.com/), and serve HTML status report

WatchFox is available as a [Docker image](https://hub.docker.com/r/donbattery/watchfox/) on Dockerhub.\
execute **docker run --name WatchFox -d -it -p 8080:8080 donbattery/watchfox** to start a container\
then **docker exec -it WatchFox /bin/bash** so you can edit /home/watchfox/config.json and start the service\
with **init_watchfox.sh**

## Main parts

[init_watchfox](docs/init_watchfox.md "initial starting script")

[config.json](docs/config.md "The configuration file")

[WatchFox](docs/WatchFox.md "The main wrapper")\
[FoxSentinel](docs/FoxSentinel.md "Status checker and logger")\
[FoxMessenger](docs/FoxMessenger.md "Status change detection and allerting")\
[FoxReporter](docs/FoxReporter.md "HTML report creator")

## Other scripts

[Setup](docs/Setup.md "sets up service credentials")
[config_parser](docs/config_parser.md "parse config.json")\
[SendEmail](docs/SendEmail.md "simple Email sender")\
[bot_say](docs/bot_say.md "simple Slack message sender")\
[ReportingServer](docs/ReportingServer.md "report-site webserver")
