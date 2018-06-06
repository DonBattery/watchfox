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

**site** will be later used (this information can be attached to Emails and Slack messages so users can easily navigate to the reporting site) Right now it is ignored.
