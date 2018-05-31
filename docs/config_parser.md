### config_parser.py

This Python script uses python's JSON library to parse **config.json**

Depending on the argument(s) config_parser.py gets when executed it will print different parts of the config file;
so other scripts can work with the data. It also translates the WebApp URL-s to valid filenames (./services) and back.

the following arguments are accapted

**python3 config_parser.py site < config.json**\
Prints out the address of WatchFox reporting site

**python3 config_parser.py email < config.json**\
Prints out the email address where allert emails will be send

**python3 config_parser.py slack < config.json**\
Prints out the Slack channel where allert messages will be send

**python3 config_parser.py services < config.json**\
Prints out every service by URL

**python3 config_parser.py name URL < config.json**\
Gives back a service name based on its URL

**python3 config_parser.py allert URL < config.json**\
Gives us a line similar to this:
Email Y Slack Y
based on the given service's (identified by URL) allerting setup
