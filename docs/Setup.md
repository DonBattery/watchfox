### Setup.sh

When WatchFox starts up, it checks if **mytokens.env** is present, if not it starts Setup.sh 
which asks the user to enter the service Email address, Email password and Slack token, then it
stores in mytokens.env 

You can rerun Setup.sh to refresh these information, or you can edit mytokens.env manually.
The content of the file will be checked on every startup of WatchFox and the needed
environment variables will be set up accordingly.
