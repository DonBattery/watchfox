### config.json

This is the only configuration file you need to edit manually:

```JSON
{
  "site" : "address of the WatchFox reporting site",
  "allert" : {
    "email" : "email address where the allerts will be sent",
    "slack_channel" : "Slack channel where the allerts will be sent"
  },
  "services" : [
    {
      "name" : "MyService",
      "hostname" : "myserver/myroot/myapp",
      "port" : 9090,
      "email" : "Yes",
      "slack" : "Yes"
    },
    {
      "name" : "Gmail",
      "hostname" : "gmail.com",
      "port" : 0,
      "email" : "No",
      "slack" : "Yes"
    }
  ]
}
```
