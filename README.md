# WatchFox

web-application monitoring with bash scripts

![WatchFox logo](https://i.imgur.com/3r2k27a.png "WatchFox")

This collection of bash (and Python) scripts function as a webpage monitoring system.

Its main focus is to monitor node.js Express applications using the **huli-hb** npm package which is a part of Malachite's dependency-injection project, and responsible for reporting the app's connection to its database.

WatchFox not just logs the status of the services, but also can allert via Email or Slack, and generates HTML report

## Main parts

[config.json](docs/config.md "The configuration file")\

[WatchFox](docs/WatchFox.md "The main wrapper")\
[FoxSentinel](docs/FoxSentinel.md "Status checker and logger")\
[FoxMessenger](docs/FoxMessenger.md "Status change detection and allerting")\
[FoxReporter](docs/FoxReporter.md "HTML report creator")\

## Other scripts

[config_parser](docs/config_parser.md "parse config.json")\
[SendEmail](docs/SendEmail.md "simple Email sender")\
[bot_say](docs/bot_say.md "simple Slack message sender")\
