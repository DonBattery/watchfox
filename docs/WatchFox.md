### WatchFox.sh

This is the main "app" wich wrapps **FoxSentinel.sh**, **FoxMessenger.sh** and **FoxReporter.sh**

When executed it checks the presence of **mytokens.env**, if not found **Setup.sh** will be executed.

Then it checks the presence of **node_modules**, if not found **npm install** will be executed (note that the Docker image initially does not contain node_modules). And starts the **ReportingServer.js** in the background.

Then it sets up the needed environment variables, and msmtp file regarding Email and Slack credentials.

Finally it enters to its mainloop: 

Echoes the report on services found in **config.json** to the screen and a **logfile** and appends the **statusfile** of every observed service (under the ./services/ folder).

Then it checks the statusefiles for status changes and reports them if configured (in config.json)

Then generates a custom html file based on the services actual status under the ./www/ folder (hosted by ReportingServer.js on PORT 8080).

Then the process sleeps for 1 min.

#### Usage

You need to craft the [config.json](config.md) file with the details on the services you want to observ.

then simply execute **init_watchfox.sh** or **WatchFox.sh** itself
