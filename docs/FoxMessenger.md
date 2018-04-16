### FoxMessenger.sh

This script accepts a list of servers (normally provided by the config_parser.py script) on the standard input and checks their **statusfile** under the **./services/** folder. If change is detected in the status of Server, APP or Database and allert is required (based on config.json), FoxMessenger will execute either the **SendEmail.sh** and/or **bot_say.py** script with the proper allert message.

#### Usage

with custom data
```SHELL
echo "host:port/root" | ./FoxMessenger.sh
```

with the config file
```SHELL
python3 config_parser.py -s < config.json | ./FoxMessenger.sh
```