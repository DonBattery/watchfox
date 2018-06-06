# WatchFox

web-application monitoring with (mostly BASH) scripts

![WatchFox logo](https://i.imgur.com/3r2k27a.png "WatchFox")

This collection of BASH (and a little Python / JavaScript) scripts function as a webpage monitoring system.

Its main focus is to monitor node.js Express applications using the [huli-hb](https://www.npmjs.com/package/huli-hb "Húlí Heartbeat") npm package, which is a part of Malachite's [dependency-injection](docs/dependency_injection.png) project, and responsible for reporting the app's connection to its database. However WatchFox can be set up to monitor any HTTP service.

[WatchFox](docs/WatchFox.png) not just logs the status of the services, but also can allert you via Email and [Slack](https://slack.com/), and serve HTML status report

WatchFox is available as a [Docker image](https://hub.docker.com/r/donbattery/watchfox/) on Dockerhub.

To create a WatchFox container execute:
```SHELL
docker run --name WatchFox -d -it -p 8080:8080 donbattery/watchfox
```
Then "enter" to its command line by executing:
```SHELL
docker exec -it WatchFox /bin/bash
```
From here you can edit **/home/watchfox/config.json**
```SHELL
nano /home/watchfox/config.json
```
and start WatchFox by executing:
```SHELL
init_watchfox.sh
```
On the first startup it will ask for the service credentials (Email and Slack), so allert can be sent to you, on these channels when changes occure in the status of the monitored services.

After WatchFox succesfully booted up you can close the terminal, it will continue to run inside its container.

## Main parts

[init_watchfox](docs/init_watchfox.md "initial starting script")

[config.json](docs/config.md "The configuration file")

[WatchFox](docs/WatchFox.md "The main wrapper")\
[FoxSentinel](docs/FoxSentinel.md "Status checker and logger")\
[FoxMessenger](docs/FoxMessenger.md "Status change detection and allerting")\
[FoxReporter](docs/FoxReporter.md "HTML report creator")

## Other scripts

[Setup](docs/Setup.md "sets up service credentials")\
[config_parser](docs/config_parser.md "parse config.json")\
[SendEmail](docs/SendEmail.md "simple Email sender")\
[bot_say](docs/bot_say.md "simple Slack message sender")\
[ReportingServer](docs/ReportingServer.md "report-site webserver")
