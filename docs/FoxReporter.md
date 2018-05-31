### FoxReporter.sh

This script generates the **data.js** under ./www which will be used to render the timestamp and status information of the observed services onto the index.html (which is served by ReportingServer.js)

#### Usage


with custom data
```SHELL
echo "host:port/root" | ./FoxReporter.sh
```

with the config file
```SHELL
python3 config_parser.py services < config.json | ./FoxReporter.sh
```
