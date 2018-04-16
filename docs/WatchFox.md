### WatchFox

This is the main "app" wich wrapps **FoxSentinel.sh**, **FoxMessenger.sh** and **FoxReporter.sh**

When executed it echoes the report on services found in **config.json** to the screen and a **logfile** and generates a **statusfile** for every observed service (under the ./services/ folder).

Then it checks the statusefiles for status changes and reports them if configured (in config.json)

Then generates a custom html file based on the services actual status (this file will be hosted with Python's SimpleHTTPServer).

#### Usage

You need to craft the **config.json** file with the details on the services you want to observ.

Then set up the Email service (msmtp) and the Slack token

```SHELL
export SLACK_API_TOKEN="your secret token"
```

Then you just need to add WatchFox to the crontab and thats it.

```SHELL
./WatchFox.sh
```